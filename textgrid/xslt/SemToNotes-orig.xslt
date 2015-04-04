<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:head">
        <h3 xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
            <span class="tooltip">(Überschrift)</span>
        </h3>
    </xsl:template>
    <xsl:template match="tei:p">
        <p xmlns="http://www.w3.org/1999/xhtml">
            <span class="tooltip">(Absatz Beginn)</span>
            <xsl:apply-templates/>
            <span class="tooltip">(Absatz Ende)</span>
        </p>
    </xsl:template>
    <xsl:template match="tei:pb">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <div xmlns="http://www.w3.org/1999/xhtml" class="tei_pb">
                <span>//</span>
                <span class="tooltip">(Seitenumbruch)</span>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:lb">
        <xsl:if test="./@type != 'empty' and (./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <xsl:if test="not(exists(./ancestor::tei:cell)) or exists(./preceding-sibling::tei:lb)">
                <br xmlns="http://www.w3.org/1999/xhtml"/>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:lb[@type='orig']">
        <xsl:if test="@type = 'orig'">
            <xsl:if test="not(exists(./ancestor::tei:cell)) or exists(./preceding-sibling::tei:lb)">
                <br xmlns="http://www.w3.org/1999/xhtml"/>
            </xsl:if>
            <span xmlns="http://www.w3.org/1999/xhtml" class="tei_lb label">
                <xsl:value-of select="count(./preceding::tei:lb[@type='orig']) + 1"/>
                <xsl:text>&#160;</xsl:text>
            </span>
            <xsl:choose>
                <xsl:when test="((./following-sibling::*)[1])[@place='left']">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <span xmlns="http://www.w3.org/1999/xhtml" class="tei_add_left"/>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:lb[@type='reg']">
        <xsl:if test="@type = 'orig'">
            <xsl:if test="not(exists(./ancestor::tei:cell)) or exists(./preceding-sibling::tei:lb)">
                <br xmlns="http://www.w3.org/1999/xhtml"/>
            </xsl:if>
            <span xmlns="http://www.w3.org/1999/xhtml" class="tei_lb label">
                <xsl:value-of select="count(./preceding::tei:lb[@type='reg']) + 1"/>
                <xsl:text>&#160;</xsl:text>
            </span>
        </xsl:if>
    </xsl:template>
  
  <!--xsl:template match="tei:choice|tei:orig|tei:reg">
    <span xmlns="http://www.w3.org/1999/xhtml">
      <xsl:attribute name="class">
        <xsl:value-of select="concat('tei_', local-name(.))"/>
      </xsl:attribute>
      <xsl:if test="local-name(.) = 'orig'">
        <xsl:text>(</xsl:text>
      </xsl:if>
      <xsl:if test="local-name(.) = 'reg'">
        <xsl:text> / </xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="local-name(.) = 'orig'">
        <span class="tooltip"> (original)</span>
      </xsl:if>
      <xsl:if test="local-name(.) = 'reg'">
        <span class="tooltip"> (regulär)</span>
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:if test="local-name(.) = 'choice'">
        <span class="tooltip">(Transkription)</span>
      </xsl:if>
    </span>
  </xsl:template-->
    <xsl:template match="tei:c[@type='superior']">
        <xsl:param name="left" select="substring-before(., '%')"/>
        <xsl:param name="right" select="substring-after(., '%')"/>
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <xsl:choose>
                <xsl:when test="matches($left, '[a-z]')">
                    <svg xmlns="http://www.w3.org/2000/svg" width=".7em" height="1.2em">
                        <g>
                            <text text-anchor="middle" y="1.2em" x="50%">
                                <xsl:value-of select="$left"/>
                            </text>
                            <text text-anchor="middle" font-size=".7em" y=".8em" x="50%">
                                <xsl:value-of select="$right"/>
                            </text>
                        </g>
                    </svg>
                </xsl:when>
                <xsl:otherwise>
                    <svg xmlns="http://www.w3.org/2000/svg" width=".9em" height="1.4em">
                        <g>
                            <text text-anchor="middle" y="1.4em" x="50%">
                                <xsl:value-of select="$left"/>
                            </text>
                            <text text-anchor="middle" font-size=".7em" y=".9em" x="50%">
                                <xsl:value-of select="$right"/>
                            </text>
                        </g>
                    </svg>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:c[@type='tab']">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml">&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:seg[@rend='elongata']">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">tei_elongata</xsl:attribute>
                <xsl:apply-templates/>
                <span class="tooltip">(Elongata)</span>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:foreign">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">tei_foreign</xsl:attribute>
                <xsl:apply-templates/>
            </span>
            <span xmlns="http://www.w3.org/1999/xhtml" class="tooltip">(Wechsel des Schriftsystems)</span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:del">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">tei_del</xsl:attribute>
                <xsl:apply-templates/>
            </span>
            <span xmlns="http://www.w3.org/1999/xhtml" class="tooltip">(getilgt)</span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:add">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <xsl:choose>
                <xsl:when test="./@place = 'above'">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="tei_add_above">
                        <xsl:apply-templates/>
                    </span>
          <!--span class="tooltip tei_add" xmlns="http://www.w3.org/1999/xhtml">(Über der Zeile nachgetragener Text)</span-->
                </xsl:when>
                <xsl:when test="./@place = 'left'">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="tei_add_left">
                        <xsl:apply-templates/>
                    </span>
          <!--span class="tei_add" xmlns="http://www.w3.org/1999/xhtml">(Links nachgetragener Text)</span-->
                </xsl:when>
                <xsl:when test="./@place = 'right'">
                    <span xmlns="http://www.w3.org/1999/xhtml" class="tei_add_right">
                        <span>&#160;&#160;&#160;&#160;</span>
                        <xsl:apply-templates/>
                    </span>
          <!--span class="tei_add" xmlns="http://www.w3.org/1999/xhtml">(Rechts nachgetragener Text)</span-->
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:handShift">
        <xsl:param name="scribe" select="./@new"/>
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml" class="tei_handShift">
                <xsl:attribute name="data-scribe">
                    <xsl:text>scribe_</xsl:text>
                    <xsl:value-of select="$scribe"/>
                </xsl:attribute>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="//tei:handNote[@n=$scribe]/tei:p/text()"/>
                <xsl:text>:) </xsl:text>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:hi[@rend='sup']">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml" class="superscript">
                <xsl:apply-templates/>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:table">
        <xsl:if test="count(.//tei:lb[@type='orig']) &gt; 0">
            <table xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates/>
            </table>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:row">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <tr xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates/>
            </tr>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:cell">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <td xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates/>
            </td>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:param name="label" select="."/>
        <xsl:param name="type" select="(./preceding::tei:lb[@type!='empty'])[last()]/@type"/>
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml" class="superscript">
                <xsl:choose>
                    <xsl:when test="count(//tei:div[@type=$type]/tei:note[@n=$label]) != 1">
                        <span class="error">
                            <span>Fußnote '</span>
                            <xsl:apply-templates/>
                            <span>' fehlt oder kommt mehrmals vor! </span>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:body//text()">
        <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'">
            <span xmlns="http://www.w3.org/1999/xhtml" class="hover-text">
                <xsl:value-of select="translate(., ' ', '&#160;')"/>
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:anchor">
<!--    <xsl:if test="(./preceding::tei:lb[@type!='empty'])[last()]/@type = 'orig'"> -->
        <span xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
  <!--  </xsl:if> -->
    </xsl:template>

  <!--  ################################
      
      footnotes
  
      ################################  -->
    <xsl:template match="tei:back">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:back/tei:div[@type='orig']">
        <span xmlns="http://www.w3.org/1999/xhtml" class="hr">&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span>
        <ul xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:note[@n]">
        <xsl:param name="label" select="@n"/>
        <xsl:param name="type" select="./parent::tei:div/@type"/>
        <xsl:if test="./parent::tei:div[@type = 'orig']">
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when test="count(//tei:ref[.=$label][((./preceding::tei:lb[@type!='empty'])[last()])[@type=$type]]) != 1">
                        <span class="error">
                            <span>Referenz '</span>
                            <xsl:value-of select="@n"/>
                            <span>' fehlt in der </span>
                            <xsl:choose>
                                <xsl:when test="$type = 'orig'">
                                    <xsl:text>Entzifferung</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Transkription</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            <span> oder kommt mehrmals vor! </span>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span>
                            <xsl:value-of select="@n"/>
                        </span>
                        <xsl:text>&#160;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates/>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:if test="./parent::tei:div[@type = 'orig']">
            <li xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates/>
            </li>
        </xsl:if>
    </xsl:template>
    <xsl:template match="tei:quote">
        <span xmlns="http://www.w3.org/1999/xhtml" class="tei_quote">
            <xsl:apply-templates/>
        </span>
        <span xmlns="http://www.w3.org/1999/xhtml" class="tooltip">(Textzitat)</span>
    </xsl:template>
</xsl:stylesheet>