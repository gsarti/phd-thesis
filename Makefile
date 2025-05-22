.PHONY: clean-latex

pdf:
	quarto preview --render pdf
	
web:
	quarto preview --render html

clean-latex:
	rm latex/*.fls latex/*.aux latex/*.fdb_latexmk latex/*.log latex/*.pdf latex/*.synctex.gz latex/*.toc