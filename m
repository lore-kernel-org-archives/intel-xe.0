Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D38CCD195
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BED410E7A9;
	Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxlEiLeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866F410E7A0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ox8DEQftOFoS81i5N2xRrgtBFS7ZhMr6h5bmH35ZCJo=;
 b=HxlEiLeEM7wpqkdV0eDgY8rHdV138KYY3ymUWu9rv52uk0Kmj5Z0dVAU
 uB15UJ+wUlNPYD9FYmYhVQTgYAE9p/SZt9CyP6reGr1CGMEngcQeVvJ4O
 w65iCRM48Cyre5PsJqiB+TkO1NHYb8f+VHqVF013jpyhmU+Llc8kB+6ze
 mAhDEM+MgJseVhAa1hxTEzHtpIOAn1DoV/XcN/Fb4QIik5ZSPN+J/67Ro
 QNo9GE/+qXOjr4HRw5yc7fqUP/G9dLUt+eXxb5B2daQrO3dn7muspdM81
 RgfNQQw1KZ5KbhphQhLCUF7Y/7JtPc1EWC8uM6aILXE1f7w/ssA0JDJYd A==;
X-CSE-ConnectionGUID: 9rySE+f7Q36jaQor5ulYDw==
X-CSE-MsgGUID: Hq8dMOxVRlyZoTUABgp1cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304524"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: lsMr21zYTH2KY1SQ+s/EPw==
X-CSE-MsgGUID: zFxgGcaCSHCbJvmlAy7juw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083557"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 31/34] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Wed,  1 Oct 2025 22:53:59 -0700
Message-Id: <20251002055402.1865880-32-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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
index c27414d4e856..1fa17e25236f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -321,6 +321,8 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
+		u8 needs_shared_vf_gt_wq:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5f04d562604b..0c38cd30143c 100644
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
index ee0239b2f48c..2e3898c18746 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
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

