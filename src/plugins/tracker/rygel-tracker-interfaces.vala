/*
 * Copyright (C) 2009 Nokia Corporation.
 *
 * Author: Zeeshan Ali (Khattak) <zeeshanak@gnome.org>
 *                               <zeeshan.ali@nokia.com>
 *
 * This file is part of Rygel.
 *
 * Rygel is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Rygel is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

public struct Event {
    int graph_id;
    int subject_id;
    int pred_id;
    int object_id;
}

[DBus (name = "org.freedesktop.Tracker1.Statistics")]
public interface Rygel.Tracker.StatsIface : DBusProxy {
    public abstract string[,] get_statistics () throws IOError;
}

[DBus (name = "org.freedesktop.Tracker1.Resources")]
public interface Rygel.Tracker.ResourcesIface: DBusProxy {
    public abstract async string[,] sparql_query (string query)
                                                  throws IOError;
    public abstract async void sparql_update (string query) throws IOError;
    public abstract async HashTable<string,string>[,] sparql_update_blank
                                        (string query) throws IOError;

    public signal void graph_updated (string  class_name,
                                      Event[] deletes,
                                      Event[] inserts);
}
