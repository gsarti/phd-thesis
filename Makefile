.PHONY: clean-latex

pdf:
	quarto preview /Users/gsarti/Documents/projects/phd-thesis/index.qmd --render pdf

html:
	quarto preview /Users/gsarti/Documents/projects/phd-thesis/index.qmd --render html

clean-latex:
	rm latex/*.fls latex/*.aux latex/*.fdb_latexmk latex/*.log latex/*.pdf latex/*.synctex.gz latex/*.toc