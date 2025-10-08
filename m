Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6A2CCD184
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CBB10E907;
	Wed,  8 Oct 2025 21:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/zCa7tQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF610E883
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959952; x=1791495952;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m8TjV0f6t5LuV0zzIa4416b4HM3pMFUwfMJhsoVlD+8=;
 b=f/zCa7tQbkApJH4zfg6mkBXKGRLrGLlilwxy+eocZeBNvB6iR/CRCAha
 8vVut58o0ZY69rSYO4F0hlrhQtJvOFpzT6hk0fwLfWb0oy2CSsLNTM9OZ
 2BwpTBQfBRv8HYS9g8bPtWfMucn+oo1KsysddS+O4Pq+hk64cVBrHnXAr
 xog99ls/Zt/4kwj8qoyTXN3ZZjDkeWJlmtoKc9AuQ7wZZB8JpXaIv3uXk
 GMaqYKvFezSdhN5UzOs1SkjJ6HaSAtBz2lLIUzAqeaAEgxCm8F8OxJHbT
 m1OC/oKOepx/kjxzgw1gXFaQmvItwhPyqHiV4LvUeYV/A8Ms3x0X+By0p g==;
X-CSE-ConnectionGUID: XxwsmU1WQf2hBiesAs1RSw==
X-CSE-MsgGUID: Nn+R08iOQB6d2g+2KmgykA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726877"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:43 -0700
X-CSE-ConnectionGUID: 55CEECFsT2WKjZCZMBWPBg==
X-CSE-MsgGUID: RZJSXYYvQlK+nKu9EP4o8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635216"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 31/34] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Wed,  8 Oct 2025 14:45:29 -0700
Message-Id: <20251008214532.3442967-32-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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
v9:
 - Fix typo (Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index 6951fedd4350..d8e94fb8b9bd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -67,7 +67,11 @@
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
-	struct drm_device *drm = &tile_to_xe(tile)->drm;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct drm_device *drm = &xe->drm;
+	bool shared_wq = xe->info.needs_shared_vf_gt_wq && tile->primary_gt &&
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
+	if (shared_wq && tile->primary_gt->ordered_wq)
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

