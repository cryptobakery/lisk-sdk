/*
 * Copyright © 2018 Lisk Foundation
 *
 * See the LICENSE file at the top-level directory of this distribution
 * for licensing information.
 *
 * Unless otherwise agreed in a custom licensing agreement with the Lisk Foundation,
 * no part of this software, including this file, may be copied, modified,
 * propagated, or distributed except according to the terms contained in the
 * LICENSE file.
 *
 * Removal or modification of this copyright notice is prohibited.
 */


/*
  DESCRIPTION: Add data field for mem_accounts column

  PARAMETERS: None
*/

-- Add data column to trs table as jsonb
ALTER TABLE "mem_accounts" ADD COLUMN IF NOT EXISTS "data" jsonb;

-- Create index for data field. Using `gin` index as it's more efficient for keys or key/value search.
CREATE INDEX IF NOT EXISTS "mem_accounts_data" ON "mem_accounts" USING gin ("data");
