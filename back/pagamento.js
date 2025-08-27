function calcularDias(dataInicio, dataFim) {
        const inicio = new Date(dataInicio);
        const fim = new Date(dataFim);
        const diffTime = fim - inicio;
        return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    }

    const urlParams = new URLSearchParams(window.location.search);
    const checkin = urlParams.get('checkin');
    const checkout = urlParams.get('checkout');
    const parcelas = parseInt(urlParams.get('parcelas')) || 1;
    const precoBase = parseFloat(urlParams.get('preco')) || 200;
    const dias = calcularDias(checkin, checkout);
    const total = dias * precoBase;
    const valorParcela = total / parcelas;

    document.getElementById('resumo').innerHTML = `
        <p><strong>Quarto:</strong> Suíte Standard</p>
        <p><strong>Data de entrada:</strong> ${checkin}</p>
        <p><strong>Data de saída:</strong> ${checkout}</p>
        <p><strong>Total de dias:</strong> ${dias}</p>
        <p><strong>Preço por noite:</strong> R$ ${precoBase.toFixed(2)}</p>
        <p><strong>Total:</strong> R$ ${total.toFixed(2)}</p>
        <p><strong>Parcelamento:</strong> ${parcelas}x de R$ ${valorParcela.toFixed(2)}</p>
    `;