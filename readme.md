# 2022 TCCoE Logika Presentation

This repository holds the [Sireum](https://github.com/sireum/kekinian) [Presentasi](https://github.com/sireum/presentasi-example)
source and pre-built binary of the 
[2022 Trusted Computing Center of Excellence (TCCoE)](https://hopin.com/events/tccoe-2022-summit)
talk on Logika, titled "Integrated Formal Verification Environment for seL4 Applications".

The Presentasi script is [bin/presentasi.cmd](bin/presentasi.cmd); it is configured for Microsoft Azure's text-to-speech synthesizer with "Ryan" neural voice.


## How To Watch The Presentation

Install [Sireum](https://github.com/sireum/kekinian), then execute the following in a terminal inside this repo 
local directory:

* macOS:

  ```bash
  $SIREUM_HOME/sireum proyek run . Presentasi
  ```

* Windows:

  ```cmd
  %SIREUM_HOME%\sireum proyek run . Presentasi
  ```

Alternatively, you can also download the pre-built jar at:

https://github.com/sireum/tccoe22-logika/releases/download/final/tccoe22-logika.jar

which can be run on macOS or Windows by using any Java 11+ with JavaFX:

```
java -jar tccoe22-logika.jar
```

Finally, a pre-recorded Presentasi video is also available at:

https://github.com/sireum/tccoe22-logika/releases/download/final/tccoe22-logika.mp4
