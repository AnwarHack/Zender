<?php

namespace Database\Seeders;

use App\Enums\Settings\GlobalConfig;
use App\Models\EmailTemplates;
use App\Models\Setting;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use App\Enums\Settings\CacheKey;
use App\Enums\Status;
use App\Enums\StatusEnum;
use App\Models\PaymentMethod;
use Carbon\Carbon;

class UpdateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
  
        try {

            /** V2.0 */


            $migrations =  [
                 'database/migrations/2024_08_11_123548_create_reward_point_logs_table.php'
            ];

            foreach ($migrations as $migration) {
                Artisan::call('migrate',
                    array(
                        '--path' => $migration,
                        '--force' => true));
            }

            $queries = [
                "ALTER TABLE `payment_logs` ADD `seller_id` BIGINT NULL AFTER `user_id`",
                "ALTER TABLE `payment_logs` ADD `type` TINYINT NULL DEFAULT '0' AFTER `status`",
                "ALTER TABLE `payment_logs` ADD `custom_info` LONGTEXT NULL AFTER `type`",
                "ALTER TABLE `payment_logs` ADD `feedback` TEXT NULL AFTER `amount`",
                "ALTER TABLE `withdraws` ADD `user_id` BIGINT NULL AFTER `seller_id`",
                "ALTER TABLE `orders` ADD `wallet_payment` TINYINT NULL AFTER `payment_status`",
                "ALTER TABLE `attribute_values` ADD `display_name` VARCHAR(191) NULL AFTER `name`",
                "ALTER TABLE `product_stocks` ADD `display_name` VARCHAR(255) NULL AFTER `attribute_id`",
                "ALTER TABLE `digital_product_attribute_values` ADD `name` VARCHAR(191) NULL AFTER `digital_product_attribute_id`",
                "ALTER TABLE `digital_product_attribute_values` ADD `file` VARCHAR(255) NULL AFTER `value`",
                "ALTER TABLE `categories` ADD `slug` VARCHAR(255) NULL AFTER `name`",
                "ALTER TABLE `brands` ADD `slug` VARCHAR(255) NULL AFTER `name`",
                "ALTER TABLE `products` ADD `point` MEDIUMINT NOT NULL DEFAULT '0' AFTER `weight`",
                "ALTER TABLE `users` ADD `point` MEDIUMINT NOT NULL DEFAULT '0' AFTER `google_id`",
                "ALTER TABLE `seller_shop_settings` ADD `whatsapp_number` VARCHAR(191) NULL AFTER `name`",
                "ALTER TABLE `seller_shop_settings` ADD `whatsapp_order` VARCHAR(121) NULL AFTER `whatsapp_number`",
            ];
    
            foreach ($queries as $query) {
                DB::statement($query);
            }

        } catch (\Throwable $th) {
        
        }
       
       
      
    }
}
