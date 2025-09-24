Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84527CCA468
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4D10E6AE;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIA40JP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C788910E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676572; x=1790212572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=As/zDc5yPNvfXRq7eXls/tkOttmKRU+mK4wRpbg2sO0=;
 b=VIA40JP15DGE594jcGUuIgOd9D2Ehynz5r5w5e4XvJ3lUBVElqmY/9K8
 ic4RXmnmX4BM5KpDhEi4sQxG16zx78uJeIBGw+vuztGARP9d/XOb+r/ut
 ZCraHxyKv3Ykbo0cnCGMkvRaNDQvq5ssccyGPO0g2oxS4HowYmc07j/fV
 nYRKTB9nPUHige+9HNLmIPYDAnFCVbJMrcNF8vXXfvb0hppTEMWXoY8oP
 eCRdeKCqrvTW6wY1z1qULup6reoG94S+CWrIvrK6yzf4JimF2fESUDo8C
 cHvAmOrqHsYYxXjh97+nWfGf3BmWvRk0hTuKm/s7LXb/hPiv8sYGgn01s A==;
X-CSE-ConnectionGUID: rhHoDBhfStOZulTA2Pzc4w==
X-CSE-MsgGUID: zxv07aWcQU6EPK+PgPuzuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908294"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:12 -0700
X-CSE-ConnectionGUID: aWjnEmnZTmqcciv+8VnxYg==
X-CSE-MsgGUID: M/PhCTtgS1aUcFULI7vwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841813"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 31/34] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Tue, 23 Sep 2025 18:15:58 -0700
Message-Id: <20250924011601.888293-32-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

VF CCS restore is a primary GT operation on which the media GT depends.
Therefore, it doesn't make much sense to run these operations in
parallel. To address this, point the media GT's ordered work queue to
the primary GT's ordered work queue on platforms that require (PTL VFs)
CCS restore as part of VF post-migration recovery.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_gt.h           |  2 +-
 drivers/gpu/drm/xe/xe_pci.c          |  6 +++++-
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_tile.c         |  2 +-
 6 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a6c361db11d9..af92c8cd43b6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -318,6 +318,8 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
+		u8 needs_shared_vf_gt_wq:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1a4796cd885b..5ab283fb24ea 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -72,7 +72,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
 	destroy_workqueue(gt->ordered_wq);
 }
 
-struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
 {
 	struct xe_gt *gt;
 	int err;
@@ -82,12 +82,16 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 		return ERR_PTR(-ENOMEM);
 
 	gt->tile = tile;
-	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
-						 WQ_MEM_RECLAIM);
+	if (use_primary_wq) {
+		gt->ordered_wq = tile->primary_gt->ordered_wq;
+	} else {
+		gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
+							 WQ_MEM_RECLAIM);
 
-	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
-	if (err)
-		return ERR_PTR(err);
+		err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
+		if (err)
+			return ERR_PTR(err);
+	}
 
 	return gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..31090ee47591 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -27,7 +27,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
 }
 
-struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3f42b91efa28..25a1d96a68e7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.needs_shared_vf_gt_wq = true,
 };
 
 #undef PLATFORM
@@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.needs_scratch = desc->needs_scratch;
+	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
 
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
@@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
 		 * Allocate and setup media GT for platforms with standalone
 		 * media.
 		 */
-		tile->media_gt = xe_gt_alloc(tile);
+		tile->media_gt = xe_gt_alloc(tile,
+					     xe->info.needs_shared_vf_gt_wq &&
+					     IS_SRIOV_VF(xe));
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9b9766a3baa3..b11bf6abda5b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -48,6 +48,7 @@ struct xe_device_desc {
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
+	u8 needs_shared_vf_gt_wq:1;
 };
 
 struct xe_graphics_desc {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..a982732a8056 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -149,7 +149,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
-	tile->primary_gt = xe_gt_alloc(tile);
+	tile->primary_gt = xe_gt_alloc(tile, false);
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
 
-- 
2.34.1

