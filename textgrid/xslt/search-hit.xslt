<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>
    <xsl:param name="id"/>
    <xsl:param name="link"/>
    <xsl:template match="/">
        <div>
            <strong>
                <a href="{$link}">
                    <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/>
                </a>
            </strong>
            <p>
                  / <xsl:value-of select="//tei:author"/>.
                  - <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:pubPlace"/>
                  : <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:date/@when"/>. <br/>
                <a href="#" onclick="return false;" data-toggle="collapse" data-target="#meta2_{$id}">
                      mehr <span class="glyphicon glyphicon-collapse-down"/>
                </a>
            </p>
            <p id="meta2_{$id}" class="collapse">
                <xsl:value-of select="//tei:notesStmt/tei:note"/>
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>