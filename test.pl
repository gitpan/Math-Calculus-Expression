# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use Test;
BEGIN { plan tests => 8 };

use Math::Calculus::Expression;
ok(1);

my $exp = Math::Calculus::Expression->new;
ok(ref $exp);

ok($exp->setExpression('2*x + a'));

ok($exp->getExpression eq '2*x + a');

ok($exp->evaluate(x => 20, a => 2) == 42);

my $exp2 = $exp->clone;
ok($exp->sameRepresentation($exp2));

$exp->setExpression('2*3*x');
$exp->simplify;
ok($exp->getExpression eq '6*x');

$exp->setExpression('x^(2+1) + 6*5*x');
$exp->simplify;
ok($exp->getExpression eq 'x^3 + 30*x');
