# Microdisseny Docker Images

Imatges Docker per a **entorns de desenvolupament Python/Django** a Microdisseny.

Cada imatge parteix d'una versió d'Ubuntu i hi afegeix Python 3, eines de sistema
(GDAL, client de PostgreSQL, gettext, poppler...) i un conjunt d'eines de
desenvolupament i test de Python (`pytest`, `flake8`, `black`, `mypy`, `pylint`...).
Sobre aquesta imatge base es construeixen variants amb **Selenium/Chrome** o amb
**Node + Quasar CLI**.

Totes es publiquen a Docker Hub sota `microdisseny/py3-development` amb un tag per variant.

## Organització del repositori

```
.
├── build.sh                    # construeix totes les imatges
├── publish.sh                  # puja totes les imatges a Docker Hub
├── update-local-images.sh      # actualitza les imatges ja descarregades localment
├── scripts/pip-upgrade.sh      # ajuda a actualitzar requirements-devel.txt
├── py3-development-ubuntu-18.04/    ┐
├── py3-development-ubuntu-20.04/    │  una carpeta per versió d'Ubuntu (18.04,
├── py3-development-ubuntu-22.04/    ├─ 20.04, 22.04, 24.04, 26.04), més les
├── py3-development-ubuntu-24.04/    │  variants -selenium i -node d'algunes
├── py3-development-ubuntu-26.04/    ┘
└── py-development/                  # llegat: 18.04 amb Python 2 + PostgreSQL embegut
```

Hi ha 3 tipus de carpeta d'imatge: **base** (`ubuntu-XX.XX`), **`-selenium`** i
**`-node`**. Cada versió d'Ubuntu té la seva base; les variants existeixen només
per a algunes versions (vegeu `build.sh`).

### Què conté cada carpeta d'imatge

| Fitxer | Descripció |
|---|---|
| `Dockerfile` | Definició de la imatge. Les carpetes base parteixen de `ubuntu:XX.XX`; les variants `-selenium` i `-node` parteixen de `microdisseny/py3-development:ubuntu-XX.XX`. |
| `requirements-devel.txt` | Llista fixada d'eines de desenvolupament/test de Python que s'instal·len a la imatge (només a les imatges base). |
| `entrypoint.sh` | Punt d'entrada. Crea un usuari `user` amb l'UID que es passa a `LOCAL_USER_ID` i executa la comanda com aquest usuari (via `gosu`), per no generar fitxers com a root al volum muntat. |

**Variants:**

- **base** (`py3-development-ubuntu-XX.XX`): Ubuntu + Python 3 + eines de sistema
  + `requirements-devel.txt`. A partir de 24.04 Python viu en un virtualenv a `/opt/venv`.
- **`-selenium`**: afegeix Google Chrome stable + chromedriver + Selenium, per a tests funcionals.
- **`-node`**: afegeix `nodejs`, `npm` i `@quasar/cli` global, per a frontends Quasar.
- **`py-development`**: imatge antiga sobre 18.04 amb Python 2 i 3 i un PostgreSQL/PostGIS
  instal·lat dins la imatge (rol `admin`/`admin`). Ja no forma part de `build.sh`.

## Scripts

### `build.sh` — construir totes les imatges

```bash
./build.sh
```

Fa `docker pull` de cada `ubuntu:XX.XX` i després `docker build` de la imatge base i
de les seves variants, etiquetant-les com `microdisseny/py3-development:ubuntu-XX.XX[-selenium|-node]`.
Cobreix 18.04, 20.04, 22.04, 24.04 i 26.04.

Per construir-ne només una:

```bash
docker build -t microdisseny/py3-development:ubuntu-24.04 py3-development-ubuntu-24.04
```

### `publish.sh` — publicar a Docker Hub

```bash
./publish.sh
```

Fa `docker push` de cada tag de `microdisseny/py3-development` a Docker Hub.
Cal haver fet `docker login` abans i haver construït les imatges amb `build.sh`.

### `update-local-images.sh` — actualitzar imatges locals

```bash
./update-local-images.sh
```

Per a cada imatge de la llista, comprova si ja existeix localment i, si és així,
en fa `docker image pull` per posar-la al dia. Útil en màquines de desenvolupament
per no descarregar imatges que no s'utilitzen.

### `scripts/pip-upgrade.sh` — actualitzar `requirements-devel.txt`

```bash
cd py3-development-ubuntu-24.04
../scripts/pip-upgrade.sh
```

Copia el `requirements-devel.txt` de la carpeta actual a `/tmp`, hi executa
`pip-upgrade` (paquet `pip-upgrade`, cal tenir-lo instal·lat) per pujar totes les
versions fixades a l'última disponible, i mostra el resultat perquè el copiïs de nou
a la carpeta.

## Ús d'una imatge

```bash
docker run --rm -it \
  -e LOCAL_USER_ID=$(id -u) \
  -v "$PWD":/app -w /app \
  microdisseny/py3-development:ubuntu-24.04 bash
```