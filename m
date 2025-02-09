Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A0DC02199
	for <intel-xe@archiver.kernel.org>; Sun,  9 Feb 2025 12:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA70E10E2D2;
	Sun,  9 Feb 2025 12:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W310jSg7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3B10E2FF
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Feb 2025 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739103156; x=1770639156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oI3dzKeteENQTVWDetXdSUxa4OE4w/NBY8jtYae+SbM=;
 b=W310jSg7cADj15NzGp31o4VwXWDv59Oh7MZr+Iyub6TWxykVEFFJZ8Hv
 894L6QqSzX5nvnYjPKw8L2EeX4oWfknnbCsNQBZn+U+VDmTGilIkP+OI2
 50LBAMI7747RThm/7xMASl4bKSRcCjsvKJBE8K0krYhGxPNe5zYOxFLYr
 pF+gqemOFw8gJRUFuaY6ao6nb3ICow0z1YkAYh0CQqisEr876kJhW2XSZ
 ZsRdQTm0HYQvfshM9iLBMz6Pc9AzyXHrE85qsiaPp+oNWC43uGv5glaWI
 uBrKKAdWZ9KnLBL1qGVejKs7Ke3NZt/dCvFXYXo7T4tMFWh1k7bgAbeGf g==;
X-CSE-ConnectionGUID: qDNfgt9nSk2KphUIsut22Q==
X-CSE-MsgGUID: ie4yXIvNSGmlxaldKmlrDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50320489"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; d="scan'208";a="50320489"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 04:12:35 -0800
X-CSE-ConnectionGUID: AFrH7pEZTvmFOlDIVVln5A==
X-CSE-MsgGUID: W7D5H3Q5QUqYXj13wltANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135194970"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 04:12:34 -0800
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 519CCPRl1604480
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 9 Feb 2025 14:12:25 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id
 519CCPJo1604479; Sun, 9 Feb 2025 14:12:25 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH 2/2] drm/xe: upon page fault, use generic uc fw instead of guc
Date: Sun,  9 Feb 2025 14:12:17 +0200
Message-Id: <20250209121217.1604458-2-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250209121217.1604458-1-dafna.hirschfeld@intel.com>
References: <20250209121217.1604458-1-dafna.hirschfeld@intel.com>
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
index 7a103e7cd3d0..3e73708ac862 100644
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
@@ -250,18 +247,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
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
@@ -327,9 +312,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 		PF_MSG_LEN_DW;
 }
 
-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct pf_queue *pf_queue;
 	unsigned long flags;
@@ -341,6 +325,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
+	pf_queue->fw = fw;
 
 	/*
 	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
@@ -405,7 +390,7 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-		send_pagefault_reply(&gt->uc.guc, &reply);
+		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
 
 		if (time_after(jiffies, threshold) &&
 		    pf_queue->tail != pf_queue->head) {
@@ -679,9 +664,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
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
index 548773f9f5b3..c2751acca968 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -288,6 +288,8 @@ struct xe_gt {
 		struct pf_queue {
 			/** @usm.pf_queue.gt: back pointer to GT */
 			struct xe_gt *gt;
+			/** @usm.pf_queue.fw the fw that handles the pf */
+			struct xe_uc_fw *fw;
 			/** @usm.pf_queue.data: data in the page fault queue */
 			u32 *data;
 			/**
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8127c3c41990..d144ee07d01b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include "xe_uc_fw_types.h"
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -664,6 +665,19 @@ static int vf_guc_init(struct xe_guc *guc)
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
@@ -674,6 +688,7 @@ int xe_guc_init(struct xe_guc *guc)
 	ret = xe_uc_fw_init(&guc->fw);
 	if (ret)
 		goto out;
+	guc->fw.send_pagefault_reply = &send_pagefault_reply;
 
 	if (!xe_uc_fw_is_enabled(&guc->fw))
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0a9263a2b01b..e0a68b0d2d2f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1316,15 +1316,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
@@ -1529,7 +1529,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	switch (action) {
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
-		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
+		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		__g2h_release_space(ct, len);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 0755d0b61227..97d8582e9015 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_bo;
+struct xe_gt;
 
 /*
  * +------------+---------------------------------------------------+
@@ -231,6 +232,10 @@ struct xe_uc_fw {
 
 	/** @build_type: Firmware build type (see CSS_INFO_BUILDTYPE for definitions) */
 	u32 build_type;
+
+	/** a callback to send the page fault replay to the fw */
+	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
+				    struct xe_uc_pagefault_reply *reply);
 };
 
 #endif
-- 
2.34.1

