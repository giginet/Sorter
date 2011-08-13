# 
# Sorter.pm
# created by giginet on 2011/8/14
#
=head1 Module Name

Sorter.pm

=head1 Description

This module will sort an array by 'Quick Sort'.

=head1 Usage

my $sorter = Sorter->new; 

$sorter->set_values(5,4,3,2,1); 

$sorter->sort;

$sorter->get_values # (1,2,3,4,5)

=head1 Author

giginet

=cut

package Sorter;
use strict;
use warnings;

sub new{
  my $class = shift;
  my $self = {
    values => \@_,
  };
  return bless $self, $class;
}

sub set_values{
  my $self = shift;
  $self->{values} = \@_;
}

sub get_values{
  my $self = shift;
  return @{$self->{values}};
}

sub sort{
  my $self = shift;
  my @values = $self->get_values;
  $self->_quick_sort(0, $#values);
}

sub _quick_sort(){
  my ($self, $begin, $end) = @_;
  my @values = $self->get_values;
  my ($i, $j, $pivot);
  if ($begin < $end) {
    ($i, $j) = ($begin, $end);
    $pivot = $values[($begin+$end)/2];
    while($i <= $j){
      ++$i while ($values[$i] < $pivot);
      --$j while ($values[$j] > $pivot);
      if ($i <= $j) {
        ($values[$i], $values[$j]) = ($values[$j], $values[$i]);
        ++$i, --$j;
      }
    }
    $self->set_values(@values);
    $self->_quick_sort($begin, $j);
    $self->_quick_sort($i, $end);
  }
}

1;
