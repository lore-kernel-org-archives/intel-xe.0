Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407C6C36019
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E07610E207;
	Tue, 17 Sep 2024 12:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqNZzL2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A023B10E46F
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574613; x=1758110613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nDOJbZj7X7z3Mv5qmd6vsYsb2ux2Yzyt5yb/xIf5VbY=;
 b=FqNZzL2GXIkhSSubx1jgHiuLzSeq88PkW8eBamPwJ9FZhIPqmB8+/Wp+
 7Q2MJscWDWWWBhRmHlFX2x3QJnKEyZEWFFuGU0iGGBWf/WRFpfi0PaFQk
 omRUlTr2059CYI+KDhJRWG6P1OpFHzdi1FCASxKv9smFAHF3TlbVzIhfs
 WuV/pZKkVT+crWsp/9VFLe7QBqdvlT5uYgvogwn8AJF2D6xu5kO36M8xt
 S/bYSd1aLNIkNKHON31eL8ijpEDltKP8Gk+pIVLo9TDPiF6x5J+PklY5t
 kNxnA1anWs7YoOts1BajrQ82j0KLju3iPK2saW74hM6mpEGXW0stwL32L Q==;
X-CSE-ConnectionGUID: LDP5jiCAT9SAbqEFqotGYQ==
X-CSE-MsgGUID: 2FTH3mTtS8miCXCqsyypbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210574"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:33 -0700
X-CSE-ConnectionGUID: 3oeSA0pHSuuu8lPjatQLWA==
X-CSE-MsgGUID: R1YhNs8YTMywB5N56BIRnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388438"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 07/23] drm/xe/xe_gt_idle: Update handling of
 xe_force_wake_get return
Date: Tue, 17 Sep 2024 17:51:10 +0530
Message-Id: <20240917122126.438448-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be checked. It internally
WARNS on domain ack failure.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 531924b6c0a1..3f0999ef2a36 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -106,7 +106,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
-	int i, j;
+	xe_wakeref_t fw_ref, i, j;
 
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
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
+	xe_wakeref_t fw_ref;
 
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
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -177,7 +180,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	int err, n;
+	xe_wakeref_t fw_ref, n;
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
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -303,13 +306,15 @@ static void gt_idle_fini(void *arg)
 {
 	struct kobject *kobj = arg;
 	struct xe_gt *gt = kobj_to_gt(kobj->parent);
+	xe_wakeref_t fw_ref;
 
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

