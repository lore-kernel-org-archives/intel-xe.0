Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB937CCD18C
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4CA10E403;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVdgcaTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1810E35E
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747494; x=1791283494;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vItpjUhM3wH61z4kZnkmKuonGcsLWYyWXCLytT4n/4c=;
 b=fVdgcaTj/DNiuj0scZ1nCEwDJHsFzXpOncHRzQLu4HEMu1xIj45/QB7F
 lKcGURUvZJ+RldkOr69PixjkqhK1hOcBfraJN5E7BCM6UWomS0+/l335u
 I0kGUqhSPBQxTC5+jOOYW7tR6n0ddJZjpbGLdAGr3i0NWK+9BCsu9w6GO
 Lo3N76gqeovM3A2gyAij/1deEXg9BSXQsEBd/Xh6bdwzIZi/YuV8I8m8I
 poqA2Goe0/6X049y5yVZjJ1+5L9pzXCATwk4NgBPzLHzjytgryUQyTgKi
 KhFX6PIBu2Bnpk+n4uwESOX8TN+ziz3pbcfa9I9yCsuL3KYgN7Z/pMEfx A==;
X-CSE-ConnectionGUID: 9GiG+AJmRHWh7pkhoNvuqg==
X-CSE-MsgGUID: cnklR7jUTeyoqBwzcsg+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546341"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:54 -0700
X-CSE-ConnectionGUID: qNJl9HEVSh2PpJmXT4mfIA==
X-CSE-MsgGUID: 1ejEFv4WQ/OwzZfCtdaaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589342"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Mon,  6 Oct 2025 03:44:42 -0700
Message-Id: <20251006104445.2210624-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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
index 8fdc4e81065c..bed53cce0abe 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -326,6 +326,8 @@ struct xe_device {
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

