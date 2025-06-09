.PHONY: clean-latex

help:
	@echo "Available targets:"
	@echo "  pdf:              Generate PDF version of the thesis."
	@echo "  web:              Generate web version of the thesis."
	@echo "  clean-latex:      Clean up LaTeX auxiliary files."
	@echo "  update-anthology: Update the filtered Anthology bibliography based on the chapter references."

pdf:
	make update-anthology
	quarto preview --render pdf
	
web:
	make update-anthology
	quarto preview --render html

clean-latex:
	rm latex/*.fls latex/*.aux latex/*.fdb_latexmk latex/*.log latex/*.pdf latex/*.synctex.gz latex/*.toc thesis.*

update-anthology:
	python scripts/filter_bib_from_qmds.py \
		latex/references/anthology.bib \
		latex/references/anthology-filtered.bib \
		index.qmd chapters/*.qmd