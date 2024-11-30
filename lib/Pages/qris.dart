import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRISPaymentPage extends StatelessWidget {
  final double amount;
  
  // ignore: use_super_parameters
  const QRISPaymentPage({
    Key? key,
    required this.amount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Dummy QRIS data - in real app this would come from your backend
    String qrisData = "00020101021226590014COM.MIDTRANS.WWW0120ID10200000000000002152046251043105802ID5910YourStore6007Jakarta610512345626304E36D";
    
    // Format currency to Indonesian Rupiah
    final currencyFormat = amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.'
    );
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.brown.shade800,
            Colors.brown.shade600,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.brown.shade800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            'Rp ${currencyFormat}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade900,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.brown.shade200,
                                width: 1,
                              ),
                            ),
                            child: QrImageView(
                              data: qrisData,
                              version: QrVersions.auto,
                              size: 180.0,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Scan QR code using your mobile banking or e-wallet app',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.brown.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Cancel Payment',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
