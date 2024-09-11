# mkdocs examples

This page includes a few neat tricks that you can do with `mkdocs`. For a complete list of examples visit the [mkdocs documentation](https://squidfunk.github.io/mkdocs-material-insiders/reference/abbreviations/).

## Code

```python
print("hello world!")
```

## Code with line numbers

```python linenums="1"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

## Code with highlights

```python hl_lines="2 3"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

## Code with tabs

=== "Tab Header"

    ```c
    #include <stdio.h>

    int main(void) {
      printf("Hello world!\n");
      return 0;
    }
    ```

=== "Another Tab Header"

    ```c++
    #include <iostream>

    int main(void) {
      std::cout << "Hello world!" << std::endl;
      return 0;
    }
    ```

## More tabs

=== "Windows"

    If on windows download the `Win32.zip` file and install it.

=== "MacOS"

    Run `brew install foo`.

=== "Linux"

    Run `apt-get install foo`.

## Checklists

* [x] Lorem ipsum dolor sit amet, consectetur adipiscing elit
* [ ] Vestibulum convallis sit amet nisi a tincidunt
* [x] In hac habitasse platea dictumst

## Add a button

[Launch the lab](https://developer.ibm.com){: .md-button .md-button--primary }

[Visit IBM Developer](https://developer.ibm.com){: .md-button }

[Sign up! :fontawesome-solid-paper-plane:](https://cloud.ibm.com){: .md-button .md-button--primary }

## Call outs

!!! tip
    You can use `note`, `abstract`, `info`, `tip`, `success`, `question`
    `warning`, `failure`, `danger`, `bug`, `quote` or `example`.

!!! note
    A note.

!!! abstract
    An abstract.

!!! info
    Some info.

!!! success
    A success.

!!! question
    A question.

!!! warning
    A warning.

!!! danger
    A danger.

!!! example
    A example.

!!! bug
    A bug.

## Call outs with code

!!! note
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

    ```python
    def bubble_sort(items):
        for i in range(len(items)):
            for j in range(len(items) - 1 - i):
                if items[j] > items[j + 1]:
                    items[j], items[j + 1] = items[j + 1], items[j]
    ```

    Nunc eu odio eleifend, blandit leo a, volutpat sapien. Phasellus posuere in
    sem ut cursus. Nullam sit amet tincidunt ipsum, sit amet elementum turpis.
    Etiam ipsum quam, mattis in purus vitae, lacinia fermentum enim.

## Formatting

In addition to the usual *italics*, and **bold** there is now support for:

* ==highlighted==
* ^^underlined^^
* ~~strike-through~~

## Tables

| **OS or Application** | **Username** | **Password** |
| - | - | - |
| Windows VM | `Administrator` | `foo` |
| Linux VM | `root` | `bar` |

## Emojis

Yes, these work. :smiley: :+1:

## Images

![image](../images/ibm-cloud-sign-up.png)

Nunc eu odio eleifend, blandit leo a, volutpat sapien

## right align image

![Placeholder](../images/ibm-cloud-sign-up.png){: align=right }

Nunc eu odio eleifend, blandit leo a, volutpat sapien
