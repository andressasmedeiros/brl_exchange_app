# BRL Exchange Rate App
Aplicativo Flutter desenvolvido como parte de um teste técnico para a Action Labs. O app mostra a cotação do Real brasileiro (BRL) frente a outras moedas em tempo real e também o histórico dos últimos 30 dias, com cálculo da variação diária (close diff).

## Tecnologias
- Flutter (versão 3.35.2 ou superior)
- Dart
- BLoC / Cubit para gerenciamento de estado
- HTTP para chamadas de API

## Como rodar o projeto
1. Clonar repositório
```bash
   git clone https://github.com/seuusuario/brl_exchange_app.git  
   cd brl_exchange_app
   ```
2. Configurar variáveis de ambiente. Na raiz do projeto, crie um arquivo chamado .env
```bash
BASE_URL=
API_KEY=
```

3. Instalar dependências
```bash
   flutter pub get
   ```  

4. Rodar no emulador/dispositivo (Utilizei AndroidStudio)
   ```bash
   flutter run
   ```  

## Funcionalidades
- Buscar a cotação atual do BRL frente a qualquer moeda (USD, EUR, GBP, JPY, CAD etc).
- Exibir o histórico de até 30 dias da moeda selecionada.
- Calcular a variação diária de fechamento (close diff).

## Estrutura do projeto
```bash
lib/  
 └── src/  
     ├── api/        -> chamadas de API  
     ├── models/     -> classes de dados (ExchangeRate, DailyRate)  
     ├── bloc/       -> cubits/blocs e estados  
     ├── ui/         -> telas e widgets  
     └── utils/      -> funções auxiliares
```

## API utilizada 
Endpoints principais:  
- currentExchangeRate → cotação atual  
- dailyExchangeRates → histórico de dias  


## Prints de execução
### Tela principal do app


  
### Resposta no Postman



## Autor
- Nome: Andressa Medeiros
- E-mail: andressasmedeiross@gmail.com  
- LinkedIn: [Meu Linkedin](https://www.linkedin.com/in/andressasmedeiros/)

