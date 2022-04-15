class Commande {
  final id;
  final String numCommande;
  final String article;
  final String typeCommande;
  final String caracters;
  final String typeVehicule;
  final String adrDepart;
  final String adrArrive;
  final String status;
  final  customerId; 
  final String date;

  Commande(
      this.id,
      this.numCommande,
      this.article,
      this.typeCommande,
      this.adrArrive,
      this.adrDepart,
      this.caracters,
      this.customerId,
      this.date,
      this.status,
      this.typeVehicule);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'numCommande': numCommande,
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
    };
  }

  factory Commande.fromJson(Map<String, dynamic> json) {
    return Commande(
      json['_id'].toString(),
      json['numCommande'].toString(),
      json['article'].toString(),
      json['typecomm'].toString(),
      json['adresse_depart'].toString(),
      json['adresse_arrive'].toString(),
      json['caracteristique'].toString(),
      json['customer_id']['_id'].toString(),
      json['date'].toString(),
      json['status'].toString(),
      json['typevehicule'].toString(),
    );
  }
}
