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
   git clone https://github.com/andressasmedeiros/brl_exchange_app.git  
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
  flutter run --dart-define-from-file=.env 
   ```  

## Funcionalidades
- Buscar a cotação atual do BRL frente a qualquer moeda (USD, EUR, GBP, JPY, CAD etc).
- Exibir o histórico de até 30 dias da moeda selecionada.
- Calcular a variação diária de fechamento (close diff).
- Quando clica na imagem do topo volta para o estado inicial do aplicativo.

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
<img width="180" height="858" alt="image" src="https://github.com/user-attachments/assets/26877a78-7ae3-48a0-ac61-6bea46d02ccd" />
<img width="180" height="853" alt="image" src="https://github.com/user-attachments/assets/37f6b647-9fce-4079-b9eb-a5c2c4dcc366" />
<img width="180" height="857" alt="image" src="https://github.com/user-attachments/assets/295eb859-9924-4576-8c90-2e7de98cec43" />
<img width="180" height="847" alt="image" src="https://github.com/user-attachments/assets/d04173be-752a-4353-9790-ad945e2cdeb6" />
  
### Resposta no Postman
<img width="893" height="288" alt="image" src="https://github.com/user-attachments/assets/7eabc677-2996-4068-a4fd-b1592cc28e81" />
<img width="860" height="693" alt="image" src="https://github.com/user-attachments/assets/78c0d305-8f3a-454c-b19d-d771c3b7b6cf" />

## Autor
- Nome: Andressa Medeiros
- E-mail: andressasmedeiross@gmail.com  
- LinkedIn: [Meu Linkedin](https://www.linkedin.com/in/andressasmedeiros/)

