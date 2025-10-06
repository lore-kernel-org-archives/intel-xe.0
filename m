Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14A4CCD186
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57110E413;
	Mon,  6 Oct 2025 11:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jX0JK2PA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30ECA10E35D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749046; x=1791285046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z+uRkF2yPEGn6KANSMxhRk5bQGbrovzKCn62T7OCXUA=;
 b=jX0JK2PAbD0IC0/63I0V57sg17CTkqQ9Hmmiqp1o6CKkrln7O0OEEpff
 NJYoBtPJgHHOVBxl51YH4oZsIGXImrjux6F288sKhLWN9cOqOUiy98Oh/
 8nyi17Yy4r35N0+09apdTEyFjRzm4vVvwSgAoDD4OIoamStLS9R3iHvRh
 bNP5yrgCm8UwicXd4wihN+mSSlSBOB/3QOgw0B7kB3E8eqvi4IHDp9iFQ
 OPKZKfBMZl5RRBHXJVz2Z7V0EsoX2W2h9hGgnTGnOdGjI0ghQKK65Ac38
 C+pYijfHXWaFOVou+yPNqfrsGPJBkj1IhOWB8xOg5do+PYJHZPdVbOPxJ Q==;
X-CSE-ConnectionGUID: VLsWjpw+QU6DeEcssLYMPw==
X-CSE-MsgGUID: gsV6k5unSqimLFcdI4BsMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020404"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:46 -0700
X-CSE-ConnectionGUID: EwmEWtwzQlKwfqEVjBvelQ==
X-CSE-MsgGUID: bkiVPk1QQvuFdIXJxcrg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655248"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Mon,  6 Oct 2025 04:10:35 -0700
Message-Id: <20251006111038.2234860-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
 drivers/gpu/drm/xe/xe_gt.h           | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_tile.c         | 2 +-
 6 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c66523bf4bf0..02c04ad7296e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -334,6 +334,8 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
+		u8 needs_shared_vf_gt_wq:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cf484a2da35e..05465f358c96 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,7 +65,7 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
 {
 	struct drm_device *drm = &tile_to_xe(tile)->drm;
 	struct xe_gt *gt;
@@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 		return ERR_PTR(-ENOMEM);
 
 	gt->tile = tile;
-	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
+	if (use_primary_wq)
+		gt->ordered_wq = tile->primary_gt->ordered_wq;
+	else
+		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
 	if (IS_ERR(gt->ordered_wq))
 		return ERR_CAST(gt->ordered_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5df2ffe3ff83..9545c0c93ab6 100644
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
index 6edb5062c1da..e9bcff2de563 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
-	tile->primary_gt = xe_gt_alloc(tile);
+	tile->primary_gt = xe_gt_alloc(tile, false);
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
 
-- 
2.34.1

