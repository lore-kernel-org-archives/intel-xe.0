Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E87C47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C2E10FE61;
	Fri, 26 Jan 2024 20:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3FE10FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301139; x=1737837139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UCDy0MQvqhfgBRbXKGEQeH5T8dh42ftFiH/YwuWz+jc=;
 b=PJ0hGELRm8XCuTn33qmF0u6Jb7pRJk/dEkFep5eRiXnqgIJrQkErAk6R
 iSuuI7CfuTiKwEE4lzsHeXDqQHPnkbITYR42h0CDbf3K4hqNtNh/eJcNi
 STUavRBIg9l9o9A0MKwc8ycLtr06ofofPK7NsHMIMjPgVk+BZneNzV0bF
 6ia5zBfH2rYXiB3oHqwVPpEP0eJNwbMR/OsetKZKPBEh9crozVuJoCeKi
 /lsCPvJoxkBR/0C1gHPwcjTGerMsCiGWR09w6Xm7QP0OT5J2Gw30MZei/
 OcmEe3GRo9k7RWf43Pl/QOz6O51gImremHNLE66JmKaqe+TnBtxKeNMFG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948745"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948745"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482325"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482325"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:16 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:16 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCqlkvmvgDJZq2hpNSzDN2ooMYKPO1FJMWEZen/DhEhsKlNQd6gWxv8KRiUdBJxcxUuKqbyj5CrF6Z7p/JUqcjc7EoToX/uyKnVCGRbHRC4pf7wUXO/PrUZCBUiaASq/LRMzbY+E9KHonuD8KHQJz9loHQDLa/wx19/8jqsKU6WTrxJGEe2wfxhRA519qYZ8FDcQHd/m676GOg1I4GIca9xBxsA3Z1hd1Ptb3nFiR4tgZxyTA4E7n2xJI0ooz7oK0Hmg/B4Uj9OZQMEIDYKoT7/N8VSKwnj4Ed7oOztXGpryUxrRNWQiJNk9+4dZ7Y1mQpqHsRVH4/40dgPthhrxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCo1EUjFEoe6c78F7eCrFzDmg7xqXL8gvj2g+6Rtlqs=;
 b=aMWv+Kn6jdQUM5MaQCvAZFFoy2ArG20Aqo/q7IqkPtO16vzJlUtxtPRcXcnx4VvtV6PGRGN/WvOd+KB92vlI09YznoriHMq0u+9omrVDRJ/DsWoq34uMtSYWZuJzSZw5fAqEGJlxhx0Ladk7kKhJfmKlQf3IHkbBGh3hx6+z8rX/P8WZIHaMrNkhURNmxLVT6baGjVFHngc+HyuwkyAkI91BGAnaMlDbHmQrt7H3dmmU9349YwP5vxtwP/oa3TmjrM3TZ+oZAquZwdIwI+3Zjoy2eYQYetLLWA6inkMGZ3peQ7UBhG3qzV0Rx6A67vPJPZ9jSVriUuyfCrbkQSOCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 27/34] drm/xe: Remove useless mem_access during probe
Date: Fri, 26 Jan 2024 15:30:36 -0500
Message-ID: <20240126203044.1104705-28-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 369049e4-1d99-4dd4-68ae-08dc1eade0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D30gO+w3Sle8w4AiQZAHveApHf19XjMRUgLkBOd21NCcIYTZu14gwBuqR8UTgn9kOSsvDU2+JKd2ZDwO/LFT29Olzvw0swVsVsFCHSRAKNMCjd4O7hGl9mb0vAajqW7GX/NheuRd6Sg4r613FPgna5ol1zukm+V4NYBwgFJJRytHFI8u9m+3vzcCWnYlo+RCn78U89IKwSQqWgTJVISd0rFBSzoaT8Sk5LZ8/HJ7cVEmOT6F6JRju6JabLJi7mVOvamoMhmkNtt2l62mWvlYz02DFZCKNrN9PldZYugMHV9WHHiZSsgcmLJo+ah1M4S1MXJVjX43o/VRbSr+rmHWCnNO95U0z5P/2rwaGHotbyd7snxBKiUsaOQ3i1c0pJxkhh3+qkbNmy1f6tlaVpKC0fkB3BsLeIXRXVtWdcOa+3juk60hWk3AsveQZjE0IYllRWeZ9S9AYtR4FzSjLYRKOtpcnAiyuUJw1sTgwAB4HXd7HLgRCA8T4n9G0TIvxBm3haYcGNYZWAT/K65mD899KY2qltR7LZO74xGzRtPCkmnQKBvUxm2PcnLCaNHPjZcV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CbRWskHF2IdTMV+pofh/RU9XXhGn+pp8ABiO+MM5kDli4XuLsGp8Mhn0GWye?=
 =?us-ascii?Q?NMCo4YIwPmRL2PTKLPzIZV849Tj01IzhSnY7zjRNSLUYqsfJuRvx0lYkTkkb?=
 =?us-ascii?Q?EvkirIrwpyKPtIJC/XFrZooYFFc3tTRoXivKKV8lTp7xDYh5FZG35wBuKCP8?=
 =?us-ascii?Q?nggqh8PfK1A1yyNkkuwu0mYvHowjbCMrtdE2obher3ovln6wU+KQFEsoenps?=
 =?us-ascii?Q?XVJ4665fWAZTafnwFHKPOLDC4eGaqalVzGibAdZ52Bm+YllOIbgApEF2uVss?=
 =?us-ascii?Q?wohH2Jcx/odsv4QFpBD0QXZ0hfEOVS8aQAoliSUo1Fcy2JRLTwG2UtGGa+92?=
 =?us-ascii?Q?dDXbtuUs5dNBPLZu+4r8KZYUcClkTOXW4C2n+qyplqSSsRBioDMrS/dXLxCa?=
 =?us-ascii?Q?/ykNkteB22qkQd+l/CS5M4rExmme3kB4CTPDRBAKSuL4M5sEAUGIadluCVY2?=
 =?us-ascii?Q?taz40K0fHz/J3YPWa6UwU1HbjHoIIjGLip0Xa/aKkO3T7JQtVKKTNIHldJDB?=
 =?us-ascii?Q?vm4DFgrNnlB9Oe+9QD3AuyPwyULRa03Bqhkjlq9rDec0ypy0BVMjhKHC7Oge?=
 =?us-ascii?Q?YdWBRpi6KehQ0E/Gle0Ybo4M18g+G3SI6gidGPGd9ko5PLj5hMDdJ1umRPEq?=
 =?us-ascii?Q?tblUNofWQmovX4M+9eIADjfpmaVo3y2nm5ssMvE9ICMUccudNIwxiCOCvvUr?=
 =?us-ascii?Q?JBRAaI8u4EoChI++ucUMDn2QJqjn425mfCbiIUFMFrg0DdPjBnnRCKhrLHWy?=
 =?us-ascii?Q?Eh3WDeMkgB5QAwa1ZcbN8Ni7kvui5Cdir9KGi35gzggZGkqS5Pw3NYyOBw35?=
 =?us-ascii?Q?YuQMewBd/CTHju4fb8UuEHiC1TT3ScH0n9lHFI2429RIzrTsd19F9mybF+bz?=
 =?us-ascii?Q?DuEMCIlY5PH93ZZzFevDDDvQ0WfTIvs1+MhhuaUtYemCJvZhlByYgwf6VYz8?=
 =?us-ascii?Q?Wyny2IeR/BJwv1NYu9sHuuzJCX1ZwvLqMmPWC4l17YCefkz9zJwDNFYkAMsS?=
 =?us-ascii?Q?7r6NMy/h4MFOtkEBFCOHHdVUnNEhjhaegwGfqIKkAmWgJcDbmilj6FnPLQ3M?=
 =?us-ascii?Q?h4GP+drk6TEtCGz0PB428mdsWFSUEw3TT7IxVFaJPsjmh57JcW0wTw0vHEy9?=
 =?us-ascii?Q?/IIC4N7Wpkl3pnvTTOASFB7RnQrm7UeT6E9hD0uRVnQtgSy9Zj7jWWo3Ebcq?=
 =?us-ascii?Q?GpLIyZxhgEMoBvnzMOfs/Qn+HS749oE813PoR6d/Mz7Q9uj4CGMcEkicC131?=
 =?us-ascii?Q?BPWyK2yjA1li8AFDeZP8x1Qfys8ocs4nraZ3zlAnDPoEshGjzEIfwZXLeMsH?=
 =?us-ascii?Q?YZs/z2y+Y08CNUjZ0zv6IJ3zulEX8/rCXOwbJB0uesZobnRXQJVWFlRv9PY3?=
 =?us-ascii?Q?Ekwhgp5Xbdep9OU8iUwv9kCHGY+DyFEUSxksZepCcKZDU4i//ObmlmYTfw/a?=
 =?us-ascii?Q?JS+se/udCVGXc8u20PxYRks9mprnXc/uKm7pMywHF0L9Vk5MwbPtC2fJcbZc?=
 =?us-ascii?Q?nWCX749xjIYq/qsmU5adw+zkmpqagFZu3bhMBf12M5VlYTn+CtyZJT8cF20p?=
 =?us-ascii?Q?7t7NZru0HayWCK57K1qXSdjJyWqWENBO7JTEflajhR+6wWCeQk+Ne8VjVJeW?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 369049e4-1d99-4dd4-68ae-08dc1eade0ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:13.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51R55FDrpeXAwDakGuDfdvYbvZLGWn195CV68SAmcONwHgcZGUHbA383CGYLk65chfxm4pgT40f8T0JvhYmtfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_pm_init is the very last thing during the xe_pci_probe(),
hence these protections are useless from the point of view
of ensuring that the device is awake.

Let's remove it so we continue towards the goal of killing
xe_device_mem_access.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c |  2 --
 drivers/gpu/drm/xe/xe_gt.c   |  6 ------
 drivers/gpu/drm/xe/xe_tile.c | 10 +++-------
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 6fdf830678b3..7faf02523b03 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -201,14 +201,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 int xe_ggtt_init(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 675a2927a19e..c6c4292c21f5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -349,7 +349,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -407,7 +406,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -417,7 +415,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -426,7 +423,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -489,7 +485,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -498,7 +493,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 044c20881de7..74ecb5f39438 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -160,23 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
-	xe_device_mem_access_get(tile_to_xe(tile));
-
 	err = tile_ttm_mgr_init(tile);
 	if (err)
-		goto err_mem_access;
+		return err;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
 	if (IS_ERR(tile->mem.kernel_bb_pool))
-		err = PTR_ERR(tile->mem.kernel_bb_pool);
+		return PTR_ERR(tile->mem.kernel_bb_pool);
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
 
-err_mem_access:
-	xe_device_mem_access_put(tile_to_xe(tile));
-	return err;
+	return 0;
 }
 
 void xe_tile_migrate_wait(struct xe_tile *tile)
-- 
2.43.0

