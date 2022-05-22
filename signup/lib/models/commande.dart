class Commande {
  final id;
  final String numCommande;
  final String titre;
  //final String article;
  final String typeCommande;
  final String adrArrive;
  final String adrDepart;
  final String caracters;
  final String customerId;
  var livreurId;
  final String date;
  final String prix;
  final String status;
  final String typeVehicule;
  final String code;

  Commande(
      this.id,
      this.numCommande,
      this.titre,
      //   this.article,
      this.typeCommande,
      this.adrDepart,
      this.adrArrive,
      this.caracters,
      this.customerId,
      this.livreurId,
      this.date,
      this.status,
      this.prix,
      this.typeVehicule,
      this.code);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'numCommande': numCommande,
      'titre': titre,
      'typec': typeCommande,
      'adresse_depart': adrDepart,
      'adresse_arrive': adrArrive,
      'caracteristique': caracters,
      'customer_id': customerId,
      'livreur_id': livreurId,
      'date': date.toString(),
      'status': status,
      'prix': prix,
      'typevehicule': typeVehicule,
      'code': code,
    };
  }

  factory Commande.fromJson(Map<String, dynamic> json) {

    return Commande(
      json['_id'].toString(),
      json['numCommande'].toString(),
      json['titre'].toString(),
      //json['article'].toString(),
      json['typec'].toString(),
      json['adresse_depart'].toString(),
      json['adresse_arrive'].toString(),
      json['caracteristique'].toString(),
      json['customer_id'].toString(),
      json['livreur_id'].toString(),
      //livreur,
      json['date'].toString()==null?'2022-05-15T21:19:44.580Z':json['date'].toString(),
      json['status'].toString(),
      json['prix'].toString(),
      json['typevehicule'].toString(),
      json['code'].toString(),
    );
  }
}
