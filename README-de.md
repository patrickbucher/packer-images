# Warum Packer?

Packer erlaubt es, Basis-Images als Code zu definieren. Diese sind ein Teil der
übergeordneten Idee _Infrastruktur als Code_. Aber warum soll man Infrastruktur
mithilfe von Code bauen?

- _Wiederverwendbarkeit_: Mit Code können mehrere Instanzen der gleichen Sache
  erstellt werden ‒ identische Kopien oder parametrisierte Variationen davon.
- _Konsistenz_: Mit Code kann alles jedes mal genau gleich gebaut werden. Die
  Ergebnisse werden so besser vorhersehbar.
- _Transparenz_: Mit Code kann man genau nachvollziehen und verstehen, wie etwas
  gebaut wird. Den Code kann man begutachten, kommentieren, auditieren und
  verbessern.
- _Reproduzierbarkeit_: Mit Code kann eine Sache bei Bedarf einfach neu gebaut
  werden. Die einzige Frage ist, _ob_ man die Sache neu bauen will, nicht _wie_
  man das machen soll.
- _Verfügbarkeit_: Mit Code können beschädigte Sachen einfach weggeworfen und
  neu gebaut werden. Das Neubauen ist einfacher und sicherer als
  manuelle Rettungsversuche des Alten.
