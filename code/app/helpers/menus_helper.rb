# finances.me is a personal finance manager
# Copyright (C) 2010 Leonardo Kornd�rfer
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module MenusHelper
    def menu_writer
	    submenu = Submenu.find(:first, :conditions => { :controller => controller_name, :action => action_name })
    	render :partial => '/menus/menu', :locals => { :submenu => submenu }
    end

    def submenu_writer
    	submenu = Submenu.find(:first, :conditions => { :controller => controller_name })
    	submenus = Submenu.find(:all, :conditions => { :menu_id => submenu.menu_id })
    	
    	render :partial => '/menus/submenu', :locals => { :submenus => submenus }
    end
end