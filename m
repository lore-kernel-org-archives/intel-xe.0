Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD3CE7AB9
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 06:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279510E7FC;
	Fri,  6 Sep 2024 06:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtcWLsgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5167710E7FC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725605850; x=1757141850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0+p02fiqSTYGCvkjqZt53H8VGDtzjWoUK0RcLr1Pz0k=;
 b=YtcWLsgo0xEk3aFc7rXfU7YtNgDLaFG3heBnh6LnSzreO8aZukfMKaTa
 ppU0INNH9kH25q/gaAoglPEwzewelSMYHiEjw4bsLYROvKsl3QOYD3PPt
 O4w85IFvxLuT00iscMpD+rpAk16Ii5Pnm/gK8WCk3oru/OhEucJD/he0D
 ih//fSAGyeUtF5RI87FIW7ldZSfEvlkDPlcbJAEF0GyvGP4maGR617Qo8
 zGMzR3q5hGu3qmQZ4sf1Me46SAxfhFejYpr7Jh3uOoyseYnQIbxZqW+qG
 K+SMArqVNvWTXPXGy8tb4nE9V3D9hpcKKQ+3CA1+oBoKd8kZ4hhcMmgmE g==;
X-CSE-ConnectionGUID: Tmz7J2QBSReJAJSGOEzk6Q==
X-CSE-MsgGUID: brVN05rKQ/i2X2RbqV494Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35740154"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="35740154"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:57:30 -0700
X-CSE-ConnectionGUID: pbkC5IfCTlCm72VtD83xuw==
X-CSE-MsgGUID: QoFOkcgtSPqi5HwG9gRugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="65684838"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 23:57:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, badal.nilawar@intel.com
Subject: [PATCH v5 1/2] drm/xe/xe_gt_idle: modify powergate enable condition
Date: Fri,  6 Sep 2024 12:41:25 +0530
Message-Id: <20240906071126.28078-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240906071126.28078-1-riana.tauro@intel.com>
References: <20240906071126.28078-1-riana.tauro@intel.com>
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

Modify powergate enable condition based on the type of GT or presence of
media engines. Also have a copy of the value written to powergate enable
register.

v2: add condition to enable render or media powergating (Badal)

v3: fix commit message (Shekhar)
    fix kernel-doc

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c       | 26 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..3924f9f3d0a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -98,7 +98,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
 void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 pg_enable;
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+	u32 vcs_mask, vecs_mask;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -110,12 +111,19 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
-	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
+	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
+
+	if (vcs_mask || vecs_mask)
+		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
+
+	if (!xe_gt_is_media_type(gt))
+		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if ((gt->info.engine_mask & BIT(i)))
-			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
-				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
+			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
+						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
@@ -128,20 +136,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
-	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
+	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
+	struct xe_gt_idle *gtidle = &gt->gtidle;
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
-
-	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
+	gtidle->powergate_enable = 0;
 
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
index f99b447534f3..b8b297a3f884 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
@@ -23,6 +23,8 @@ enum xe_gt_idle_state {
 struct xe_gt_idle {
 	/** @name: name */
 	char name[16];
+	/** @powergate_enable: copy of powergate enable bits */
+	u32 powergate_enable;
 	/** @residency_multiplier: residency multiplier in ns */
 	u32 residency_multiplier;
 	/** @cur_residency: raw driver copy of idle residency */
-- 
2.40.0

