FOSOAuthServerBundle
====================

[![Build Status](https://secure.travis-ci.org/FriendsOfSymfony/FOSOAuthServerBundle.png)](http://travis-ci.org/FriendsOfSymfony/FOSOAuthServerBundle)

## Documentation

The bulk of the documentation is stored in the `Resources/doc/index.md` file in this bundle:

[Read the Documentation for master](https://github.com/FriendsOfSymfony/FOSOAuthServerBundle/blob/master/Resources/doc/index.md)

## Repo setup
In order to use both repositories you can go through this [SO answer](https://stackoverflow.com/a/14516130/5335632).
Our Bitbucket repository is _origin_, and the original fork is _upstream_.

## Installation
1. Build the image: `docker build -t fos_oauth_server_bundle .`
2. Run container: `docker run --rm -d fos_oauth_server_bundle -r "while(true){}"`
3. Note container's name: `docker ps`
4. Copy vendor from the container: `docker container cp <container_name>:/usr/src/fos-oauth-server-bundle/vendor vendor`
5. Stop the container: `docker stop <container_name>`

### Upgrading
1. Build the image: `docker build -t fos_oauth_server_bundle . --build-arg COMPOSER_CMD=update`
2. Run container: `docker run --rm -d fos_oauth_server_bundle -r "while(true){}"`
3. Note container's name: `docker ps`
4. Copy _vendor_ from the container:
   `docker container cp <container_name>:/usr/src/fos-oauth-server-bundle/vendor vendor`
5. Copy _composer.lock_ from the container:
   `docker container cp <container_name>:/usr/src/fos-oauth-server-bundle/composer.lock composer.lock`
5. Stop the container: `docker stop <container_name>`

## License

This bundle is under the MIT license. See the complete license in the bundle:

    Resources/meta/LICENSE

## TODO

- More tests

## Credits

- Arnaud Le Blanc, and [all contributors](https://github.com/FriendsOfSymfony/FOSOAuthServerBundle/contributors)
- Inspired by [BazingaOAuthBundle](https://github.com/willdurand/BazingaOAuthServerBundle) and [FOSUserBundle](https://github.com/FriendsOfSymfony/FOSUserBundle)
- Installation doc adapted from [FOSUserBundle](https://github.com/FriendsOfSymfony/FOSUserBundle) doc.
