# X2SLN
Xml to (Visual Studio) Solution

# Description

X2SLN is utility for generate Visual Studio .NET Core solution from a XML description file.
The description follows a XML Schema based on C4Model abstraction (https://c4model.com/).
XML Tags map the following C4 concepts:

- &lt;SoftwareSystem/> maps a Visual Studio solution (.sln)
- &lt;Container/> maps a Visual Studio project (.csproj)
- &lt;Component/> maps a Nuget package
- &lt;RelationShip/> maps a project dependency (reference)

TemplateAspNetCoreAPI.xml is an example of C4Model description.

## Requirements:

- Must be administrator 
- Powershell must be activated, for this run the following command as administrator: 
```
Set-Executionpolicy RemoteSigned
```
- .NET Core SDK installed


# Installation

```
git clone https://github.com/ro2K/X2SLN.git
```

# Usage

Syntax:

``` 
x2sln.cmd [NameOfSolutionModel.xml] [NameOfSolution] 
```

Example:

```
x2sln.cmd TemplateAspNetCoreAPI.xml MyProject
```

==> Solution is generated in ./MyProject/src folder.

## Remarks:

TemplateAspNetCoreAPI.xml is associated by default with SolutionModel2cmd.xsl styleshet.
By opening this XML file with browser (IE, Edge, FireFox) the transformation is directly executed and shows the command line batch with the dotnet new... commands.




