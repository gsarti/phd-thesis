# From Insights to Impact: Actionable Interpretability for Neural Machine Translation

This repository contains the full contents of my PhD thesis, written in Quarto and supporting cross-compilation to PDF and HTML formats. It is based on the excellent [GroNLP](https://www.rug.nl/research/clcg/?lang=en) thesis template by [Rik van Noord](https://www.rikvannoord.nl/), which was adapted to work with Quarto by [Gabriele Sarti](https://gsarti.com). The template can be easily adapted for other thesis requirements by adjusting the `_quarto.yaml` file and the templates in the `latex` folder.

## Requirements

- [Quarto](https://quarto.org/docs/get-started/) (>= 1.0)
- [R](https://cran.r-project.org/) (>= 4.0)

Run the following command to install the required R packages:

```shell
./setup.sh
```

## Usage

To build the thesis in its PDF form, run the following command:

```shell
make pdf
```

To build the thesis in its HTML form, run the following command:

```shell
make web
```