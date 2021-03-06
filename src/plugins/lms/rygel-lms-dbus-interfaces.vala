/*
 * Copyright (C) 2014 Intel Corporation.
 *
 * Author: Alexander Kanavin <alex.kanavin@gmail.com>
 *
 * This file is part of Rygel.
 *
 * Rygel is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * Rygel is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

[DBus (name = "org.lightmediascanner.Scanner1")]
interface Rygel.LMS.DBus : DBusProxy {
    public abstract string data_base_path { owned get; }

    [DBus (name = "UpdateID")]
    public abstract uint64 update_id { get; }

    //TODO: add all the other API items which are currently unused
}
