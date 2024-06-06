Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A00CC25B76
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 00:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED31710E56C;
	Thu,  6 Jun 2024 00:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JONtQU6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53510E459
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633187; x=1749169187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jyl4EYFJcbvZBUWiFG8Lzuq0qydjIqAN8Czke402Ebw=;
 b=JONtQU6TxQEQZw23y7StRQvfMrUMYVYfH7n4UALzJnIwhTneW9DLaNmh
 NFbUmuh+b7pwr7RqSZ69axRulcBWQKbKzJT///tPXuz1ca195gLMg5PeJ
 Rtvnjjh0yanK7yO8hk4JrcEmbWCocM+QvGBEWU6ZwNHLupMfaDdQ7almT
 o+wip/uYpiJqW9aQcXpjcMK5HZh3VA2mP4GawuE2VBgTB+/xm2hio5Yxf
 bkCidqTd2PwKWZZLCocf/bWUiAxeSwch9zMWifQ1F335MgjdfcIlgdLPJ
 pm2jeD8Gf2/EBo1H64ataEWpAWaxncph8jIqwb67qHvSPRAtWbrSLen2B g==;
X-CSE-ConnectionGUID: wQ3+5YQuS5eKu7o7kJfeHQ==
X-CSE-MsgGUID: 6G1m0hq1Tbe++D98jaekgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31820039"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31820039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:46 -0700
X-CSE-ConnectionGUID: 6V4SsNPOTcGL0VcQzJzzAg==
X-CSE-MsgGUID: 6dD0OWQzQU6qfqoNCYVdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38328634"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:19:45 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 4/6] drm/xe/trace: Print device_id in xe_trace_guc events
Date: Wed,  5 Jun 2024 17:18:12 -0700
Message-Id: <20240606001814.3460974-5-radhakrishna.sripada@intel.com>
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

In multi-gpu environments it is important to know the device
guc txn belongs to. The tracing information includes the device_id
to indicate the device the event is associated with.

v2: Use variable sized variant to display dev name(Gustavo)

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++----
 drivers/gpu/drm/xe/xe_trace_guc.h | 48 ++++++++++++++++++-------------
 2 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 78f79df638d5..ff3fd10cd417 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -528,7 +528,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
-	trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
+	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
@@ -641,6 +641,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      u32 g2h_len, u32 num_g2h,
 			      struct g2h_fence *g2h_fence)
 {
+	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct drm_printer p = xe_gt_info_printer(gt);
 	unsigned int sleep_period_ms = 1;
@@ -668,7 +669,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		if (sleep_period_ms == 1024)
 			goto broken;
 
-		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
+		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
@@ -680,7 +681,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 
-		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
+		trace_xe_guc_ct_g2h_flow_control(xe, g2h->info.head,
 						 desc_read(xe, g2h, tail),
 						 g2h->info.size,
 						 g2h->info.space,
@@ -1170,8 +1171,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	g2h->info.head = (head + avail) % g2h->info.size;
 	desc_write(xe, g2h, head, g2h->info.head);
 
-	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
-			     g2h->info.head, tail);
+	trace_xe_guc_ctb_g2h(xe, ct_to_gt(ct)->info.id,
+			     action, len, g2h->info.head, tail);
 
 	return len;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
index d6830ff21822..8f11e2df359c 100644
--- a/drivers/gpu/drm/xe/xe_trace_guc.h
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -9,16 +9,21 @@
 #if !defined(_XE_TRACE_GUC_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _XE_TRACE_GUC_H_
 
+#include <linux/string_helpers.h>
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_device_types.h"
 #include "xe_guc_exec_queue_types.h"
 
+#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
+
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
-		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		    TP_ARGS(_head, _tail, size, space, len),
+		    TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		    TP_ARGS(xe, _head, _tail, size, space, len),
 
 		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_xe(xe))
 			     __field(u32, _head)
 			     __field(u32, _tail)
 			     __field(u32, size)
@@ -27,6 +32,7 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev, __dev_name_xe(xe));
 			   __entry->_head = _head;
 			   __entry->_tail = _tail;
 			   __entry->size = size;
@@ -34,30 +40,31 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			   __entry->len = len;
 			   ),
 
-		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			      __entry->_head, __entry->_tail, __entry->size,
+		    TP_printk("dev=%s, h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			      __get_str(dev), __entry->_head, __entry->_tail, __entry->size,
 			      __entry->space, __entry->len)
 );
 
 DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
-	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	     TP_ARGS(_head, _tail, size, space, len)
+	     TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+	     TP_ARGS(xe, _head, _tail, size, space, len)
 );
 
 DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
-		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		   TP_ARGS(_head, _tail, size, space, len),
+		   TP_PROTO(struct xe_device *xe, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		   TP_ARGS(xe, _head, _tail, size, space, len),
 
-		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			     __entry->_head, __entry->_tail, __entry->size,
+		   TP_printk("dev=%s, g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			     __get_str(dev), __entry->_head, __entry->_tail, __entry->size,
 			     __entry->space, __entry->len)
 );
 
 DECLARE_EVENT_CLASS(xe_guc_ctb,
-		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		    TP_ARGS(gt_id, action, len, _head, tail),
+		    TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		    TP_ARGS(xe, gt_id, action, len, _head, tail),
 
 		    TP_STRUCT__entry(
+				__string(dev, __dev_name_xe(xe))
 				__field(u8, gt_id)
 				__field(u32, action)
 				__field(u32, len)
@@ -66,6 +73,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 		    ),
 
 		    TP_fast_assign(
+			    __assign_str(dev, __dev_name_xe(xe));
 			    __entry->gt_id = gt_id;
 			    __entry->action = action;
 			    __entry->len = len;
@@ -73,22 +81,22 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 			    __entry->_head = _head;
 		    ),
 
-		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			      __entry->gt_id, __entry->action, __entry->len,
+		    TP_printk("dev=%s, gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			      __get_str(dev), __entry->gt_id, __entry->action, __entry->len,
 			      __entry->tail, __entry->_head)
 );
 
 DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
-	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-	     TP_ARGS(gt_id, action, len, _head, tail)
+	     TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+	     TP_ARGS(xe, gt_id, action, len, _head, tail)
 );
 
 DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
-		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		   TP_ARGS(gt_id, action, len, _head, tail),
+		   TP_PROTO(struct xe_device *xe, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		   TP_ARGS(xe, gt_id, action, len, _head, tail),
 
-		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			     __entry->gt_id, __entry->action, __entry->len,
+		   TP_printk("dev=%s, gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			     __get_str(dev), __entry->gt_id, __entry->action, __entry->len,
 			     __entry->tail, __entry->_head)
 
 );
-- 
2.34.1

