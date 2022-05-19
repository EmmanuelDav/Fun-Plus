import 'classes.dart';

List<CompanyStocks> stocksList = [
  CompanyStocks(name: "A10 NETWORKS INC.", price: 10.34),
  CompanyStocks(name: "Intel Corp", price: 56.96),
  CompanyStocks(name: "HP Inc", price: 32.43),
  CompanyStocks(name: "Advanced Micro Devices Inc.", price: 77.44),
  CompanyStocks(name: "Apple Inc", price: 133.98),
  CompanyStocks(name: "Amazon.com, Inc.", price: 3505.44),
  CompanyStocks(name: "Microsoft Corporation", price: 265.51),
  CompanyStocks(name: "Facebook", price: 339.1),
  CompanyStocks(name: "A10 NETWORKS INC.", price: 10.34),
  CompanyStocks(name: "Intel Corp", price: 56.96),
  CompanyStocks(name: "HP Inc", price: 32.43),
  CompanyStocks(name: "Advanced Micro Devices Inc.", price: 77.44),
  CompanyStocks(name: "Apple Inc", price: 133.98),
  CompanyStocks(name: "Amazon.com, Inc.", price: 3505.44),
  CompanyStocks(name: "Microsoft Corporation", price: 265.51)
];

final List<League> data = <League>[
  League(
    'Premier League',
    <Club>[
      Club(
        'Liverpool',
        <Player>[
          Player('Virgil van Dijk'),
          Player('Mohamed Salah'),
          Player('Sadio Mané'),
        ],
      ),
      Club(
        'Manchester City',
        <Player>[
          Player('Kevin De Bruyne'),
          Player('Sergio Aguero'),
        ],
      ),
    ],
  ),
  League(
    'La Liga',
    <Club>[
      Club(
        'Real Madrid',
        <Player>[
          Player('Sergio Ramos'),
          Player('Karim Benzema'),
        ],
      ),
      Club(
        'Barcelona',
        <Player>[
          Player('Lionel Messi'),
        ],
      ),
    ],
  ),
  League(
    'Ligue One',
    <Club>[
      Club(
        'Paris Saint-Germain',
        <Player>[
          Player('Neymar Jr.'),
          Player('Kylian Mbappé'),
        ],
      ),
    ],
  ),
  League(
    'Bundeshliga',
    <Club>[
      Club(
        'Bayern Munich',
        <Player>[
          Player('Robert Lewandowski'),
          Player('Manuel Neuer'),
        ],
      ),
    ],
  ),
];
