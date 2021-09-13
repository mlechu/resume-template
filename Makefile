OUT_DIR=./out
FLAGS= -f -pdfxe -cd -output-directory=./$(OUT_DIR)
MAIN=./MAIN.tex
PREFIX=mlechu-

all:
	make res
	make cl
	make both

res:
	latexmk -jobname=$(PREFIX)resume $(FLAGS) -usepretex='\def\ResumeToggle{1}\def\CoverLetterToggle{0}' $(MAIN)
	make clean

cl:
	latexmk -jobname=$(PREFIX)cl $(FLAGS) -usepretex='\def\ResumeToggle{0}\def\CoverLetterToggle{1}' $(MAIN)
	make clean

both:
	latexmk -jobname=$(PREFIX)resume-cl $(FLAGS) -usepretex='\def\ResumeToggle{1}\def\CoverLetterToggle{1}' $(MAIN)
	make clean

clean:
	rm -f out/*.aux out/*.fdb_latexmk out/*.idx out/*.fls out/*.synctex.gz out/*.log out/*.nav out/*.xdv 

cleaner:
	rm -f out/*

help:
	echo "USAGE: make [all/res/cl/both/clean]"