import os

sites = [
    ("Alchemy Recruitment", "https://www.alchemyrecruitment.com.au", "alchemyrecruitment"),
    ("Arquitetos Urbanistas", "https://www.arq-urb.com/", "arq-urb"),
    ("Blog do Inexistent Man", "https://www.inexistentman.net/", "inexistentman"),
    ("BRV360", "https://www.brv360.com", "brv360"),
    ("Caetano Bilhar", "https://www.caetanobilhar.com.br/", "caetanobilhar"),
    ("Clinica Carlos Gomes", "https://www.clinicacarlosgomes.med.br", "clinicacarlosgomes"),
    ("Criativo de Galochas", "http://www.criativodegalochas.com.br/", "criativodegalochas"),
    ("Digital Copy Solucoes", "http://www.digitalcopysolucoes.com/", "digitalcopy"),
    ("DigitalDreams FM", "http://www.digitaldreamsfm.com/", "digitaldreamsfm"),
    ("Egecon", "https://www.egecongarantidora.com", "egecon"),
    ("Engeferr Estruturas Metalicas", "https://www.engeferr.com", "engeferr"),
    ("Elite Printers", "https://www.eliteprinters.com.br/", "eliteprinters"),
    ("Fisio Claudia Caetano", "https://www.claudiacaetano.fst.br/", "claudiacaetano"),
    ("Gobbi &amp; Lanziotti", "https://www.gobbilanziotti.com.br/", "gobbilanziotti"),
    ("Grafica Moreno", "https://www.graficamoreno.com.br", "graficamoreno"),
    ("Imoveis Comerciais SP", "https://www.imoveiscomerciaissp.com.br", "imoveiscomerciais"),
    ("Integra Psicologia", "https://www.integrapsicologia.com.br", "integrapsicologia"),
    ("Maranga Manchete", "https://www.maringamanchete.com.br/", "maringamanchete"),
    ("Orcamentti", "https://www.orcamentti.com/", "orcamentti"),
    ("Pavan Fotografia", "http://www.mvpavan.com.br/", "pavanfotografia"),
    ("Plantao Maranga", "https://www.plantaomaringa.com", "plantaomaringa"),
    ("Podologia Claudia Caetano", "https://www.podologamaringa.com.br/", "podologiamaringa"),
    ("Podologista Elaine Amaral", "https://www.maringapodologia.com.br/", "podologistaelaine"),
    ("Prospec Brindes", "https://www.prospecbrindes.com.br", "prospecbrindes"),
    ("Sepultados.com", "https://www.sepultados.com/", "sepultados"),
    ("TextWizard", "https://www.textwizard.tools", "textwizard"),
]

# Generate HTML table rows (3 columns)
rows = []
for i in range(0, len(sites), 3):
    cells = []
    for j in range(3):
        if i + j 