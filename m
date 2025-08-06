Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765FBC87FDA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D8010E3AB;
	Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W50KsVAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145C110E3A6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gG2oESwqkNFVzCM+VXTs5aYXlNIgx5Q7loAs/SzDaxw=;
 b=W50KsVAh6gWaAvSmdr0cDyb9un4Cxa8Bv/NHNZ18hVrDsPsRVArZ6rph
 rXYrCLt2prCWE4w9jAj0ukGPMuqM6q5IFemWBB2CIowNeYR1Mwpsnp57a
 UZFWKz3F2zqs53UFB7M8Nl2XdlQV4rrlvyfUq6GgWSgeyRO/Z8vab5S6e
 FpadJ64GKHxjy7tkiHldItSizoeGZ23XHxWZmrFBTC492QvUQ3MEQph27
 a9HY80Sy4x1wDNEW/YI28CB9DXTJKCrl8VlSonEYJqEd1MoaVjwZ3yoge
 q2GxKGRsb0ZElwHsR/LE8qxUkOz8oBzKE87/45J1SVSOTo7I2dUhqdin5 g==;
X-CSE-ConnectionGUID: d2tsz68yR8ekOnYKtx+YIA==
X-CSE-MsgGUID: TSwxS0H8RI6V38weBmrZQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316935"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: Gg/20wZbS8GOxufLkLnQ/g==
X-CSE-MsgGUID: g7sjKuh9SUO7FM2BZHo8Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868951"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 06/11] drm/xe: Add xe_guc_pagefault layer
Date: Tue,  5 Aug 2025 23:22:37 -0700
Message-Id: <20250806062242.1090416-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  2 +-
 drivers/gpu/drm/xe/xe_gt.c            |  6 --
 drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c | 94 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pagefault.h | 13 ++++
 drivers/gpu/drm/xe/xe_svm.c           |  3 +-
 drivers/gpu/drm/xe/xe_vm.c            |  1 -
 7 files changed, 110 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6fbebafe79c9..c103c114b75c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,7 +58,6 @@ xe-y += xe_bb.o \
 	xe_gt_freq.o \
 	xe_gt_idle.o \
 	xe_gt_mcr.o \
-	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
@@ -75,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
+	xe_guc_pagefault.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
 	xe_heci_gsc.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5aa03f89a062..35c7ba7828a6 100644
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
@@ -634,10 +633,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	err = xe_gt_pagefault_init(gt);
-	if (err)
-		return err;
-
 	err = xe_gt_idle_init(&gt->gtidle);
 	if (err)
 		return err;
@@ -848,7 +843,6 @@ static int gt_reset(struct xe_gt *gt)
 	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_pagefault_reset(gt_to_xe(gt), gt);
-	xe_gt_pagefault_reset(gt);
 
 	xe_uc_stop(&gt->uc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..67b5dd182207 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -21,7 +21,6 @@
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
@@ -29,6 +28,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
+#include "xe_guc_pagefault.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
@@ -1419,10 +1419,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
 							   adj_len);
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
index 000000000000..0aa069d2a581
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -0,0 +1,94 @@
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
+	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);;
+	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
+	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
+		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
+	else
+		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
+	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
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
index 000000000000..0723f57b8ea9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.h
@@ -0,0 +1,13 @@
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
+int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..1bcf3ba3b350 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -109,8 +109,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 			      &vm->svm.garbage_collector.range_list);
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
-	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
-		   &vm->svm.garbage_collector.work);
+	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
 }
 
 static u8
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..c9ae13c32117 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -27,7 +27,6 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
-#include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
-- 
2.34.1

