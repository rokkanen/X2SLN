<?xml version = '1.0' encoding = 'iso-8859-1'?>
<!-- Author  : S.ROKKANEN/RO2K - 12/03/2018 -->
<!-- Version : 0.9 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="iso-8859-1"/>

  <xsl:template match='/'>
  <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match='SoftwareSystem'>
@echo off
set project=%1
set templateName=%project%
md %templateName%
cd %templateName%
md src
cd src    
    <xsl:apply-templates select="//Container" mode="prj"/>
	
REM /// Dependencies<xsl:apply-templates select="//RelationShip"/>

REM /// Create solution
dotnet new sln --name %project%<xsl:apply-templates select="//Container" mode="sln"/>
cd..
  </xsl:template>

  <xsl:template match="Container" mode="prj">

dotnet new <xsl:value-of select="@technology"/> --name <xsl:value-of select="@id"/>
REM del <xsl:value-of select="@id"/>\Class1.cs
REM /// Add Nuget packages<xsl:apply-templates select="Components/Component"/>
  </xsl:template>
  
  <xsl:template match="Container" mode="sln">
<xsl:variable name="csProject"><xsl:value-of select="@id"/>\<xsl:value-of select="@id"/>.csproj</xsl:variable>
dotnet sln "%project%.sln" add <xsl:value-of select="$csProject"/>
</xsl:template>

  <xsl:template match="Component">
    <xsl:variable name="csProject"><xsl:value-of select="../../@id"/>\<xsl:value-of select="../../@id"/>.csproj</xsl:variable>
dotnet add <xsl:value-of select="$csProject"/> package <xsl:value-of select="@id"/></xsl:template>

  <xsl:template match="RelationShip">
    <xsl:variable name="csProjectSrc"><xsl:value-of select="@sourceId"/>\<xsl:value-of select="@sourceId"/>.csproj</xsl:variable>   
    <xsl:variable name="csProjectDest"><xsl:value-of select="@targetId"/>\<xsl:value-of select="@targetId"/>.csproj</xsl:variable> 
dotnet add <xsl:value-of select="$csProjectSrc"/> reference <xsl:value-of select="$csProjectDest"/>
  </xsl:template>

</xsl:stylesheet>
