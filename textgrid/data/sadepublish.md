# Publizieren aus dem TextGridLab

## Vorbemerkung
Der Grundsätzliche Umgang mit dem TextGridLab sollte bekannt sein, ansonsten ist das [Benutzerhandbuch](https://dev2.dariah.eu/wiki/display/TextGrid/User+Manual+2.0) eine gute Resource für weitergehende Informationen.

## Vorbereitung

### Installation des "SADE Publish Tool" im TextGridLab
Um SADE an das TextGridLab anzubinden und komfortables publizieren aus dem Lab zu ermöglichen sollte das "SADE Publish Tool" aus dem Marketplace installiert werden. Dafür im Lab den Menüpunkt "Hilfe->Eclipse-Marketplace" auswählen. Im "Recent" Tab befindet sich der Eintrag "SADE Publish Tool". Nach ein Klick auf "Install" wird dieser ins Lab integriert. Das Lab möchte nun neustarten, das sollte es auch tun.

![Marketplace Screenshot](/exist/rest/sade-projects/textgrid/data/img/marketplace.png)

### Einrichten des "SADE Publish Tool"
Nach dem Neustart aus dem Menu "Fenster->Benutzervorgaben" auswählen. Hier den Eintrag "Sade Publisher" auswählen und eintragen:

> __SADE Url:__ http://localhost:8080/exist/apps/textgrid-connect/publish/tutorial/

> __Authorized User:__ sade 

> __Password:__ test

![Preferences Screenshot](/exist/rest/sade-projects/textgrid/data/img/preferences.png)


## Eine erste Publikation

### Öffnen der SADE-Publish Perspektive
Falls noch nicht geschehen, nun bitte im TextGridLab anmelden. Den "Welcome-Screen" schliessen, und dann aus der Tool-Leiste die SADE-Publish-Perspektive asuwählen. Es bietet sich die Folgende Ansicht:

![SADE-Publish Perspective Screenshot](/exist/rest/sade-projects/textgrid/data/img/sade-publish2.png)

Der Knopf "Reset" ist zum Zurücksetzen der Ansicht, der Knopf "Publish" löst den Publikationsvorgang aus, dazu mehr im nächsten Abschnitt.

### Hinzufügen eigener Objekte
Nun können Objekte aus einem bestehenden Projekt publiziert werden. Im Navigator links werden geeignete Objekte ausgewählt, dabei ist auch eine Mehrfachauswahl mithilfe der 'Shift' oder 'Strg' Taste möglich. Über den Kontextmenüintrag "Publish to SADE" im Navigator können die ausgewählten Objekte in die rechte Publikationsauswahl einefügt werden, wie im folgenden Screenshot zu sehen.

![SADE-Publish - Objekte hinzufügen](/exist/rest/sade-projects/textgrid/data/img/sade-publish3.png)

Im Publikationsbereich erscheint nun der Name des zu publizierenden Objektes, davor ein Icon das die Art des Objektes anzeigt und ein kleines [x], mit dem einzelne Objekte wieder aus der Liste gelöscht werden können.

### Publikation starten
Ein Klick auf "Publish" löst den Publikationsvorgang aus. Wenn der Publikatiosvorgang eines Objektes abgeschlossen ist erscheint ein grünes Häckchen hinter dem jeweiligen Eintrag.

![SADE-Publish - OK](/exist/rest/sade-projects/textgrid/data/img/sade-publish-done.png)

Die Publikation war erfolgreich. Wie die publizierten Daten nun betrachtet werden können ist im Abschnitt "[Betrachten eigener Inhalte](view.html?id=webgui.md)" zu lesen.

#Betrachten eigener Inhalte

## Suche
Nun kann durch Eingabe eines Suchwortes oben rechts im Suchschlitz nach den eigenen Inhalten gesucht werden [Beispiel](results.html?q=und). Klick auf den Titel können diese angezeigt werden. 

