Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DCBCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 06:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFD210E417;
	Thu, 12 Oct 2023 06:26:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA9B10E417
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697091959; x=1728627959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wWstS3RsT9b3hu9XZv1ZT3/ZZRjWJsNwsLude/FqGnc=;
 b=ekzbIS54EVIaMyN7JqffJIOvJbNxjR5yQJ9Dmr1II7a83BfYwSSXwntQ
 QwxGvt5SXKd9teVZMi8bRbSCzgAyfbIrWjOLO7r/4pauRBPYJQFHi4IXH
 p7nhxspQ2KxzsgPOHlm6ffT6IHWC7bRsY1Xytj8qz5Np+fRl0vQiZZEa3
 sKiW4rJ7gAVfViVpkxNP/hg86ZYf+mZ8GJ2V79X1s3MyhKVpi11ocOCqm
 FQSLsPY9wv6pyRX7sT8NUYeMX/rfOTwsq8RP1VKY9k/RSAVtDsFlAJmj7
 A9dInbMe+K/TEIerKN2OAtMCBfJHEWIFGETBi5CHoPerOl3QAa9CdSzx3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387681218"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="387681218"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="754126953"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="754126953"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 23:25:55 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 12:02:09 +0530
Message-Id: <20231012063209.56824-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231012063209.56824-1-riana.tauro@intel.com>
References: <20231012063209.56824-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Toggle GuC CT communication for
 D3Hot Transition
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

During Runtime suspend/resume, GuC is reloaded for both
D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
loaded everytime for D3hot->D0, only enable/disable ctb communication.

Add a function that toggles CT communication when d3cold
is not allowed.

v2: simplify code (Bala)
    handle pmu suspend in runtime suspend (Rodrigo)
    change function names

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 62 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h |  2 ++
 drivers/gpu/drm/xe/xe_pm.c |  4 +--
 drivers/gpu/drm/xe/xe_uc.c | 21 +++++++++++++
 drivers/gpu/drm/xe/xe_uc.h |  2 +-
 5 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1..2c507d67291b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -709,6 +709,68 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_runtime_suspend - Helper for GT related Runtime PM suspend actions
+ * @xe: xe gt instance
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_suspend(gt);
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
+	xe_pmu_suspend(gt);
+
+	ret = xe_uc_toggle_communication(&gt->uc, false);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (ret)
+		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(ret));
+	else
+		xe_gt_info(gt, "suspended\n");
+
+	return ret;
+}
+
+/**
+ * xe_gt_runtime_resume - Helper for GT related Runtime PM resume actions
+ * @xe: xe gt instance
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_gt_runtime_resume(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret = 0;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_resume(gt);
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
+	ret = xe_uc_toggle_communication(&gt->uc, true);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+
+	if (ret)
+		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(ret));
+	else
+		xe_gt_info(gt, "resumed\n");
+
+	return ret;
+}
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..e6574e51004f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e31a91cf311c..1cd46ab804fe 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -254,7 +254,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out;
 	}
@@ -304,7 +304,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe_gt_runtime_resume(gt);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		err = xe_bo_restore_user(xe);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index bf75c39d929d..62a5fa6e5362 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -225,6 +225,27 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+/**
+ * xe_uc_toggle_communication - enable or disable uc communication
+ * @uc: The UC object
+ * @toggle: 0-disable, 1-enable
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return 0;
+
+	if (toggle)
+		return xe_guc_enable_communication(&uc->guc, false);
+
+	xe_guc_disable_communication(&uc->guc);
+
+	return 0;
+}
+
 int xe_uc_suspend(struct xe_uc *uc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 4109ae7028af..69d7dff0900e 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -20,5 +20,5 @@ int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 void xe_uc_sanitize(struct xe_uc *uc);
-
+int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle);
 #endif
-- 
2.40.0

