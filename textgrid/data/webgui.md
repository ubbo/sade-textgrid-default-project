
## Erstellen oder Anpassen eines eigenen Portals

Hier ein kurzer Einstieg, wie Sie mit SADE zu einem eigenen Portal kommen.

## eXide

TODO: hier sollte ein wenig Erklärung zu eXide stehen.


### Aufbau der Menüs
Hier ein kleines Beispiel, wie das Menü konfiguriert wird:

```
<navigation>
    <item label="Ein Text" link="view.html?id=text.md"/>
    <submenu label="Links">
        <item label="http://textgrid.de" link="http://textgrid.de"/>
    </submenu>
</navigation>
```

Mit dieser Konfiguration wird ein minimales Menü aufgebaut, das ein Aufklappbares Menü mit dem Namen "Links" und einem Unterpunkt mit externem Link aufbaut, obendrein einen Link auf der Hauptebene zu "Ein Text", in der Darstellung sieht das dann so aus:

![Menü Screenshot](/exist/rest/sade-projects/textgrid/data/img/sade-dropdown.png)

Sie können einfach zum Tutorialprojekt neue Menüpunkte hinzufügen, diese umbenennen, oder das Menü umstellen, probieren Sie es aus!
[Menü bearbeiten](/exist/apps/eXide/index.html?open=/db/sade-projects/tutorial/navigation.xml)

Schauen Sie das Ergebnis an: [Tutorialprojekt](/exist/apps/SADE/tutorial/)

Sie können natürlich auch eigene Dokumente in das Menü aufnhemen, z.B. publizierte TEI Daten .

# Anpassen des Projekttitels
Auch der Projekttitel lässt sich anpassen, er ist vermerkt in der config.xml als ``<param key="project-title">Mein Projekt</param>``
[Projektkonfiguration bearbeiten](/exist/apps/eXide/index.html?open=/db/sade-projects/tutorial/config.xml).

#Aufgaben
1. Erstellen Sie einen neuen Link im Menü
2. Ändern Sie den Text von "Text1"
3. Ändern Sie den Projekttitel
4. Verlinken Sie ein selbtpubliziertes TEI Dokument im Menü (hierzu "[Publikation eigener Inhalte](view.html?id=sadepublish.md)" lesen)


