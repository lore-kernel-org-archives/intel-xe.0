Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78251CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E510E1D4;
	Fri,  7 Nov 2025 18:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5Wh44hi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0333A10E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539210; x=1794075210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+6ZtnHE0yUphSCfIptuVijleoHp1978JN9S3UNSr0fs=;
 b=F5Wh44hizwAyRYImLPO9Rx0BIZh091t8+RjQ9jVgVKwKz3mQURuvO7dT
 BDSJo7RIfygx8m9cxnRfUSIZxcPtjOxW4mOWLf4Xi150GKrJJTLm+SJHA
 BZk2mX23DsmQiwgEdQYdL8WqrPf7p8zjvZK6dB6H0NjrE1pEWDNXuKee1
 86cpIU9DJN8bL5nkAl3q0j381L5PKqWt2Dcza728nR1e9d4Kt8w05apgq
 lwoe0zi/9caBeMPzCQzQ/PudLqncdibtjcv4LUUvnJgZMoxomm3BJ+oCy
 I6qPCQO+0ViAmz2eF5OnxqRs7BgU5knlw3cf+KRfLSj6o2GFM6Fww7Puh A==;
X-CSE-ConnectionGUID: fIdYqU+0QZmfQ/U6+7rW/g==
X-CSE-MsgGUID: A9dLxvLVRsS1FVjL15u8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733143"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: SiiRDh4TTmKPb0uIeaLZOw==
X-CSE-MsgGUID: iC3qvs9CSXCI54rUu0SIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271176"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 10/33] drm/xe/gt_idle: Use scope-based cleanup
Date: Fri,  7 Nov 2025 10:13:26 -0800
Message-ID: <20251107181315.631642-45-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 503aeabbe4c3..6a63b7ad69a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -103,7 +103,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 vcs_mask, vecs_mask;
-	struct xe_force_wake_ref fw_ref;
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
-	xe_force_wake_put(fw_ref);
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
 	struct xe_gt_idle *gtidle = &gt->gtidle;
-	struct xe_force_wake_ref fw_ref;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
@@ -160,9 +157,8 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	gtidle->powergate_enable = 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
-	xe_force_wake_put(fw_ref);
 }
 
 /**
@@ -181,7 +177,6 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	enum xe_gt_idle_state state;
 	u32 pg_enabled, pg_status = 0;
 	u32 vcs_mask, vecs_mask;
-	struct xe_force_wake_ref fw_ref;
 	int n;
 	/*
 	 * Media Slices
@@ -218,14 +213,12 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
 	/* Do not wake the GT to read powergating status */
 	if (state != GT_IDLE_C6) {
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 		if (!fw_ref.domains)
 			return -ETIMEDOUT;
 
 		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
 		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
-
-		xe_force_wake_put(fw_ref);
 	}
 
 	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
@@ -265,9 +258,8 @@ static ssize_t name_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	ssize_t ret;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
+	guard(xe_pm_runtime)(pc_to_xe(pc));
 	ret = sysfs_emit(buff, "%s\n", gtidle->name);
-	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return ret;
 }
@@ -281,9 +273,8 @@ static ssize_t idle_status_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	enum xe_gt_idle_state state;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
+	guard(xe_pm_runtime)(pc_to_xe(pc));
 	state = gtidle->idle_status(pc);
-	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
 }
@@ -311,9 +302,8 @@ static ssize_t idle_residency_ms_show(struct kobject *kobj,
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
+	guard(xe_pm_runtime)(pc_to_xe(pc));
 	residency = xe_gt_idle_residency_msec(gtidle);
-	xe_pm_runtime_put(pc_to_xe(pc));
 
 	return sysfs_emit(buff, "%llu\n", residency);
 }
@@ -396,21 +386,17 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 
 int xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
-	struct xe_force_wake_ref fw_ref;
-
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	xe_mmio_write32(&gt->mmio, RC_CONTROL, 0);
 	xe_mmio_write32(&gt->mmio, RC_STATE, 0);
 
-	xe_force_wake_put(fw_ref);
-
 	return 0;
 }
-- 
2.51.1

