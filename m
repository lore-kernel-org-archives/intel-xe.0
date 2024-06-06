Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C0C27C5F
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86B10E610;
	Thu,  6 Jun 2024 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1JSjV6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8310E459
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633186; x=1749169186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7gdrhO7WcBQcQLKRVjzQWt7X4SbyXRja6z1wBPEk8o=;
 b=D1JSjV6fXPClZPMwW894oRHkYUkJ9CqrW4/cff8Avy7isALhR71uOZn9
 YjtUWZJmRIgteynLRiwB/Mz3G+u+v1iqNAxFBTWaidv5D06QNHfEymlEb
 Mhg8f5dzMJdcgk+4QWNT8bdZ5LyaIxmcnedoPG4QFi3Gprke6pf8e2ybC
 B1JvpCqOfORhXipmM5C9ai7bhuuUfofiM7qhCne589Q4GAENQkgI4GZMY
 6v0kPiVE85x9KRFCXwbunatkor6B0zppIrEOCKfb0aReUdKuHRv/Zh0WC
 kZ63snuFN+lnw042kUFl2R1DcVlGa3tTBQHRiZKj4BxPGXPGXa6md5obw A==;
X-CSE-ConnectionGUID: APOQGoZ0S+qUvGRaTO/YkA==
X-CSE-MsgGUID: Ef86BsBZRIyqbAdjE9UYow==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820036"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: qEXPJ+21RXGTX7HW3mhseg==
X-CSE-MsgGUID: mFn6pMKVTW+bdCAHFMvixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328628"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 2/6] drm/xe/trace: Extract guc related traces
Date: Wed,  5 Jun 2024 17:18:10 -0700
Message-Id: <20240606001814.3460974-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
References: <20240606001814.3460974-1-radhakrishna.sripada@intel.com>
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

xe_trace.h is starting to get over crowded. Move the traces
related to guc to its own file.

v2: Update year in License(Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c    |   2 +-
 drivers/gpu/drm/xe/xe_trace.h     |  80 -----------------------
 drivers/gpu/drm/xe/xe_trace_guc.c |   9 +++
 drivers/gpu/drm/xe/xe_trace_guc.h | 103 ++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7c5e77fbfc1e..eb1943f81cf8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -113,6 +113,7 @@ xe-y += xe_bb.o \
 	xe_tile_sysfs.o \
 	xe_trace.o \
 	xe_trace_bo.o \
+	xe_trace_guc.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c1f258348f5c..78f79df638d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -29,7 +29,7 @@
 #include "xe_guc_submit.h"
 #include "xe_map.h"
 #include "xe_pm.h"
-#include "xe_trace.h"
+#include "xe_trace_guc.h"
 
 /* Used when a CT send wants to block and / or receive data */
 struct g2h_fence {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 9493cc3d6d82..8e00f0cdeb75 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -332,86 +332,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
 	     TP_ARGS(fence)
 );
 
-/* GuC */
-DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
-		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		    TP_ARGS(_head, _tail, size, space, len),
-
-		    TP_STRUCT__entry(
-			     __field(u32, _head)
-			     __field(u32, _tail)
-			     __field(u32, size)
-			     __field(u32, space)
-			     __field(u32, len)
-			     ),
-
-		    TP_fast_assign(
-			   __entry->_head = _head;
-			   __entry->_tail = _tail;
-			   __entry->size = size;
-			   __entry->space = space;
-			   __entry->len = len;
-			   ),
-
-		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			      __entry->_head, __entry->_tail, __entry->size,
-			      __entry->space, __entry->len)
-);
-
-DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
-	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	     TP_ARGS(_head, _tail, size, space, len)
-);
-
-DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
-		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		   TP_ARGS(_head, _tail, size, space, len),
-
-		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			     __entry->_head, __entry->_tail, __entry->size,
-			     __entry->space, __entry->len)
-);
-
-DECLARE_EVENT_CLASS(xe_guc_ctb,
-		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		    TP_ARGS(gt_id, action, len, _head, tail),
-
-		    TP_STRUCT__entry(
-				__field(u8, gt_id)
-				__field(u32, action)
-				__field(u32, len)
-				__field(u32, tail)
-				__field(u32, _head)
-		    ),
-
-		    TP_fast_assign(
-			    __entry->gt_id = gt_id;
-			    __entry->action = action;
-			    __entry->len = len;
-			    __entry->tail = tail;
-			    __entry->_head = _head;
-		    ),
-
-		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			      __entry->gt_id, __entry->action, __entry->len,
-			      __entry->tail, __entry->_head)
-);
-
-DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
-	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-	     TP_ARGS(gt_id, action, len, _head, tail)
-);
-
-DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
-		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		   TP_ARGS(gt_id, action, len, _head, tail),
-
-		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			     __entry->gt_id, __entry->action, __entry->len,
-			     __entry->tail, __entry->_head)
-
-);
-
 #endif
 
 /* This part must be outside protection */
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.c b/drivers/gpu/drm/xe/xe_trace_guc.c
new file mode 100644
index 000000000000..fcdf6888ff2f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_guc.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_guc.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
new file mode 100644
index 000000000000..d6830ff21822
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_GUC_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_GUC_H_
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "xe_guc_exec_queue_types.h"
+
+DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
+		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		    TP_ARGS(_head, _tail, size, space, len),
+
+		    TP_STRUCT__entry(
+			     __field(u32, _head)
+			     __field(u32, _tail)
+			     __field(u32, size)
+			     __field(u32, space)
+			     __field(u32, len)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->_head = _head;
+			   __entry->_tail = _tail;
+			   __entry->size = size;
+			   __entry->space = space;
+			   __entry->len = len;
+			   ),
+
+		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			      __entry->_head, __entry->_tail, __entry->size,
+			      __entry->space, __entry->len)
+);
+
+DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
+	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+	     TP_ARGS(_head, _tail, size, space, len)
+);
+
+DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
+		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		   TP_ARGS(_head, _tail, size, space, len),
+
+		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			     __entry->_head, __entry->_tail, __entry->size,
+			     __entry->space, __entry->len)
+);
+
+DECLARE_EVENT_CLASS(xe_guc_ctb,
+		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		    TP_ARGS(gt_id, action, len, _head, tail),
+
+		    TP_STRUCT__entry(
+				__field(u8, gt_id)
+				__field(u32, action)
+				__field(u32, len)
+				__field(u32, tail)
+				__field(u32, _head)
+		    ),
+
+		    TP_fast_assign(
+			    __entry->gt_id = gt_id;
+			    __entry->action = action;
+			    __entry->len = len;
+			    __entry->tail = tail;
+			    __entry->_head = _head;
+		    ),
+
+		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			      __entry->gt_id, __entry->action, __entry->len,
+			      __entry->tail, __entry->_head)
+);
+
+DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
+	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+	     TP_ARGS(gt_id, action, len, _head, tail)
+);
+
+DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
+		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		   TP_ARGS(gt_id, action, len, _head, tail),
+
+		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			     __entry->gt_id, __entry->action, __entry->len,
+			     __entry->tail, __entry->_head)
+
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_guc
+#include <trace/define_trace.h>
-- 
2.34.1

