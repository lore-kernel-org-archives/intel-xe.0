Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B5CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 15:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FC010E71F;
	Tue,  9 Sep 2025 15:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8SiEYeU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AB310E71F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757430306; x=1788966306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5pRiHsUL/oJAtkD2/5PNEXTUljc6HKzh3xoZdVKK18=;
 b=J8SiEYeU+r9mec3XO+GKjnqzKDTwaowMpvYskYWgmg+B6kyetjHOcmD4
 yfMMJZnljM721mhHFTmcef4Saq6SefiOjJM8TBsPA6uHAqCbvb/UlT4Tf
 rcyrmK4POZOK5yjBm0gIPQAULhCX95sUinCWH2clZ32oP57q4W0lbFQnB
 hEThf7xj3+VFKbqesQDswDp82QvEBqY82iCNfkwHoOFQZQeTY9rYe+N8p
 hni9AfEuSTJQdOfyKE/5J4HCh08dGK/LHL/tYwcTX/OAqYPsMhvwTvLs9
 Xu+xyX+9Qa7is68sYs28AB33IjK5mpNecQ69kIiL/3cUXJZmXkJcMC+an A==;
X-CSE-ConnectionGUID: 6rnYXKLOQhyB//pSp0dHgA==
X-CSE-MsgGUID: hbYpf3rJQK2fI/pcL1GQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63354365"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63354365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:06 -0700
X-CSE-ConnectionGUID: 5C4Iy+TaQaGnI8AboQnEEQ==
X-CSE-MsgGUID: hQxhhX6ARUKLsM8PaDLJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203881506"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:04 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, michal.mrozek@intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC 2/2] drm/xe/gt_pagefault: Add tracepoints when handing page
 faults
Date: Tue,  9 Sep 2025 17:03:37 +0200
Message-ID: <20250909150437.986365-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909150437.986365-1-francois.dugast@intel.com>
References: <20250909150437.986365-1-francois.dugast@intel.com>
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

Add a new tracepoints when handling VMA and SVM page faults.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c       | 22 ++++--------
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 25 ++++++++++++++
 drivers/gpu/drm/xe/xe_trace.h              | 40 ++++++++++++++++++++++
 3 files changed, 71 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index d02d22fb3659..50836df79950 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -20,24 +20,11 @@
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
 #include "xe_svm.h"
+#include "xe_trace.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 #include "xe_vram_types.h"
 
-struct pagefault {
-	u64 page_addr;
-	u32 asid;
-	u16 pdata;
-	u8 vfid;
-	u8 access_type;
-	u8 fault_type;
-	u8 fault_level;
-	u8 engine_class;
-	u8 engine_instance;
-	u8 fault_unsuccessful;
-	bool trva_fault;
-};
-
 enum access_type {
 	ACCESS_TYPE_READ = 0,
 	ACCESS_TYPE_WRITE = 1,
@@ -209,11 +196,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	atomic = access_is_atomic(pf->access_type);
 
-	if (xe_vma_is_cpu_addr_mirror(vma))
+	if (xe_vma_is_cpu_addr_mirror(vma)) {
+		trace_xe_handle_svm_pagefault(xe, pf);
 		err = xe_svm_handle_pagefault(vm, vma, gt,
 					      pf->page_addr, atomic);
-	else
+	} else {
+		trace_xe_handle_vma_pagefault(xe, pf);
 		err = handle_vma_pagefault(gt, vma, atomic);
+	}
 
 unlock_vm:
 	if (!err)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
new file mode 100644
index 000000000000..431b1469d79b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GT_PAGEFAULT_TYPES_H_
+#define _XE_GT_PAGEFAULT_TYPES_H_
+
+#include <linux/types.h>
+
+struct pagefault {
+	u64 page_addr;
+	u32 asid;
+	u16 pdata;
+	u8 vfid;
+	u8 access_type;
+	u8 fault_type;
+	u8 fault_level;
+	u8 engine_class;
+	u8 engine_instance;
+	u8 fault_unsuccessful;
+	bool trva_fault;
+};
+
+#endif	/* _XE_GT_PAGEFAULT_TYPES_ */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index b9f59651771e..8587982e7eee 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -14,8 +14,10 @@
 
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
+#include "xe_gt_pagefault_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
+#include "xe_hw_engine.h"
 #include "xe_migrate_types.h"
 #include "xe_sched_job.h"
 #include "xe_tlb_inval_types.h"
@@ -473,6 +475,44 @@ DEFINE_EVENT(xe_migrate, xe_migrate_vram,
 	     TP_ARGS(xe, len, vram_addr, dir)
 );
 
+DECLARE_EVENT_CLASS(xe_pagefault,
+		    TP_PROTO(struct xe_device *xe, struct pagefault *pf),
+		    TP_ARGS(xe, pf),
+
+		    TP_STRUCT__entry(
+			    __string(dev, __dev_name_xe(xe))
+			    __field(u64, page_addr)
+			    __field(u8, fault_type)
+			    __field(u8, access_type)
+			    __field(u8, fault_level)
+			    __field(u8, engine_class)
+			    __field(u8, engine_instance)
+			    ),
+
+		    TP_fast_assign(
+			    __assign_str(dev);
+			    __entry->page_addr = pf->page_addr;
+			    ),
+
+		    TP_printk("dev=%s addr=%llx fault_type=%d access_type=%d fault_level=%d engine_class=%d %s engine_instance=%d",
+			      __get_str(dev), __entry->page_addr,
+			      __entry->fault_type, __entry->access_type,
+			      __entry->fault_level, __entry->engine_class,
+			      xe_hw_engine_class_to_str(
+				      __entry->engine_class),
+			      __entry->engine_instance)
+);
+
+DEFINE_EVENT(xe_pagefault, xe_handle_vma_pagefault,
+	     TP_PROTO(struct xe_device *xe, struct pagefault *pf),
+	     TP_ARGS(xe, pf)
+);
+
+DEFINE_EVENT(xe_pagefault, xe_handle_svm_pagefault,
+	     TP_PROTO(struct xe_device *xe, struct pagefault *pf),
+	     TP_ARGS(xe, pf)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

