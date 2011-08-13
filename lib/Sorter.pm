# implement this
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
  my @sorted = sort { $a <=> $b } @{$self->{values}};
  $self->{values} = \@sorted;

}

1;
