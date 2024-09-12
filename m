Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E11EEE245
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BC510EC22;
	Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZvK0PZb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C7110EC1C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167495; x=1757703495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FAG4zf83RfBmG5DJVg/4IClgOh1eCh9G62AqOauL4g=;
 b=gZvK0PZbkylRZGmfAvTKC6dumGUpynmmYgReAoThx7MXU2WNdhCDu34p
 XVLPllpvO7PvbfjIW/hBNErzRS5AzmQg8vx/P5MGwsxv3m+PBMoYT8/kM
 JKc/Y74yGStnFdXj4MRW1vVNucVi2WM0OwNygAcXYh0Y9YU582IFpjvs1
 I8eVbp5joF6m0MM8Jx8chtrYpLcm+NU4y6gpyck8UuxcK43xNoB3KhBwS
 5XSVazkG831VpDDsa8XPF5FuvO/bHaotxDgsMuMXoTBEDyYpN/WAtjJKb
 BNhFzxubq0oRDPuKgIpZxyjW4Qz4hHjQi5vvvgcRquMWjijSo7rSP40Ym Q==;
X-CSE-ConnectionGUID: smqG5pilQCuixTpcPHCqIw==
X-CSE-MsgGUID: NK03EAqgQ1qcNw0dX//p1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202942"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:14 -0700
X-CSE-ConnectionGUID: SS+DOoJnSACVmz+387bZcw==
X-CSE-MsgGUID: WQFi1z+vTvaQ8VBzYg2lHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910136"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 07/23] drm/xe/xe_gt_idle: Update handling of
 xe_force_wake_get return
Date: Fri, 13 Sep 2024 00:45:47 +0530
Message-Id: <20240912191603.194964-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 531924b6c0a1..9af81b07ab7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -106,7 +106,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
-	int i, j;
+	int fw_ref, i, j;
 
 	if (IS_SRIOV_VF(xe))
 		return;
@@ -132,7 +132,8 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(!fw_ref);
 	if (xe->info.skip_guc_pc) {
 		/*
 		 * GuC sets the hysteresis value when GuC PC is enabled
@@ -143,12 +144,13 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
+	int fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
@@ -156,9 +158,10 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	gtidle->powergate_enable = 0;
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(!fw_ref);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 }
 
 /**
@@ -177,7 +180,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	int err, n;
+	int fw_ref, n;
 	/*
 	 * Media Slices
 	 *
@@ -213,14 +216,14 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
 	/* Do not wake the GT to read powergating status */
 	if (state != GT_IDLE_C6) {
-		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (err)
-			return err;
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return -ETIMEDOUT;
 
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
 
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -303,13 +306,15 @@ static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	int fw_ref;
 
 	xe_gt_idle_disable_pg(gt);
 
 	if (gt_to_xe(gt)->info.skip_guc_pc) {
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		XE_WARN_ON(!fw_ref);
 		xe_gt_idle_disable_c6(gt);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
-- 
2.34.1

