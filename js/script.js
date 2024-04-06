const ulrUF = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
const uf = document.getElementById("estado");
window.addEventListener('load', carregaUF)

// Determina os Estados
async function carregaUF() {
    const request = await fetch(ulrUF);
    const response = await request.json();

    const options = document.createElement("optgroup");
    options.setAttribute('label', 'Estado');
    response.forEach(function (uf) {
        options.innerHTML += '<option>' + uf.sigla + '</option>'
    })

    uf.append(options);

}

// Cria uma mascara
function mascara(mascara, documento) {
    let i = documento.value.length;
    let saida = '#';
    let texto = mascara.substring(i);
    while (texto.substring(0, 1) != saida && texto.length) {
        documento.value += texto.substring(0, 1);
        i++;
        texto = mascara.substring(i);
    }
}