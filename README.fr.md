# X2SLN
Xml to (Visual Studio) Solution

# Description

X2SLN est un utilitaire qui permet d'automatiser la création d'une solution Visual Studio .NET Core à partir d'un fichier de description XML.
Cette description s'inspire de l'abstraction C4Model décrite ici: https://c4model.com/
Les concepts C4 ont été "mappés" de la façon suivante:

- &lt;SoftwareSystem/> représente une solution Visual Studio 2017
- &lt;Container/> représente un projet (.csproj) Visual Studio 2017
- &lt;Component/> représente un package Nuget
- &lt;RelationShip/> représente une référence (dépendance) projet

Un modèle de solution est fourni à titre d'exemple: TemplateAspNetCoreAPI.xml

## Pré-requis:

- Etre administrateur de sa machine 
- Powershell doit être activé, pour cela exécuter powershell en tant qu'administrateur, puis la commande: 
```
Set-Executionpolicy RemoteSigned
```
- .NET Core SDK doit être installé


# Installation

```
git clone https://github.com/ro2K/X2SLN.git
```

# Utilisation

Syntaxe:

``` 
x2sln.cmd [NameOfSolutionModel.xml] [NameOfSolution] 
```

Example:

```
x2sln.cmd TemplateAspNetCoreAPI.xml MyProject
```

==> La solution sera générée dans ./MyProject/src

## Remarque:

TemplateAspNetCoreAPI.xml est associé par défaut avec la feuille de style SolutionModel2cmd.xsl, en ouvrant ce fichier XML via un navigateur moderne,
on obtient directement la transformation qui correspond au batch d'initialisation avec les commandes donet new ...





