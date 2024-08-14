import 'package:final_finetech/screens/home/components/custom_navigation_bar.dart';
import 'package:final_finetech/screens/wallet/wallet_screent.dart';
import 'package:flutter/material.dart';
import 'package:final_finetech/models/credit_card.dart';
import 'package:final_finetech/services/credit_card_service.dart';
import 'package:final_finetech/models/earnings.dart';
import 'package:final_finetech/services/earnings_service.dart';
import 'package:final_finetech/screens/profile/profile_screen.dart';
import 'components/stock_banner.dart';
import 'package:final_finetech/services/product_service.dart';
import 'package:final_finetech/models/transactions.dart';
import 'package:final_finetech/screens/home/components/transactions.dart';
import 'components/custom_app_bar.dart';
import 'components/earnings.dart';
import 'package:final_finetech/screens/home/components/wallet_banner.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  List<Transaction> everyProduct = [];
  List<Earnings> earningsList = [];
  List<CreditCard> creditCards = [];

  @override
  void initState() {
    super.initState();
    loadCreditCards();
    loadTransactions();
    loadEarnings();
  }

  Future<void> loadCreditCards() async {
    CreditCardService creditCardService = CreditCardService();
    try {
      List<CreditCard> loadedCards = await creditCardService.getCreditCards();
      setState(() {
        creditCards = loadedCards;
      });
    } catch (e) {
      print('Error loading credit cards: $e');
    }
  }

  Future<void> loadEarnings() async {
    EarningsService earningsService = EarningsService();
    try {
      List<Earnings> allEarnings = await earningsService.getEarnings();
      setState(() {
        earningsList = allEarnings;
      });
    } catch (e) {
      print('Error loading earnings: $e');
    }
  }

  Future<void> loadTransactions() async {
    ProductService productService = ProductService();
    try {
      List<Transaction> allProducts = await productService.getProducts();
      setState(() {
        everyProduct = allProducts;
      });
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        index: currentPageIndex,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPageIndex,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  const WalletBalanceBanner(),
                  const StockBanner(),
                  EarningsList(
                    earnings: earningsList,
                    index: currentPageIndex,
                  ),
                  const SizedBox(height: 20),
                  TransactionsList(
                      products: everyProduct,
                      title: 'Transactions',
                      index: currentPageIndex),
                ],
              ),
            ),
            WalletScreen(
                products: everyProduct,
                index: currentPageIndex,
                creditCards: creditCards), // Pass credit cards here
            const Center(child: Text('Analytics')),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentPageIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
