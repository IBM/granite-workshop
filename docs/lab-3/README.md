# Retrieval Augmented Generation (RAG) with Langchain

*With IBM Granite Models*

## In this notebook

This notebook contains instructions for performing Retrieval Augumented Generation (RAG). RAG is an architectural pattern that can be used to augment the performance of language models by recalling factual information from a knowledge base, and adding that information to the model query. The most common approach in RAG is to create dense vector representations of the knowledge base in order to retrieve text chunks that are semantically similar to a given user query.

RAG use cases include:

- Customer service: Answering questions about a product or service using facts from the product documentation.
- Domain knowledge: Exploring a specialized domain (e.g., finance) using facts from papers or articles in the knowledge base.
- News chat: Chatting about current events by calling up relevant recent news articles.

In its simplest form, RAG requires 3 steps:

- Initial setup:
  - Index knowledge-base passages for efficient retrieval. In this recipe, we take embeddings of the passages using WatsonX, and store them in a vector database.
- Upon each user query:
  - Retrieve relevant passages from the database. In this recipe, we using an embedding of the query to retrieve semantically similar passages.
  - Generate a response by feeding retrieved passage into a large language model, along with the user query.

## Setting up the environment

Ensure you are running python 3.10 in a freshly-created virtual environment.

```python
import sys
assert sys.version_info >= (3, 10) and sys.version_info < (3, 11), "Use Python 3.10 to run this notebook."
```

### Install and import the dependencies

Install the dependencies in one `pip` command, so that pip's dependency resolver can include them all.

```python
! pip install \
  "git+https://github.com/ibm-granite-community/utils.git" \
  "wget"
```

```python
from ibm_granite_community.langchain_utils import find_langchain_model, find_langchain_vector_db
```

## Selecting System Components

### Choose your Embeddings Model

Specify the model to use for generating embedding vectors from text.

To use a model from a provider other than Huggingface, replace this code cell with one from [this Embeddings Model recipe](https://github.com/ibm-granite-community/utils/blob/main/recipes/Components/Langchain_Embeddings_Models.ipynb).

```python
from langchain_huggingface import HuggingFaceEmbeddings
embeddings_model = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
```

### Choose your Vector Database

Specify the database to use for storing and retrieving embedding vectors.

To connect to a vector database other than Milvus substitute this code cell with one from [this Vector Store recipe](https://github.com/ibm-granite-community/utils/blob/main/recipes/Components/Langchain_Vector_Stores.ipynb).

```python
from langchain_milvus import Milvus
import uuid

db_file = f"/tmp/milvus_{str(uuid.uuid4())[:8]}.db"
print(f"The vector database will be saved to {db_file}")

vector_db = Milvus(embedding_function=embeddings_model, connection_args={"uri": db_file}, auto_id=True)
```

### Choose your LLM

Specify the model that will be used for inferencing, given a query and the retrieved text.

To connect to a model on a provider other than Replicate, substitute this code cell with one from [this LLM component recipe](https://github.com/ibm-granite-community/utils/blob/main/recipes/Components/Langchain_LLMs.ipynb).

```python
from langchain_community.llms import Replicate
from ibm_granite_community.notebook_utils import get_env_var

model = Replicate(
    model="ibm-granite/granite-8b-code-instruct-128k",
    replicate_api_token=get_env_var('REPLICATE_API_TOKEN'),
)
```

## Building the Vector Database

In this example, we take the State of the Union speech text, split it into chunks, derive embedding vectors using the embedding model, and load it into the vector database for querying.

### Download the document

Here we use President Biden's State of the Union address from March 1, 2022.

```python
import os, wget

filename = 'state_of_the_union.txt'
url = 'https://raw.github.com/IBM/watson-machine-learning-samples/master/cloud/data/foundation_models/state_of_the_union.txt'

if not os.path.isfile(filename):
  wget.download(url, out=filename)
```

### Split the document into chunks

Split the document into text segments that can fit into the model's context window.

```python
from langchain.document_loaders import TextLoader
from langchain.text_splitter import CharacterTextSplitter

loader = TextLoader(filename)
documents = loader.load()
text_splitter = CharacterTextSplitter(chunk_size=1000, chunk_overlap=0)
texts = text_splitter.split_documents(documents)
```

### Create and populate the vector database

NOTE: Population of the vector database may take over a minute depending on your embedding model and service.

```python
# vector_db = vector_db_class.from_documents(texts, embeddings)
vector_db.add_documents(texts)
```

## Querying the Vector Database

### Conduct a similarity search

Search the database for similar documents by proximity of the embedded vector in vector space.

```python
query = "What did the president say about Ketanji Brown Jackson"
docs = vector_db.similarity_search(query)
print(docs[0].page_content)
```

## Answering Questions

### Automate the RAG pipeline

Build a question-answering chain with the model and the document retriever.

```python
from langchain.chains import RetrievalQA

qa = RetrievalQA.from_chain_type(llm=model, chain_type="stuff", retriever=vector_db.as_retriever()) # , chain_type_kwargs={"verbose": False})
```

### Generate a retrieval-augmented response to a question

Use the question-answering chain to process the query.

```python
query = "What did the president say about Ketanji Brown Jackson"
qa.invoke(query)
```
