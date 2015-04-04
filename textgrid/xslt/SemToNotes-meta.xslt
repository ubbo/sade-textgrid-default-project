<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="labels">
        <labels>
            <label element="editor" value="Editor: "/>
            <label element="institution" value="Archiv: "/>
            <label element="collection" value="Bestand: "/>
            <label element="idno" value="Signatur: "/>
            <label element="placeName" value="Ort: "/>
            <label element="date" value="Datum: "/>
            <label element="classCode" value="Schwierigkeitsgrad: "/>
        </labels>
    </xsl:variable>
    <xsl:variable name="tei" select="/"/>
    <xsl:template match="/">
        <xsl:call-template name="idno"/>
        <xsl:call-template name="abstract"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:msIdentifier"/>
    <xsl:template name="idno">
        <b xmlns="http://www.w3.org/1999/xhtml">
            <xsl:value-of select="$tei//tei:institution/text()"/>
            <xsl:text>,&#160;</xsl:text>
            <xsl:value-of select="$tei//tei:collection/text()"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="$tei//tei:idno/text()"/>
        </b>
        <br/>
    </xsl:template>
    <xsl:template match="tei:witness"/>
    <xsl:template match="tei:abstract"/>
    <xsl:template name="abstract">
        <b xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="$tei//tei:abstract/tei:p"/>
            <xsl:text>,&#160;</xsl:text>
            <xsl:value-of select="$tei//tei:date/text()"/>
            <xsl:if test="$tei//tei:placeName/text()">
                <xsl:text>&#160;(</xsl:text>
                <xsl:value-of select="$tei//tei:placeName/text()"/>
                <xsl:text>)</xsl:text>
            </xsl:if>
        </b>
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="tei:teiHeader">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:titleStmt"/>
    <xsl:template match="tei:classCode">
        <xsl:param name="self" select="local-name(.)"/>
        <div xmlns="http://www.w3.org/1999/xhtml">
            <span class="label">
                <xsl:value-of select="$labels//label[@element=$self]/@value"/>
            </span>
            <span>
                <xsl:apply-templates/>
            </span>
            <div>
                <xsl:attribute name="class">
                    <xsl:value-of select="$self"/>
                </xsl:attribute>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="tei:keywords/tei:term">
        <div xmlns="http://www.w3.org/1999/xhtml">
            <span class="label">Archivaliengattung: </span>
            <span>
                <xsl:apply-templates/>
            </span>
        </div>
    </xsl:template>
    <xsl:template match="tei:handNotes">
        <div xmlns="http://www.w3.org/1999/xhtml" class="handNotes">
            <span class="label">Schreiberhände: </span>
            <br/>
            <ul>
                <xsl:for-each select="./tei:handNote">
                    <li class="handNote">
                        <xsl:attribute name="id">
                            <xsl:text>scribe_</xsl:text>
                            <xsl:value-of select="./@n"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="./@n"/>
                        <xsl:text>)</xsl:text>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="tei:editorialDecl/tei:p">
        <div xmlns="http://www.w3.org/1999/xhtml" class="editorialDecl">
            <span>
                <xsl:apply-templates/>
            </span>
        </div>
    </xsl:template>
    <xsl:template match="tei:quote">
        <span xmlns="http://www.w3.org/1999/xhtml" class="tei_quote">
            <xsl:apply-templates/>
        </span>
        <span xmlns="http://www.w3.org/1999/xhtml" class="tooltip">(Textzitat)</span>
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:if test="not(exists(./ancestor::tei:cell)) or exists(./preceding-sibling::tei:lb)">
            <br xmlns="http://www.w3.org/1999/xhtml"/>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>