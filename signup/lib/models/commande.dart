class Commande {
  final id;
  final String numCommande;
  final String titre;
  //final String article;
  final String typeCommande;
  final String caracters;
  final String typeVehicule;
  final String adrDepart;
  final String adrArrive;
  final String status;
  final String prix;
  final customerId;
  final String date;

  Commande(
      this.id,
      this.numCommande,
      this.titre,
      //   this.article,
      this.typeCommande,
      this.adrArrive,
      this.adrDepart,
      this.caracters,
      this.customerId,
      this.date,
      this.prix,
      this.status,
      this.typeVehicule);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'numCommande': numCommande,
      'titre': titre,
      'typecomm': typeCommande,
      'caracteristique': caracters,
      'typevehicule': typeVehicule,
      'adresse_depart': adrDepart,
      'adresse_arrive': adrDepart,
      'status': status,
      'customer_id': {
        "_id": customerId,
      },
      'date': date,
      'prix': prix,
    };
  }

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      json['_id'].toString(),
      json['numCommande'].toString(),
      json['titre'].toString(),
      //json['article'].toString(),
      json['typecomm'].toString(),
      json['adresse_depart'].toString(),
      json['adresse_arrive'].toString(),
      json['caracteristique'].toString(),
      json['customer_id'].toString(),
      json['date'].toString(),
      json['status'].toString(),
      json['typevehicule'].toString(),
      json['prix'].toString(),
    );
  }
}
