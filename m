Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE7AC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B510E301;
	Wed,  8 Nov 2023 00:34:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED1D10E301
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403688; x=1730939688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nm4v0KLlt3fZljY26PHhwaQN4L8/AtZVvpvzlzniU0E=;
 b=KDd+y9OzOmnpyVnNHb92/FjyiZlIbDcTc5glsJXKuVGEqe678asw8HSo
 BS7IIqoFXqFuxeJeEjO50++S6QtodlxJpkz/F+aP7mI4Qmzq8bjEtDNMO
 zJjHluHNEuTzctKuc1gXnMM4QHjcdUC7Em7PiKAXI15JnuyCeiB5Z7q19
 TqTRVQynmD2qMc2/wTJ7C70KfgSGFafhT1tVm/nze28xnMvKsjBBmskll
 ZGvHL2hlHWVqg83GdBb3JaB1dUp8E6ggS22rtP7QlNFl3BGiVPdu0vYRq
 oD2lbbIuzY39UFocoz0fZ1IuSoP6DdQR+oPCOuxXSDGt3F6L715OaVNPk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368991781"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="368991781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762889657"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="762889657"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPlcHEFfDU+mKG2/SMonMl+bnlT+fXIV7o53QS3dARWwjbSPhGyq9c5vQmb8X9mSoGSASIIt7VxA75FMjzPmhQ6eT2xIEb26SqU0OPJlxzSVe5GwI3Wtw0Q7uTKY+ZaRAIjwU/1/kDria7sNv3LqwZNP+FiGKyQjJ8PD0v3eOVOfMOKCJTZyMZ3RzrX6G3HVJCr9SWsoJH7BgBkqrljHzs3UP3bUNM4tzmD2JJXlbGQcWCuw4Z3eMhk6PnUfJZ8FvqmqnxCROa1CQdagD6fNZx5+JtmpcKM3V3waidhy44uYJ60CNaNbAvet7d1RmDth9SPbzKM6xm17466+OYNuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2reCKQdaO7KjALxX1b+XFbzi5xGzOcK4lYKO1GSgd8M=;
 b=WbPV0tBK8kilywAoomohVYAEcGr9TudBDpIIDbPMm2YAIe6IxKrT2cObhcku08o6UVFzK4yCn3OKoNSVPsoRxsAXEC1zjGj/gsI9mb8YEdDgMc8hqH2KegIP+9DAx4/+uOyHEXdQeyd8r0TH170XNvOjqGGU2iJhiOJ5tzpWqmMa8NeIUwJemgsNC3xqYGz3YVRrVs3FfXiOsTTRA+dcTPMuX2PMMtVCeyI9LsVTUrzhCDJzYe8QAlDcycsyiZOGL/jc3wX6ohtilvkAf4k/fuLKVMtWy7WL7I49zHvbxSmPWI9MoL4YmWyty69eexHQ3UzXlRMWWSH0XTffXKAWsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:42 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:42 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:41 +0100
Message-ID: <20231108003344.1169016-10-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecdf653-3cae-4583-65bd-08dbdff27fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D83JByv9/lWcGsEwk+At3mv/F4k5dm0K8yqSm6r8dX8JdIJRR4qvBW5U6YSQG1XcoFxdQqRgSknJqjIAg35uiFSPGAIWok9pzOkSiMIDJvmnIArhE2ObzhQIJtEPGwybAop3uNgsNBAfQuylZIN0kJjlpNTp66JwniP+VZ6IRqHa8q3rlfdPD25u7FRT+8EBUf5Ju8J30jdyXJN9SvYVZaXHzdY6+oY1zANEVpVC1bxzez84Z+zUyEVYthpCLkxcDpEHGfoUc9n0sM9bwP/GTFq4piun8TnLn7yUNBW7l8hHOVfZcURnM2Pi+Vmlzg4jB2CjoPn9wrDM9mPq7HjiM1cME1h5iyT025Dc2rtL2bX/EFbn9Is2AlFGjiIppldeNK7lc3pbtdYpkI5aZx4aaGoG8F9mu8R8I6LzWW/4LYMEbhjLUMhudSpYF5JywVWHBQDU2+Rbao+LU9v17vkuHdLoP4msiVhmr2J2WALwEx+IaTjU5Gi1NUYrNXvnMNw+mFnEoauFzoSdJgq59rBU73l85+w+7qyv1Fyn4e4XVvd9fpSY9+PzfEtftNJsg0z6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjM2Y0w0R3ZZTXRBSGxZaENQL04zeG93SUVybEN2ZnBLbldNVGxiZmFtTlAz?=
 =?utf-8?B?WmZWaVhjMFVaUmlTQ3JiVENWOVMzODJIZllXaS9ObjNWN1gzcVU3Y0FuUjVQ?=
 =?utf-8?B?ZEtrZ2czNVdzOVVPa2pXVjcyU1dxMXoyNW13RWY2eUNKTXFRYVRSTEtHeVg2?=
 =?utf-8?B?M2pSOXFHN0p0cEpYVVJaQVJuVC8zRzQ5TzJMOTBPaEQ1blZjeFBZQzdhN3lF?=
 =?utf-8?B?dmJYcjd1SkZEVWU5V0psYjh6d2xONE9oYVNMSk5xNmIvN3RxaFRSSGcyRDFx?=
 =?utf-8?B?L3dpVnVveXgxbm9uaHFxUzRsRWlWR1pHNnR0SUtiZnAxOEx6dHpaK3QyOFlz?=
 =?utf-8?B?eUswdG41YkRkLy9rR21lTzYwR2MrdHV3bHdJc3ErTDVseEJCK2NZZFc0SGsz?=
 =?utf-8?B?VUVCa1Vsd3lsU1NpNW9KWHA1YXFQajNkcFp6MUQ4OVA4SWQ2MCtwV3FyckJr?=
 =?utf-8?B?ZW9YLytkNVp6NU9telgzWUx3RzVKd2hQVDJkKzFIOW9mUmtJZTZBbjZ0MzBt?=
 =?utf-8?B?TGh3K3J0cUNCQmcvbmlTYlE4N20rMklwbWJ5TXA0cFhXeGE0L09YSWpEUlBr?=
 =?utf-8?B?R3k1QXZicmpZZEp0WG9hZ2k3R2dNM2xlVmZlVWR2dmtLNlQ1enhhakdkaXdT?=
 =?utf-8?B?OHh4clArODF4Q2k2SXhOaVJqTTBlYXZZMlFhTThIak5zMVVPRW5ZVEhJVC8w?=
 =?utf-8?B?UWRnMU1oMDZpbzVRZGNJQ0d2V1NkQm90NmlTblZWeFdPY0VibE9kR1FKV2x2?=
 =?utf-8?B?TzJHd3ZhL3ZTejRQcXRwemg3REFCcmZaVS82SExlMkdNQzg0Tkp0emhTNVM4?=
 =?utf-8?B?REJpVmhDWFZZZmZLenJQVmlxLyttZmx0cDM1THlJRWlSb25aTk5BTElQYXJk?=
 =?utf-8?B?Q2hzU2hhNnlLWDA1a2w5T0FyeklkVTF3NHYrQUNPVWM0bi9FSytnYS84eUIy?=
 =?utf-8?B?WHRoT3V3NHJ5clhucDRGTVp4RU14bHl2MjcvalowSE41RSs4bkhMcU1UNGNr?=
 =?utf-8?B?TURBSmd5VkM1akU3L3Y2aFVxaXR5Z0tTMWxNMjNPT0pzOUN4V3R5eEJnZjI1?=
 =?utf-8?B?L2N4NkhKYUdZd1gyeWFiOEh1c2pxMDhGbGhwN3NYbEF0aTh0LzZlczUvb1Zo?=
 =?utf-8?B?R1hYM1pLMEltWDk5TUJ3WSsxMnNHd3gzVXFlNzJpdUY4eFR4MUY1dVkyR2Vs?=
 =?utf-8?B?QkdHd1FabzdmblV2VVJna0dhbWd6WDdmTllWSERxTitDRW52aVk4cUxZaFI5?=
 =?utf-8?B?TG81SStpbG1pTFlsRWwzQ3hnbTZJZ24xbEZjYURJUEYrWW9UY3k4c3R4S1pX?=
 =?utf-8?B?aUtuRXQyVnAvUDlsUWNDMWdPek1tcXhYcmU1bjIzOElqaUpadXl6N3AzOEV0?=
 =?utf-8?B?Tkl0VHUwb3RtbFQ2VnltdUk1K1pIZ2lSbG1yY21GclN3NlFnU1paNnEwMjVY?=
 =?utf-8?B?SmN6RkNTS0Y1ZVpRd3BFT0tyU0pvcDBYRkgvVGFNUzQ5SUw1Lzl4YkE1SGVR?=
 =?utf-8?B?eDhjTER3ZkI0U2pabTNHdUh3Z0lZTzBSWGdSV1pjOVdKY3R6djdWV0M4cVRa?=
 =?utf-8?B?aWV0clpxZnpLLy8vTUQ3V2EvT3czQ085WmdKRjVaYWdKYlI5ZGNnb1FWbW9E?=
 =?utf-8?B?VVJzcVdaSTJYdHpRc0dybXQ1RzZoS1JjTEJkQUVrVGloMlRqZUV4alBqRG5G?=
 =?utf-8?B?eDlLa0x4WW5uY2cwbVdYMEVNOFBiL1FvY1E0OWE5MDYveEJhV0hTYm5mODRi?=
 =?utf-8?B?b0xDWWxNaHBHS3duRjQrYWthUkJ1dmxpYU9ReVQ5RDZ6b0FHa2JidWxIOXNT?=
 =?utf-8?B?encrMFg0ZUltSGt1OFVZK1ZScGdtVU15WGVTSDJYNmpKYkROeU94SDgyUmRK?=
 =?utf-8?B?amVmYzk0TUJ0SUFjdEIxTjVBTVlISnF4RkcvcGRqVU9kWHB6bVN6U3FiazVW?=
 =?utf-8?B?NjdZdk9JaEJ5Qm5TUnlIK25lWGtUNzIzOHE1enFPQm1oaFFqZ1BMN0dUOTh4?=
 =?utf-8?B?S3libzhweGlIcGxsYzFxTEcxWllnK2QxV0cvZzcwWENZcHJoWEpENEZGVzNw?=
 =?utf-8?B?RzZtRlBVVVBXOE5iTnM2T2pneW84V3ZXMzBlWW5hVXVTRjFsY3ZoU1hhZWRV?=
 =?utf-8?B?NzhVVTcxVGRkR29ydWlmWElwSWNrNzR0UWRjNlpsKzdvMTVOYmo2STBWWm1l?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecdf653-3cae-4583-65bd-08dbdff27fd8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:42.3944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zHTWFM+co+308Yi3sjxUzMP0zBXxWdykMU+e0appK3JsQTcfmMKt2B6h3wHrWhFBTRc86z9k/kGkA9PEUVxWzx7te1oH2TVMGQECunzmWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 09/12] drm/xe: Introduce xe_tile_init_early and
 use at earlier point in probe
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It also merges the GT (which is part of tile) initalization happening
at xe_info_init with allocating other per-tile data structures into a
common helper function.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ------
 drivers/gpu/drm/xe/xe_pci.c    | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h   |  1 +
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 53be4f0424c21..696f997bd2c93 100644
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
index 2aa74eab08232..87c45c6e08aec 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -611,12 +612,11 @@ static int xe_info_init(struct xe_device *xe,
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
index 131752a57f652..ea0cc84a0ab79 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_gt.h"
 #include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
@@ -71,6 +72,24 @@
  *  - MOCS and PAT programming
  */
 
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
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 782c47f8bd450..f35d943eed54c 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -10,6 +10,7 @@
 
 struct xe_tile;
 
+int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
-- 
2.42.0

