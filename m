Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF71C021AD
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 11:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ADE10E2CE;
	Tue, 18 Feb 2025 11:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4POXCKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D5B10E2CE
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739878036; x=1771414036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=acv0MoqAaNG2IVM8uWohtq5W6c8+zfQoj6bYzD+UeFo=;
 b=L4POXCKDkauN3Pe0HSc88W740FqfsrlJxbwf4rVkAtKf39/53kUplGZ+
 6FScA0ZEJ+eVtStIzX2B2XfGueM3RqgvWo3/Q1mKtYGUzuXgHXAKdnSx+
 YGjmttPDSxcFaIB39odBQpSg5TCnPrFp74UUGC7Rs70ADRVgQaFcmm8ZT
 QA7qUk7Ze3cC6yfTJyDrasuqs34cW6J+VMh7Tr+A1V57KsARcLWKSNyzP
 b6Th5RD6ilYgFaxKH622PXpG7IdO03+TxGFHHjSkjBxklTFoW4xS1cAfL
 QqF6B5xdgWDXV+jJ8pmcJRjEfw58+SRlliLvclCcelozXKXPohLqJifE+ Q==;
X-CSE-ConnectionGUID: /a/ezS+hQBC+oE9Tz38QYQ==
X-CSE-MsgGUID: qnQ/CBTUSIaaB0R2jKKsGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51190467"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51190467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:27:15 -0800
X-CSE-ConnectionGUID: Ytr152/aSzu0Yiq62JRA3g==
X-CSE-MsgGUID: JkJCbfDUTfWOvW76V4wXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="115018239"
Received: from intelmailrelay-01.habana-labs.com ([10.111.11.20])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 03:27:14 -0800
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 51IBR50h262828
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 13:27:05 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 51IBR5ag262827;
 Tue, 18 Feb 2025 13:27:05 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH v2 2/2] drm/xe: upon page fault,
 use generic uc fw instead of guc
Date: Tue, 18 Feb 2025 13:27:02 +0200
Message-Id: <20250218112702.262780-2-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
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

Future asic will have different firmware to handle page faults.
Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
xe_guc and add a callback to struct xe_uc_fw to send the page
fault replay to the fw.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 ++++--------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  6 +++---
 drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c          | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_uc_fw_types.h  |  5 +++++
 6 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 51c4bcc769d2..c1e076e14219 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -11,13 +11,10 @@
 #include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 
-#include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
-#include "xe_guc.h"
-#include "xe_guc_ct.h"
 #include "xe_migrate.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
@@ -246,18 +243,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	return err;
 }
 
-static int send_pagefault_reply(struct xe_guc *guc,
-				struct xe_uc_pagefault_reply *reply)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
-		reply->dw0,
-		reply->dw1,
-	};
-
-	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-}
-
 static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 {
 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
@@ -322,9 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 		PF_MSG_LEN_DW;
 }
 
-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct pf_queue *pf_queue;
 	unsigned long flags;
@@ -336,6 +320,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
+	pf_queue->fw = fw;
 
 	/*
 	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
@@ -390,7 +375,7 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-		send_pagefault_reply(&gt->uc.guc, &reply);
+		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
 
 		if (time_after(jiffies, threshold) &&
 		    pf_queue->tail != pf_queue->head) {
@@ -664,9 +649,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
 		ACC_MSG_LEN_DW;
 }
 
-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct acc_queue *acc_queue;
 	u32 asid;
 	bool full;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
index 839c065a5e4c..0c01af3b7124 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
@@ -9,11 +9,11 @@
 #include <linux/types.h>
 
 struct xe_gt;
-struct xe_guc;
+struct xe_uc_fw;
 
 int xe_gt_pagefault_init(struct xe_gt *gt);
 void xe_gt_pagefault_reset(struct xe_gt *gt);
-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
+int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
 
 #endif	/* _XE_GT_PAGEFAULT_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..73f7bd044828 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -249,6 +249,8 @@ struct xe_gt {
 		struct pf_queue {
 			/** @usm.pf_queue.gt: back pointer to GT */
 			struct xe_gt *gt;
+			/** @usm.pf_queue.fw the fw that handles the pf */
+			struct xe_uc_fw *fw;
 			/** @usm.pf_queue.data: data in the page fault queue */
 			u32 *data;
 			/**
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..1ea3678f1463 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include "xe_uc_fw_types.h"
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -642,6 +643,19 @@ static int vf_guc_init(struct xe_guc *guc)
 	return 0;
 }
 
+static int send_pagefault_reply(struct xe_gt *gt, struct xe_uc_fw *fw,
+				struct xe_uc_pagefault_reply *reply)
+{
+	struct xe_guc *guc = container_of(fw, struct xe_guc, fw);
+	u32 action[] = {
+		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
+		reply->dw0,
+		reply->dw1,
+	};
+
+	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
 int xe_guc_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
@@ -652,6 +666,7 @@ int xe_guc_init(struct xe_guc *guc)
 	ret = xe_uc_fw_init(&guc->fw);
 	if (ret)
 		goto out;
+	guc->fw.send_pagefault_reply = &send_pagefault_reply;
 
 	if (!xe_uc_fw_is_enabled(&guc->fw))
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18e..14ff5f255d45 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1293,15 +1293,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 								 adj_len);
 		break;
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
-		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
+		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
 							   adj_len);
 		break;
 	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
-		ret = xe_guc_access_counter_notify_handler(guc, payload,
-							   adj_len);
+		ret = xe_access_counter_notify_handler(gt, &guc->fw, payload,
+						       adj_len);
 		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
 		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
@@ -1494,7 +1494,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	switch (action) {
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
-		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
+		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		__g2h_release_space(ct, len);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index d8714ccb3f78..4d82430e3274 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_bo;
+struct xe_gt;
 
 /*
  * +------------+---------------------------------------------------+
@@ -228,6 +229,10 @@ struct xe_uc_fw {
 
 	/** @private_data_size: size of private data found in uC css header */
 	u32 private_data_size;
+
+	/** a callback to send the page fault replay to the fw */
+	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
+				    struct xe_uc_pagefault_reply *reply);
 };
 
 #endif
-- 
2.34.1

