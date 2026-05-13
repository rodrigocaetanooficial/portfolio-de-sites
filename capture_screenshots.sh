#!/bin/bash
# Captura screenshots de todos os sites do portfolio
# Usa Google Chrome em modo headless

OUTPUT_DIR="/home/rodrigo/portfolio-de-sites/screenshots"
mkdir -p "$OUTPUT_DIR"

URLS=(
  "https://www.alchemyrecruitment.com.au"
  "https://www.arq-urb.com/"
  "https://www.inexistentman.net/"
  "https://www.brv360.com"
  "https://www.caetanobilhar.com.br/"
  "https://www.clinicacarlosgomes.med.br"
  "http://www.criativodegalochas.com.br/"
  "http://www.digitalcopysolucoes.com/"
  "http://www.digitaldreamsfm.com/"
  "https://www.egecongarantidora.com"
  "https://www.engeferr.com"
  "https://www.eliteprinters.com.br/"
  "https://www.claudiacaetano.fst.br/"
  "https://www.gobbilanziotti.com.br/"
  "https://www.graficamoreno.com.br"
  "https://www.imoveiscomerciaissp.com.br"
  "https://www.integrapsicologia.com.br"
  "https://www.maringamanchete.com.br/"
  "https://www.orcamentti.com/"
  "http://www.mvpavan.com.br/"
  "https://www.plantaomaringa.com"
  "https://www.podologamaringa.com.br/"
  "https://www.maringapodologia.com.br/"
  "https://www.prospecbrindes.com.br"
  "https://www.sepultados.com/"
  "https://www.textwizard.tools"
)

# Nomes amigaveis para os arquivos
NAMES=(
  "alchemyrecruitment"
  "arq-urb"
  "inexistentman"
  "brv360"
  "caetanobilhar"
  "clinicacarlosgomes"
  "criativodegalochas"
  "digitalcopy"
  "digitaldreamsfm"
  "egecon"
  "engeferr"
  "eliteprinters"
  "claudiacaetano"
  "gobbilanziotti"
  "graficamoreno"
  "imoveiscomerciais"
  "integrapsicologia"
  "maringamanchete"
  "orcamentti"
  "pavanfotografia"
  "plantaomaringa"
  "podologiamaringa"
  "podologistaelaine"
  "prospecbrindes"
  "sepultados"
  "textwizard"
)

CHROME="/usr/bin/google-chrome-stable"
if [ ! -f "$CHROME" ]; then
  CHROME="/usr/bin/google-chrome"
fi

echo "Usando: $CHROME"

for i in "${!URLS[@]}"; do
  URL="${URLS[$i]}"
  NAME="${NAMES[$i]}"
  OUTFILE="$OUTPUT_DIR/${NAME}.png"
  
  echo "[$((i+1))/${#URLS[@]}] Capturando $NAME..."
  echo "  URL: $URL"
  
  $CHROME \
    --headless \
    --disable-gpu \
    --no-sandbox \
    --disable-dev-shm-usage \
    --window-size=1280,800 \
    --screenshot="$OUTFILE" \
    "$URL" 2>/dev/null
  
  if [ $? -eq 0 ] && [ -f "$OUTFILE" ]; then
    FILESIZE=$(stat -c%s "$OUTFILE" 2>/dev/null || stat -f%z "$OUTFILE" 2>/dev/null)
    echo "  OK - ${FILESIZE} bytes"
  else
    echo "  FALHOU ao capturar $NAME"
  fi
done

echo ""
echo "=== Resumo ==="
ls -la "$OUTPUT_DIR"/*.png 2>/dev/null | wc -l
echo "screenshots capturados em $OUTPUT_DIR"
