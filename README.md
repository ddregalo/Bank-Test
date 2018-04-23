# Bank Tech Test

A program that processes bank transactions (deposit or withdrawal) and returns an account statement of all transactions by a single user. The account statement includes **date**, **amount** (credit or debit) and resulting **balance** for each transaction in order of most recent transaction showing first (at the top of statement).


## Program Description

* **Code Language**: Ruby (2.5.0)
* **Usage/Interaction**: IRB (console repl)
* **Testing**: Rspec-simplecov


## User Stories/Journeys

```
As a person,
So I can manage my money,
I want to start a new bank account with a balance of zero.

As a client of a bank,
So I can keep my money in a safe place,
I want to deposit a sum of money into my account.

As a client of a bank,
So I can have money when I need it,
I want to withdraw a sum of money from my account.

As a client of a bank,
So I can know how much money I have available,
I want to check my balance at any time.

As a client of a bank,
So I can keep track of my finances,
I want to see an account statement printed
with all past transactions - details of date,
transaction amount and resulting balance for each transaction.

EDGE CASE (Additional Feature)

As a bank,
So I can protect my business and other client's money,
I want to ensure a client can not withdraw more money
than their current balance.

```


## Program Feature Demonstration (IRB in console)
```
> require_relative './lib/account.rb'
 => true

> require_relative './lib/statement.rb'
 => true

> require_relative './lib/date_formatter.rb'
 => true

> require_relative './lib/printer.rb'
 => true

> account = Account.new
 => #<Account:0x00007fe59708acd0 @balance=0, @date=#<DateFormatter:0x00007fe59708ac58>, @statement=#<Statement:0x00007fe59708aca8 @transaction_history=[]>, @printer=#<Printer:0x00007fe59708ac30>>

> account.deposit(1000)
 => ["23/04/2018 || 1000.00 ||  || 1000.00"]

> account.withdraw(1500)
Traceback (most recent call last):
        3: from /Users/danielcampos/.rvm/rubies/ruby-2.5.0/bin/irb:11:in `<main>'
        2: from (irb):7
        1: from /Users/danielcampos/Projects/Tech-Test-Practise/Bank-Test/lib/account.rb:25:in `withdraw'
RuntimeError (Transaction Denied! Your maximum available balance is 1000.)

> account.withdraw(500)
 => ["23/04/2018 || 1000.00 ||  || 1000.00", "23/04/2018 ||  || 500.00 || 500.00"]

> account.show_account_statement
DATE || CREDIT || DEBIT || BALANCE
23/04/2018 || 1000.00 ||  || 1000.00
23/04/2018 ||  || 500.00 || 500.00
 => nil
 ```

Feel free to get in touch for any questions or comments - suggestions are always welcome! :)
