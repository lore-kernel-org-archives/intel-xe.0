Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA43EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 05:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6034F10E16C;
	Thu, 13 Jul 2023 05:35:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823710E171
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 05:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689226499; x=1720762499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SHKrzlZk1Qak3CiqTnOAnsxignwZ6uriwPb7wmv339E=;
 b=QWbwJyl6JCSZpXYxxqFZ1kAln1ERlVnHYumhWCHSAdaB6KrEYp1C4BH/
 GCVNKDa90Q71kowh/x6l1GjZr4zNmtTWG1GyftY4qj6e94MOrlRrVR8Zw
 Mt6piPvzs9fCyUIdxpwHsF4IVROz4hUVuP8VuGxzVUauzznLeGqti3mpK
 KYduEY3W6i+gk0Z+aTwwphXBTjvQ9THLLqhdZSWF337sQG03NqECdhjuj
 JyWL9SqWI6eXnWLY+Gr/Z/OWbVSWlPc9i8GzXIyish5I09nvHcJnnNhNI
 FWrM1mOyi1n4uyBDJZe7Jlle8ZJCuRSzBKn/UXVDs0LM9znOAbP/quuNf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="344685504"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="344685504"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 22:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835438882"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="835438882"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 22:34:55 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 11:08:32 +0530
Message-Id: <20230713053832.1386402-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: remove gucrc disable from suspend path
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

Currently GuCRC is disabled in suspend path for xe.
Rc6 is a prerequiste to enable s0ix and
should not be disabled for s2idle. There is no requirement
to disable GuCRC for S3+.

Remove it from xe_guc_pc_stop, thus removing from suspend path.
Retain the call in other places where xe_guc_pc_stop is
called.

v2: Fix cosmetic review comments (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

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
index 3093cfeff0c2..9a7fae727dfa 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -730,7 +730,15 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static int pc_gucrc_disable(struct xe_guc_pc *pc)
+/**
+ * xe_guc_pc_gucrc_disable - Disable GuC RC
+ * @pc: Xe_GuC_PC instance
+ *
+ * Disables GuC RC by taking control of RC6 back from GuC.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
@@ -827,7 +835,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 
 	if (xe->info.platform == XE_PVC) {
-		pc_gucrc_disable(pc);
+		xe_guc_pc_gucrc_disable(pc);
 		ret = 0;
 		goto out;
 	}
@@ -850,10 +858,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
-	ret = pc_gucrc_disable(pc);
-	if (ret)
-		goto out;
-
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
@@ -876,6 +880,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
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

