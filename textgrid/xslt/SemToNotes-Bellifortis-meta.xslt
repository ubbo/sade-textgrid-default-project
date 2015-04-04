<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>
    <xsl:template match="teiHeader">
        <xsl:element name="h2" namespace="http://www.w3.org/1999/xhtml">
            <xsl:value-of select="//author[1]"/>: <xsl:value-of select="//title[1]"/> [<xsl:value-of select="//locus[1]"/>: <xsl:value-of select="//msItem[1]/titlePart[1]"/>]
    </xsl:element>
        <xsl:element name="h4" namespace="http://www.w3.org/1999/xhtml">
            <xsl:value-of select="//edition[1]"/>
        </xsl:element>
        <xsl:element name="h4" namespace="http://www.w3.org/1999/xhtml">
       Editor: <xsl:value-of select="//editionStmt[1]/respStmt[1]/persName[1]"/>
        </xsl:element>
        <xsl:element name="h4" namespace="http://www.w3.org/1999/xhtml">
        Herausgeber:
        <xsl:for-each select="//publisher[1]/persName">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
        </xsl:element>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
        Quellenbeschreibung:    
    <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class" namespace="http://www.w3.org/1999/xhtml">sourceDesc</xsl:attribute>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            Ort: <xsl:value-of select="//settlement[1]"/>
                </xsl:element>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            Insitution: <xsl:value-of select="//institution[1]"/>
                </xsl:element>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            Repository: <xsl:value-of select="//repository[1]"/>
                </xsl:element>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            Signatur: <xsl:value-of select="//idno[1]"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
        Weitere Informationen:    
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class" namespace="http://www.w3.org/1999/xhtml">sourceDesc</xsl:attribute>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
                Abbildungen: <xsl:value-of select="count(//text//figure)"/>
                </xsl:element>
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
                Zeilen: <xsl:value-of select="count(//text//l)"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
<!-- we dont want any primary text here: -->
    <xsl:template match="text"/>
</xsl:stylesheet>