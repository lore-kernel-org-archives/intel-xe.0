Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F3ECEACDF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F910EB37;
	Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOjS0URE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9FC10EB2A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156629; x=1794692629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mQ6yvu+J03sm2cerdsxiGoIjRdLeMwtwxBog9jHFSA=;
 b=hOjS0UREWf5VV7OYN14YeAEws0+ccQ8KyoJ7uAmU08g0ggra05by+lh6
 0BWSkcSMD7Ex48+gLcun8vqiqDmzE9xTUX66+dwiy0Y9I3sRlkx4PBP+0
 oxYITJtGyTpj8fA5CvAQl8ztRUSzE2Tyos4ZpIEDsZGyxBmcJMIBfaG0u
 g5BJdZ6aaYmu797F9jMzQ7/1pJHtmU7yOk2CvOVde0HZyirvJPAa1vIS0
 qqAZet8CgUTP8y3LRcO3iHCAhx1WzxdIds5iWKzzg3GhpRddTEkglIjv7
 l1akzOhshuC7Z2sp3l2P+I9P1PefEtj3KUgrNieYhfNJNPPw9ioQ8tGmm w==;
X-CSE-ConnectionGUID: 0CxEpFgRQaW5X98fPqloiA==
X-CSE-MsgGUID: NSa3oRbdSwWR1RkzcerL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648306"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648306"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: UDRxR7diTaqzN7tzV4D9Ow==
X-CSE-MsgGUID: 4NEcD0B7SKC8iUu4XW9Jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308285"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 04/27] drm/xe/gt_idle: Use scope-based cleanup
Date: Fri, 14 Nov 2025 13:43:40 -0800
Message-ID: <20251114214335.2388972-33-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Use scope-based cleanup for runtime PM and forcewake in the GT idle
code.

v2:
 - Use scoped_guard() over guard() in idle_status_show() and
   idle_residency_ms_show().  (Gustavo)
 - Eliminate unnecessary 'ret' local variable in name_show().

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 41 ++++++++++-----------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index bdc9d9877ec4..3ca7bd7c9bcd 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -103,7 +103,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
-	unsigned int fw_ref;
 	int i, j;
 
 	if (IS_SRIOV_VF(xe))
@@ -135,7 +134,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		}
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (xe->info.skip_guc_pc) {
 		/*
 		 * GuC sets the hysteresis value when GuC PC is enabled
@@ -146,13 +145,11 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
-	unsigned int fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
@@ -160,9 +157,8 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	gtidle->powergate_enable = 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 /**
@@ -181,7 +177,6 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	unsigned int fw_ref;
 	int n;
 	/*
 	 * Media Slices
@@ -218,14 +213,12 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
 	/* Do not wake the GT to read powergating status */
 	if (state != GT_IDLE_C6) {
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref.domains)
 			return -ETIMEDOUT;
 
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
-
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -263,13 +256,9 @@ static ssize_t name_show(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
-	ssize_t ret;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
-	ret = sysfs_emit(buff, "%s\n", gtidle->name);
-	xe_pm_runtime_put(pc_to_xe(pc));
-
-	return ret;
+	guard(xe_pm_runtime)(pc_to_xe(pc));
+	return sysfs_emit(buff, "%s\n", gtidle->name);
 }
 static struct kobj_attribute name_attr = __ATTR_RO(name);
 
@@ -281,9 +270,8 @@ static ssize_t idle_status_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	enum xe_gt_idle_state state;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
-	state = gtidle->idle_status(pc);
-	xe_pm_runtime_put(pc_to_xe(pc));
+	scoped_guard(xe_pm_runtime, pc_to_xe(pc))
+		state = gtidle->idle_status(pc);
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
@@ -311,9 +299,8 @@ static ssize_t idle_residency_ms_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
-	residency = xe_gt_idle_residency_msec(gtidle);
-	xe_pm_runtime_put(pc_to_xe(pc));
+	scoped_guard(xe_pm_runtime, pc_to_xe(pc))
+		residency = xe_gt_idle_residency_msec(gtidle);
 
 	return sysfs_emit(buff, "%llu\n", residency);
 }
@@ -396,21 +383,17 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 
 int xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
-	unsigned int fw_ref;
-
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
 	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
 }
-- 
2.51.1

