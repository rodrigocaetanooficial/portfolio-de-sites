#!/bin/bash
# Screenshot script - captures all 25 sites
SCR_DIR="/home/rodrigo/portfolio-de-sites/screenshots"
CHROME="google-chrome-stable"

# Array of URLs and filenames
declare -A SITES
SITES["alchemy"]="https://www.alchemyrecruitment.com.au"
SITES["arquitetos-urbanistas"]="https://www.arq-urb.com/"
SITES["inexistentman"]="https://www.inexistentman.net/"
SITES["brv360"]="https://www.brv360.com"
SITES["caetano-bilhar"]="https://www.caetanobilhar.com.br/"
SITES["clinica-carlos-gomes"]="https://www.clinicacarlosgomes.med.br"
SITES["criativo-galochas"]="http://www.criativodegalochas.com.br/"
SITES["digital-copy"]="http://www.digitalcopysolucoes.com/"
SITES["digitaldreams"]="http://www.digitaldreamsfm.com/"
SITES["egecon"]="https://www.egecongarantidora.com"
SITES["engeferr"]="https://www.engeferr.com"
SITES["elite-printers"]="https://www.eliteprinters.com.br/"
SITES["claudia-caetano"]="https://www.claudiacaetano.fst.br/"
SITES["gobbi-lanziotti"]="https://www.gobbilanziotti.com.br/"
SITES["grafica-moreno"]="https://www.graficamoreno.com.br"
SITES["imoveis-comerciais-sp"]="https://www.imoveiscomerciaissp.com.br"
SITES["integra-psicologia"]="https://www.integrapsicologia.com.br"
SITES["maringa-manchete"]="https://www.maringamanchete.com.br/"
SITES["orcamentti"]="https://www.orcamentti.com/"
SITES["pavan-fotografia"]="http://www.mvpavan.com.br/"
SITES["plantao-maringa"]="https://www.plantaomaringa.com"
SITES["podologia-claudia"]="https://www.podologamaringa.com.br/"
SITES["podologista-elaine"]="https://www.maringapodologia.com.br/"
SITES["prospec-brindes"]="https://www.prospecbrindes.com.br"
SITES["sepultados"]="https://www.sepultados.com/"
SITES["textwizard"]="https://www.textwizard.tools"

for NAME in "${!SITES[@]}"; do
    URL="${SITES[$NAME]}"
    OUTPUT="$SCR_DIR/$NAME.png"
    echo "Capturing $NAME -> $URL"
    $CHROME --headless --disable-gpu --no-sandbox --disable-dev-shm-usage \
        --screenshot="$OUTPUT" --window-size=1280,900 \
        "$URL" 2>/dev/null
    echo "Done: $NAME ($(stat -c%s "$OUTPUT" 2>/dev/null || echo 'FAILED') bytes)"
done
echo ""
echo "=== ALL DONE ==="
ls -la "$SCR_DIR/"
