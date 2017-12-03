all: $(patsubst %.org,docs/%.pdf,$(wildcard *.org))

docs/%.pdf: %.org
	emacs $< --batch -u `id -un` --eval '(load user-init-file)' -f org-beamer-export-to-pdf
	mv *.pdf docs/

clean:
	rm -rf *.pdf *.tex *.bbl _minted*
