# Star Wars Dice

Rolls and interprets probabilities for Star Wars TTRPGs

## Usage

1. Figure out the dice pool you want to roll (after upgrades and downgrades have been applied)

2. Pass the number of dice into the `bin/roll.rb` script to get the net result of the roll.

    ```bash
    > bin/roll.rb -d1 -a2 -b1 -s1 -p1 -c1
    => Success: 1, Advantage: 1
    ```
  * Use `bin/roll.rb --help` to show all options and flags
