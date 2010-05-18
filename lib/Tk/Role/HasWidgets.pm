use 5.010;
use strict;
use warnings;

package Tk::Role::HasWidgets;
# ABSTRACT: keep track of your tk widgets

use Moose::Role;
use MooseX::Has::Sugar;


=method _set_w

    $object->_set_w( $name, $widget );

Store a reference to C<$widget> and associate it to C<$name>.

=method _w

    my $widget = $object->_w( $name );

Get back the C<$widget> reference associated to C<$name>.

=cut

# a hash to store the widgets for easier reference.
has _widgets => (
    ro,
    traits  => ['Hash'],
    isa     => 'HashRef',
    default => sub { {} },
    handles => {
        _set_w => 'set',
        _w     => 'get',
    },
);

1;
__END__

=head1 DESCRIPTION



=head1 SEE ALSO

You can look for information on this module at:

=over 4

=item * Search CPAN

L<http://search.cpan.org/dist/Tk-Role-HasWidgets>

=item * See open / report bugs

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Tk-Role-HasWidgets>

=item * Git repository

L<http://github.com/jquelin/tk-role-haswidgets>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Tk-Role-HasWidgets>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Tk-Role-HasWidgets>

=back
