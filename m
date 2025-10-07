Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D935CCD186
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357D10E67A;
	Tue,  7 Oct 2025 11:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bt/JrYgG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA7210E657
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836412; x=1791372412;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7cIHJDpXUPsjxIQpeWsbSDDpWx3xtduAeFTixbtDVYY=;
 b=bt/JrYgGSI5WNg6lEabkW3bV8a4NFMPFNTpeRUDpLf6hx/1AlxsyEV3L
 bs1qG3Dk8cphBa8zg+ejjREZAYbk8nvs3b0wGf8NRuEggwl+gOhSd9DtX
 hv0Jc2oMTvYNuoELJ49QhZ8FpaGU/SdZYaa2348C1trwlGB1jApe4cYok
 1hG6hkpQkmnYb6pbty1bvt8Rxx7weGjCVYKCjIcIW0fpJAzXXx5z2S9Mw
 Bgi0HTYGCCaZIxIRQkzd5qsTH81XE/l03t18QLJniWCQtzg59XKu1eYaA
 dgwMt3/CDkZ1KS9yO9xJ9UM1ALfIV98LbpaiLOl1uWgK/l+tbHgsuXtx6 A==;
X-CSE-ConnectionGUID: pLmJoiH0RoiTySfLRlVaPg==
X-CSE-MsgGUID: VfxDjuoXRcyCGtsG1dW+dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660702"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:52 -0700
X-CSE-ConnectionGUID: gHUGQmA7SuiusmjTO8AaIQ==
X-CSE-MsgGUID: 86ftN1FRSgGENHOYvl9v3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924022"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 29/32] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Tue,  7 Oct 2025 04:26:38 -0700
Message-Id: <20251007112641.2669655-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

v7:
 - Remove bool from xe_gt_alloc (Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

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
index cf484a2da35e..f2a4dc58e26c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -67,7 +67,11 @@
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
-	struct drm_device *drm = &tile_to_xe(tile)->drm;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct drm_device *drm = &xe->drm;
+	bool sharded_wq = xe->info.needs_shared_vf_gt_wq && tile->primary_gt &&
+		IS_SRIOV_VF(xe);
+	struct workqueue_struct *ordered_wq;
 	struct xe_gt *gt;
 
 	gt = drmm_kzalloc(drm, sizeof(*gt), GFP_KERNEL);
@@ -75,9 +79,15 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 		return ERR_PTR(-ENOMEM);
 
 	gt->tile = tile;
-	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
-	if (IS_ERR(gt->ordered_wq))
-		return ERR_CAST(gt->ordered_wq);
+	if (sharded_wq && tile->primary_gt->ordered_wq)
+		ordered_wq = tile->primary_gt->ordered_wq;
+	else
+		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq",
+							  WQ_MEM_RECLAIM);
+	if (IS_ERR(ordered_wq))
+		return ERR_CAST(ordered_wq);
+
+	gt->ordered_wq = ordered_wq;
 
 	return gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3f42b91efa28..f8243622429d 100644
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
-- 
2.34.1

