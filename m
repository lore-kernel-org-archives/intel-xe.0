Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AD7C48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEC112449;
	Mon,  4 Mar 2024 18:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFweKa9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5D112449
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576525; x=1741112525;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Z+p1bb+8Qapq/t1NFTCykTvBLaLKqc+Te8JTwcsNIYs=;
 b=IFweKa9VIyRNFie0+2xQ+c8/CwR4MkYKsXRqLeCFXxwMPAkBhQHmT7Q2
 ocX1Gc6HdJ26mEQS3l3/WWnIrEdmJwhDYPUhG2/5ZUrAaACX0iwSMxsWm
 2EWLxWfKezDMK2geiHpVvC4RaW/lB26qCatdy6N8TB2h/CoRVgBMylIJ4
 EGCSJBPGBzxzZTfu6CRepkWpj7VJkbrhOa3auo11Ap+WWlWFdYNgKxtf1
 tTOCvSkIAAhv8mhXb/jvdfugn6SQPegsXZti9iieppB65X/NLYZnTwKsy
 O6T1rnLNQ0QEKSOozf+ds/mZH8k1WLwUT3+9fRDwuqWgaCtkIsnUzq8l+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3947113"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3947113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9667312"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XikZ9kT7mYhRhCQLylcL5ToqieSsQrZRpN/vT0ZkaaTmHhh5fasu+yuwghzSdcTF69TZk5v3nZn/lZlldLTEaFEwWpDabZE0aXATvI1bspCIiBjhKidWh2sv8+fe0u9whvg5AWTJ7ZbgTXGNukLsE+fMkzgEPenUu/UNh1eY+sUCkYpwQSxM7WBcKGjaEqleCa4of0cgrXi9Mp+SQCHiTZkMz4ffx/ZgvS+7PfhtLChs0VNFztNQX0mn2mJy/S1pcHMTpK3Os4RsYLDw8oDxqgHmc8HzAPktuP2T9E77m5Z534t/8M3ODrJVgxbvfcgIP5y/LNHUdzTN5ZKeu2qiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x09ZS3yZ5ylxU0tRc2UvN9aCapH5phE0LgGhrezjq/A=;
 b=fnYGBerrkVzJ/0wQFv0eEgICRb19HeBrGAW+cvdlrLekEuaCi5mGU4qMjk698yCDCnLS0Aa/7NDc8v+PdkKrd5TVtNQmxWHRLnf6WkRNwq+tlfeUx/bULgcRjgi1kgBJCk98x3Rw0zOQeP6sDN8fz8GKKA8aCa5DBj021hr4YguLFwJHpAYYy/DeTHCaMGpdga3PSV66KuWGg2rXlypNQphqoUrPCPx1PunJN9I8wIZQPf7tBEfhuofQ5dqhdzkzM/E3+5jNnJVNW2xYyUhJPZiN+6Lx+xPmYo3y7XzO+aq0zai4HHGvzn7lRZRCs+dFry2hPvkL8UnQtiKBBVQkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/9] drm/xe: Remove useless mem_access during probe
Date: Mon, 4 Mar 2024 13:21:46 -0500
Message-ID: <20240304182154.42611-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7257695a-ea2c-4f0e-5001-08dc3c77fb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIPM6iPbcApul+6vDoBe8VID/aQGw5yK6CoTUmgmVGwUEgN3JrrfXZCE6CNcszO02fyOKf+F1taGWEh/uem1Kxt6ESJYClnyXujGIHwX0vwCie2qPNzNGiAYMEGG5xYxPX82/4w4t/EIGWLWx03Q9Q5JEc9yseb1ixd6JKhyeOe2qUbNt9KMTe+/wJGNj122+sOrPUbpBWn2Hl1ypz6bcqjCYu4crH+r/1goRuXl/pwJdbULQsEXletVl21bMK15Un1GaWx4mIq7HnifMVs1gP5xWy0NVanrOyAOLEvmGvu2YjMT34ZDWKriedIJed/9+TcxQzNnkPdmxnmcgdK8VvqCIEWI5KYH0vNH1kWvc6vEczijNwFm7d+96B1+ef1c+s18rs3zM1GHiu2qk9zN0l4Q9LgXSL7KA5rTfoYLJVvFmYUn/UlOMSIqbo6YQDMuAK3YbxxolU7YNAwVd0ety0DCf0F0MDFqWUp+Os5T5DC7wE8Wk9Am9TCDLBKU5ekWyYGxb7H4iO3W++oXFkf5t1G9rUxzQDW+Q/V/LaBz6dyUuRl0PDYI65KW+U/N6E+y/OB5xk0FhpsymCieKNzHuotGhF8LRDnhGMlw3dI8lRZ52au7OLWAFGvSIYKm2Hefs0faw7b/mBIFt2vpBG7W706nVkRrS+P9Jfyr4EcKgpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TY7L9lwfxFq2ubLV2cS1nEATXEvhZVYQDgnrITZQ8uzwKVU9FOcWoqJa5Dcf?=
 =?us-ascii?Q?v7ntadwRFii9gEGZvkZ5eRXxwUfvk1OAqNSVW8oY94NNHJ9OKbkqmDXwbEiv?=
 =?us-ascii?Q?gjj1d90vPLdNwg8nCbAf5cy/KaesqQro9CuPhZl/dizvqig17guqWmJTUNXg?=
 =?us-ascii?Q?/m2qZfYXqoZ1I4/SxjAZz8MYvgsyQP3r0n9uIPpj5/8rHBIn1fxDK4JkiFou?=
 =?us-ascii?Q?L1Bs7kv2N5PzOdiDNqNwnLmnLBYQRnzHjObEqJVXJH1QJJnN4eJ85PQNMQ6y?=
 =?us-ascii?Q?YMwz1jyFuibE/KJEj3K7TJBeXCyIqPoQ46njgF3qPJKms+nUcS5taaGdC2nj?=
 =?us-ascii?Q?JCXpEmi/DPoc073X2YZMjMAgKMQOa2BJJ8Pk/chhDs5tSivIgRGcSLt5qj1R?=
 =?us-ascii?Q?XjO2ExCUk1kG5fvLV8cV3zDOnyMvw13BypRMgkyte3kxTgOr6Ev7t0vuQeku?=
 =?us-ascii?Q?+MaqCA9OY/HmrvvcQO14d6UUKW4DIT9JxAb+qJFSJc4kUdJygRl6foUsAREP?=
 =?us-ascii?Q?/AaxKMJ7eRCW9uPwIohrvWJrltNQA3lHFxCQT+r0La1UR3ZjE1ZK3N8oNXE/?=
 =?us-ascii?Q?31zAQV7BuEmOQH7pQzJOw8YsSd0LMcIW7goi9fv7WxRyf8L3QhNTV3FFrG8U?=
 =?us-ascii?Q?RylNrq5QmhM9UFtQTZGG7fx9G5RXGTwPxPqwlJJ6m3YRLUs04/Fq17BldJbp?=
 =?us-ascii?Q?A5lUGlfNWJdkEX9gdpobMcFbRnNRrA4rOvq/Ix1KsgxUmFQFqO2xQlWKIwdX?=
 =?us-ascii?Q?exIGLL7Dx3UAt7Vq3iemFNIEOH+WYstfHqPKVvnn0WT0NZbCNZM85rN00I4N?=
 =?us-ascii?Q?z1IUUnt6t7zX+aWVshpVCmwTtXNqlD6UwdbDsWJSs7EV5rpveL6N1WdG6J69?=
 =?us-ascii?Q?RjuUbOTpr2/rzkEFaHsOZHg2Rnn59y6kK3quLj2NDr7f3/jsR73NW4+Zl/6A?=
 =?us-ascii?Q?2JPeonP60ElkYTAQHTyEURHzpr518uVX0wy04MiQoVk1utKqlJnjC8AySOxQ?=
 =?us-ascii?Q?CUJQ5enGWrIdrw5aeY1NkNQf9vppMdrJVWn0ua4q6P+TSrrfHmuqJcBK7Efy?=
 =?us-ascii?Q?v330ePA3d1CNpsQzuCMx5mZhjITHaQ5H2tzicISphviULs8BdmgXTQNnjfuS?=
 =?us-ascii?Q?atbce/z0vR0PMtH0S3FgU0d7ao1OIlySRF/qdbjSVE4fIz0Ox5/k6ijVNdoF?=
 =?us-ascii?Q?grRDjP1ayNurxnfkJci6isIy1yVpzwMjSLVCWdHwpVeBkn4kb/fFz2ZVSZR0?=
 =?us-ascii?Q?4bq2QxgP4FsBwJvfk7NbuXPuaZBvqdY0KK+Q+4G9wuN5w5N0G1z3xZggncFM?=
 =?us-ascii?Q?ZBLOGnvdzzDRHnI7t4BkTydg05ZFsCtFMKZKBPRWyd2dq8h0/F7OUs3YqzHn?=
 =?us-ascii?Q?fhKeRAw5EIfbxSBgwjBGxSainR+ITcZf/T0nC6qBIEma1YQUDGwKW/3QP9QE?=
 =?us-ascii?Q?GbLLfPPMiFiXXSyXeLng/cbxI7+sLqU+MZIuBi8Y2Rx/zPlNhBxpNJmMTGow?=
 =?us-ascii?Q?0A19vbGFUIZ+sEpy2N2lwTU5F2HVpnhRtsOueh9KKPzPvSibvWJjZOn/qyhh?=
 =?us-ascii?Q?5rYSdGqspfxVKwstIPGq+hQO8LOxO/6xcBfJft5v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7257695a-ea2c-4f0e-5001-08dc3c77fb7a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:21:59.9787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y/az4zt0kDw/Cy7tyBCBmcu+eST876Jo2diN8Sn5vlnECJqPrdUJXjOCNVs+Fllu2XwjVoKdYQo/O2wQvgMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
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

xe_pm_init is the very last thing during the xe_pci_probe(),
hence these protections are useless from the point of view
of ensuring that the device is awake.

Let's remove it so we continue towards the goal of killing
xe_device_mem_access.

v2: Adding more cases

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c |  2 --
 drivers/gpu/drm/xe/xe_gt.c   |  9 ---------
 drivers/gpu/drm/xe/xe_tile.c | 10 +++-------
 drivers/gpu/drm/xe/xe_uc.c   | 11 -----------
 4 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 717d0e76277a..355e4bb987cb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -206,14 +206,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
index 85408e7a932b..063b710a8c7b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -347,7 +347,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -389,7 +388,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -399,7 +397,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -408,7 +405,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -474,7 +470,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -483,7 +478,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -496,7 +490,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
@@ -519,8 +512,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-
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
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 7033f8c1b431..4feb35c95a1c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,11 +32,8 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
-	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
-	xe_device_mem_access_get(xe);
-
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -65,16 +62,8 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
-	if (ret)
-		goto err;
-
-	xe_device_mem_access_put(xe);
-
-	return 0;
 
 err:
-	xe_device_mem_access_put(xe);
-
 	return ret;
 }
 
-- 
2.43.2

