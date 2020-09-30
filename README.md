# Authoring examples

## Key concepts


1.  Notebooks are stored in version control system (git) without output.
1.  ``Makefile`` is used to keep all prescriptions for bulting
  pdf/html etc. 
1. All notebooks which are going to be included in pdf-book have to start with number, e.g.: ``01-*.ipynb``
1.  ``nbconvert`` is used to automatically execute and clean notebooks.
1.  It will work with different Jupyter kernels: we tested against SageMath and Python.
1.  Notebook will use ``PDF`` environment variable to distinguish
    between interactive output or static one. In the `Python` process is
    it easily accesible as ``os.environ['PDF']``. This can be
    an option when using interactive features like `@interact`
    in Sage, which should be replaced by static figures in pdf format. See  ``Makefile`` for imlementation details.
1.  All cells with tags ``nbtest`` will be removed from pdf or html
    output. This mechanism can be used for regression testing i.e. some tests
    can be placed in cells which will be removed from pdf-book output automatically. See  ``Makefile`` for implementation details.
1.  We will include `Dockerfile` which allows to run a given
    repository on mybinder service.


## How to use it?

1. Clone this repository.
2. Setup your environment according to your needs (e.g. modify requirements.txt)
3. Check following commands:
   - ``make pdf`` - execute notebooks using nbconvert and assemble pdf file using [bookbook](https://github.com/takluyver/bookbook) scripts.
   - ``make html`` - execute notebooks using nbconvert and assemble html version 
   - ``make clear_output`` - removes output from all source files.
   - ``make clean`` - remove html files and executed notebooks  ``notebooks4pdf/``, except pdf-file
   
Notebooks after execution are stored in ``notebooks4pdf/`` temporary subfolder, which might be usefull for debugging. Note that the source version of notebooks are in main direcory. 
   



   


## Try me  on mybinder!

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/OpenDreamKit/authoring_cookie_cutter/master)


## Acknowledgments

<table class="none">
<tr>
<td>
  <img src="http://opendreamkit.org/public/logos/Flag_of_Europe.svg" width="128">
</td>
<td>
  This package was created as part of the Horizon 2020 European
  Research Infrastructure project
  <a href="https://opendreamkit.org/">OpenDreamKit</a>
  (grant agreement <a href="https://opendreamkit.org/">#676541</a>).
</td>
</tr>
</table>
