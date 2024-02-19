Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F735C48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 13:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358FC10E426;
	Mon, 19 Feb 2024 13:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBSjhV6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9B210E420
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Feb 2024 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708347952; x=1739883952;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=3OA4rqRyOO/SkPrKjVl60itFEA6KLvT/8xrwgGN5rBc=;
 b=HBSjhV6xxxw3LkQAgxSLe8kngl/ipHH+mPkb0zmToqT1ht2Q7sKDEXa6
 +z99Z76+6WONalrcrKs5EDW0kAbiCy/6pWsluxtlAWInjQVYuQmgVvd4e
 ChSGeK6WERxhhoO0ShgWoAe9TFjf7AnfnrCFSBmqb/a0ovqSScsi4ko9Y
 3NIQrNnqstYhNNix+Ai8RqE/xA3FoUpqHlTAVmlGmlHulI6w4CmhNSLA2
 ehfgCHjAFJo8BITHTorfCPnJ5YWUw+ZAhbNBUP66kYvU4OPrV9Vys3CVo
 0J5nE6ELGJjI5Bb4lHNAbOEkAUSqAoD1ITU68QNHLHSZowmo1t4YksAqz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13824027"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13824027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4389563"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 05:05:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 05:05:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 05:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUyBp4zNlCPvAYQzFfRvMfkCgQTWxupX4GgW2EjDp983IMbfFPG/DLanR3NuJLJhTgJIaU3sNIA2gs4CA0uQOpLOfC6YgDKFvPfLTexLVY3eaSZGY3qAOk2W3M4cAycAD8aM+3DcuukRb2OZI2DNeuERNPQMmiTT3SsevgkSrc7Gm8DntjjGqG0wshioEO9AP9NRm+I2BOjjze/i/xYvEAGB6LPnmlAIRNKzH0g1oZ6hglm3b1rS6AknLnWa1t7i9Aki0sDK1k2v44g22+bkQhecOdfcyvDRRz/8h/Pdt/lpXh64sqWbjVVLO+36k0KbsheGTjiK+6zZ2E8AP4lcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7i4J9nfWBSsnteV8+SiG+RSE5HZj0QGokw4ytF3h50=;
 b=iKpE3Jj6sz452w+jPyUHWgzfU3JXGof8wRbFcpHBhUxpcCchfrhlbQ8v4AUZtuqzP1td68rEw7A+bo9dK3ZYC0yU6xiB6cYI2Ct8QYNMVILvek6K1PvkLlQ2t4kxtUDaxxkFX7IDxPKnYOZD7OQlWhv1vKJl6+IgmbNRqJjR8mJiL4Bu7QpWp8Ej0b0C3OY+DDpPWt2W9IIeuvr0J6dd6yFCrZRGvYfV02Xi4JUY7HJ4ExP1pFDwaYp3YzKPZTvhMJqYt87LNYoRN2Vk2PzZN3l/VFtzHzrIGNtZDmFlnxBn5SN+7TahjCQ9NClFz3I71n3gc4A2PBgCepdTTZNR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.27; Mon, 19 Feb 2024 13:05:44 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5067:c1f7:e269:88c7%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:05:44 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 3/4] drm/xe/guc: Move GuC power control init to "post-hwconfig"
Date: Mon, 19 Feb 2024 14:05:29 +0100
Message-ID: <20240219130530.1406044-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219130530.1406044-1-michal.winiarski@intel.com>
References: <20240219130530.1406044-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a34682-07e7-4d1a-2102-08dc314b7b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipgfV2gcWvMyEEJu3hF42nAYs0705D47cez1YhVONwVk4sLWhTds1CgCsuKGQHabhP87WC5naPRR67lis5m4ixKaCq5PkTgY4i/iQgpE8EiDDwtGbqldTnh2VAf8lYS7aAbM5UuC99Ve8OQFpVnskZ//uIvXh0NFuQu2Us4TnO2dVSWsOE+rU+UqyxYYDZtxbtFYyS591ANJceZSQ2RRKmNcQIpoyhND8Fbnri15j4gaYS9amZwC5FLVZIFLpOZdLtNFmv0lP8lM0adqlyH7iJA7T6wEpHE8Q6EyXaR7gTN4SU8L4hbNKtPfIM6SASWV/a+VW4vQJ/vm4FLlfRM+Q9Rsh/f7FKbCYi1XFoEsugvaCxN9uGKYs+rxiW3txMJ7c4CF39w9XptauEGFCyRBzU/guS0lE24DcFy2AMhEQK5DCsC4g5/5lsMvzft0J3IqzBUdMS4ka5E+phYZj+C1YOOSrtnHGgcWLeMXXuWFPCj/Edsfdb9AS+9t8W4bjnQ9/08pvCMugibmasOAPZguxJOLtRo4lJBajOsC8Ok7s+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXE3Q3VyY1lId2tTcllIZjlQV2NJZThFR1RjSzNjUU5VRnRuaXFReUloeEQ2?=
 =?utf-8?B?bXBDZ256cFhheGdqV0d1a0tPeWlMY3RFV2FJVm52RzBmL1IzYkxZVnZYVS9v?=
 =?utf-8?B?cEVXNW50MDRkNEZXaVl3UW1VcnJaUjF6NTVsWjBkeUhTcUw3ak1EQTZMMUdw?=
 =?utf-8?B?cE9sNitxZVI0cHlWQTBrRnpDYWVLMDlqMmFDbzJPZjFtZjBRR0lyN0E5M1o1?=
 =?utf-8?B?cU1PdG0xNU0wZmxRUWFSOWRNZUNXY2t3R05lVHBpS0t5U3I0SkVkcjE3ZTdu?=
 =?utf-8?B?WHpmUWIwTW1vQVk2dDBRMC9aMmVpTjRhcnhiNXhLVWRoWjRsU3NDYlFGMkNv?=
 =?utf-8?B?YTBvZDFhc05IclNseEluYUNwWTdmazZpb0M2d2E3RnN1c0hSZlR1Mzk3T29C?=
 =?utf-8?B?L3c5MUpPcHhMR2s0bEc1QUdkbW9sRVFwSitwenkrb2Z1VTljeVIyYlRUQllB?=
 =?utf-8?B?NjFCb3VOT2IyWEdkTDRCaURvTnQ4T1AvZ2w1UHg3SURhT3U2UTBOMEcvTXdw?=
 =?utf-8?B?czk0aVYyOWRSQVkrWUVRWm1vTWFCQnBGZzNQQkRzdk1UUWNxVFJyb24rMlBh?=
 =?utf-8?B?Q0x1eGNuYVpzTmJTOWtNblRmakFYUXp0Q0dtczNSS1ZPcHBSOWlIYXN6WnQ5?=
 =?utf-8?B?Qlk0WTdieGR2WHJYeDFIUHIrVGNJQ2FpaVJWMzNlVnliMWtvOEUrQVpWWEpL?=
 =?utf-8?B?MTV2U05vTkJsZHBUTUdDeThpczcwSGxiT0Z3cUNudm8vWGFCNVVVN1E5QW5t?=
 =?utf-8?B?NThRcGo5Mkd5bEgzY2NKbTBqOTlWT3ZCd2kxRmgraUlzVzJpcjg1aGRMd016?=
 =?utf-8?B?MnlRN3Y2ZSs2dzFHWnQvQkJOdFkvMWszWGVJdTNLQldWc0V4T1EzOTZ6U3lI?=
 =?utf-8?B?MCtxdFJoREZ1OExLOUpVeVN6c244VStKRHJiSXRSbmJJb0ZGRUhudUhUL0R2?=
 =?utf-8?B?RGlzai9LS2k0TFBlWFRnMXRYWlg1VDhtRmRwR2hlNmtXOWIxNUk0Tk5JQ1pG?=
 =?utf-8?B?UENUbzNKMC9iU1JwVVFuRjRtRzd0S2x3K09hLzQ3NjJNTWVvQThadlNmYjZ1?=
 =?utf-8?B?anloU0J1eUhTeTJrOG95WlZGdEY3dDhnYXRPZTA5QUw2UzkrRUlTU0JkSWQ1?=
 =?utf-8?B?S0NPTm56MmhBK2RTeGVhYjIvVVYyeWE0a08yb2JYcmZBUzdDWnUxZ3ZXckF1?=
 =?utf-8?B?VWNqRGpta0Q5SG1UbFA2U0RtSUhpWko1K3ZEU25HOXZWMXpITFBQTUlFMjNy?=
 =?utf-8?B?VWUrNVBKUnc2Yk5mMXBWYStKWktjaGl1MkQwei9ZWVdXKzlEYk1oQTQ4TEhl?=
 =?utf-8?B?T3loS2o3MzNQSEpZd0NCNmFQbGJJK0ZLZnBYRXF0SENPR0VERTdrREFzc282?=
 =?utf-8?B?VlgybTQyM0huaDBIVUt0dnpMZ1pkMjZQS1QydW8zZnVTVVN6YUl2MUtaWjg4?=
 =?utf-8?B?OE02S2dQVnZiTVJ5MkIrcUVadHIxUmhrMXdld2Fjem5yWnM1RlQ3dXVSbFdU?=
 =?utf-8?B?QlBJaHpXaHg1WkZjcW1PRXZQcDJHVnJ3bW0yOFdJRHllV1JGZEJDOTRmS2xw?=
 =?utf-8?B?dW1TMHdHaHNqM3RBbng3U3dlc0hWMm5kZzBadHh4VFVYOVJaM0dqMUM0d3RG?=
 =?utf-8?B?YUxUZHlxWnRlbEVwaTg0bjRzd1BueGJETGFvRmxFeTN1eFZzVzRhbzFia2xH?=
 =?utf-8?B?dWM4STEwbnBpWUZUeHhhK0piUStDNFlPd1U4ckN6bkRYOHNIUzZaN1UzZWtl?=
 =?utf-8?B?TEU5Tk9XcXVjYWFldHdnTFVDS0ttZHlBekorNmhidUNzQk45eVdxY3I0MVkw?=
 =?utf-8?B?aU1xQ3l2eWEvdXg5bzg2QnNOaUdlV2RoMHBib2xJVXdrc2c2RGdqd3g1Z1Q5?=
 =?utf-8?B?TDdTdVJyVEpuK0VvQ0w0WFNmUVRCdjByZHNtWFY2WkY5elJnakdFMGw0NmFT?=
 =?utf-8?B?M1dMVmczeHJGRmJKdGJ3Wlpsb3NDbkg2cDhMNGR2Skl4UnltclVGaVVubGI1?=
 =?utf-8?B?VTdRb2hyWFVHdEFkVU8rQzd1aHlXcG5uVlJ5Yzl1NXBkR3ZxMFFpNlppbEls?=
 =?utf-8?B?dGwwOXM5eHJVWm04ZDVsZlJzMjhaeXBZMGxCQ015TFNXVmk5VEJhUnBGRVY5?=
 =?utf-8?B?eWpYZzJtNWZpVWdwS096R21aY3NvRlJ1bVNoVENPZ2owK1RKSEx6ZDFuR25j?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a34682-07e7-4d1a-2102-08dc314b7b5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 13:05:44.3085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrIWr3LV4Q5htqhgtJtuaYyvLSWQL9NHfmdADaxg+0o9xLye8NlY4ingIY+V3ziMiEY7PkffBoUrVBtwQDT0V+6+zEP5X6d7m7IIC4h7vQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

SLPC is not used at "hwconfig" stage. Move the initialization of data
structures used for SLPC to a later point in probe.
Also - move the xe_guc_pc_init_early to happen just prior to initial
"hwconfig" load.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc.c    | 12 +++++++-----
 drivers/gpu/drm/xe/xe_guc_pc.c | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 -
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c79edfd5a34fb..fdfb70c7db9f8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -368,9 +368,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&gt->uc.guc.pc);
-
 	err = xe_uc_init_hwconfig(&gt->uc);
 	if (err)
 		goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8c10546e387df..68089556c1409 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -251,7 +251,6 @@ static void guc_fini(struct drm_device *drm, void *arg)
 	struct xe_guc *guc = arg;
 
 	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_fini(&guc->pc);
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
@@ -330,10 +329,6 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = xe_guc_pc_init(&guc->pc);
-	if (ret)
-		goto out;
-
 	ret = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, guc_fini, guc);
 	if (ret)
 		goto out;
@@ -367,6 +362,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
+	ret = xe_guc_pc_init(&guc->pc);
+	if (ret)
+		return ret;
+
 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
 }
 
@@ -574,6 +573,9 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d91702592520a..2839d685631bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -956,10 +956,12 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 /**
  * xe_guc_pc_fini - Finalize GuC's Power Conservation component
- * @pc: Xe_GuC_PC instance
+ * @drm: DRM device
+ * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-void xe_guc_pc_fini(struct xe_guc_pc *pc)
+static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 {
+	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
@@ -969,9 +971,10 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 		return;
 	}
 
+	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
-	mutex_destroy(&pc->freq_lock);
+	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
 }
 
 /**
@@ -985,11 +988,14 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	int err;
 
 	if (xe->info.skip_guc_pc)
 		return 0;
 
-	mutex_init(&pc->freq_lock);
+	err = drmm_mutex_init(&xe->drm, &pc->freq_lock);
+	if (err)
+		return err;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, size,
 					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
@@ -998,5 +1004,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 		return PTR_ERR(bo);
 
 	pc->bo = bo;
+
+	err = drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	if (err)
+		return err;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index cecad8e9300b4..d3680d89490ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,7 +9,6 @@
 #include "xe_guc_pc_types.h"
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
-void xe_guc_pc_fini(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
-- 
2.43.2

