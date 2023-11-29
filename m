Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA4C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9228410E5E2;
	Wed, 29 Nov 2023 01:17:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99A910E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220621; x=1732756621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=w0ExMfyGFODNpm4WbARcIuztYIZltmPR5IRT4OPWH0w=;
 b=mM4nulcCo32sxfg+0Lg3JgTkqgvTw7kHGx9Cnc+CKS2vgbcjZ2HzmV9c
 cOPFHyku//XEIn9QhY6BJhZPQxJVBOQFjlPOo6V1CAne46fEhFr0cBzOt
 +gHo1pDS4YvNOPUh6nvzp9b439xTKgsELovI4ij6c3SvEyOw3HkxtaDot
 TdO3CbftaZ6qMd5oMGpH6RcOI2dWxt+QA6sNObNFaXSUHslVq51VUTsxW
 RENkPpaZJhehY3Xx5DOJ9t+OyfYuiUiUfP2IgUL2lNSIC07sNZDBlCiSb
 gCR4Jav6pAek6rHEurxt5FSH3oKHSuh5HmwdwpiW/XYqhnPbebgrNGBM+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6329423"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6329423"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859621684"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="859621684"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 17:16:58 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 17:16:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 17:16:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXlo4G51FejoHgd9FFsx8Ki0aj4H29e8MqXuodb4SyTgnQJix9qgcvo45XMyai0xnEByvagF67bw9lGiNOPe1R+m36L/vD3PURyUbiyZoAenWHIgZAv6Wg7i+7dUPym3pNS+o8PJCNGCco9MzJZp+5Yi1IBV3/DdL5zKoqeZXIgenK5ZFFMO1qx32pHtU7xYxMblJDpfB8GKzV9JOu4LRZNZWCsyRnl9egWINOitsPquKJ4PFwnHGgS1+U3YuSQEfv/uadqrsmOZNx37+FhW2/TXERHLGJoAf+H5jT2f/BwDLbfqNyNae1kmZRAyvbPjTp3tz7m3y1G6fyJiCCcx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+htuzUGt5OLhOhz695nw513r82HmTqMZ0tsjKMkaAoc=;
 b=kDgD2sAM91pAwFCbtwd/2ewe/fXNoXFFo54rK2G95y/0CDvp2xRLDIZDFGUl17EA/P1/013GNT85Ife8pY2vDiv/N2j0zaDRcQCv25bSp46DP+brRS8enXsVk1iLZRZboNtxRaUAZ413j9p73yGGLSAwU5M48c5UfYZjvyB00FWrbcyB7N9xiEtmRhqLKgJv1hQ/kDSXkQOG2mH+Ikizv+RyIbi22QlX8Aj64y8be0Q5g07hDcSAAaaa+bN3uTOoQ4xqST+OQhOpu5LuAgnxP4Ru+S3UUB25ydN4QnYsYYXxpKxBDHjX9AJOBH8zq8wZGGnyJyUukiw0t8OoanujEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 01:16:56 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 01:16:56 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 02:16:09 +0100
Message-ID: <20231129011624.836843-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129011624.836843-1-michal.winiarski@intel.com>
References: <20231129011624.836843-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 3543a784-2389-4843-d723-08dbf078e0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3KuD/96Rtk6mB8CI1Y9vjbEcYofv9dBXKZCnDsB2fVUurLmQR66bZZHuJytjdV9jOWAXPb3KZ/hv915ASnZNgw71Xqthcl9BWQTUXHW+40a0oEKfuxsnwvvGt71N1PhYs8vfzxE8tHccottJa2Sr/sPl/YIvTQqqE3qLqIuJvaJm8O3Klu3bClDbVeapXRBm1cGWoORP6OT7b32/md9SffVewBG7liltmtrIUE5cElby0nBh/gfXwCnz7BmK1d4olGu4iIFXBQLJaQNCN6UtERCwwcIhOmFZ7JYJZoqCA6wdxLDCNc9D7u6jqYh/YnXsutTt7nXPgEkWlORuuatyLPRVgaXWUS3pczO8U+nddQmCglP3dh5q0Jpnbf4S1rIdb/Ohtn9YgTPZA0b+dzTsPvW/W3v5JqipAsNZxykwxVX3vjo2Nr9YSzj1J2BJ2DyXj5jyK/yV9Iq4pMkrDDlIx/fJsiKj3e/661q7IliuxSudqrQyureOiuNgLZ+A8InyoE129kCYCVoTEY7I+LX1wp/afFbv+3cbfC0BPAsOq+rZIXzdJMg1YhvzzOLrq/v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(86362001)(1076003)(5660300002)(83380400001)(82960400001)(26005)(2616005)(2906002)(6512007)(6506007)(6666004)(8676002)(8936002)(4326008)(478600001)(6486002)(54906003)(316002)(66476007)(66556008)(66946007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk83M0YrcmhRSFdCRkNpT3FHbit5N1dKMGQ2Z09PZUZkb3YyNGNBeTdCQlRa?=
 =?utf-8?B?QVcyZVZlMHJJTkppVEp6N3pRdWk3dFo2ek14MWhaV3FIRER3VUd5VTl3MCtG?=
 =?utf-8?B?TUdxdlVXd1oxZXA0Qk13cVRPMVMyS3d1YnQ3UWFZQlhlMXNGUGpNVmV6ZGRv?=
 =?utf-8?B?S2JUbXBYRkxMQzBGVEhBVm1KMElEbUhnZ3VPNmlleW5wUVNVNENaWkwxV1dM?=
 =?utf-8?B?OEFjdGlrcTlIWTlFajZuam9zNTVDR3ViR0Z5d2xQS0pIM2Q0a3RpSWVxSVZ1?=
 =?utf-8?B?UFNSb29aNTlzRFpQbG9tU1orMG5uUWFyYlFMSmpkeE9RMU5VSVZYU2dsSW1N?=
 =?utf-8?B?ejZKMThxbjYrQ3ErSE5UdDBKeWwwbHNjY0FZTHlwdGw3eElXY1ZQVkdJRkR1?=
 =?utf-8?B?UC9XYUZxSk1TSWRSenhpTUxLcGdIaUJQOGQ2elo2c3E3aWhjck9wMDJTZGVC?=
 =?utf-8?B?VGtTVE9xQ3IvYzZ1bGlSY1l6eTVCN1FkS0ZQYzVMN1NKUUo1aksvell6RTFL?=
 =?utf-8?B?TEx1RzhPSVFyWHBLS0VXTWtvTExsNCtYcHN3S2wrR1NCVXdaNUJtSHdDU2R4?=
 =?utf-8?B?Z0F2V2ZSdmo0MmM2d3ltbU9WNURyN0NMNWZtNHdYL2RrSFRlektWbXZ1SFUv?=
 =?utf-8?B?Z0VjdGJIZ2V3L25rY1B2VVp4L0tvQVVwQnZoeGlUZmF6cU13dWJxTHVCQVpH?=
 =?utf-8?B?MmlBbWlhZXRObTdZaG91V2VBb2JSZ3ZzTkZHU2J1dm5DUmhoL1dvNFUrUFQy?=
 =?utf-8?B?T3BBeXdMQkZLdUxaRzlENjRSWEFhV0ZlNGQ3Wmt5T0NRUkV3RWEwaFROVXJz?=
 =?utf-8?B?cTNjOWxPbktDT3NMN1dISTZxR045RTNQMy9teTQ1bDRzczhvKzdoU1dGZ3Jy?=
 =?utf-8?B?WFBLVm1WTXZTZ24wRklVWFVmZkN6c054N3JOb3JPV3FFdUpJK0tMTjF6UmJr?=
 =?utf-8?B?NFNnWHNZUVdDOEYrWHN4d3VFN2hTVmpGdm4zTzRJV2k2NnBRZFNwdHphbjVo?=
 =?utf-8?B?L2F4dWE4Vk9ySzdwRFRhZGNrOGVEbDQ0TTM4Ly9NSGN3cyt2d2NEWWR6akVl?=
 =?utf-8?B?cXBZVEc4dHNVdDhGbERCcUJHU2ZSTkd4blRBOXBabWN6dythb211azduWUlQ?=
 =?utf-8?B?R3Rrd1dXTkl4VWlRVXlhTVNOMEx2dmxKSGpCeWx2Ykg5WXpuaHJrQzVIUTc3?=
 =?utf-8?B?KzdTWWJ0QjV6K3NhbjdCTCtYWE1RL2lIOTBFakZydDc2a29BQWlzR21yN2d2?=
 =?utf-8?B?NEQxTHVIN0VocWo5NU5zUXJhdWJ0dkxMZ2RxN3dXcktyWk1NNGV1OGZQQkNo?=
 =?utf-8?B?Lzd5bVQybUU0Z1FKMmNUTTlGamdaZlNTSCtXRGtSRFJRRGU1VG5PdjhtdXRZ?=
 =?utf-8?B?c1ZobStkWm1BeTE1RjJvbTREREJ0YkcvTVNiL2VhWmFmQWVFdGNqbndyUzVR?=
 =?utf-8?B?NkxTOCtnRjBDY296bWNwcUxpTmh4Z3BkS1gwS2l3dXg0SUxrblVWN3lhWDNG?=
 =?utf-8?B?MXk3N0VZNDF6NWZ2UVFCY2h4eEkyRmJXeERzc1dROWl0djcvN0h1NUg0VjBG?=
 =?utf-8?B?bENFSkZuWDBpT2VnN2s1anEwQUZyS3d0T3M1U0duaWZYclJoZm9UMmZzOTNu?=
 =?utf-8?B?ck1pT1Vzd3U4MkJQekN2MkxNa3lGK1VsVnB1YU8rLzk0NG5PdWk1QStZeVhl?=
 =?utf-8?B?VjB6SUtiMG54MW9JWm9YenZNRDBUNHUrWkZUdCtCdjJsVWhabEcwU1BxQUZp?=
 =?utf-8?B?WldlK1NFTSthOTZibHpnNmNsZTFuYkRmWnNZVW9zK3FudjNsZWMveDNxMEsx?=
 =?utf-8?B?UFBmL3JxVjNFdDR3d25sUzlXdVZVZ0tBQnRUUVVvQTUweU5FL2ZDOG4wMG10?=
 =?utf-8?B?L1g5azkycnREV3ROTU1hbm5lR29qTFczcVQrMHZVeGlLRjZWQnVWcGpicnpk?=
 =?utf-8?B?L0FNVjMwM1dhSHQ4V1NoY3lvMjgxM0FoY1YzMTREZkY1VjFnSzR6OXZTbStX?=
 =?utf-8?B?VkNTUHA0RlFRaXVSRGwxcWpSczBXWitCUXVoUlo4dG80Y3RZSzlWRDlCODJS?=
 =?utf-8?B?VHdkUWs3OTR2UGpldG5DRkhReW1SU3p6WVBnYnVWN3lkQ1hFZFNEY3lZZWN0?=
 =?utf-8?B?ODJHU2YvcGJ6cmRKbnZFQ1BiT1hManUzWi9Kb25KdU83NE1iQmVaS3JhTmJD?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3543a784-2389-4843-d723-08dbf078e0d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 01:16:56.3089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jt9H61CBjK5rT0fpI0YDKaZ8aET9lK89u9Hvw83mKglSu0g2yLXpR1Vd/Uk18SQt6CoBFW/L/jnlpqB9/bdVXk0k73GYRpQ6/pTn8WZI7UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 07/22] drm/xe: Introduce xe_tile_init_early
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

It also merges the GT (which is part of tile) initialization happening
at xe_info_init with allocating other per-tile data structures into a
common helper function.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ------
 drivers/gpu/drm/xe/xe_pci.c    | 10 +++++-----
 drivers/gpu/drm/xe/xe_tile.c   | 32 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_tile.h   |  2 +-
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 785bf2e610b7c..5e1f73c8c77ad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -393,12 +393,6 @@ int xe_device_probe(struct xe_device *xe)
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
index abdd2ca4b6ac2..2483650720c54 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -26,6 +26,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -624,12 +625,11 @@ static int xe_info_init(struct xe_device *xe,
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
2.43.0

