Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2210ACCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B1B10EB33;
	Fri, 24 Oct 2025 18:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0AT2Jwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E9510E21F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761329061; x=1792865061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6gOPHYde43SHxpFBt9YbameW1nTSCvYr4odFNt8j1c=;
 b=c0AT2JwraoVNAnpX2HT+jxJRUz2c7+baQM2cfqo3j38doVdD1I3tBh1+
 NgPvzv8xk2KvrLi/wAIt5JHtVh9+ZJUw02jYx2qrHsrb0c0WvzetTDXSj
 pxDlzViAVpwF0fVUfwxq7KHmw1m70owGDYAh9J5zJPx7cfdRrI/zkCptb
 wkkJlxkwHcDW470ARRrDD1ztTnb2PKklJBQu3uqScBFXdSK+uqF+rxepq
 3sUNbZeA2huQcZI0q7UIaVvHOB8Ubd0A2t7GgBTDxC6xRYD4+I4QxCRul
 ehxDpDsaerD4+BUfvKV6mNbmw4HFg1O3PWDabOdk3DE8q/KYn31HviW1c Q==;
X-CSE-ConnectionGUID: C+Bl3RenR7ittamLyPNzAQ==
X-CSE-MsgGUID: SThGSELvQ/60Rq4P8P5F9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67349334"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67349334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:20 -0700
X-CSE-ConnectionGUID: aVHv0utCQNiBY4CSYEV6wg==
X-CSE-MsgGUID: lcDpexV1Q2mWaFZ1TgqH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183709650"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v2 6/7] drm/xe: Add xe_guc_pagefault layer
Date: Fri, 24 Oct 2025 11:04:13 -0700
Message-Id: <20251024180414.1379284-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024180414.1379284-1-matthew.brost@intel.com>
References: <20251024180414.1379284-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add xe_guc_pagefault layer (producer) which parses G2H fault messages
messages into struct xe_pagefault, forwards them to the page fault layer
(consumer) for servicing, and provides a vfunc to acknowledge faults to
the GuC upon completion. Replace the old (and incorrect) GT page fault
layer with this new layer throughout the driver.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Include engine instance (Stuart)
---
 drivers/gpu/drm/xe/Makefile           |  2 +-
 drivers/gpu/drm/xe/xe_gt.c            |  6 --
 drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c | 95 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pagefault.h | 15 +++++
 drivers/gpu/drm/xe/xe_svm.c           |  3 +-
 drivers/gpu/drm/xe/xe_vm.c            |  1 -
 7 files changed, 113 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b35021e5b9eb..319f208eb19a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,7 +58,6 @@ xe-y += xe_bb.o \
 	xe_gt_freq.o \
 	xe_gt_idle.o \
 	xe_gt_mcr.o \
-	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle.o \
 	xe_gt_topology.o \
@@ -73,6 +72,7 @@ xe-y += xe_bb.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
+	xe_guc_pagefault.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
 	xe_guc_tlb_inval.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e4852c4c90cd..44ed3202dfd1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -32,7 +32,6 @@
 #include "xe_gt_freq.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_mcr.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
@@ -638,10 +637,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = xe_gt_pagefault_init(gt);
-	if (err)
-		return err;
-
 	err = xe_gt_idle_init(&gt->gtidle);
 	if (err)
 		return err;
@@ -851,7 +846,6 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_pagefault_reset(gt_to_xe(gt), gt);
-	xe_gt_pagefault_reset(gt);
 
 	xe_uc_stop(&gt->uc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e68953ef3a00..529d2b3bec21 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -21,12 +21,12 @@
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
+#include "xe_guc_pagefault.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_guc_tlb_inval.h"
@@ -1545,10 +1545,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
-	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
-		ret = xe_guc_access_counter_notify_handler(guc, payload,
-							   adj_len);
-		break;
 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
 		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
new file mode 100644
index 000000000000..b1b79a3e661a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "abi/guc_actions_abi.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+#include "xe_guc_pagefault.h"
+#include "xe_pagefault.h"
+
+static void guc_ack_fault(struct xe_pagefault *pf, int err)
+{
+	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
+	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
+	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
+	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
+		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
+		 PFD_PDATA_HI_SHIFT);
+	u32 action[] = {
+		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
+
+		FIELD_PREP(PFR_VALID, 1) |
+		FIELD_PREP(PFR_SUCCESS, !!err) |
+		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
+		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
+		FIELD_PREP(PFR_ASID, pf->consumer.asid),
+
+		FIELD_PREP(PFR_VFID, vfid) |
+		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
+		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
+		FIELD_PREP(PFR_PDATA, pdata),
+	};
+	struct xe_guc *guc = pf->producer.private;
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+static const struct xe_pagefault_ops guc_pagefault_ops = {
+	.ack_fault = guc_ack_fault,
+};
+
+/**
+ * xe_guc_pagefault_handler() - G2H page fault handler
+ * @guc: GuC object
+ * @msg: G2H message
+ * @len: Length of G2H message
+ *
+ * Parse GuC to host (G2H) message into a struct xe_pagefault and forward onto
+ * the Xe page fault layer.
+ *
+ * Return: 0 on success, errno on failure
+ */
+int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_pagefault pf;
+	int i;
+
+#define GUC_PF_MSG_LEN_DW	\
+	(sizeof(struct xe_guc_pagefault_desc) / sizeof(u32))
+
+	BUILD_BUG_ON(GUC_PF_MSG_LEN_DW > XE_PAGEFAULT_PRODUCER_MSG_LEN_DW);
+
+	if (len != GUC_PF_MSG_LEN_DW)
+		return -EPROTO;
+
+	pf.gt = guc_to_gt(guc);
+
+	/*
+	 * XXX: These values happen to match the enum in xe_pagefault_types.h.
+	 * If that changes, we’ll need to remap them here.
+	 */
+	pf.consumer.page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3])
+				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
+		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
+		 PFD_VIRTUAL_ADDR_LO_SHIFT);
+	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
+	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
+	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
+	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
+		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
+	else
+		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
+	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
+	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
+
+	pf.producer.private = guc;
+	pf.producer.ops = &guc_pagefault_ops;
+	for (i = 0; i < GUC_PF_MSG_LEN_DW; ++i)
+		pf.producer.msg[i] = msg[i];
+
+#undef GUC_PF_MSG_LEN_DW
+
+	return xe_pagefault_handler(guc_to_xe(guc), &pf);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.h b/drivers/gpu/drm/xe/xe_guc_pagefault.h
new file mode 100644
index 000000000000..3bd599e7207c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_PAGEFAULT_H_
+#define _XE_GUC_PAGEFAULT_H_
+
+#include <linux/types.h>
+
+struct xe_guc;
+
+int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 129e7818565c..613d6224e44a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -104,8 +104,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 			      &vm->svm.garbage_collector.range_list);
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
-	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
-		   &vm->svm.garbage_collector.work);
+	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
 }
 
 static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..78ca3399fb1a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -27,7 +27,6 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
-#include "xe_gt_pagefault.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
-- 
2.34.1

