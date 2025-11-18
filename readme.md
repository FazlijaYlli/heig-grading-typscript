# heig-grading-typscript
## Requirements
For this script to work properly, you need these tools accessible from the command line.
- python with **openpyxl**
- typst

> [!NOTE]
> You can install typst on Windows by typing 
> ```winget install --id=Typst.Typst -e``` 
> in Powershell.

## Configuration
### Script configuration
The user only has to configure some variables in the `generate_reports.py` file.

The course and project name can be set. The project number can also be set.
The file prefix will be used for the .typ and .pdf files.

The important part is these variables :

```python
first_criterion_line = 4
last_criterion_line = 31
first_group_column = 4
last_group_column = 17
```

These correspond to the lines and columns in the excel file. You will need to change the `last_group_column` if you change the number of groups.
Should you add or remove criterions, the `last_criterion_line` will need to be changed as well.

### Adding criterions and comments
#### Section
To add a new main section, add a line with *text* on the first column.
#### Subsection
To add a new subsection, add a line with text on the second column, and leave the first column empty.
#### Comment
To add a comment for a specific subsection, right click on the celle in Excel and click "Add Note..." (**NOT** "Add comment...") and enter your comment.

## Example file
The file `grading.xlsx` is guaranteed to work and you can use it to experiment with the script and the generation of reports. It has an example of two comments for two different groups.

## Using
### Clone
First, clone the repoitory and cd into it.
```bash
git clone https://github.com/FazlijaYlli/heig-grading-typscript.git
cd heig-grading-typscript
```
### Grade
Start from the example grading.xlsx template file and fill the cells according to the correction.

### Configure
Edit the `generate_reports.py` file until the configuration matches the excel file.

### Generate and compile
> [!WARNING]
>  On Linux or WSL
> You might have to create a virtual python environement to install the required packages using pip.
> 
> **Also, running `dos2unix typst_compile.sh` will be necessary.**

Once the configuration is done, simply run
```bash
./typst_compile.sh
```
to generate the typ files from the excel file and compile them into pdf files.
### Done !
The PDF files can be found in `/feedbacks/pdf`.
