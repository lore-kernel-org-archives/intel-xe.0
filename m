Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F21C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 22:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B27810EB23;
	Thu,  6 Jun 2024 22:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv1AKnxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37510E10F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717713595; x=1749249595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BkfPv28+vOtZPTvBI3+hTHvr6JyF6aXrv8U1wo/stXo=;
 b=Lv1AKnxgppepY67jv6DxPK7sNOaSFE5tHpS9PVaVmekFu62CEQV77zH6
 bhwL4BrPuYckUjlpWoQEzGgf1kiZS6/fvaPSy/lkI6HI4Z7dqhN1NU2+f
 hpL6/Mf9UP835GwkGDagzlTqrbLmoEgNYGnRXaWcnm8/bHJo1kadM9nU1
 tNXiMrMgNMHfX42D7H2H+fJUBzafSKTvWxzJTI5R5QJTU1Hgv6peijm7w
 IW1+F2RVj1b1dGXwLNxPRyVYZd6NeYN4HtHMFHbV295FfJtjHPfp27USQ
 3mxzoG1No/Dks7yDwN2fcXqsuNr3499xPge82uaIolBziu0CqVwA5+sE5 A==;
X-CSE-ConnectionGUID: c0LjCDdwQFSuPW7wqmqN2Q==
X-CSE-MsgGUID: 6qYIq5e/T2uj91zRDdpatw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17346518"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17346518"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:39:54 -0700
X-CSE-ConnectionGUID: IRE+b3MlTweLx0rJTFxaxg==
X-CSE-MsgGUID: 4ZWyGMrAQXOOhUIwZRr4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37966761"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:39:53 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 2/6] drm/xe/trace: Extract guc related traces
Date: Thu,  6 Jun 2024 15:38:15 -0700
Message-Id: <20240606223819.3545560-3-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
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
index 12e93fbcf9eb..2e7c94510ace 100644
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
index ba9cee9e1466..81128c0f31e6 100644
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

