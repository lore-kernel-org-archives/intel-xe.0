Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F1BFCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C54210E6A7;
	Wed, 18 Mar 2026 07:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7lJBGXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129E510E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817835; x=1805353835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHDj4v8JThkoLn8btakEN/HHQPHxJ20AKhAcX/KUy6I=;
 b=Z7lJBGXnV2lyXYNtDZjtA7er5sVaDOxGJPmhX98diHbE6MG+/4kBVaKs
 Z3tk0GCHDCyH3BpMcjm2svflQPZ+fHNlkvmRu6ja1YgjQfpN/6RotMioU
 40LRRyy+d7DMQgIjyH8x8FND3FtN5+VGTVsRHJEqIPVxJ4VBcXfwhtBGc
 uqh9m0YfqkFvfJ5OLz54SFHm//h3lLQ6/MChEby76/RDHB7OtHW801ubr
 Te04s/s3ycCq5Vn4O5nVF9W7QAxWhWHoV1LSd/aInuL20Aw+qK3UxC4nj
 gcVHG2HjZvphvzdHReKgz8kkuJT2dsGDAaEy3FPR7F5NAUN9wNyY+TJsU A==;
X-CSE-ConnectionGUID: ZZ33oMC8Sm6haafsp+VGGA==
X-CSE-MsgGUID: mzKK/vJWTAG/gsaRKUJRmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764275"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:33 -0700
X-CSE-ConnectionGUID: 9ez25RqnRl+c75oz698ljw==
X-CSE-MsgGUID: bkfVDAHWTvWi5He5xuZ6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424078"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 11/15] drm/xe: Add xe_guc_access_counter layer
Date: Wed, 18 Mar 2026 13:14:52 +0530
Message-Id: <20260318074456.2839499-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/xe_guc_access_counter.c | 62 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h | 15 ++++++
 drivers/gpu/drm/xe/xe_guc_ct.c             |  4 ++
 4 files changed, 82 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 92d8d6e4a447..296b3cba0b89 100644
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
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm/xe/xe_guc_access_counter.c
new file mode 100644
index 000000000000..2158400bc50a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_guc_access_counter.h"
+
+#include "xe_access_counter.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_guc.h"
+#include "xe_guc_fwif.h"
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
+	struct xe_access_counter ac;
+	struct xe_device *xe = guc_to_xe(guc);
+	int i;
+
+#define GUC_ACC_MSG_LEN_DW	\
+	(sizeof(struct xe_guc_acc_desc) / sizeof(u32))
+
+	BUILD_BUG_ON(GUC_ACC_MSG_LEN_DW > XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW);
+
+	if (len != GUC_ACC_MSG_LEN_DW)
+		return -EPROTO;
+
+	ac.gt = guc_to_gt(guc);
+
+	/* Parse access counter descriptor */
+	ac.consumer.granularity = FIELD_GET(ACC_GRANULARITY, msg[2]);
+	ac.consumer.sub_granularity = FIELD_GET(ACC_SUBG_HI, msg[1]) << 31 |
+				      FIELD_GET(ACC_SUBG_LO, msg[0]);
+	ac.consumer.counter_type = FIELD_GET(ACC_TYPE, msg[0]);
+	ac.consumer.va_range_base = ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
+				    (msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
+	/* xe3: Use ASID and engine info */
+	ac.consumer.xe3.asid = FIELD_GET(ACC_ASID, msg[1]);
+	ac.consumer.xe3.engine_class = FIELD_GET(ACC_ENG_CLASS, msg[1]);
+	ac.consumer.xe3.engine_instance = FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
+	ac.consumer.xe3.vfid = FIELD_GET(ACC_VFID, msg[2]);
+
+	/* Store producer message for potential acknowledgment */
+	ac.producer.private = guc;
+	for (i = 0; i < GUC_ACC_MSG_LEN_DW; ++i)
+		ac.producer.msg[i] = msg[i];
+
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
index a11cff7a20be..8ac0938f7a28 100644
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
@@ -1630,6 +1631,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
+		ret = xe_guc_access_counter_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
-- 
2.34.1

