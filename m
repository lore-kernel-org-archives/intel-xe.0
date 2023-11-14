Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D697C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461AA10E0E5;
	Tue, 14 Nov 2023 13:03:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEE310E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967025; x=1731503025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bOF9S2MPoSjsBlpNp2P4SWBsYSCd/fFO8LnkQVqQsGg=;
 b=TY5/PUv672+VqJiCezK21h/gl3Cn5KHecyi0oGlzur9xuEJVWewRwlOK
 h/JyPcmYHAkKcF1LNonjvOaLlx4JsjbIs6g+liFj3lOZfl2q2i0moALYd
 xNfY0YR+qrFQaBe8Fnf/l6oB/1cmoLL6Rhi/Blmhdh8NV2E0NcIPzjk18
 4TxK1JtUe1WJeiFRRieaV6LGblwwMhT1DzLquMgIxktD376D6GoW6XPFZ
 sQQFvp/Hbs9GiKNDwAIYm7BxiLNjnx/YijrenIPQDPqz8ZdEf5tP+8/vP
 aVzlUyZ6NOCBWKMrnuus1d5wKglXPjKI4qXCUusaa+7dxjgFqmx8qVY81 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375692019"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375692019"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799518303"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="799518303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:03:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:03:43 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:03:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcMbooYWzqxsYjbI8b3m+D5kGODTJiRM3IeMS+8ozyI+wrf5hYb583pZL1lCFJuIN10UWAHqIjxncMRjYHj/lwxP5WwwmoQFeaM+qu0jYOFL/LCcWcrSo2GfE6izFc2hmXLCvuJzxDnxxjRgyn9h5AdpI04RUqGtRcBjWaeLxR3xhJlGkFhSUFjTLmdzdE/D52d4AEcTF26Lme8xhyk03m8GU2VI9i3efIZQkfY+IKIK6azj2YwUaqcesBC4ip7ApwG64ubdXMV3DdbFA0mOa3VpoePbubY0K/nnEqLNVWxQim0SErCuWjYLoRoh7fokPfeev/jtzTqNVMkfpjUfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNOeFfTD6rFcuQ2oSbA0rlxZ56GztdItZUtu0jqw8aM=;
 b=m8gIe92CGwMdGCnfLZbhTm1mBWNQpE3sWDtlf3kbHDvNo0zBiMc5tYEaN+6untiC+GcGq0NgXIWpCFh3FozIZt5M3r+zVzKWJ8fGNuE+7tNb04XuWWFhpTLAdrdHq4NIYH6Lh3B9rUiAEjdOT9/umzuhRRDA83mX9ERFbskAjvrNLHRM0NMsIEzIkJRqzq8NM+jdLvF5rHAbXoTHMVdxXTPCGfvrzRBtUBcucSwMY6zJ1rEhMT/fY+1Atk9ZyXu6Ge7fTZiJAq9S/vopMtEVSatPVqk6U5zZWAWy0D+UVt7NIY351Nn3AqdlZGv0+C2L4q/Lij5pmAieimv2gbKICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 13:03:41 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:03:39 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 14:02:18 +0100
Message-ID: <20231114130231.2299661-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW4PR11MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e8ac0b-3595-40b4-67cd-08dbe5121ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I08Orr3rgaQEv4IUnnh9Li1iEpGcd0wIxawBLvL4cx4BThYXlUg9UwHZ1+9ihJbtSYoSAsMR51xKKjsGlhNhqW86Lp8vXBsBfipqi37YA1rWllSFUAGlLUJCMVb3dINjrq+tXA96wVa9V/hfI9cIzcqmyA3FQGx6xYaUHVeL1czlUUTFOMzLfcObJFBgfcqGuzsIOrAo1F0W33/iVbH9mIjvxHmZ3bPuAa9cZHYoUfBmA3J9waYVssqhHl2kFmVWPVZANWIP5CvjTHkR4H4s3jkWeCYTFDBO6nPINf9qAzq+3PyqcUJ+UPFp4E2nUj+PnP8J2LN0HCMNv56MCOVPY3MQB2LzOGaXofsSWfxBeJguLZiKgu7Wn7BUykG9l5sSisZrT5jM1mlAhBKZbILmwuE873335ByRif6JtNrajIlDqCq1VW6h/wkHx+RhiQ8RXmLIGMtuAQS1Uk/Kop77mQxldEweR+KUs3gacTXTjK1M+Mqvrx2XjNgrb7W9dk+syuqumyusFAmrSH2y93cMudcJ8/keZYYFvMN0VVkFMy14QDFhQupuRyi9NRmNS9eo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(54906003)(66946007)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzR1dVNsa1psdUNCcHlLUlhuZGRTVk90QWxOY0xhVVlqaldQYXdvUEhEaDBr?=
 =?utf-8?B?UTFTcjV1c1NtNEZIWDN6SEVjdHhPVzlVdExocENLNHlNaVdNb08rbjZDYTNi?=
 =?utf-8?B?eHRUZW9HKy94bXhrN0h1d1JGRENkYXVIbkJOWVdnSFk0aTlJZitocjE2aGFD?=
 =?utf-8?B?ODhlekFqSjZFcVBsaXJ5YS90K05URkg1akVWTW1abzVLOUpKbmhyT3VGc0Nx?=
 =?utf-8?B?VnVzSExFTVVTVUszU010SThRMXkvMUZlNWVJZlcrUGc3M3Z5aWNCUnIwcVFp?=
 =?utf-8?B?bkVDdS9qVnFWYVZMRWFLd1Rac0JlaG9BMzdKN2g4THp2SG1YWDdPU3prd1c0?=
 =?utf-8?B?ckNxSFZUc0dSM2NRUzk3VTJRbUhvNlI3RUdVZHIvVEgvaDJiSVcxLzRkeUdO?=
 =?utf-8?B?L3huSWxROEpKRERSVFoxbHp2eERMZGFYMkFuclhqL1FSazA0VkgycFZWd29r?=
 =?utf-8?B?djZQSjdHQW5lelVPVmt1WnRCNWx3aXljbGlJSmpFdWN6KzRDQ2YxY2JsVkl6?=
 =?utf-8?B?dG14dkJWSXZ5TTVEaEREcENodjl2WU1GSVNmWjU3NFhmS0trRURTMGpzTW5p?=
 =?utf-8?B?SHVXZS81RFp3bk1KQW5pM3hYTlFKWm5WUitJdE1sZDRVMGRBY3BWMFBnL2Jn?=
 =?utf-8?B?RUgxOEcwUEk5MkNtS28rcjFJZENjdkxtdlN5YzdWWFJSZjlJNnpHbVFoWjVQ?=
 =?utf-8?B?aXcraldTWXdCL002c2loK2hkaGQ2UGw5WkxYRnh5RHp2Ykpmdkk0VVgxdk9S?=
 =?utf-8?B?RzFYbDNhTjZXTWZYNUtvdW15OXlnQTBGRENhZkVZZEJNYUpCTWRFVnI2cExT?=
 =?utf-8?B?WU5LbUxWcjBRY3UwSVI0eTRQS1RodVQ3dEdQOWdqSWRaL1R1Rk5kaWNPVW8r?=
 =?utf-8?B?ZlhVTDFxZytiaTNUakF4ZmFmTzlhZnVuRllBdzlqOUdzL1JDczVVWE1zMFFa?=
 =?utf-8?B?VDJrVlJQQmhLUXRyczlSV28yeGlhMUluQzFKdTB3KzdETVBOZ0RvQ3FlRzJT?=
 =?utf-8?B?R25RQzBVMlVDY09RNHBENzhRaUlyM2JweERsSlhONFpoamx4OTlmOWcydW83?=
 =?utf-8?B?TGFFbkNZL0ZVK2Z5bHFoL1hIQSt6OVBoM0NPM215VDdEdGRXQkpRVk1UY1Uz?=
 =?utf-8?B?UzlFR1FiTFB4NTl5QTk4TDVoRjA1alVlY0s5clFWbWg4TnFGTHNLdi9IYWI2?=
 =?utf-8?B?dXpqdFJiY3d3N2xGdWJRMjJwV1RBcC91bW1lTnZSdk4zSVFOZVhHaGxsU29j?=
 =?utf-8?B?bWxVVVh4ZW9TRDlOMjZBcTQwai9CSnBBSFZoZ0tQNkt6aVhRVmxLQWx0Y3Zn?=
 =?utf-8?B?aUtDdmdjQnZ2bit0Rm9ZU1l2eXZSc1dtOFNvajRadDFqTlZiUStDejBVcHBQ?=
 =?utf-8?B?V0RrTDN1b25nUUNUQkxjajNwVUJKVHJ5c1VmSDdEU2tpZlRFcGc3SkhiREdF?=
 =?utf-8?B?Wk5HckoxRXE2Q0hPRmtmTTdxY2dFSk9Sa1dHZ09RK2xDa2lINVgydXhXRTZK?=
 =?utf-8?B?RkhSeDJFaU5idGpZa1JXalZ6UDJ2SXhvdVJVeEJwdVZsdVo1Q1ZGUTFKci9F?=
 =?utf-8?B?TWVYMHJDZ2NOejRmRHFVdEVWMXV0MDFDTFg4N0dxWDFwbGNWK05nMlVpaVVy?=
 =?utf-8?B?a2R4dk0wdDJ2WHFqazNab0JpU3Q4MURhVU1WR0ljck9YY3lLZHY5RXdxY0lQ?=
 =?utf-8?B?Z2tNQnhEL25HVEpwSGhyMm94TVAzaFMwUzJwKzdyRkY0YXlmUGdxV3g3ZVE3?=
 =?utf-8?B?UVJVVGdsanQ3MmZiRmh4a0pKcHc4aU9BSFkyZXNhV0lRM1JJR0lHQnYyRk03?=
 =?utf-8?B?MUtDc2FYdmEzc2hobC91bzlBR2x4UTlUa3ZHNmNQWmo0R2M1VWhndGVUTXQr?=
 =?utf-8?B?QW9jZUZTM3JHRTBtd0lhUDJwcGYzdlpTbGV2aVBtaWxzSWg1Zkd6bGhDM0Z1?=
 =?utf-8?B?aWlUNVFYRDJtSkk5Lzk2ZXRqOUN0dllSSWtNZUxFQTdWL2FRSG0wZlRxRTFZ?=
 =?utf-8?B?N1ZvMUFBVnRENzY3QzUvL1BXelJnRWhHTC8xYy95S1FOcWZrSmJXQlVTeVpK?=
 =?utf-8?B?K01MQ3ZyRW5vMXpRSG16b2lMV1Z5N25WeTlBUnNXcldjQ3MrWHJZNXptUGRV?=
 =?utf-8?B?RmFicG9kQ3hYK2dHTlhEZUl1bitWVWhQU3Fwb2YrTWhzQS9CVndod0tyZTFo?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e8ac0b-3595-40b4-67cd-08dbe5121ef9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:03:39.6129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2e/OlnGhItN3ZWN+JlSemd6QJ6A/cCFDRMsvcpOjt7vFPA4FcKRIoR5uwLgLH27BAsBvKzPmrqqphNjeCCEJluN7aRxPubwvT32clsjJ6rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 07/20] drm/xe: Introduce xe_tile_init_early
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
index d603093f32274..c50cc3f7cbe06 100644
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

