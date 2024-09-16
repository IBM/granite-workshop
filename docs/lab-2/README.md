# Tuning a Granite Model using the InstructLab CLI

Now that you've set up InstructLab, let's get tuning the Granite Model.

## Sanity check

First thing you should do is verify you can talk to the Granite model, go ahead and run
the following commands to verify you can.

```bash
cd instructlab
source venv/bin/activate
ilab model chat
/q
```

## Prepare to train your model

!!! note
    If you are running CPU only, or don't have a modern GPU or a Apple M1/M2/M3 this will take a long time. We strongly suggest finding someone with a GPU enabled machine to continue with this workshop. If anything the instructor or teaching assistants should have a laptop that can be projected on the main screen.

1. Pull down an example `qna.yaml`. But wait what is a `qna.yaml`? There's a few things you should know before going any further.

Knowledge is based more on answering questions that involve facts, data, or references.

Knowledge in the taxonomy tree consists of a few more elements than skills:

- Each knowledge node in the tree has a `qna.yaml`, similar to the format of the `qna.yaml` for skills.
- ⭐ Knowledge submissions require you to create a Git repository, can be with GitHub, that contains the markdown files of your knowledge contributions. These contributions in your repository must use the markdown (.md) format.
- The `qna.yaml` includes parameters that contain information from your repository.

!!! tip
    Guidelines for Knowledge contributions

    - Submit the most up-to-date version of the document
    - All submissions must be text, images will be ignored
    - Do not use tables in your markdown freeform contribution

Format of the `qna.yaml`:

- `version`: The chache verion of the qna.yaml file, this is the format of the file used for SDG. The value must be the number 3.
- `created_by`: Your GitHub username.
- `domain`: Specify the category of the knowledge.
- `seed_examples`: A collection of key/value entries.
  - `context`: A chunk of information from the knowledge document. Each `qna.yaml` needs five `context` blocks and has a maximum word count of 500 words.
  - `questions_and_answers`: The parameter that holds your questions and answers
    - `question`: Specify a question for the model. Each `qna.yaml` file needs at least three question and answer pairs per `context` chunk with a maximum word count of 250 words.
    - `answer`: Specify the desired answer from the model. Each `qna.yaml` file needs at least three question and answer pairs per `context` chunk with a maximum word count of 250 words.
- `document_outline`: Describe an overview of the document your submitting.
- `document`: The source of your knowledge contribution.
  - `repo`: The URL to your repository that holds your knowledge markdown files.
  - `commit`: The SHA of the commit in your repository with your knowledge markdown files.
  - `patterns`: A list of glob patterns specifying the markdown files in your repository. Any glob pattern that starts with `*`, such as `*.md`, must be quoted due to YAML rules. For example, `"*.md"`.

### Knowledge: YAML examples

```yaml
version: 3
domain: astronomy
created_by: juliadenham
seed_examples:
  - context: |
      **Phoenix** is a minor [constellation](constellation "wikilink") in the
      [southern sky](southern_sky "wikilink"). Named after the mythical
      [phoenix](Phoenix_(mythology) "wikilink"), it was first depicted on a
      celestial atlas by [Johann Bayer](Johann_Bayer "wikilink") in his 1603
      *[Uranometria](Uranometria "wikilink")*. The French explorer and
      astronomer [Nicolas Louis de
      Lacaille](Nicolas_Louis_de_Lacaille "wikilink") charted the brighter
      stars and gave their [Bayer designations](Bayer_designation "wikilink")
      in 1756. The constellation stretches from roughly −39 degrees to −57 degrees
      [declination](declination "wikilink"), and from 23.5h to 2.5h of [right
      ascension](right_ascension "wikilink"). The constellations Phoenix,
      [Grus](Grus_(constellation) "wikilink"),
      [Pavo](Pavo_(constellation) "wikilink") and [Tucana](Tucana "wikilink"),
      are known as the Southern Birds.
    questions_and_answers:
      - question: |
          What is the Phoenix constellation?
        answer: |
          Phoenix is a minor constellation in the southern sky.
      - question: |
          Who charted the Phoenix constellation?
        answer: |
          The Phoenix constellation was charted by french explorer and
          astronomer Nicolas Louis de Lacaille.
      - question: |
          How far does the Phoenix constellation stretch?
        answer: |
          The phoenix constellation stretches from roughly −39° to −57°
          declination, and from 23.5h to 2.5h of right ascension.
  - context: |
      Phoenix was the largest of the 12 constellations established by [Petrus
      Plancius](Petrus_Plancius "wikilink") from the observations of [Pieter
      Dirkszoon Keyser](Pieter_Dirkszoon_Keyser "wikilink") and [Frederick de
      Houtman](Frederick_de_Houtman "wikilink"). It first appeared on a 35cm
      diameter celestial globe published in 1597 (or 1598) in Amsterdam by
      Plancius with [Jodocus Hondius](Jodocus_Hondius "wikilink"). The first
      depiction of this constellation in a celestial atlas was in [Johann
      Bayer](Johann_Bayer "wikilink")'s
      *[Uranometria](Uranometria "wikilink")* of 1603. De Houtman included
      it in his southern star catalog the same year under the Dutch name *Den
      voghel Fenicx*, "The Bird Phoenix", symbolising the
      [phoenix](Phoenix_(mythology) "wikilink") of classical mythology. One
      name of the brightest star [Alpha
      Phoenicis](Alpha_Phoenicis "wikilink")—Ankaa—is derived from the Arabic:
      العنقاء, romanized: al-‘anqā’, lit. 'the phoenix', and
      was coined sometime after 1800 in relation to the constellation.
    questions_and_answers:
      - question: |
          What is the brightest star in the Phoenix constellation
          called?
        answer: |
          Alpha Phoenicis or Ankaa is the brightest star in the Phoenix
          Constellation.
      - question: Where did the Phoenix constellation first appear?
        answer: |
          The Phoenix constellation first appeared on a 35-cm diameter
          celestial globe published in 1597 (or 1598) in Amsterdam by
          Plancius with Jodocus Hondius.
      - question: |
          What does "The Bird Phoenix" symbolize?
        answer: |
          "The Bird Phoenix" symbolizes the phoenix of classical mythology.
  - context: |
      Phoenix is a small constellation bordered by [Fornax](Fornax "wikilink")
      and Sculptor to the north, Grus to the west, Tucana to the south,
      touching on the corner of [Hydrus](Hydrus "wikilink") to the south, and
      [Eridanus](Eridanus_(constellation) "wikilink") to the east and
      southeast. The bright star [Achernar](Achernar "wikilink") is
      nearby. The three-letter abbreviation for the constellation, as
      adopted by the [International Astronomical
      Union](International_Astronomical_Union "wikilink") in 1922, is
      "Phe". The official constellation boundaries, as set by Belgian
      astronomer [Eugène Delporte](Eugène_Joseph_Delporte "wikilink") in 1930,
      are defined by a polygon of 10 segments. In the [equatorial coordinate
      system](equatorial_coordinate_system "wikilink"), the [right
      ascension](right_ascension "wikilink") coordinates of these borders lie
      between 23<sup>h</sup> 26.5<sup>m</sup> and 02<sup>h</sup> 25.0<sup>m</sup>,
      while the [declination](declination "wikilink")
      coordinates are between −39.31° and −57.84°. This means it remains
      below the horizon to anyone living north of the [40th
      parallel](40th_parallel_north "wikilink") in the [Northern
      Hemisphere](Northern_Hemisphere "wikilink"), and remains low in the sky
      for anyone living north of the [equator](equator "wikilink"). It is most
      visible from locations such as Australia and South Africa during late
      [Southern Hemisphere](Southern_Hemisphere "wikilink") spring. Most
      of the constellation lies within, and can be located by, forming a
      triangle of the bright stars Achernar, [Fomalhaut](Fomalhaut "wikilink")
      and [Beta Ceti](Beta_Ceti "wikilink")—Ankaa lies roughly in the centre
      of this.
    questions_and_answers:
      - question: What are the characteristics of the Phoenix constellation?
        answer: |
          Phoenix is a small constellation bordered by Fornax and Sculptor to
          the north, Grus to the west, Tucana to the south, touching on the
          corner of Hydrus to the south, and Eridanus to the east and southeast.
          The bright star Achernar is nearby.
      - question: |
          When is the phoenix constellation most visible?
        answer: |
          Phoenix is most visible from locations such as Australia and
          South Africa during late Southern Hemisphere spring.
      - question: |
          What are the Phoenix Constellation boundaries?
        answer: |
          The official constellation boundaries for Phoenix, as set by Belgian
          astronomer Eugène Delporte in 1930, are defined by a polygon of 10
          segments.
  - context: |
      Ten stars have been found to have planets to date, and four planetary
      systems have been discovered with the [SuperWASP](SuperWASP "wikilink")
      project. [HD 142](HD_142 "wikilink") is a yellow giant that has an
      apparent magnitude of 5.7, and has a planet ([HD 142b](HD_142_b
      "wikilink")) 1.36 times the mass of Jupiter which orbits every 328 days.
      [HD 2039](HD_2039 "wikilink") is a yellow subgiant with an apparent
      magnitude of 9.0 around 330 light years away which has a planet ([HD 2039
      b](HD_2039_b "wikilink")) six times the mass of Jupiter. [WASP-18](WASP-18
      "wikilink") is a star of magnitude 9.29 which was discovered to have a hot
      Jupiter-like planet ([WASP-18b](WASP-18b "wikilink")) taking less than a
      day to orbit the star. The planet is suspected to be causing WASP-18 to
      appear older than it really is. [WASP-4](WASP-4 "wikilink") and
      [WASP-5](WASP-5 "wikilink") are solar-type yellow stars around 1000
      light years distant and of 13th magnitude, each with a single planet
      larger than Jupiter. [WASP-29](WASP-29 "wikilink") is an orange
      dwarf of spectral type K4V and visual magnitude 11.3, which has a
      planetary companion of similar size and mass to Saturn. The planet
      completes an orbit every 3.9 days.
    questions_and_answers:
      - question: In the Phoenix constellation, how many stars have planets?
        answer: |
          In the Phoenix constellation, ten stars have been found to have
          planets to date, and four planetary systems have been discovered
          with the SuperWASP project.
      - question: |
          What is HD 142?
        answer: |
          HD 142 is a yellow giant that has an apparent magnitude of 5.7, and
          has a planet (HD 142 b) 1.36 times the mass of Jupiter which
          orbits every 328 days.
      - question: |
          Are WASP-4 and WASP-5 solar-type yellow stars?
        answer: |
          Yes, WASP-4 and WASP-5 are solar-type yellow stars around 1000 light
          years distant and of 13th magnitude, each with a single planet
          larger than Jupiter.
  - context: |
      The constellation does not lie on the
      [galactic plane](galactic_plane "wikilink") of the Milky Way, and there
      are no prominent star clusters. [NGC 625](NGC_625 "wikilink") is a dwarf
      [irregular galaxy](irregular_galaxy "wikilink") of apparent magnitude 11.0
      and lying some 12.7 million light years distant. Only 24000 light years in
      diameter, it is an outlying member of the [Sculptor Group](Sculptor_Group
      "wikilink"). NGC 625 is thought to have been involved in a collision and
      is experiencing a burst of [active star formation](Active_galactic_nucleus
      "wikilink"). [NGC 37](NGC_37 "wikilink") is a
      [lenticular galaxy](lenticular_galaxy "wikilink") of apparent magnitude
      14.66. It is approximately 42 [kiloparsecs](kiloparsecs "wikilink")
      (137,000 [light-years](light-years "wikilink")) in diameter and about
      12.9 billion years old. [Robert's Quartet](Robert's_Quartet "wikilink")
      (composed of the irregular galaxy [NGC 87](NGC_87 "wikilink"), and three
      spiral galaxies [NGC 88](NGC_88 "wikilink"), [NGC 89](NGC_89 "wikilink")
      and [NGC 92](NGC_92 "wikilink")) is a group of four galaxies located
      around 160 million light-years away which are in the process of colliding
      and merging. They are within a circle of radius of 1.6 arcmin,
      corresponding to about 75,000 light-years. Located in the galaxy ESO
      243-49 is [HLX-1](HLX-1 "wikilink"), an
      [intermediate-mass black hole](intermediate-mass_black_hole
      "wikilink")—the first one of its kind identified. It is thought to be a
      remnant of a dwarf galaxy that was absorbed in a
      [collision](Interacting_galaxy "wikilink") with ESO 243-49. Before its
      discovery, this class of black hole was only hypothesized.
    questions_and_answers:
      - question: |
          Is the Phoenix Constellation part of the Milky Way?
        answer: |
          The Phoenix constellation does not lie on the galactic plane of
          the Milky Way, and there are no prominent star clusters.
      - question: |
          How many light years away is NGC 625?
        answer: |
          NGC 625 is 24000 light years in diameter and is an outlying
          member of the Sculptor Group.
      - question: |
          What is Robert's Quartet composed of?
        answer: |
          Robert's Quartet is composed of the irregular galaxy NGC 87,
          and three spiral galaxies NGC 88, NGC 89 and NGC 92.
document_outline: |
  Information about the Phoenix Constellation including the
  history, characteristics, and features of the stars in the constellation.
document:
    repo: https://github.com/juliadenham/Summit_knowledge
    commit: 0a1f2672b9b90582e6115333e3ed62fd628f1c0f
    patterns: phoenix_constellation.md
```

*Example `attribution.txt` file*

```text
Title of work: Phoenix (constellation)
Link to work: https://en.wikipedia.org/wiki/Phoenix_(constellation)
Revision: https://en.wikipedia.org/w/index.php?title=Phoenix_(constellation)&oldid=1237187773
License of the work: CC-BY-SA-4.0
Creator names: Wikipedia Authors
```

### Knowledge: Markdown file example

```markdown
# Phoenix (constellation)

**Phoenix** is a minor [constellation](constellation "wikilink") in the
[southern sky](southern_sky "wikilink"). Named after the mythical
[phoenix](Phoenix_(mythology) "wikilink"), it was first depicted on a
celestial atlas by [Johann Bayer](Johann_Bayer "wikilink") in his 1603
*[Uranometria](Uranometria "wikilink")*. The French explorer and
astronomer [Nicolas Louis de
Lacaille](Nicolas_Louis_de_Lacaille "wikilink") charted the brighter
stars and gave their [Bayer designations](Bayer_designation "wikilink")
in 1756. The constellation stretches from roughly −39 degrees to −57 degrees
[declination](declination "wikilink"), and from 23.5h to 2.5h of [right
ascension](right_ascension "wikilink"). The constellations Phoenix,
[Grus](Grus_(constellation) "wikilink"),
[Pavo](Pavo_(constellation) "wikilink") and [Tucana](Tucana "wikilink"),
are known as the Southern Birds.

The brightest star, [Alpha Phoenicis](Alpha_Phoenicis "wikilink"), is
named Ankaa, an [Arabic](Arabic "wikilink") word meaning 'the Phoenix'.
It is an orange giant of apparent magnitude 2.4. Next is [Beta
Phoenicis](Beta_Phoenicis "wikilink"), actually a
[binary](Binary_star "wikilink") system composed of two yellow giants
with a combined apparent magnitude of 3.3. [Nu
Phoenicis](Nu_Phoenicis "wikilink") has a dust disk, while the
constellation has ten star systems with known planets and the recently
discovered [galaxy clusters](galaxy_cluster "wikilink") [El
Gordo](El_Gordo_(galaxy_cluster) "wikilink") and the [Phoenix
Cluster](Phoenix_Cluster "wikilink")—located 7.2 and 5.7 billion light
years away respectively, two of the largest objects in the [visible
universe](visible_universe "wikilink"). Phoenix is the
[radiant](radiant_(meteor_shower) "wikilink") of two annual [meteor
showers](meteor_shower "wikilink"): the
[Phoenicids](Phoenicids "wikilink") in December, and the July
Phoenicids.
```

## Generating synthetic data

After you've built a good knowledge submission like above, the `qna.yaml`, the `attribution.txt` and
finally the hosted `.md` file, you need to tell the teacher model to build questions around
your seeded ones. Lets do that now.

1. If you haven't yet, you'll need to pull down the default teacher model, this is done with this command:

```bash
ilab model download
```

Next sanity check the merlinite model, via the following command:

```bash
ilab serve --model-path models/merlinite-7b-lab-Q4_K_M.gguf

# in another terminal
ilab model chat
```
After the model is working as expected, ie running "who is batman?" close out the `ilab serve` and `ilab model chat`.

2. Next we need to generate the data, this is done with the following command:

```bash
ilab data generate
```

This can take some time, take note of the time in the right hand corner, this is building 1000 questions off of your initial 15.

3. After this is complete, now we'll need to train the actual model. If this isn't a Mac M3, this will take **at least an hour**, so
hopefully you can take a lunch break or something while this is running.

```bash
ilab model train --model-dir instructlab/granite-7b-lab --tokenizer-dir models/granite-7b-lab --model-name instructlab/granite-7b-lab
```

This takes the granite model, leverages the tokenized version of it, and runs the SDG from the `generate` command against it.

4. When this is completed, you'll need to test this model, which is the following command:
```bash
ilab model test --model-dir instructlab-granite-7b-lab-mlx-q
```

5. Now to run the command on the Mac M3, or Apple hardware you'll need to convert it to a `gguf`, that is this next command.

!!! note
    You won't need to do this if you are running on Linux (or maybe Windows remember that's unsupported at the moment)

```bash
ilab model convert --model-dir instructlab-granite-7b-lab-mlx-q
```

6. Finally run the new model with `ilab model serve`.

```bash
ilab model serve --model-path instructlab-granite-7b-lab-trained/instructlab-granite-7b-lab-Q4_K_M.gguf
```

Success! You should notice a difference in the knowledge from what you've trained. If you haven't or something isn't working as expected please understand
that the way [quantization](https://huggingface.co/docs/optimum/en/concept_guides/quantization#) happens to run on your laptop sometimes causes the model to
not know what you trained it. We have some evidence that 1 out of 5 models trained retains your submissions when running on your local laptop. Don't fret
though your submission is great for the upstream model, and extremely valuable to the project.

When the full run from the upstream happens, the PR you submit with the new (or corrected) knowledge will be "baked in" better then the quantization
method you use here, which will give much higher percentage of retrieval.
