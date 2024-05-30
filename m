Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D0CC27C50
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4F410EC64;
	Thu, 30 May 2024 15:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gk+m28rq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB40310E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082087; x=1748618087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=egPTY668Gyl5iKmq+QURDs2HFzClENqQazScsG+MnpA=;
 b=gk+m28rqORWaJpF6eXLj7fLHZfoJhtaEkh7AsCfQhMaOCxJfWQJ6wHQR
 269Qx043VvnXUnHVykD1OjX16CJyGno4bY70h2pReBez75wWMe1RKF9FO
 u1Zs8/mvd7CJjADWm7HV9BdG14Ht2Yjku8hPRVCxlHVa6zkKDthbOAZ+y
 rRYDsCzfrXuPkSjE6NW8oB9xLznMt8RBn95m1PqahJ80ac6DNnL7dKr07
 dCRGMtKmDy7UE82bQAptcMP0WdKLd+M5Qe8oOTVnpWbo4lhEb2nUOZC9q
 i6oNM9rgt/kue1nvUstCLtz+N7v7SkE2Dxcj7AwsXbECpklTjLIEC9E9t g==;
X-CSE-ConnectionGUID: +FE0zThQScy6y0ifhEf8Wg==
X-CSE-MsgGUID: Nvu1Z8g5Tp+qx4awNmMbpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24695862"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24695862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
X-CSE-ConnectionGUID: WZn2Fnr7SMeEOMF7/ZY0KQ==
X-CSE-MsgGUID: wcwJXafDSkO4vdihL+Z6zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36326446"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:41 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 4/6] drm/xe/trace: Print device_id in xe_trace_guc events
Date: Thu, 30 May 2024 08:13:11 -0700
Message-Id: <20240530151313.2284182-5-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
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

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c    | 13 +++++----
 drivers/gpu/drm/xe/xe_trace_guc.h | 44 +++++++++++++++++--------------
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 78f79df638d5..5b08cceb994a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -528,7 +528,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
-	trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
+	trace_xe_guc_ctb_h2g(dev_name(xe->drm.dev), gt->info.id, *(action - 1), full_len,
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
@@ -668,7 +669,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		if (sleep_period_ms == 1024)
 			goto broken;
 
-		trace_xe_guc_ct_h2g_flow_control(h2g->info.head, h2g->info.tail,
+		trace_xe_guc_ct_h2g_flow_control(dev_name(xe->drm.dev),
+						 h2g->info.head, h2g->info.tail,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
@@ -680,7 +682,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
 
-		trace_xe_guc_ct_g2h_flow_control(g2h->info.head,
+		trace_xe_guc_ct_g2h_flow_control(dev_name(xe->drm.dev),
+						 g2h->info.head,
 						 desc_read(xe, g2h, tail),
 						 g2h->info.size,
 						 g2h->info.space,
@@ -1170,8 +1173,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	g2h->info.head = (head + avail) % g2h->info.size;
 	desc_write(xe, g2h, head, g2h->info.head);
 
-	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
-			     g2h->info.head, tail);
+	trace_xe_guc_ctb_g2h(dev_name(xe->drm.dev), ct_to_gt(ct)->info.id,
+			     action, len, g2h->info.head, tail);
 
 	return len;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
index fb4976499812..8a7953803696 100644
--- a/drivers/gpu/drm/xe/xe_trace_guc.h
+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
@@ -15,10 +15,11 @@
 #include "xe_guc_exec_queue_types.h"
 
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
-		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		    TP_ARGS(_head, _tail, size, space, len),
+		    TP_PROTO(const char *devid, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		    TP_ARGS(devid, _head, _tail, size, space, len),
 
 		    TP_STRUCT__entry(
+			     __array(char, devid, 12)
 			     __field(u32, _head)
 			     __field(u32, _tail)
 			     __field(u32, size)
@@ -27,6 +28,7 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			     ),
 
 		    TP_fast_assign(
+			   memcpy(__entry->devid, devid, 12);
 			   __entry->_head = _head;
 			   __entry->_tail = _tail;
 			   __entry->size = size;
@@ -34,30 +36,31 @@ DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 			   __entry->len = len;
 			   ),
 
-		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			      __entry->_head, __entry->_tail, __entry->size,
+		    TP_printk("dev: %s: h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			      __entry->devid, __entry->_head, __entry->_tail, __entry->size,
 			      __entry->space, __entry->len)
 );
 
 DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
-	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	     TP_ARGS(_head, _tail, size, space, len)
+	     TP_PROTO(const char *devid, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+	     TP_ARGS(devid, _head, _tail, size, space, len)
 );
 
 DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
-		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-		   TP_ARGS(_head, _tail, size, space, len),
+		   TP_PROTO(const char *devid, u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		   TP_ARGS(devid, _head, _tail, size, space, len),
 
-		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
-			     __entry->_head, __entry->_tail, __entry->size,
+		   TP_printk("dev: %s: g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
+			     __entry->devid, __entry->_head, __entry->_tail, __entry->size,
 			     __entry->space, __entry->len)
 );
 
 DECLARE_EVENT_CLASS(xe_guc_ctb,
-		    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		    TP_ARGS(gt_id, action, len, _head, tail),
+		    TP_PROTO(const char *devid, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		    TP_ARGS(devid, gt_id, action, len, _head, tail),
 
 		    TP_STRUCT__entry(
+				__array(char, devid, 12)
 				__field(u8, gt_id)
 				__field(u32, action)
 				__field(u32, len)
@@ -66,6 +69,7 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 		    ),
 
 		    TP_fast_assign(
+			    memcpy(__entry->devid, devid, 12);
 			    __entry->gt_id = gt_id;
 			    __entry->action = action;
 			    __entry->len = len;
@@ -73,22 +77,22 @@ DECLARE_EVENT_CLASS(xe_guc_ctb,
 			    __entry->_head = _head;
 		    ),
 
-		    TP_printk("gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			      __entry->gt_id, __entry->action, __entry->len,
+		    TP_printk("dev: %s: gt%d: H2G CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			      __entry->devid, __entry->gt_id, __entry->action, __entry->len,
 			      __entry->tail, __entry->_head)
 );
 
 DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
-	     TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-	     TP_ARGS(gt_id, action, len, _head, tail)
+	     TP_PROTO(const char *devid, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+	     TP_ARGS(devid, gt_id, action, len, _head, tail)
 );
 
 DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
-		   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
-		   TP_ARGS(gt_id, action, len, _head, tail),
+		   TP_PROTO(const char *devid, u8 gt_id, u32 action, u32 len, u32 _head, u32 tail),
+		   TP_ARGS(devid, gt_id, action, len, _head, tail),
 
-		   TP_printk("gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
-			     __entry->gt_id, __entry->action, __entry->len,
+		   TP_printk("dev: %s: gt%d: G2H CTB: action=0x%x, len=%d, tail=%d, head=%d\n",
+			     __entry->devid, __entry->gt_id, __entry->action, __entry->len,
 			     __entry->tail, __entry->_head)
 
 );
-- 
2.34.1

