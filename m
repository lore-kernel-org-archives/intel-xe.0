Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BE9CA0EE0
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9D710E7C5;
	Fri, 30 Aug 2024 05:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SktD9hDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EA310E7C8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994349; x=1756530349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A6ILo0rG1DYYqM4XSc2DuR6yYiW61GfXN1I3Y+PPWek=;
 b=SktD9hDS4KwK8th/BNcnR962AS9CuXIvp5I2OPdibeVKmJRK1u4tyNhL
 7hU9BxER5AiClzt0TnbBESgoH5XAYfhp2hXf3J1ccMF945t/ydJGR5lwY
 yrnOc/SImao9pJMlwpMVnUBQNi+ZkIt2FsLEw+I+aqgUpZNueeqtw9a3K
 mef+WwvFrJNyPuqr0Q8pDH7cllUXQr2xckAJGWmJtwqJIVKNm/tGLXYjW
 1t714LC38nvZnKUZNEAZvKovOamhrcNRiQ86BkGTwS2aajHxEXyHnAYgw
 l9OBY6eEw8drGpKIP+ThPTBfv9idXz2AjnkhQzIFZZcoVkRV4FJtRuNSM g==;
X-CSE-ConnectionGUID: lPydFklKTCihBBeU2EOCpA==
X-CSE-MsgGUID: PQAWD09cQ2C4PBQaaV46Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006486"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:48 -0700
X-CSE-ConnectionGUID: 9vK3aFmJRN23iJAu/q/GDQ==
X-CSE-MsgGUID: mfvtgwcUQTieqp9bmhP5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101301985"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:46 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 4/9] drm/xe/gt: call xe_force_wake_put() only if
 xe_force_wake_get() succeeds
Date: Fri, 30 Aug 2024 10:53:21 +0530
Message-Id: <20240830052326.3707019-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

A failure in xe_force_wake_get() no longer increments the domain's
refcount, so xe_force_wake_put() should not be called in such cases

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c      |  6 ++++--
 drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 224c137967c3..73987ef83e7e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -824,11 +824,13 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	int err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
+	XE_WARN_ON(err);
 	xe_uc_stop_prepare(&gt->uc);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	if (!err)
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..f9fdefd161b5 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -99,7 +99,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 pg_enable;
-	int i, j;
+	int i, j, err;
 
 	if (IS_SRIOV_VF(xe))
 		return;
@@ -118,7 +118,8 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
 	}
 
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(err);
 	if (xe->info.skip_guc_pc) {
 		/*
 		 * GuC sets the hysteresis value when GuC PC is enabled
@@ -129,20 +130,26 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	}
 
 	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (!err)
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 void xe_gt_idle_disable_pg(struct xe_gt *gt)
 {
+	int err;
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(err);
 
 	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	if (!err)
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 }
 
 static ssize_t name_show(struct device *dev,
@@ -205,9 +212,13 @@ static void gt_idle_fini(void *arg)
 	xe_gt_idle_disable_pg(gt);
 
 	if (gt_to_xe(gt)->info.skip_guc_pc) {
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		int err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+
+		XE_WARN_ON(err);
 		xe_gt_idle_disable_c6(gt);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+		if (!err)
+			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	}
 
 	sysfs_remove_files(kobj, gt_idle_attrs);
-- 
2.34.1

