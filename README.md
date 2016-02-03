# Defective Circuit Board Ruby Kata

I've converted the 'Defective Circuit Board Puzzle' from [ datagenics ]( http://datagenetics.com/blog/january32016/index.html ) into a Ruby kata. The text below is directly from the datagenics site, I couldn't have put it better myself:

> Let’s imagine that I have ten old computer circuit boards. Eight are in perfect condition, and two are defective.
> I want to determine which are the two defective boards, and the only tool I have is an antiquated testing machine. To use the machine, I have to insert exactly three circuit boards, then push a test button. The test machine always gives a result and identifies a 'defective' board. Knowing what I do about the peculiarities of this test machine, here’s what could happen:

> * If exactly one of the boards is defective, the machine correctly identifies the defective board.
> * If two of the boards are defective, the machine randomly (and correctly) identifies one of the defective boards.
> * If none of the boards are defective, the machine, bogusly, identifies one of the good boards (at random) as bad.

> Because we know there are only two defective boards, there will never be a scenario where three defective boards are in the machine at the same time.
> So, whatever the composition of states of boards inserted into the test machine, on every test, one circuit board will be classified as defective (sometimes correctly, but possibly incorrectly).
> The test machine is agnostic of the ordering of the cards so there is no information that can be gained form knowing which slot any card was in when the test was run. Also, there is no information about the bias, periodicity, skew, or affinity when a card is selected at random, so any strategy involving repeating the same test multiple times and averaging the results is bogus.
What

> Can you devise a strategy that will allow you to determine which two boards are defective? What is the smallest number of tests needed to perform this task?

I've provided some classes to help:

## CircuitBoard ##
A circuit board is what you're trying to test. I've provided a Board::Generator which can produce a set of 10 circuit boards, where 2 are faulty. You'll be using that rather than individually creating circuit boards.

## Board::Generator ##
The generator returns an array of 10 circuit boards for you to use when devising your solution.

> Board::Generator.new_set

## BoardTester ##
This is your circuit board tester! It has the limitations defined above.
You can call the test method, handing in an array of 3 circuit boards for it to test. The response will be an array of boolean values, one for each circuit board.

*  True means a board is working.
*  False means a board is faulty.

With the caveats mentioned above of course ;-)

## Workbench ##
I've made this class to get you started. If you run rspec you'll see that there's a pending test, which is currently failing. If you return the defective cards, the test will pass.

Use the Board generator to get yourself some circuit boards
> boards = Board::Generator.new_set

Test some
> Board::Tester.test(boards.pick(3)) #=> [true, true, false]

N.B. Circuit boards have have a 'working?' method on them, obviously you could easily solve this by using this attribute, that's not the idea of the kata. The solution should solve the problem through exclusive use of the BoardTester and its output.

I've not made a kata before. Let me know what you think, if you enjoy it, if you didn't.

# How do I begin? #
> git clone git@github.com:krazerxz/defective-circuit-board-kata-ruby.git
> cd defective-circuit-board-kata-ruby
> gem install bundler
> bundle install
> rspec

Have fun!
