# heig-grading-typscript
## Requirements
For this script to work properly, you need these tools accessible from the command line.
- python with **openpyxl**
- typst

> [!INFO]
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
last_group_column = 17```

These correspond to the lines and columns in the excel file. You will probably need to change the `last_group_column` since the number of groups almost always differ.

### Adding criterions
#### Section
To add a new main section, add a line with *text* on the first column.
#### Subsection
To add a new subsection, add a line with text on the second column, and leave the first column empty.

## Example file
The file `grading.xlsx` is guaranteed to work and you can use it to experiment with the script and the generation of reports.
