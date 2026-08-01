# Master's thesis

LaTeX source, figures, bibliography, and Wolfram Language calculations for Henrique Farinha's master's thesis.

## Building

Compile `main.tex` with a LaTeX distribution that includes `biber` and the packages declared in `preamble.tex`. A typical command is:

```sh
latexmk -pdf -use-biber main.tex
```

The current compiled draft is available as `main.pdf`.
