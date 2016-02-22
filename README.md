# ytnobody/amagi

Minimalist JSON Web Framework written in perl on a container

## SYNOPSIS

### Write a your application

Need to write a JSON Web Application in perl.

Example.

    use strict;
    use warnings;
    use Amagi;
    amagi_init;
    
    our $member = {};
    
    get '/' => sub {
        { members => [ sort keys %$member ] };
    };
    
    get '/member/{id:[0-9]+}' => sub {
        my ($app, $req) = @_;
        my $id = $req->captured->{id};
        { member => $member->{$id} };
    };
    
    post '/member/{id:[0-9]+}' => sub {
        my ($app, $req) = @_;
        my $id   = $req->captured->{id}; 
        my $name = $req->param('name') || 'Anonymous';
        $member->{$id} = {id => $id, name => $name};
        { message => 'registered' };
    };
    
    __PACKAGE__->app;

Then, save as 'app.psgi'.

### Write a your Dockerfile

Example.

    FROM ytnobody/amagi
    MAINTAINER your name <yourname@yourdomain.example>
    ADD app.psgi app.psgi
    EXPOSE 7333
    CMD plackup -p 7333

That's all.

## SEE ALSO

* [p5-Amagi on GitHub](https://github.com/colon-limited/p5-Amagi)

* [ytnobody/alpine-perl on Docker Hub](https://hub.docker.com/r/ytnobody/alpine-perl/)

* [Plack on MetaCPAN](https://metacpan.org/pod/Plack)

