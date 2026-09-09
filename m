Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87DC88E43
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9493910F11F;
	Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcgA6ynv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057CD10F10D
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957730; x=1820493730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOaBkbx7S7+YU7xJRanrBHc9e4G8jsFTq2MGI+vaE7M=;
 b=AcgA6ynv/CPkx4XPZbNdWFLuUEjBXv96f16bE71QwbG+MemcQMgatbYH
 2t4E4rVzKUjtFqDmEZ52LjcD8Yol9V5JwWg0MzN35irb1geWoBRuTE9uM
 O6HsOtewdbq3yQTX8HEl61buhPs80BlmE//xUEwPPwY331+/0BXkPazl4
 8HggE3q11WyeFbCwT7UWeACEkv0nQjLFcymj+iiNL+AcxzAjy1bC7GbZz
 KsYkwpVxB01o70TxxpwPkWKwKUuQ6rr10QkniKEsRoDzBvDCL/HGGG4mw
 Ov03+0OC5Ef5hPte7h9UlVwsrCmoARPQbyiCn9xQkJh5YVcwEfOBHsW6H g==;
X-CSE-ConnectionGUID: EtUX1879RKOeIiowAsr9jA==
X-CSE-MsgGUID: Q+l44rS1R82Ud6Q/Dfxu+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715563"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:10 -0700
X-CSE-ConnectionGUID: kJCzTUKqRweCvBh7WQCfRg==
X-CSE-MsgGUID: oPiNmWriSMKg0ZgmIjhVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246647"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 13/21] drm/xe: Add xe_guc_access_counter layer
Date: Wed,  9 Sep 2026 18:15:07 +0530
Message-ID: <20260909124457.1610890-36-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add GuC to host (G2H) access counter notification handler to parse
GuC firmware messages into struct xe_access_counter and forward to
xe_access_counter_handler for processing.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |  1 +
 drivers/gpu/drm/xe/xe_access_counter_types.h | 12 ++++
 drivers/gpu/drm/xe/xe_guc_access_counter.c   | 74 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h   | 15 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c               |  4 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h             |  1 +
 6 files changed, 107 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 96a4f83c5d89..ad1acc67ee0b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -74,6 +74,7 @@ xe-y += xe_access_counter.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
+	xe_guc_access_counter.o \
 	xe_guc_pagefault.o \
 	xe_guc_pc.o \
 	xe_guc_rc.o \
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
index 7cdcdae4e357..955d63e2c204 100644
--- a/drivers/gpu/drm/xe/xe_access_counter_types.h
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -40,6 +40,18 @@ enum xe_access_counter_granularity {
 	XE_ACCESS_COUNTER_GRANULARITY_64M  = 3,
 };
 
+static inline u64 xe_access_counter_granularity_to_size(u8 granularity)
+{
+	switch (granularity) {
+	case XE_ACCESS_COUNTER_GRANULARITY_128K: return SZ_128K;
+	case XE_ACCESS_COUNTER_GRANULARITY_2M:   return SZ_2M;
+	case XE_ACCESS_COUNTER_GRANULARITY_16M:  return SZ_16M;
+	case XE_ACCESS_COUNTER_GRANULARITY_64M:  return SZ_64M;
+	default:
+		return SZ_128K;
+	}
+}
+
 /**
  * struct xe_access_counter - Xe access counter
  *
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm/xe/xe_guc_access_counter.c
new file mode 100644
index 000000000000..7e9b835e1ed6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_guc_access_counter.h"
+
+#include "xe_access_counter.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_guc.h"
+#include "xe_guc_fwif.h"
+#include "xe_guc_submit.h"
+#include "xe_printk.h"
+
+static u64 xe_guc_access_counter_page_va(struct xe_device *xe, u64 addr, u8 gran)
+{
+	u64 gran_size = xe_access_counter_granularity_to_size(gran);
+	u64 sub_gran_size = gran_size / 32;
+	u64 region_base = ALIGN_DOWN(addr, gran_size);
+	u64 offset_in_subchunk = addr & (sub_gran_size - 1);
+	u64 page_va = region_base + offset_in_subchunk;
+
+	xe_dbg(xe, "gran_size = %llx, addr = = %llx, region_base = %llx, page_va=%llx\n",
+	       gran_size, addr, region_base, page_va);
+	return page_va;
+}
+
+/**
+ * xe_guc_access_counter_handler() - G2H access counter handler
+ * @guc: GuC object
+ * @msg: G2H message
+ * @len: Length of G2H message
+ *
+ * Parse GuC to host (G2H) message into a struct xe_access_counter and forward
+ * onto the Xe access counter layer.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_access_counter ac = {};
+	struct xe_device *xe = guc_to_xe(guc);
+	u64 addr;
+#define GUC_ACC_MSG_LEN_DW	\
+	(sizeof(struct xe_guc_acc_desc) / sizeof(u32))
+
+	if (len != GUC_ACC_MSG_LEN_DW)
+		return -EPROTO;
+
+	ac.gt = guc_to_gt(guc);
+
+	/* Parse access counter descriptor */
+	ac.consumer.granularity = FIELD_GET(ACC_GRANULARITY, msg[2]);
+	ac.consumer.sub_granularity = FIELD_GET(ACC_SUBG_HI, msg[1]) << ACC_SUBG_LO_WIDTH |
+				      FIELD_GET(ACC_SUBG_LO, msg[0]);
+	ac.consumer.counter_type = FIELD_GET(ACC_TYPE, msg[0]);
+	if (ac.consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
+		return -EINVAL;
+
+	addr = ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
+		(msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
+	ac.consumer.page_va = xe_guc_access_counter_page_va(xe, addr, ac.consumer.granularity);
+	ac.gran_end = ac.consumer.page_va +
+		      xe_access_counter_granularity_to_size(ac.consumer.granularity);
+	ac.consumer.asid = FIELD_GET(ACC_ASID, msg[1]);
+	ac.consumer.engine_class = FIELD_GET(ACC_ENG_CLASS, msg[1]);
+	ac.consumer.engine_instance = FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
+	ac.consumer.vfid = FIELD_GET(ACC_VFID, msg[2]);
+#undef GUC_ACC_MSG_LEN_DW
+
+	return xe_access_counter_handler(xe, &ac);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.h b/drivers/gpu/drm/xe/xe_guc_access_counter.h
new file mode 100644
index 000000000000..1ac8e76398d2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_ACCESS_COUNTER_H_
+#define _XE_GUC_ACCESS_COUNTER_H_
+
+#include <linux/types.h>
+
+struct xe_guc;
+
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c4733da385c..3068cbbff8c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,6 +26,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
+#include "xe_guc_access_counter.h"
 #include "xe_guc_pagefault.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -1753,6 +1754,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
+		ret = xe_guc_access_counter_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 971b850f2136..a2a77b252d3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -299,6 +299,7 @@ struct xe_guc_acc_desc {
 #define ACC_TRIGGER	0
 #define ACC_NOTIFY	1
 #define ACC_SUBG_LO	GENMASK(31, 1)
+#define ACC_SUBG_LO_WIDTH 31
 
 	u32 dw1;
 #define ACC_SUBG_HI	BIT(0)
-- 
2.43.0

