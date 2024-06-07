Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3D6C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0F410ECEF;
	Fri,  7 Jun 2024 18:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8XmRfdO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B05010ECEA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717785068; x=1749321068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ou85ahGsyYbYaUrYAlyfs50RnY73LB0HrZr+0CcMDWs=;
 b=L8XmRfdOHQvyOo9EFqrxNX6NF7yQltU6xy22MZi2TtrOBJtOstDW4yub
 UKdISAQwXp/TY/h6nzKc8ykq3L6j1DRPcipTrO0TCepC5DtizHgv+OV6i
 GZUyj8zxG91RTZxasBhxe04BI8XkID3EdAjWa071XYGW2TADmyBggGNFz
 kHiPYjM8tAsoFwq6YGYHriJK5uJElaDwVKz+IJsPXWYEk7ELLmGrd2pxg
 TssJNZo+okW+yL2XtdZMuEd/LdiL/Wj7ngtVaYqfj2A1vDoUqH0Yt1L/q
 YFc9VUb0IUCHmNpERJXCWv7z+f5/kqjJ6ByyYnvpGRa7y3oTlNoaXqbg6 A==;
X-CSE-ConnectionGUID: EaejoUeFRtW6VYIZavWgUQ==
X-CSE-MsgGUID: 25HdNstORzuNoZEcLJy2Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18314399"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18314399"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
X-CSE-ConnectionGUID: S/gMWgCRTBCWYMzUZZp/EA==
X-CSE-MsgGUID: VxnHzxLQSIm4GD5Qv1NCdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43342157"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v6 4/6] drm/xe/trace: Print device_id in xe_trace_guc events
Date: Fri,  7 Jun 2024 11:29:41 -0700
Message-Id: <20240607182943.3572524-5-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
References: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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
v3: Pass single argument to __assign_str to fix kunit error
v4: Minor formatting tweaks

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c    | 11 ++++----
 drivers/gpu/drm/xe/xe_trace_guc.h | 47 ++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index aef400133720..b4137fe195a4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -571,7 +571,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
-	trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
+	trace_xe_guc_ctb_h2g(xe, gt->info.id, *(action - 1), full_len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
@@ -684,6 +684,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      u32 g2h_len, u32 num_g2h,
 			      struct g2h_fence *g2h_fence)
 {
+	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct drm_printer p = xe_gt_info_printer(gt);
 	unsigned int sleep_period_ms = 1;
@@ -711,7 +712,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		if (sleep_period_ms == 1024)
 			goto broken;
 
-		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
+		trace_xe_guc_ct_h2g_flow_control(xe, h2g->info.head, h2g->info.tail,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
@@ -723,7 +724,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 
-		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
+		trace_xe_guc_ct_g2h_flow_control(xe, g2h->info.head,
 						 desc_read(xe, g2h, tail),
 						 g2h->info.size,
 						 g2h->info.space,
@@ -1213,8 +1214,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	g2h->info.head = (head + avail) % g2h->info.size;
 	desc_write(xe, g2h, head, g2h->info.head);
 
-	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
-			     g2h->info.head, tail);
+	trace_xe_guc_ctb_g2h(xe, ct_to_gt(ct)->info.id,
+			     action, len, g2h->info.head, tail);
 
 	return len;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
index d6830ff21822..23abdd55dc62 100644
--- a/drivers/gpu/drm/xe/xe_trace_guc.h
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -12,13 +12,17 @@
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
@@ -27,6 +31,7 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			     ),
 
 		    TP_fast_assign(
+			   __assign_str(dev);
 			   __entry->_head = _head;
 			   __entry->_tail = _tail;
 			   __entry->size = size;
@@ -34,30 +39,31 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			   __entry->len = len;
 			   ),
 
-		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			      __entry->_head, __entry->_tail, __entry->size,
+		    TP_printk("h2g flow control: dev=%s, head=%u, tail=%u, size=%u, space=%u, len=%u",
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
+		   TP_printk("g2h flow control: dev=%s, head=%u, tail=%u, size=%u, space=%u, len=%u",
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
@@ -66,6 +72,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 		    ),
 
 		    TP_fast_assign(
+			    __assign_str(dev);
 			    __entry->gt_id = gt_id;
 			    __entry->action = action;
 			    __entry->len = len;
@@ -73,22 +80,22 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 			    __entry->_head = _head;
 		    ),
 
-		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			      __entry->gt_id, __entry->action, __entry->len,
+		    TP_printk("H2G CTB: dev=%s, gt%d: action=0x%x, len=%d, tail=%d, head=%d\n",
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
+		   TP_printk("G2H CTB: dev=%s, gt%d: action=0x%x, len=%d, tail=%d, head=%d\n",
+			     __get_str(dev), __entry->gt_id, __entry->action, __entry->len,
 			     __entry->tail, __entry->_head)
 
 );
-- 
2.34.1

