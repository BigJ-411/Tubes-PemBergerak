class KontakModel {
  final String? phone;
  final String? nama;

  KontakModel({
    required this.phone,
    required this.nama,
  });

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'phone': phone,
      };
}
