# Faceted-Search

## Überblick
Das Faceted-Search Modul ermöglicht ...

## Konfiguration des Moduls
Die Konfiguration für das Faceted-Search Modul befindet sich in der config.xml 

```
    <module key="faceted-search">
        <param key="viewer-html">index.html?id=/xml/data/</param>
        ...
    </module>

```

[Konfiguration bearbeiten](/exist/apps/eXide/index.html?open=/db/sade-projects/textgrid/config.xml)

## Ändern der Ergebnisdarstellung

Mithilfe der Konfigurations-Option "result-xslt" kann auf ein XSLT Stylesheet verwiesen werden, 
welches aus den Metadaten im TEI-Dokument des Einzeltreffers einzelne Suchtreffer darstellt.
```
 <param key="result-xslt">/sade-projects/textgrid/xslt/search-hit.xslt</param>
```

Eine einfaches XSLT Stylesheet zur Ergebnisanzeige ist vorhanden und kann an eigene TEI-Metadaten angepasst werden.
[XSLT bearbeiten](/exist/apps/eXide/index.html?open=/db/sade-projects/textgrid/xslt/search-hit.xslt). Eine solche 
XSLT Transformation für Einzelergebnisse kann im Template definiert werden:

```
  <div data-template="fsearch:result-xslt"/>
```


## Konfiguration der Facetten

In der Konfiguration des Faceted-Search Moduls können die dargestellten Facetten mithilfe eines XPATH Ausdrucks festgelegt werden.

```
        <param key="facets">
            <facet key="persons" title="Person">
                <xpath>tei:author</xpath>
            </facet>
            ...
        </param>
```
[Konfiguration bearbeiten](/exist/apps/eXide/index.html?open=/db/sade-projects/textgrid/config.xml)


