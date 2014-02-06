# = Informations
#
# == License
#
# Ekylibre - Simple ERP
# Copyright (C) 2009-2012 Brice Texier, Thibaud Merigon
# Copyright (C) 2012-2014 Brice Texier, David Joulin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# == Table: product_junctions
#
#  created_at      :datetime         not null
#  creator_id      :integer
#  id              :integer          not null, primary key
#  lock_version    :integer          default(0), not null
#  operation_id    :integer
#  originator_id   :integer
#  originator_type :string(255)
#  started_at      :datetime
#  stopped_at      :datetime
#  tool_id         :integer
#  type            :string(255)
#  updated_at      :datetime         not null
#  updater_id      :integer
#
class ProductMerging < ProductDeath
  has_way :absorber

  after_save do
    # Duplicate individual indicator data
    product.copy_indicator_data_of!(producer, at: self.stopped_at, taken_at: self.started_at, originator: self)

    # Add whole indicator data
    for indicator_name in absorber.whole_indicators_list
      if product_datum_value = self.product_way.send(indicator_name)
        absorber.add_to_indicator_data(indicator_name, product_datum_value, after: self.stopped_at, originator: self)
      else
        raise StandardError, "No given value for #{indicator_name}."
      end
    end

  end

end