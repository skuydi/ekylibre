# = Informations
# 
# == License
# 
# Ekylibre - Simple ERP
# Copyright (C) 2009-2013 Brice Texier, Thibaud Mérigon
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
# == Table: account_balances
#
#  account_id       :integer          not null
#  company_id       :integer          not null
#  created_at       :datetime         not null
#  creator_id       :integer          
#  financialyear_id :integer          not null
#  global_balance   :decimal(16, 2)   default(0.0), not null
#  global_count     :integer          default(0), not null
#  global_credit    :decimal(16, 2)   default(0.0), not null
#  global_debit     :decimal(16, 2)   default(0.0), not null
#  id               :integer          not null, primary key
#  local_balance    :decimal(16, 2)   default(0.0), not null
#  local_count      :integer          default(0), not null
#  local_credit     :decimal(16, 2)   default(0.0), not null
#  local_debit      :decimal(16, 2)   default(0.0), not null
#  lock_version     :integer          default(0), not null
#  updated_at       :datetime         not null
#  updater_id       :integer          
#

require 'test_helper'

class AccountBalanceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end