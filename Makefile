.PHONY: clean-latex

pdf:
	quarto preview --render pdf
	
web:
	quarto preview --render html

clean-latex:
	rm latex/*.fls latex/*.aux latex/*.fdb_latexmk latex/*.log latex/*.pdf latex/*.synctex.gz latex/*.toc thesis.*

update-anthology:
	python scripts/filter_bib_from_qmds.py \
		latex/references/anthology.bib \
		latex/references/anthology-filtered.bib \
		index.qmd chapters/*.qmd