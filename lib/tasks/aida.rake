#require 'csv'

class String
  def escape_single_quotes
    self.gsub(/'/, "\\\\'")
  end
end

namespace :aida do

  desc 'Export page text'
  task :pages => :environment do
    # CSV::Writer.generate(report, ',') do |title|
    attrs = [:title_en, :text_en, :title_es, :text_es, :id]
    #puts attrs.map(&:to_s).join(',')
    Page.find(:all).each do |page|
      puts attrs.map {|a| page.send(a).to_s }.map {|a| "\"#{a.gsub(/"/, '\"')}\""  }.join(',')
    end
    #  end
  end

  desc 'Export page text'
  task :sql=> :environment do
    puts 'delete from node;'
    puts 'delete from node_revisions;'
    puts 'delete from url_alias;'
    puts 'delete from book;'
    puts 'delete from menu_links;'
    puts <<-SQL
INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 2, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 8, 2, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 10, 2, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 0, 1, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 15, 2, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 2, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 18, 2, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 20, 2, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 22, 20, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 22, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 18, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 23, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 18, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 24, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 17, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 25, 0, 0, 0, 0, 0, 0, 0),
('navigation', 26, 18, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 26, 0, 0, 0, 0, 0, 0, 0),
('navigation', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0),
('navigation', 29, 10, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 29, 0, 0, 0, 0, 0, 0, 0),
('navigation', 30, 18, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 30, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 33, 18, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 33, 0, 0, 0, 0, 0, 0, 0),
('navigation', 34, 18, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 34, 0, 0, 0, 0, 0, 0, 0),
('navigation', 35, 18, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 35, 0, 0, 0, 0, 0, 0, 0),
('navigation', 36, 18, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 36, 0, 0, 0, 0, 0, 0, 0),
('navigation', 37, 18, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 37, 0, 0, 0, 0, 0, 0, 0),
('navigation', 38, 17, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 17, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 17, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 39, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 18, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 40, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 20, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 41, 0, 0, 0, 0, 0, 0, 0),
('navigation', 42, 10, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 42, 0, 0, 0, 0, 0, 0, 0),
('navigation', 43, 10, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 43, 0, 0, 0, 0, 0, 0, 0),
('navigation', 45, 20, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 45, 0, 0, 0, 0, 0, 0, 0),
('navigation', 46, 18, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 46, 0, 0, 0, 0, 0, 0, 0),
('navigation', 47, 18, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 47, 0, 0, 0, 0, 0, 0, 0),
('navigation', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0),
('navigation', 49, 17, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 49, 0, 0, 0, 0, 0, 0, 0),
('navigation', 50, 20, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 50, 0, 0, 0, 0, 0, 0, 0),
('navigation', 51, 20, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 51, 0, 0, 0, 0, 0, 0, 0),
('navigation', 52, 15, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 52, 0, 0, 0, 0, 0, 0, 0),
('navigation', 53, 15, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 53, 0, 0, 0, 0, 0, 0, 0),
('navigation', 55, 15, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 55, 0, 0, 0, 0, 0, 0, 0),
('navigation', 56, 15, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 56, 0, 0, 0, 0, 0, 0, 0),
('navigation', 57, 15, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 57, 0, 0, 0, 0, 0, 0, 0),
('navigation', 58, 15, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 58, 0, 0, 0, 0, 0, 0, 0),
('navigation', 59, 15, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 59, 0, 0, 0, 0, 0, 0, 0),
('navigation', 60, 15, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 60, 0, 0, 0, 0, 0, 0, 0),
('navigation', 61, 36, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 61, 0, 0, 0, 0, 0, 0),
('navigation', 62, 26, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 26, 62, 0, 0, 0, 0, 0, 0),
('navigation', 63, 23, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 63, 0, 0, 0, 0, 0, 0),
('navigation', 64, 25, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 64, 0, 0, 0, 0, 0, 0),
('navigation', 65, 17, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 65, 0, 0, 0, 0, 0, 0, 0),
('navigation', 66, 30, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 66, 0, 0, 0, 0, 0, 0),
('navigation', 67, 25, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 67, 0, 0, 0, 0, 0, 0),
('navigation', 68, 36, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 68, 0, 0, 0, 0, 0, 0),
('navigation', 69, 22, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 69, 0, 0, 0, 0, 0, 0),
('navigation', 70, 45, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 45, 70, 0, 0, 0, 0, 0, 0),
('navigation', 71, 22, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 71, 0, 0, 0, 0, 0, 0),
('navigation', 72, 48, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 72, 0, 0, 0, 0, 0, 0),
('navigation', 73, 42, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 42, 73, 0, 0, 0, 0, 0, 0),
('navigation', 74, 23, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 74, 0, 0, 0, 0, 0, 0),
('navigation', 75, 48, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 75, 0, 0, 0, 0, 0, 0),
('navigation', 76, 48, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 76, 0, 0, 0, 0, 0, 0),
('navigation', 77, 23, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 77, 0, 0, 0, 0, 0, 0),
('navigation', 78, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 78, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 79, 25, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 79, 0, 0, 0, 0, 0, 0),
('navigation', 80, 39, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 80, 0, 0, 0, 0, 0, 0),
('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 82, 39, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 82, 0, 0, 0, 0, 0, 0),
('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 86, 38, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 86, 0, 0, 0, 0, 0, 0),
('navigation', 87, 38, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 87, 0, 0, 0, 0, 0, 0),
('navigation', 88, 38, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 38, 88, 0, 0, 0, 0, 0, 0),
('navigation', 89, 38, 'admin/build/menu-customize/navigation', 'admin/build/menu-customize/%', 'Navigation', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 89, 0, 0, 0, 0, 0, 0),
('navigation', 90, 38, 'admin/build/menu-customize/primary-links', 'admin/build/menu-customize/%', 'Primary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 90, 0, 0, 0, 0, 0, 0),
('navigation', 91, 38, 'admin/build/menu-customize/secondary-links', 'admin/build/menu-customize/%', 'Secondary links', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 38, 91, 0, 0, 0, 0, 0, 0),
('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 93, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 93, 0, 0, 0, 0, 0, 0, 0),
('navigation', 94, 10, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 94, 0, 0, 0, 0, 0, 0, 0),
('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 96, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 96, 0, 0, 0, 0, 0, 0, 0),
('navigation', 97, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 97, 0, 0, 0, 0, 0, 0, 0),
('navigation', 98, 15, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 98, 0, 0, 0, 0, 0, 0, 0),
('navigation', 99, 15, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 99, 0, 0, 0, 0, 0, 0, 0),
('navigation', 100, 37, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 37, 100, 0, 0, 0, 0, 0, 0),
('navigation', 101, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 16, 101, 0, 0, 0, 0, 0, 0, 0),
('navigation', 102, 94, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 102, 0, 0, 0, 0, 0, 0),
('navigation', 103, 94, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 103, 0, 0, 0, 0, 0, 0),
('navigation', 104, 94, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 94, 104, 0, 0, 0, 0, 0, 0),
('navigation', 105, 16, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 105, 0, 0, 0, 0, 0, 0, 0),
('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 107, 11, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 107, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 108, 15, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 108, 0, 0, 0, 0, 0, 0, 0),
('navigation', 109, 105, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 105, 109, 0, 0, 0, 0, 0, 0),
('navigation', 110, 10, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 110, 0, 0, 0, 0, 0, 0, 0),
('navigation', 111, 10, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Story', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 111, 0, 0, 0, 0, 0, 0, 0),
('navigation', 112, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 113, 0, 'admin/content/node-type/story/delete', 'admin/content/node-type/story/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 114, 0, 'search', 'search', 'Search', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 115, 0, 'upload/js', 'upload/js', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 116, 18, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Control how files may be attached to content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 116, 0, 0, 0, 0, 0, 0, 0),
('navigation', 117, 18, 'admin/settings/language', 'admin/settings/language', 'Languages', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Configure languages for content and the user interface.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 117, 0, 0, 0, 0, 0, 0, 0),
('navigation', 118, 18, 'admin/settings/search', 'admin/settings/search', 'Search settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:66:"Configure relevance settings for search and other indexing options";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 118, 0, 0, 0, 0, 0, 0, 0),
('navigation', 119, 16, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"View most popular search phrases.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 119, 0, 0, 0, 0, 0, 0, 0),
('navigation', 120, 17, 'admin/build/translate', 'admin/build/translate', 'Translate interface', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"Translate the built in interface and optionally other text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 120, 0, 0, 0, 0, 0, 0, 0),
('navigation', 121, 17, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site''s URL paths by aliasing them.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 121, 0, 0, 0, 0, 0, 0, 0),
('navigation', 122, 15, 'admin/help/locale', 'admin/help/locale', 'locale', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 122, 0, 0, 0, 0, 0, 0, 0),
('navigation', 123, 15, 'admin/help/path', 'admin/help/path', 'path', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 123, 0, 0, 0, 0, 0, 0, 0),
('navigation', 124, 15, 'admin/help/search', 'admin/help/search', 'search', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 124, 0, 0, 0, 0, 0, 0, 0),
('navigation', 125, 15, 'admin/help/translation', 'admin/help/translation', 'translation', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 125, 0, 0, 0, 0, 0, 0, 0),
('navigation', 126, 15, 'admin/help/upload', 'admin/help/upload', 'upload', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 126, 0, 0, 0, 0, 0, 0, 0),
('navigation', 127, 118, 'admin/settings/search/wipe', 'admin/settings/search/wipe', 'Clear index', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 118, 127, 0, 0, 0, 0, 0, 0),
('navigation', 128, 121, 'admin/build/path/delete', 'admin/build/path/delete', 'Delete alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 121, 128, 0, 0, 0, 0, 0, 0),
('navigation', 129, 121, 'admin/build/path/edit', 'admin/build/path/edit', 'Edit alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 121, 129, 0, 0, 0, 0, 0, 0),
('navigation', 130, 117, 'admin/settings/language/delete/%', 'admin/settings/language/delete/%', 'Confirm', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 117, 130, 0, 0, 0, 0, 0, 0),
('navigation', 131, 120, 'admin/build/translate/delete/%', 'admin/build/translate/delete/%', 'Delete string', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 120, 131, 0, 0, 0, 0, 0, 0),
('navigation', 132, 117, 'admin/settings/language/edit/%', 'admin/settings/language/edit/%', 'Edit language', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 117, 132, 0, 0, 0, 0, 0, 0),
('navigation', 133, 120, 'admin/build/translate/edit/%', 'admin/build/translate/edit/%', 'Edit string', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 120, 133, 0, 0, 0, 0, 0, 0),
('navigation', 152, 15, 'admin/help/i18n', 'admin/help/i18n', 'i18n', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 152, 0, 0, 0, 0, 0, 0, 0),
('navigation', 160, 15, 'admin/help/i18nmenu', 'admin/help/i18nmenu', 'i18nmenu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 160, 0, 0, 0, 0, 0, 0, 0),
('navigation', 158, 15, 'admin/help/i18nstrings', 'admin/help/i18nstrings', 'i18nstrings', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 158, 0, 0, 0, 0, 0, 0, 0),
('navigation', 159, 15, 'admin/help/i18nblocks', 'admin/help/i18nblocks', 'i18nblocks', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 15, 159, 0, 0, 0, 0, 0, 0, 0),
('navigation', 157, 0, 'i18nstrings/save', 'i18nstrings/save', 'Save string', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 157, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    SQL
#('primary-links', 153, 0, 'node/1001', 'node/%', 'Inicio', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:6:"Inicio";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    #('primary-links', 154, 0, 'node/1', 'node/%', 'Home', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:4:"Home";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    #('primary-links', 155, 0, 'node/1078', 'node/%', 'Proyectos Pasados', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Proyectos Pasados";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 155, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    #('primary-links', 156, 0, 'node/78', 'node/%', 'Past Projects', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:13:"Past Projects";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    mlids = {}
    mlid = 10000
    Page.all.each do |page|
      en_id = page.id
      es_id = en_id + 1000;

      mlids[en_id] = mlid
      mlids[es_id] = mlid + 1
      mlid += 2

      node_type = page.parent ? 'book' : 'book'
      puts "INSERT INTO node
            (nid,            vid,            type,  language,title,             uid, status, created, changed, comment, promote, moderate, sticky, tnid, translate) VALUES
            (#{en_id},     #{en_id},     '#{node_type}','en',    '#{page.title_en.escape_single_quotes}',1,   1,      NOW(),   NOW(), 0,0,0,0,#{en_id},0),
            (#{es_id},#{es_id},'#{node_type}','es',    '#{page.title_es.escape_single_quotes}',1,   1,      NOW(),   NOW(), 0,0,0,0,#{en_id},0);"

      puts "INSERT INTO book (mlid, nid, bid) VALUES (#{mlids[en_id]},#{en_id},1),(#{mlids[es_id]},#{es_id},1001);"

      puts "INSERT INTO node_revisions
              (nid,       vid,       uid, title,              body,             teaser,          log, timestamp,format) VALUES
              (#{en_id},#{en_id},1,   '#{page.title_en.escape_single_quotes}', '#{page.text_en.escape_single_quotes}','', '', NOW(), 1),
              (#{es_id},#{es_id},1,'#{page.title_es.escape_single_quotes}', '#{page.text_es.escape_single_quotes}', '', '', NOW(), 1);"

      puts "INSERT INTO url_alias (src, dst, language) VALUES ('node/#{en_id}','#{page.name}','en');"
      puts "INSERT INTO url_alias (src, dst, language) VALUES ('node/#{es_id}','#{page.name}','es');"
    end

    Page.all.each do |page|
      hier_mdlids = page.hier.map(&:id).map {|hid| mlids[hid]}
      p1 = hier_mdlids[0] || 0
      p2 = hier_mdlids[1] || 0
      p3 = hier_mdlids[2] || 0
      p4 = hier_mdlids[3] || 0
      p5 = hier_mdlids[4] || 0
      has_children = page.children.empty? ? 0 : 1
      mod = page.parent ? 'book' : 'system'
      mod = 'book'
      puts "INSERT INTO menu_links (menu_name, mlid, plid, link_path, router_path, link_title,
                                    options, module, has_children,
                                    depth, p1, p2, p3, p4, p5)
          VALUES
          ('book-toc-1001', #{mlids[page.id]}, #{hier_mdlids[-1] || 0}, 'node/#{page.id}', 'node/%','#{page.title_en.escape_single_quotes}',
            'a:0:{}','#{mod}',#{has_children},
            #{page.depth},#{p1},#{p2},#{p3},#{p4},#{p5});"

      #      +---------------+------+------+-----------+-------------+-------------------+---------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
      #      | menu_name     | mlid | plid | link_path | router_path | link_title        | options | module | hidden | external | has_children | expanded | weight | depth | customized | p1  | p2  | p3 | p4 | p5 | p6 | p7 | p8 | p9 | updated |
      #      +---------------+------+------+-----------+-------------+-------------------+---------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
      #      | book-toc-1001 |    1 |    0 | node/1001 | node/%      | Inicio            | a:0:{}  | system |      0 |        0 |            0 |        0 |      0 |     1 |          0 |   1 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
      #      | book-toc-1001 |  172 |    0 | node/1001 | node/%      | Inicio            | a:0:{}  | book   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 172 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
      #      | book-toc-1001 |  173 |  172 | node/1078 | node/%      | Proyectos Pasados | a:0:{}  | book   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 172 | 173 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
      #      | book-toc-1001 |  174 |    0 | node/1001 | node/%      | Inicio            | a:0:{}  | book   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 174 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
      #      | book-toc-1001 |  175 |  174 | node/1078 | node/%      | Proyectos Pasados | a:0:{}  | book   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 174 | 175 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
      #      +---------------+------+------+-----------+-------------+-------------------+---------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
      #
      #
    end

  end


  desc 'Clear out drupal database'
  task :clear_drupal => :environment do
    Node.connection.update 'delete from node;'
    Node.connection.update 'delete from node_revisions;'
    Node.connection.update 'delete from url_alias;'
    Node.connection.update 'delete from menu_links where menu_name != \'navigation\';'
    Node.connection.update 'delete from cache_menu;'
  end


  #| pid | src       | dst           | language |
  #+-----+-----------+---------------+----------+
  #|   1 | node/1001 | home          | es       |
  #|   2 | node/1    | home          | en       |
  #|   3 | node/1078 | past_projects | es       |
  #|   4 | node/78   | past_projects | en       |

  desc 'Export page text'
  task :transfer=> :clear_drupal do

    Page.find(:all, :conditions=>{:parent_page_id=>0}).each do |page|
      node = create_drupal_page(page, 'en')
      n = create_drupal_page(page, 'es')
    end

    Page.find_in_batches(:conditions=>['parent_page_id!=0']) do |page_group|
      page_group.each do |page|
        create_drupal_page(page, 'en')
        create_drupal_page(page, 'es')
      end
    end

    Page.find(:all, :conditions=>{:parent_page_id=>0}).each do |page|
      create_menu(page, 'secondary-links', 'en')
      create_menu(page, 'secondary-links', 'es')
    end

  end

  def create_menu(page, menu_name, lang, parent_menu = nil)
    nid = page.node_id(lang)
    node = Node.find(nid)
    title = node.title
    title = "Node #{nid}" if title.blank?
    ml = MenuLink.new(parent_menu, node,
        :menu_name=>menu_name,
        :has_children=>(page.children.empty? ? 0 : 1)
    )
    ml.save!
    ml.update_attribute("p#{ml.depth}", ml.mlid)
    ml.save!

    page.children.each do |child_page|
      create_menu(child_page, menu_name, lang, ml)
    end

    #+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
    #| menu_name       | mlid | plid | link_path | router_path | link_title                     | options                                                                                   | module | hidden | external | has_children | expanded | weight | depth | customized | p1  | p2  | p3 | p4 | p5 | p6 | p7 | p8 | p9 | updated |
    #+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
    #| secondary-links |  145 |    0 | node/1190 | node/%      | TITLE OF LAOROGYA MENU ENGLISH | a:2:{s:10:"attributes";a:1:{s:5:"title";s:17:"La Oroya Whatever";}s:5:"alter";b:1;}       | menu   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 145 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  146 |    0 | node/190  | node/%      | LA OROYA SUBSCRIBE ENGLISH     | a:2:{s:10:"attributes";a:1:{s:5:"title";s:18:"La Oroya Subscribe";}s:5:"alter";b:1;}      | menu   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 146 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  147 |  145 | node/1158 | node/%      | Instrumentos Econ?micos        | a:2:{s:10:"attributes";a:1:{s:5:"title";s:24:"Instrumentos Econ?micos";}s:5:"alter";b:1;} | menu   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 145 | 147 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  148 |  146 | node/158  | node/%      | Economic Instruments           | a:2:{s:10:"attributes";a:1:{s:5:"title";s:20:"Economic Instruments";}s:5:"alter";b:1;}    | menu   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 146 | 148 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+

  end

  def create_drupal_page(page, lang)
    title = page.title(lang)
    node_id = page.node_id(lang)
    node = Node.new do |n|
      n.nid = node_id
      n.vid = node_id
      n.type = 'page'
      n.language = lang
      n.title= title
      n.uid = 1
      n.status = 1
      n.created = Time.now
      n.changed = Time.now
      n.comment = 0
      n.promote = 0
      n.moderate = 0
      n.sticky = 0
      n.tnid = page.node_id('en')
      n.translate = 0
      n.body = page.text(lang)
    end
    node.save!

    UrlAlias.create!(:src=>"node/#{node.nid}", :dst=>page.name, :language=>lang)

    node
  end
end



#| pid | src       | dst           | language |
#+-----+-----------+---------------+----------+
#|   1 | node/1001 | home          | es       |
#|   2 | node/1    | home          | en       |
#|   3 | node/1078 | past_projects | es       |
#|   4 | node/78   | past_projects | en       |



###########################

#mysql> select * from node;
#+------+------+------+----------+-------------------+-----+--------+------------+------------+---------+---------+----------+--------+------+-----------+
#| nid  | vid  | type | language | title             | uid | status | created    | changed    | comment | promote | moderate | sticky | tnid | translate |
#+------+------+------+----------+-------------------+-----+--------+------------+------------+---------+---------+----------+--------+------+-----------+
#| 1192 | 1192 | book |          | TOP PAGE          |   1 |      1 | 1243116382 | 1243116382 |       0 |       0 |        0 |      0 |    0 |         0 |
#| 1193 | 1193 | book |          | CHILD OF TOP PAGE |   1 |      1 | 1243116453 | 1243116453 |       0 |       0 |        0 |      0 |    0 |         0 |
#| 1194 | 1194 | book |          | GRANDCHILD        |   1 |      1 | 1243116502 | 1243116586 |       0 |       0 |        0 |      0 |    0 |         0 |
#+------+------+------+----------+-------------------+-----+--------+------------+------------+---------+---------+----------+--------+------+-----------+
#3 rows in set (0.00 sec)
#
#
#mysql> select * from node_revisions;
#+------+------+-----+-------------------+---------------------------+---------------------------+-----+------------+--------+
#| nid  | vid  | uid | title             | body                      | teaser                    | log | timestamp  | format |
#+------+------+-----+-------------------+---------------------------+---------------------------+-----+------------+--------+
#| 1192 | 1192 |   1 | TOP PAGE          | BODY OF TOP PAGE          | BODY OF TOP PAGE          |     | 1243116382 |      1 |
#| 1193 | 1193 |   1 | CHILD OF TOP PAGE | BODY OF CHILD OF TOP PAGE | BODY OF CHILD OF TOP PAGE |     | 1243116453 |      1 |
#| 1194 | 1194 |   1 | GRANDCHILD        | GRANDCHILD BODY           | GRANDCHILD BODY           |     | 1243116586 |      1 |
#+------+------+-----+-------------------+---------------------------+---------------------------+-----+------------+--------+
#3 rows in set (0.00 sec)
#
#mysql> select * from url_alias;
#+-------+-----------+-----------------+----------+
#| pid   | src       | dst             | language |
#+-------+-----------+-----------------+----------+
#| 18137 | node/1192 | top_page        |          |
#| 18138 | node/1194 | GRANDCHILD PATH |          |
#+-------+-----------+-----------------+----------+
#2 rows in set (0.00 sec)

#
#mysql> select * from menu_links where module != 'system';
#+---------------+-------+-------+--------------------------------------------+------------------------------+------------------------------+-------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-------+-------+-------+-------+----+----+----+----+----+---------+
#| menu_name     | mlid  | plid  | link_path                                  | router_path                  | link_title                   | options                                                                             | module | hidden | external | has_children | expanded | weight | depth | customized | p1    | p2    | p3    | p4    | p5 | p6 | p7 | p8 | p9 | updated |
#+---------------+-------+-------+--------------------------------------------+------------------------------+------------------------------+-------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-------+-------+-------+-------+----+----+----+----+----+---------+
#| navigation    |    89 |    38 | admin/build/menu-customize/navigation      | admin/build/menu-customize/% | Navigation                   | a:0:{}                                                                              | menu   |      0 |        0 |            0 |        0 |      0 |     4 |          0 |     2 |    17 |    38 |    89 |  0 |  0 |  0 |  0 |  0 |       0 |
#| navigation    |    90 |    38 | admin/build/menu-customize/primary-links   | admin/build/menu-customize/% | Primary links                | a:0:{}                                                                              | menu   |      0 |        0 |            0 |        0 |      0 |     4 |          0 |     2 |    17 |    38 |    90 |  0 |  0 |  0 |  0 |  0 |       0 |
#| navigation    |    91 |    38 | admin/build/menu-customize/secondary-links | admin/build/menu-customize/% | Secondary links              | a:0:{}                                                                              | menu   |      0 |        0 |            0 |        0 |      0 |     4 |          0 |     2 |    17 |    38 |    91 |  0 |  0 |  0 |  0 |  0 |       0 |
#| navigation    | 13322 | 13312 | node/1192                                  | node/%                       | TOP PAGE MENU                | a:2:{s:10:"attributes";a:1:{s:5:"title";s:8:"TOP PAGE";}s:5:"alter";b:1;}           | menu   |      0 |        0 |            1 |        0 |      0 |     2 |          0 | 13312 | 13322 |     0 |     0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| book-toc-1192 | 13323 |     0 | node/1192                                  | node/%                       | TOP PAGE                     | a:0:{}                                                                              | book   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 13323 |     0 |     0 |     0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| book-toc-1192 | 13324 | 13323 | node/1193                                  | node/%                       | CHILD OF TOP PAGE            | a:0:{}                                                                              | book   |      0 |        0 |            1 |        0 |      0 |     2 |          0 | 13323 | 13324 |     0 |     0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| navigation    | 13325 | 13322 | node/1193                                  | node/%                       | CHILD OF TOP PAGE MENU TITLE | a:2:{s:10:"attributes";a:1:{s:5:"title";s:17:"CHILD OF TOP PAGE";}s:5:"alter";b:1;} | menu   |      0 |        0 |            1 |        0 |      0 |     3 |          0 | 13312 | 13322 | 13325 |     0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| book-toc-1192 | 13326 | 13324 | node/1194                                  | node/%                       | GRANDCHILD                   | a:0:{}                                                                              | book   |      0 |        0 |            0 |        0 |      0 |     3 |          0 | 13323 | 13324 | 13326 |     0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| navigation    | 13327 | 13325 | node/1194                                  | node/%                       | GRANDCHILD LINK TITLE        | a:2:{s:10:"attributes";a:1:{s:5:"title";s:10:"GRANDCHILD";}s:5:"alter";b:1;}        | menu   |      0 |        0 |            0 |        0 |      0 |     4 |          0 | 13312 | 13322 | 13325 | 13327 |  0 |  0 |  0 |  0 |  0 |       0 |
#+---------------+-------+-------+--------------------------------------------+------------------------------+------------------------------+-------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-------+-------+-------+-------+----+----+----+----+----+---------+
#9 rows in set (0.00 sec)

#mysql> select * from book;
#+-------+------+------+
#| mlid  | nid  | bid  |
#+-------+------+------+
#| 13323 | 1192 | 1192 |
#| 13324 | 1193 | 1192 |
#| 13326 | 1194 | 1192 |
#+-------+------+------+
#3 rows in set (0.00 sec)
#
#
#
#
#