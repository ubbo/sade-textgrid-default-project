<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <!-- we dont want any meta text here: -->
    <xsl:template match="teiHeader"/>
    <xsl:template match="l">
        <xsl:apply-templates select="note"/>
    </xsl:template>
    <xsl:template match="body">
        <xsl:apply-templates/>
        <xsl:element name="hr" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="style" select="'border-color: black;'"/>
        </xsl:element>
        <xsl:element name="ol" namespace="http://www.w3.org/1999/xhtml">
            <xsl:for-each select="//note[@type='footnote']">
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="id">footnote-<xsl:value-of select="@n"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template match="l/note[@type = 'translation']">
        <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="figure">
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">figure</xsl:attribute>
            <xsl:element name="h4">Abbildung</xsl:element>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note[@type = 'description']">
        Beschreibung: <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="note[@type='footnote']">
        <xhtml:sup>[<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="href" select="concat('#', @n)"/>
                <xsl:value-of select="@n"/>
            </xsl:element>]</xhtml:sup>
    </xsl:template>
</xsl:stylesheet>