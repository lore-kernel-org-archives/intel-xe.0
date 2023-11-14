Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A41C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B214710E440;
	Tue, 14 Nov 2023 11:45:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EB910E440
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962316; x=1731498316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bzzreuJFJv3OehWJz21iz0jnHPUKz+w1qyD4ko7xYuE=;
 b=XGW6KVIoTu0rMZx+/MqiZFwHUuNSIh4feeYYOoRWjDMeaTrMkS/en/hX
 ScCfAW1Uo0ERxQ8rApGlef7Mqm6PNepIWVPPldhDqfbZFpFJgqsIxB6hy
 zyyKtTdaby3ei/rOPCezCgcM2GIMVy8IJWJSHc7Jc6jFdHuo6tDxTzGRz
 r/Zxv7fmDHhbBQBeQE5ABM95IGEORHjKh/JV3PwmSUY80gKR9bt+UgJZp
 LYTb3DkuzXfqdNTKSyx3u5ieIqMadZgH49mAd9g7zH/gW2i/UxEFvHaM4
 d3YnZwswNVsI594tnkr+0lrAG0mWom4PtNms9et3BiYZKyphid80+iCLL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9276776"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9276776"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011888149"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="1011888149"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:14 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2lbw89ctWcY0fQuMDruNREQtOEMsiE2NOkbtZrKV+bqLRcGCwJruCwV5KbY7+2emlHtxzU0Ahz1wADGBn9q3M6ZpFuO53dA+gQB6c4Gy7Y25U4w4l8zIqGjZaLxjtcaMe99ehsFzVj/68FlZ88F92pRv3gDZOFIw/IcA1wwQdzL69lWppop6MiAI3qgc/E2u+mrow+jTIBcRg77BXu4UuSxPGzozgz8UjvIk+kIqIpjc4aBgWFQWInS4Ugf6sW8Yj+c1dw63hKOxn/L4l/Pn4A4fiQLoCk8VFe09fupH+YPIw5cVif9fwPnOhmtoNazslz+DYrTe69Dkgrt9a8EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJI0NGQ/2oN06J7uOvUBQ2sZuqMDepP3MV7lAx3RaQ4=;
 b=RJF9Ed8QXjWrx+R6b/usEbsCGyn0qRrJo/nf5lQplM6TRhTB1G03AbGKFA03uB6tQXozm2FpP8btTqQbXxrzP42E6LWPHjsQK1rtx5KVUFau5WrxNCr+PNZeoY3RV/qHGICuJ9YnRhkZgm8HbUR75zEwxRj6dLzDzpTvSXwJIRiBJYseNKAAOTMoFr3soDaGEU2gMAhKgLMM2P3lV9UWV5CVavCXjHfclngYM9aA8AJMmQ5tTLW/GqtBZTnuMkgwe8NfeXNvR8qnajCTTHkBtPEHYg7ie4L7YylipssoXAb/wl8tpVkCz0yUcWgyeLEnoN862LjfYsV2wysTAVptZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:10 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:10 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:52 +0100
Message-ID: <20231114114405.2207747-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c03334a-19c3-4e25-667c-08dbe507281b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5nwSzQioALiTzlq3VFapywmIZooMhOVmkAjAqOzi9szbyd2bL8zloN/dETiEY6SEmCxUvEWg6hC3EglzDsWBvUyiLTM91+DLTWtN9LlreHWxrHu+wBzCRwtfJvz5e8flT7BR4+ZCj64Uh8XQw9QDCor8006mPr1bWaRp/TTiAh73QP0IIxEl+DKjuHtzWyysUIpwyQYC8smhztrgkhQVcVx75BPnuVDb6z1ERjf1ZzM7HVylbJ9HMSPFQlAqNDJWv/cRzYURHSdlpDHutlHeidNv0h6kjElQLN3E8PtMGW0HvbC1im6OKzwA4tpHeY+gC1OPUTRpo3lt17PAXeEuyNdokZgu2m+77jnh4gptogr+WlsWNpxZNlx+jwimi/riscjiMyZSVjvBnoPZhuPdWqMzyUifNHnICieI73cJCFOkrXSyQzEQzMg73in1iXKgi4ViLpcpq6dlVkDv3Iv6luxgcU8XlLhwK4+slcCgsroGiOZ/+uxPzmxjlvLwfHc8lKHdeo9BvXrIufSGZquEUFMcxBgzhLDkfMhrsvfoXXE3XPjNTtIOvz3w+xqzu9/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWloRXBsMHNubmtqZHZWVlBSVVFtWmVKSzdPR0QrbDc1dnZkd21HOFZ4SXcx?=
 =?utf-8?B?c2dkdzlZdHlsWXZOZFk3VUdRT3pzN1gyY0JZWlBTRnplTTNnTm9WdnBhTXIr?=
 =?utf-8?B?U2VEOHZRbWpFZzZWQjJFQStwSzBlMGxRRW1JVitGNFh3WHNnNVVJa0tnaWpJ?=
 =?utf-8?B?cWdieDBxVXd3M01NVEkxcXp1R2V1bjVrT1cwSjQ0VVNJcTV4TGhPMkFsQmNQ?=
 =?utf-8?B?TFhmeitXNFhaZlhtb2lweVlSZkx0bkpPbFoySHFrMzVwZ1hWNTF3NnA2dEp3?=
 =?utf-8?B?WWpSVFN4eTdya3hUWGFKVno3d1dOTHVoYXBSZkFlSmFMcC9rUklRN2JGNXdz?=
 =?utf-8?B?Q3JXVkxoSDdmT0NwMFlBUlBJOHZOWHRVblNJbUxQQmJ3ZWNOZzMraFBHYWJR?=
 =?utf-8?B?Rm5sa1ZwMHFWTG9vVjl3VXdRd2ZBK1ZoRjhwM0hMQncvSzRGNlFNSGI4dThm?=
 =?utf-8?B?NEcrdWlScXgyK1VSS2xmUWF4bTgzSmwwRDZITTZQazZQQnh0K0MrVk55bmp6?=
 =?utf-8?B?VWZrT0wwWHBuSFF3d2NOM1Q1dXNzOC9tYzdqM0NHRG9IdEVZR251bGczY2hk?=
 =?utf-8?B?OWNIRzU1NWh1bVpmUWFhNG1CU245YWRNWWdOb2loV2k0WmtSek9uTEhyYXhY?=
 =?utf-8?B?R0JiRUNQeHFQTFRvRWVlaWFNbzA3NGVqSGwxMTMwTmhzcmswNUtpNUsyK0Yx?=
 =?utf-8?B?YUdwS29hNWNiOHc1b1dpdFE2aFVWYlgrV2R4Q3VEb3dRL0xtRVZvc1BwVHR5?=
 =?utf-8?B?dk02R0hmYUpBZ24rcS9oUkZHMVFDZnk0N3lDNHVnVmcrMmtmV0JBeEovb3dx?=
 =?utf-8?B?OG90OTNTaUo1eDN6OTc4bUhjSHNqM25wNEd6Z3lqc3puYW5xQTNRSjE3blhU?=
 =?utf-8?B?MDhDM1BnYytDRmhXeEhiZkdMRTRycis0Q1BuU2tXQUViR1o0Ukk3NzZIRi8r?=
 =?utf-8?B?VllGdHcwQy8wT2VyS1J5ejJqSzNYRDhETUVnNHFFQSt4Vlc4MTZkYjN3VVZE?=
 =?utf-8?B?K21aZllTSnJVampjZ2pDenpGTkZXS1IvelZtcTM1amxkNjhrTXZiYzJ5dlBt?=
 =?utf-8?B?clN3S2pyUEloY054bSs4NllEQ0NFd0tpQTdKcUh0dHpkK24xcFd2NlBEY2dP?=
 =?utf-8?B?Zm9vNVdrcjkrM1lzNjBmTUpBSWRGSlBKQ1Q0RThza21kditLQ3dmemU0Qlll?=
 =?utf-8?B?V0xPekpaM2ZqTmFvMlNXM2d1c0V1V3hPemc2MUUwc1R3dkxuWnB0c3JnNS9K?=
 =?utf-8?B?QStBQ2R3WHYzMHJuVHNXZWg5SWdqbUJEcHhEUW0wU2NQdUZoNVlieXJnZW1W?=
 =?utf-8?B?K0Jna0RQbWhWR3YwcXkyd210eVZIaU1jenpudFpFQkduVDNuQ0d3M0YxVG8w?=
 =?utf-8?B?aWhYaHBCMnRtN1RFWGpjVFVuZ2JsY25mYW5IRmtJdkh4LzNxWHdOYW9UZ1Bh?=
 =?utf-8?B?REp3SzRqd0pBODd5RnpUMERBeFlzZU1rNnp4N3FnNHlJVlR4clNTQVY2SjJC?=
 =?utf-8?B?MW1MNkpBM3lFZXg0TnJ3eDZqSjF5S2VNbHVXUGhDQzViQWJsZ2RmeWx6elE5?=
 =?utf-8?B?L1hDcCt3VkJSdlJVajNzNGE1YkNYWXdRSVZHNk9PS2NnalRQaHl3UzBuZHdJ?=
 =?utf-8?B?UVJqSHFlOFlUR1IrRzhaRjRlbTB1SXp4dzlKZFVyY3MyVXI0MExGRVdLa2tH?=
 =?utf-8?B?bEE5L3FjajFtS2xKRmNsS1JxdWdaZUptNU9UbU01bVBPUFZrNVdDRkdGc0p0?=
 =?utf-8?B?cXFhMHo5V1VyVUhIVWFieTJ5U0FVajdGN1BZd20xRThCWUZVdHErVEt2b2Jz?=
 =?utf-8?B?dDZ5eG1Wdkh1UkxmdXg5MFZwUVBGTG94UnN0djBSUW0wNDVNcG03SUxnS1dK?=
 =?utf-8?B?RVRsTUJSNlNtVHpRaElmbURJdFRTUlBUZzE2RnByZW04Qjg3c0hIajlPUjhJ?=
 =?utf-8?B?b240M3J1ZVlzM0NvYlEvTVcya1NYN2JIcWdiZDFyazBwRFozRVp5RmNyYm1i?=
 =?utf-8?B?N3k4TG02bUdodnVmbXA4NzEzRDZBN3RLUDIwVjJWUGFzTGJGVVRpNHVmR2tN?=
 =?utf-8?B?VWR5WlI4Zndta2NzZjd2YjEzS1VqQ1J6ZVRsQVhhd2ZlTTk4eUhNZXI5SHRl?=
 =?utf-8?B?NVdZZGxqK2c3YmFRSjQvLytBSmJ2cnhQNy90UWxnOEM5TlhoVGpUK2NBdTBX?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c03334a-19c3-4e25-667c-08dbe507281b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:10.4866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDU2xnh/5c2GyukQ6DLnfr3S8Og+IUyA0K+onPDkNrHTWI5NGymtBHUnq7hZn/mdv0l39ly31ytoOmJ6kui+qDpEP5MD85JeF5p/T1OP3Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 07/20] drm/xe: Introduce xe_tile_init_early
 and use at earlier point in probe
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It also merges the GT (which is part of tile) initalization happening
at xe_info_init with allocating other per-tile data structures into a
common helper function.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v1 -> v2:
- Add comment to "early" variant (Lucas)
- Make "xe_tile_alloc" static

 drivers/gpu/drm/xe/xe_device.c |  6 ------
 drivers/gpu/drm/xe/xe_pci.c    | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile.c   | 32 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_tile.h   |  2 +-
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e9dfbf44f7534..3a98e7b502190 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -382,12 +382,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_tile(tile, xe, id) {
-		err = xe_tile_alloc(tile);
-		if (err)
-			return err;
-	}
-
 	err = xe_mmio_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e4a62452ca1f6..89072a0a6bbed 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -621,12 +622,11 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 
 	for_each_tile(tile, xe, id) {
-		tile->xe = xe;
-		tile->id = id;
+		int err;
 
-		tile->primary_gt = xe_gt_alloc(tile);
-		if (IS_ERR(tile->primary_gt))
-			return PTR_ERR(tile->primary_gt);
+		err = xe_tile_init_early(tile, xe, id);
+		if (err)
+			return err;
 
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 131752a57f652..daf1ac39dcbb1 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_gt.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
@@ -80,7 +81,7 @@
  *
  * Returns -ENOMEM if allocations fail, otherwise 0.
  */
-int xe_tile_alloc(struct xe_tile *tile)
+static int xe_tile_alloc(struct xe_tile *tile)
 {
 	struct drm_device *drm = &tile_to_xe(tile)->drm;
 
@@ -97,6 +98,35 @@ int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_init_early - Initialize the tile and primary GT
+ * @tile: Tile to initialize
+ * @xe: Parent Xe device
+ * @id: Tile ID
+ *
+ * Initializes per-tile resources that don't require any interactions with the hardware or any
+ * knowledge about the Graphics/Media IP version.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
+{
+	int err;
+
+	tile->xe = xe;
+	tile->id = id;
+
+	err = xe_tile_alloc(tile);
+	if (err)
+		return err;
+
+	tile->primary_gt = xe_gt_alloc(tile);
+	if (IS_ERR(tile->primary_gt))
+		return PTR_ERR(tile->primary_gt);
+
+	return 0;
+}
+
 static int tile_ttm_mgr_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 782c47f8bd450..1c9e42ade6b05 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -10,7 +10,7 @@
 
 struct xe_tile;
 
-int xe_tile_alloc(struct xe_tile *tile);
+int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
-- 
2.42.1

