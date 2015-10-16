# Assignment: Project 2
# Author: Matthew Rogers
# Verzion: 9.28.2015

use 5.14.1;
use warnings;

my ($orderNumber, $numberCharacters, $totalBill, $woodType, $colorCharacters, $continueInt );
my ($customerName);

sub main {
	use constant YES => 1;
	setContinueInt();
	system("cls");
	if($continueInt == YES) {
		setCustomerName();
		setOrderNumber();
		setWoodType();
		setNumberCharacters();
		setColorCharacters();
		calculateTotalBill();
		printTotalBill();
		main();
	}
	printGoodbye();
}
main();

sub setContinueInt {
	if (defined $continueInt) {
		print "Do you want to continue (0=no, 1=yes)? ";
		chomp ($continueInt = <STDIN>);
	} else {
		$continueInt = 1;
	}
}

sub setCustomerName {
	print "\n\nPlease enter your name: ";
	chomp ($customerName = <STDIN>);
}

sub setOrderNumber {
	print "\n\nPlease enter your order number: ";
	chomp ($orderNumber =<STDIN>);
}

sub setWoodType {
	print "\n\nWould you like oak (NO=0, YES=1)? ";
	chomp ($woodType = <STDIN>);
}

sub setNumberCharacters {
	print "\n\nHow many letters would you like on your sign?: ";
	chomp ($numberCharacters = <STDIN>);
}

sub setColorCharacters {
	print "\n\nWould you like gold characters (NO=0, Yes=1)? ";
	chomp ($colorCharacters = <STDIN>);
}

sub calculateTotalBill {
	use constant MIN_CHARGE => 30;
	use constant MIN_NUM_LETTERS => 6;
	use constant GOLD_LETTER_COLOR => 12;
	use constant OAK_WOOD => 15;
	if ($numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters <= 0 && $woodType <= 0){
		$totalBill = MIN_CHARGE
	} elsif ($numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType >= 1){
		$totalBill = MIN_CHARGE + GOLD_LETTER_COLOR + OAK_WOOD
	} elsif ($numberCharacters > 0 && $numberCharacters > MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType >= 1){
		$totalBill = MIN_CHARGE + (($numberCharacters - 6)* 3) + GOLD_LETTER_COLOR + OAK_WOOD
	} elsif ($numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType <= 0){
		$totalBill = MIN_CHARGE + GOLD_LETTER_COLOR 
	} elsif ($numberCharacters > 0 && $numberCharacters > MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType <= 0){
		$totalBill = MIN_CHARGE +(($numberCharacters - 6)* 3) + GOLD_LETTER_COLOR
	} elsif ($numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters <= 0 && $woodType >=1){
		$totalBill = MIN_CHARGE + OAK_WOOD
	}
}

sub printTotalBill {
	use constant TOTAL_BILL => 1;
	system("cls");
	if ($totalBill > TOTAL_BILL && $numberCharacters > 0 && $numberCharacters > MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType >= 1){
		print "\n\nYou wanted oak, you wanted $numberCharacters letters on your sign, and you wanted gold letters, your total is \$$totalBill " ;
	} elsif ($totalBill > TOTAL_BILL && $numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters <= 0 && $woodType <= 0){
		print "\n\nYou wanted pine, you wanted $numberCharacters letters on your sign, and you wanted original letters, your total is \$$totalBill";
	} elsif ($totalBill > TOTAL_BILL && $numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType >= 1){
		print "\n\nYou wanted oak with gold letters and $numberCharacters letters your total is \$$totalBill ";
	} elsif ($totalBill > TOTAL_BILL && $numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType <= 0){
		print "\n\nYou wanted pine with gold letters and $numberCharacters your total is \$$totalBill ";
	} elsif ($totalBill > TOTAL_BILL && $numberCharacters > 0 && $numberCharacters > MIN_NUM_LETTERS && $colorCharacters >= 1 && $woodType <= 0){
		print "\n\nYou wanted pine with gold letters and $numberCharacters your total is \$$totalBill ";
	} elsif ($totalBill >TOTAL_BILL && $numberCharacters > 0 && $numberCharacters < MIN_NUM_LETTERS && $colorCharacters <= 0 && $woodType >=1){
		print "\n\nYou wanted oak with original letters and $numberCharacters your total is \$$totalBill ";
	}
}

sub printGoodBye {
	system ("cls");
	print "\n\n\t\tGoodbye";
}