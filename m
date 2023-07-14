Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41CEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 05:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A6B10E118;
	Fri, 14 Jul 2023 05:26:36 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5B510E118
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 05:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689312394; x=1720848394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rMrllfrl14I2x9dhuYeFCTTqgBQHa6Mhpgekk3UK0bM=;
 b=LRweWb4aZZatTtwDSHWNYxYAmy75/ju4GzpUCqPc0XycrDDMOnx//cEA
 NDWEuv70IUhem+gwWzXUKgUl+/nc3btw1fPFyiyfNGkzfDjHG6slOd/CQ
 Hfdi1kSMP+HQ8iSDcM2CDXN5WlhybA2hEpH5KuW8YqKK2yDgtQvodeOlN
 RuVtneL4Auzx8K4HqhzxKLkEdg8X2rd9lYNbiwrLGN+V4668n2ZGNLxRP
 ycmeKvFGlj0ohMeNkynq1z8lf8RxxPZ8c0zl0sJt244m007j/yt0n+qWK
 w7cDL4TzbYBea6nHNVx7nCUWyD1pLbeJu8ruPmenU4etNpDxk8ytJXOKO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350266739"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="350266739"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1052917812"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="1052917812"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 22:26:31 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jul 2023 11:00:08 +0530
Message-Id: <20230714053008.1430254-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: remove gucrc disable from suspend path
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

v2: add description and return statement to kernel-doc (Rodrigo)
v3: update commit message (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a21d44bfe9e8..b31ef2a8ff17 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
+	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
 
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

