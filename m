Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2762CEB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 07:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3610E434;
	Thu,  6 Jul 2023 07:07:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF210E434
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688627234; x=1720163234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2W0JG+WQnWpPcNOBs0T4gMKn3kcJgTvHnyJcYWv/u0s=;
 b=hcqtxd+KI+K0kaXD6cTucTDqnl+u+mSktZiEZWBSmcLxqu8lMBuYF60l
 xgQdpL4xaU0LD8RrswLw3250pkv2oEjarY98jN6t7qIKObwmqgXE6eoph
 zoFg+2ycAGGLF0wP02erYJXnNMU6753VQR1Cg5fB0VItlxnwkELpIhayt
 iFrfl8DrNjtREBzBwg5/SAOUmSp/XzxieEEjbXXvP+oaq2LClEqFhonws
 0mJTlz3VHVkhlKuYEKGzA1Dg2WWSvrU0lJF0OFqF1lPJSpy0kxIItpw7k
 j+2/V5IraGQpnL3bNqe8kmEd1oAIEZ2l6G9j+dix+7GRGexPBFT+Tyx35 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="353362810"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="353362810"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 00:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="863992989"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="863992989"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 00:07:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 12:40:36 +0530
Message-Id: <20230706071036.968267-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe: remove gucrc disable from suspend
 path
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently rc6 is disabled in suspend path for xe
Rc6 is a prerequiste to enable s0ix and
should not be disabled for s2idle.

There is no requirement to disable rc6 for S3+,
so remove gucrc disable from suspend path.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 13 +++++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 5 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc76678a8276..d3a2bd3db12f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
+	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
 	xe_gt_tlb_invalidation_reset(gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3093cfeff0c2..b675ef903937 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -730,7 +730,11 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static int pc_gucrc_disable(struct xe_guc_pc *pc)
+/**
+ * xe_guc_pc_gucrc_disable - disable gucrc
+ * @pc: Xe_GuC_PC instance
+ */
+int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
@@ -827,7 +831,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 
 	if (xe->info.platform == XE_PVC) {
-		pc_gucrc_disable(pc);
+		xe_guc_pc_gucrc_disable(pc);
 		ret = 0;
 		goto out;
 	}
@@ -850,10 +854,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
-	ret = pc_gucrc_disable(pc);
-	if (ret)
-		goto out;
-
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
@@ -876,6 +876,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 
+	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	xe_bo_unpin_map_no_vm(pc->bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 370353a40a17..81833a53b3c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -11,6 +11,7 @@
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
+int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 
 enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..f8cbd292d6d0 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 	return xe_guc_reset_prepare(&uc->guc);
 }
 
+void xe_uc_gucrc_disable(struct xe_uc *uc)
+{
+	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
+}
+
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
 	xe_guc_stop_prepare(&uc->guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index d6efc9ef00d3..42219b361df5 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_hwconfig(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
+void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
-- 
2.40.0

