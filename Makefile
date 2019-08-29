SHELL := /bin/bash 
notebooks := $(wildcard [0-9]*.ipynb)
notebooks_executed := $(foreach d,$(notebooks), notebooks4pdf/$(d) )


.PHONY: clean pdf  dirs clean_output test html

clear_output: 
	@echo CLEANING...
	@jupyter nbconvert --ClearOutputPreprocessor.enabled=True --clear-output $(notebooks) && echo "OK"

test:
	@echo We have here:
	@echo $(notebooks)

notebooks4pdf/%.ipynb : %.ipynb
	@echo CLEANING OUTPUT of $< 
	@jupyter nbconvert --ClearOutputPreprocessor.enabled=True --clear-output $< 
	@echo Executing notebook  $< and writing it to $@
	@time PDF=1 jupyter nbconvert  --to notebook --execute  $< --output $@ 
	@echo Removing tagged cells in excecuted notebook
	@cd notebooks4pdf &&  jupyter nbconvert  --to notebook  $< --output $< --TagRemovePreprocessor.enabled=True --TagRemovePreprocessor.remove_cell_tags="['nopdf']"   


pdf: $(notebooks_executed)  latex_template.tplx 
	cd notebooks4pdf && python3 -m bookbook.latex --template ../latex_template.tplx --pdf && mv combined.pdf ../my_book.pdf


html: $(notebooks_executed)
	cd notebooks4pdf &&  python3 -m bookbook.html  && mv html ../ -v && cp -r images  ../html/

clean:
	@rm -fv combined.*   *log *aux *tex
	@rm -frv notebooks4pdf/ html/

dirs:
	@test -d notebooks4pdf || mkdir -v notebooks4pdf && echo notebooks4pdf exists
	@test -L notebooks4pdf/images || ln -sv ../images notebooks4pdf/images && echo images link exists  

# Making directories
log1 := $(shell test -d notebooks4pdf || mkdir -v notebooks4pdf)
log2 := $(shell test -L notebooks4pdf/images || ln -sv ../images notebooks4pdf/images)
