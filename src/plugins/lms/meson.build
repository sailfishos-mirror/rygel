configure_file(input : 'lms.plugin.in',
               output : 'lms.plugin',
               configuration : plugin_config,
               install_dir : rygel_plugindir)

lms_sources = [
    'rygel-lms-plugin.vala',
    'rygel-lms-plugin-factory.vala',
    'rygel-lms-root-container.vala',
    'rygel-lms-music-root.vala',
    'rygel-lms-image-root.vala',
    'rygel-lms-category-container.vala',
    'rygel-lms-all-music.vala',
    'rygel-lms-album.vala',
    'rygel-lms-albums.vala',
    'rygel-lms-artist.vala',
    'rygel-lms-artists.vala',
    'rygel-lms-all-videos.vala',
    'rygel-lms-database.vala',
    'rygel-lms-all-images.vala',
    'rygel-lms-image-years.vala',
    'rygel-lms-image-year.vala',
    'rygel-lms-dbus-interfaces.vala']

shared_module('rygel-lms',
              lms_sources,
              dependencies : lms_deps + [build_config, rygel_core, rygel_server, rygel_db],
              c_args : ['-DG_LOG_DOMAIN="LMS"'],
              install : true,
              install_dir : rygel_plugindir)
