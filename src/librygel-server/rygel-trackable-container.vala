/*
 * Copyright (C) 2012 Intel Corporation.
 *
 * Author: Jens Georg <jensg@openismus.come
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

public interface Rygel.TrackableContainer : Rygel.MediaContainer {
    public async void clear () {
        try {
            var children = yield this.get_children (0, 0, "", null);
            if (children == null) {
                return;
            }

            foreach (var child in children) {
                yield this.remove_child_tracked (child);
            }
        } catch (Error error) {
        }
    }

    public abstract async void add_child (MediaObject object);

    public async void add_child_tracked (MediaObject object) {
        yield this.add_child (object);

        this.updated (object, ObjectEventType.ADDED);
        this.updated ();
        if (object is TrackableContainer) {
            var trackable = object as TrackableContainer;

            // Release the events that might have accumulated
            trackable.thaw_events ();
        }
    }

    public abstract async void remove_child (MediaObject object);

    public async void remove_child_tracked (MediaObject object) {
        // We need to descend into this to get the proper events
        if (object is TrackableContainer) {
            var trackable = object as TrackableContainer;
            yield trackable.clear ();
        }

        yield this.remove_child (object);

        this.updated (object, ObjectEventType.DELETED);
        this.total_deleted_child_count++;

        // FIXME: Check if modification of child_count should lead to
        // LastChange event.
        this.updated ();
    }

    /**
     * Used to query the (persisted) service reset token from the plug-in.
     *
     * If a plugin implements PLUGIN_CAPABILITIES_TRACK_CHANGES, it should
     * persist the ServiceResetToken. To do this override this virtual
     * function in the root container implementation and provide the persisted
     * version.
     */
    public virtual string get_service_reset_token () {
        return UUID.get ();
    }

    /**
     * Set a new service reset token.
     *
     * If the service reset procedure has to be performed, the content
     * directory service will set the new service reset token.
     *
     * @param token the new service reset token.
     */
    public virtual void set_service_reset_token (string token) {}

    /**
     * Query the current system update id.
     * This should be overriden by the root container of the back-end
     * implementation.
     *
     * @return the current SystemUpdateID as persisted by the back-end.
     */
    public virtual uint32 get_system_update_id () { return 0; }

    private void thaw_events () {
        // Forward events.
    }
}