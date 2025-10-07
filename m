Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B3ECCD18C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592C810E687;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw1rxaTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B2E10E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842316; x=1791378316;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7cIHJDpXUPsjxIQpeWsbSDDpWx3xtduAeFTixbtDVYY=;
 b=Cw1rxaTdKWQoX+VxWQMUm0iAMWMsmshli8WaYif5kXYlsqhVxJz9/9uj
 +lrN5w6OAIGwG1vsBG74KBNO+358yW7lP3m/n6onE4mOtGoB0Q9e2yAuP
 0fPDEWzhqeRMUN1eSgR2KjzPOAU1JS+rV+vMB18wn9V/ryX6gujcKyvKj
 upWcgbI4aGwrxX/LNsvx8tn6HSDdatG1tMrBXmJuO8zkniI/ThjURbssK
 X1j4oRpwPk4V5KusTHLUUEun/styaqtLfScrFlhKdzJwCdcdGEYfOZxhF
 DrvUVA1gEF/c0f+4AqBsroMIHzNsw4li7S8G2711HrRZwXgmT4O9tct0m g==;
X-CSE-ConnectionGUID: /1jZHge/Sl2O3kwNZsMpAQ==
X-CSE-MsgGUID: LUOeZOucSPOQy3ZKf6ijhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639851"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639851"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:16 -0700
X-CSE-ConnectionGUID: UIBrdasGQIaqVUi5nR/QNw==
X-CSE-MsgGUID: AXaMQJg+ThaJ2AmsmotCoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576965"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 30/33] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Date: Tue,  7 Oct 2025 06:05:02 -0700
Message-Id: <20251007130505.2694829-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

