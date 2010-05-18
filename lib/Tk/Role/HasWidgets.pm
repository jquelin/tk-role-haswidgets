use 5.010;
use strict;
use warnings;

package Tk::Role::HasWidgets;
# ABSTRACT: keep track of your tk widgets

use Moose::Role 0.92;
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

=head1 SYNOPSIS

    package Your::Tk::Window::Class;

    use Moose;
    with 'Tk::Role::HasWidgets';

    # later on, in one of the methods
    $self->_w( 'my_button' )->configure( ... );


=head1 DESCRIPTION

When programming C<Tk>, it's almost always a good idea to keep a
reference to the widgets that you created in the interface. Most of the
time, a simple hash is enough; but it is usually wreapped up in methods
to make the hash private to the window object. And of course, those
methods are duplicated in all modules, under a form or another.

Since duplication is bad, this module implements a role implementing
those methods once and forever.


=head2 About the method names

The methods featured in this role begin with C<_>, that is, they are
following Perl convention of private methods. This is on purpose:
remember that this method is a role, consumed by your class. And you
don't want those methods to be available outside of the window
class, do you?



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
