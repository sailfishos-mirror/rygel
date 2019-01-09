project('rygel', 'vala', 'c', version : '0.37.1')
vala = meson.get_compiler('vala')

# Check for the required vala version
vala_version_required = '>= 0.40'
vala_version_found = vala.version()

if not vala_version_found.version_compare(vala_version_required)
    error('Found Vala version @0@, need @1@'.format(vala_version_found, vala_version_required))
endif

i18n = import('i18n')

rygel_libdir = join_paths(get_option('prefix'), get_option('libdir'))
rygel_includedir = join_paths(get_option('includedir'), 'rygel-2.6')
rygel_vapidir = join_paths(get_option('prefix'), get_option('datadir'), 'vala/vapi')

if not get_option('uninstalled')
    rygel_datadir = join_paths(get_option('prefix'), get_option('datadir'), 'rygel')
    rygel_libexecdir = join_paths(get_option('prefix'), get_option('libexecdir'),
    'rygel')
    rygel_sysconfdir = join_paths(get_option('prefix'), get_option('sysconfdir'))
    rygel_plugindir = join_paths(rygel_libdir, 'rygel-2.6', 'plugins')
    rygel_enginedir = join_paths(rygel_libdir, 'rygel-2.6', 'engines')
    rygel_presetdir = join_paths(rygel_datadir, 'rygel', 'presets')
    rygel_icondir = join_paths(rygel_datadir, 'icons', 'hicolor')
    rygel_bigicondir = join_paths(rygel_datadir, 'rygel', 'icons', '120x120')
    rygel_smallicondir = join_paths(rygel_datadir, 'rygel', 'icons', '48x48')
else
    rygel_datadir = join_paths(meson.current_build_dir(), 'data')
    rygel_libexecdir = join_paths(meson.current_build_dir(), 'src/plugins/media-export')
    rygel_sysconfdir = join_paths(meson.current_source_dir(), 'data')
    rygel_plugindir = join_paths(meson.current_build_dir(), 'src', 'plugins')
    rygel_enginedir = join_paths(meson.current_build_dir(), 'src', 'media-engines')
    rygel_presetdir = join_paths(meson.current_source_dir(), 'data', 'presets')
    rygel_icondir = join_paths(meson.current_source_dir(), 'data', 'icons', 'hicolor')
    rygel_bigicondir = join_paths(meson.current_source_dir(), 'data', 'icons', '120x120')
    rygel_smallicondir = join_paths(meson.current_source_dir(), 'data', 'icons', '48x48')
endif

plugin_config = configuration_data()
plugin_config.set('VERSION', meson.project_version())
plugin_config.set('PACKAGE_URL', 'http://www.rygel-project.org')

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', 'rygel')
conf.set_quoted('PACKAGE_NAME', 'Rygel')
conf.set_quoted('PACKAGE_STRING', 'Rygel @0@'.format(meson.project_version()))
conf.set_quoted('PACKAGE_VERSION', meson.project_version())
conf.set_quoted('PACKAGE_URL', 'http://www.rygel-project.org')
conf.set_quoted('ENGINE_DIR', rygel_enginedir)
conf.set_quoted('PRESET_DIR', rygel_presetdir)
conf.set_quoted('DATA_DIR', rygel_datadir)
conf.set_quoted('PLUGIN_DIR', rygel_plugindir)
conf.set_quoted('BIG_ICON_DIR', rygel_bigicondir)
conf.set_quoted('SMALL_ICON_DIR', rygel_smallicondir)
conf.set_quoted('SYS_CONFIG_DIR', rygel_sysconfdir)
conf.set_quoted('LOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))
conf.set_quoted('MX_EXTRACT_PATH', join_paths(rygel_libexecdir, 'mx-extract'))
conf.set_quoted('DESKTOP_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'applications'))
conf.set_quoted('VERSION', meson.project_version())
config_include = include_directories('.')

add_global_arguments(['-include','config.h'], language : 'c')

valadoc = find_program('valadoc', required : false)
gtkdoc = dependency('gtk-doc', required : false)

gupnp = dependency('gupnp-1.2', version : '>= 1.1')
gee = dependency('gee-0.8', version: '>= 0.8.0')
gssdp = dependency('gssdp-1.2', version : '>= 1.1')
glib = dependency('glib-2.0', version : '>= 2.26')
gio = dependency('gio-2.0', version : '>= 2.26')
gio_unix = dependency('gio-unix-2.0', version : '>= 2.26')
gmodule = dependency('gmodule-2.0')
libxml = dependency('libxml-2.0', version: '>= 2.7')
gupnp_av = dependency('gupnp-av-1.0', version: '>= 0.12.8')
gupnp_dlna = dependency('gupnp-dlna-2.0', version: '>= 0.9.4')
soup = dependency('libsoup-2.4', version : '>= 2.44.0')
mediaart = dependency('libmediaart-2.0', version : '>= 0.7.0')
sqlite = dependency('sqlite3', version : '>= 3.5')

if get_option('gstreamer')
    gstreamer = dependency('gstreamer-1.0', version : '>= 1.0')
    gstreamer_pbu = dependency('gstreamer-pbutils-1.0', version : '>= 1.0')
    gstreamer_base = dependency('gstreamer-base-1.0', version : '>= 1.0')
    gstreamer_audio = dependency('gstreamer-audio-1.0', version : '>= 1.0')
    gstreamer_video = dependency('gstreamer-video-1.0', version : '>= 1.0')
    gstreamer_tag = dependency('gstreamer-tag-1.0', version : '>= 1.0')
    gupnp_dlna_gst = dependency('gupnp-dlna-gst-2.0', version: '>= 0.9.4')
else
    gstreamer = disabler()
    gstreamer_pbu = disabler()
    gstreamer_base = disabler()
    gstreamer_audio = disabler()
    gstreamer_video = disabler()
    gstreamer_tag = disabler()
    gupnp_dlna_gst = disabler()
endif

gdk_pixbuf = dependency('gdk-pixbuf-2.0')

if get_option('gtk')
    gtk = dependency('gtk+-3.0', version : '>= 3.0')
else
    gtk = disabler()
endif

posix = vala.find_library('posix')

sed = find_program('sed')
g_ir_compiler = find_program('g-ir-compiler')
gir_dir = join_paths(get_option('datadir'), 'gir-1.0')
typelib_dir = join_paths(get_option('libdir'), 'girepository-1.0')
pkgconfig_dir = join_paths(get_option('libdir'), 'pkgconfig')

cc = meson.get_compiler('c')
math = cc.find_library('m', required: false)
unistring = cc.find_library('unistring', required: false)
u8_strcoll_available = cc.has_function('u8_strcoll', dependencies: unistring)
conf.set10('HAVE_UNISTRING', u8_strcoll_available)

common_deps = [gupnp, gee]

core_deps = common_deps + [gssdp, gio, gmodule, libxml, posix, math]
renderer_deps = common_deps + [gupnp_av, soup]
renderer_gst_deps = common_deps + [gstreamer, gstreamer_audio]
server_deps = common_deps + [gssdp, gupnp_av, soup, mediaart, gmodule, libxml]
db_deps = common_deps + [gupnp_av, gio, sqlite, unistring]
media_engine_gst_dep = [gee, gupnp_av, libxml, gio, gstreamer, gstreamer_pbu,
                        gstreamer_base, gupnp_dlna]
ruih_deps = common_deps
rygel_deps = common_deps

external_plugin_deps = [gio]
gst_launch_plugin_deps = [gstreamer]
lms_deps = [sqlite]
mx_export_deps = common_deps + [gio, gio_unix, gstreamer, gstreamer_pbu,
                                gupnp_dlna, gupnp_av, mediaart, gdk_pixbuf,
                                posix, gupnp_dlna_gst, gstreamer_tag, libxml,
                                soup]
mx_plugin_deps = common_deps + [gstreamer, gstreamer_pbu, gio_unix, gupnp_dlna]
ui_deps = common_deps + [gtk]

configure_file(output: 'config.h', configuration: conf)

pc_conf = configuration_data()
pc_conf.set('prefix', get_option('prefix'))
pc_conf.set('exec_prefix', '${prefix}')
pc_conf.set('libdir', join_paths(get_option('prefix'), get_option('libdir')))
pc_conf.set('includedir', join_paths('${prefix}', get_option('includedir')))
pc_conf.set('VERSION', '"@0@"'.format(meson.project_version()))
pc_conf.set('RYGEL_PLUGIN_DIR', rygel_plugindir)
pc_conf.set('RYGEL_MEDIA_ENGINE_DIR', rygel_enginedir)
pc_conf.set('RYGEL_PLUGIN_LINKER_FLAGS', '')
pc_conf.set('RYGEL_ENGINE_LINKER_FLAGS', '')

configure_file(output: 'rygel-core-2.6.pc',
               input: 'rygel-core-2.6.pc.in',
               configuration: pc_conf,
               install: true,
               install_dir : pkgconfig_dir)

configure_file(output: 'rygel-server-2.6.pc',
               input: 'rygel-server-2.6.pc.in',
               configuration: pc_conf,
               install: true,
               install_dir : pkgconfig_dir)

configure_file(output: 'rygel-renderer-2.6.pc',
               input: 'rygel-renderer-2.6.pc.in',
               configuration: pc_conf,
               install: true,
               install_dir : pkgconfig_dir)

configure_file(output: 'rygel-renderer-gst-2.6.pc',
               input: 'rygel-renderer-gst-2.6.pc.in',
               configuration: pc_conf,
               install: true,
               install_dir : pkgconfig_dir)

configure_file(output: 'rygel-ruih-2.0.pc',
               input: 'rygel-ruih-2.0.pc.in',
               configuration: pc_conf,
               install: true,
               install_dir : pkgconfig_dir)

subdir('src')
subdir('po')
subdir('data')
subdir('doc')

if get_option('examples')
    subdir('examples')
endif


if get_option('tests')
    subdir('tests')
endif