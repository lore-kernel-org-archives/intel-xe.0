Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A3EA3F0D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 07:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E45210E4D8;
	Tue, 10 Feb 2026 07:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJA+hiAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4DF10E4D8
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770708592; x=1802244592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tXX1RoVPYtKr/lnZwdYSsVE76Pf6F24w27KETEzs4cQ=;
 b=ZJA+hiAZpZ+/QMZgWWZeXN582G3Rm1cj8tU3CAni/EPCsppn0a/9Q8Mv
 dSv0W21d7GjUYQSjJy9V5cWFRM9mVs1oUU+zqGacD8/gvwnoiMoQOs+PE
 p4ayKzVu2jOGTXsxYBaRqUhT/uELh5oN5KwQMjPSrUHdV5RS2NiUrT+kE
 3lIqcdV/fBejMlFAvoQlqMBz6rNcp0refw18cFquNuZci3W4xSwWZqlFm
 YSKjOs7QIXa50zbvZeIdjuIjzZuJsl7rl/WklU/xMcX9AP5qTIdgFcHia
 UHppWIWIec81AeVkuyIKxgTo+46ZQw4iJMosbrjQMSzvaWuY+eMCPhqsC Q==;
X-CSE-ConnectionGUID: 2j4PK5qGRIOF25XazmWtsg==
X-CSE-MsgGUID: fX300uxET3qyMlxIdyb4oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89414948"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89414948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 23:29:52 -0800
X-CSE-ConnectionGUID: YKsfxvUBTMiN2LOCF+wrNA==
X-CSE-MsgGUID: uSzokT4vToaMGy8SQA6uRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234793795"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 23:29:51 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH] Decouple devcoredump from accessing core  driver structures
Date: Tue, 10 Feb 2026 12:59:42 +0530
Message-ID: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
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

During devcoredump, print should not access any live gt pointers.
Decouple the snapshot_print from accessing gt pointer by storing the
captured data in a separate list and then print data from that list.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c     | 25 +++++++------------------
 drivers/gpu/drm/xe/xe_hw_engine.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  7 +++++++
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 2f5816c78fba..0555fb07c499 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1695,8 +1695,7 @@ static void
 snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
 			     u32 type, const struct __guc_mmio_reg_descr_group *list)
 {
-	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = snapshot->xe;
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
@@ -1806,7 +1805,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 	};
 	int type;
 	const struct __guc_mmio_reg_descr_group *list;
-	enum guc_capture_list_class_type capture_class;
 
 	struct xe_gt *gt;
 	struct xe_device *xe;
@@ -1826,8 +1824,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 
 	xe_gt_assert(gt, snapshot->hwe);
 
-	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
-
 	drm_printf(p, "%s (physical), logical instance=%d\n",
 		   snapshot->name ? snapshot->name : "",
 		   snapshot->logical_instance);
@@ -1841,23 +1837,16 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
 		   str_yes_no(snapshot->kernel_reserved));
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
-		/*
-		 * FIXME: During devcoredump print we should avoid accessing the
-		 * driver pointers for gt or engine. Printing should be done only
-		 * using the snapshot captured. Here we are accessing the gt
-		 * pointer. It should be fixed.
-		 */
-		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
-							capture_class, false);
+
+		list = snapshot->list[type];
+
 		snapshot_print_by_list_order(snapshot, p, type, list);
 	}
 
-	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
-		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
-							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
-							capture_class, true);
+	if (snapshot->render_compute_list) {
+
 		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
-					     list);
+					     snapshot->render_compute_list);
 	}
 
 	drm_puts(p, "\n");
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4d3ee5226e3a..a246b4f860e6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -923,6 +923,8 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 	struct __guc_capture_parsed_output *node;
+	enum guc_capture_list_class_type capture_class;
+	int type;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -941,6 +943,24 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
 	snapshot->mmio_base = hwe->mmio_base;
 	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
 
+	snapshot->xe = gt_to_xe(hwe->gt);
+
+	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+
+	/* Capture the register list */
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
+		snapshot->list[type] = xe_guc_capture_get_reg_desc_list(hwe->gt,
+				GUC_CAPTURE_LIST_INDEX_PF, type, capture_class, false);
+	}
+
+	/* Capture the register list from RENDER / COMPUTE */
+	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+		snapshot->render_compute_list = xe_guc_capture_get_reg_desc_list(hwe->gt,
+				GUC_CAPTURE_LIST_INDEX_PF, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
+				capture_class, true);
+	}
+
+
 	/* no more VF accessible data below this point */
 	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
 		return snapshot;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e4191a7a2c31..87ad1e68fb47 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_HW_ENGINE_TYPES_H_
 #define _XE_HW_ENGINE_TYPES_H_
 
+#include "abi/guc_capture_abi.h"
 #include "xe_force_wake_types.h"
 #include "xe_lrc_types.h"
 #include "xe_reg_sr_types.h"
@@ -167,6 +168,12 @@ struct xe_hw_engine_snapshot {
 	char *name;
 	/** @hwe: hw engine */
 	struct xe_hw_engine *hwe;
+	/** @xe: device pointer */
+	struct xe_device *xe;
+	/** @list: register list */
+	const struct __guc_mmio_reg_descr_group *list[GUC_STATE_CAPTURE_TYPE_MAX];
+	/** @render_compute_list: render/compute list */
+	const struct __guc_mmio_reg_descr_group *render_compute_list;
 	/** @logical_instance: logical instance of this hw engine */
 	u16 logical_instance;
 	/** @forcewake: Force Wake information snapshot */
-- 
2.51.1

