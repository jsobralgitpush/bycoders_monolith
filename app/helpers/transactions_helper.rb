module TransactionsHelper
    def set_transaction_kind(transaction_type)
        case transaction_type
        when 1
            "Débito"
        when 2
            "Boleto"
        when 3
            "Financiamento"
        when 4
            "Crédito"
        when 5
            "Recebimento de Empréstimo"
        when 6
            "Vendas"
        when 7
            "Recebimento de TED"
        when 8
            "Recebimento de DOC"
        when 9
            "Aluguel"
        end
    end

    def set_extract_type(transaction_type)
        case transaction_type
        when 1
            "Entrada"
        when 2
            "Saída"
        when 3
            "Saída"
        when 4
            "Entrada"
        when 5
            "Entrada"
        when 6
            "Entrada"
        when 7
            "Entrada"
        when 8
            "Entrada"
        when 9
            "Saída"
        end
    end
end
