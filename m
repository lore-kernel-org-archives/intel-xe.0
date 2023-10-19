Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D6DCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 09:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAAD10E4B6;
	Thu, 19 Oct 2023 09:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79A110E4B5
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697707608; x=1729243608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PozMqtwDPBHnbCVoAzs8eGz4z7YRgQi6jCxJWULkvqo=;
 b=NACKXdq2J8HxjnPyuVaT1QpczxvJ+F+i98EAeRn4rLQ1s4vWDS91tuwA
 tH2OqQstp9deUpEMlxbuhW8Mlq566eXnZ6z345NkXkxGEsLZHbMpNyH2W
 xvADo9lsgrDRG42VsdjcWfHVysuXg6qmHJkD/9ecB8ZlL5L/Uj7nVpRgR
 FTeKiGA2iwCygWa0BQ8ZADY/H3wr9Szg01viN019CnnBaUu/Z4YnkYXdN
 pQlkI/ypbavvn5Y1z15iTxTm4BpGU7uWgKE5OBmYmzBbWfpe/lyrRAhAQ
 +tt8WucQpVQ+TaAFQgQcsOqq/vCq1sDtmYYSYJgIEu/mcISA/MEWeefb6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386037765"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="386037765"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900671217"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="900671217"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:24:41 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:01:39 +0530
Message-Id: <20231019093140.1901665-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019093140.1901665-1-balasubramani.vivekanandan@intel.com>
References: <20231019093140.1901665-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Add event tracing for CTB
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

Event tracing enabled for CTB submissions.

Additional minor refactor - Removed a unnecessary ct_to_xe() call.

v2: Remove a unwanted comment (Hari)
    Add missing change to commit message

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 13 +++++++++--
 drivers/gpu/drm/xe/xe_trace.h  | 41 ++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8b686c8b3339..a84e111bb36a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -460,7 +460,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Write H2G ensuring visable before descriptor update */
 	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
 	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
-	xe_device_wmb(ct_to_xe(ct));
+	xe_device_wmb(xe);
 
 	/* Update local copies */
 	h2g->info.tail = (tail + full_len) % h2g->info.size;
@@ -469,6 +469,9 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
+	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
+			     desc_read(xe, h2g, head), h2g->info.tail);
+
 	return 0;
 }
 
@@ -934,6 +937,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	struct guc_ctb *g2h = &ct->ctbs.g2h;
 	u32 tail, head, len;
 	s32 avail;
+	u32 action;
 
 	lockdep_assert_held(&ct->fast_lock);
 
@@ -984,11 +988,13 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 				   avail * sizeof(u32));
 	}
 
+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
+
 	if (fast_path) {
 		if (FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[1]) != GUC_HXG_TYPE_EVENT)
 			return 0;
 
-		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
+		switch (action) {
 		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 			break;	/* Process these in fast-path */
@@ -1001,6 +1007,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	g2h->info.head = (head + avail) % g2h->info.size;
 	desc_write(xe, g2h, head, g2h->info.head);
 
+	trace_xe_guc_ctb_g2h(ct_to_gt(ct)->info.id, action, len,
+			     g2h->info.head, tail);
+
 	return len;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e32f1cad51d9..d493aa183ed6 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -520,6 +520,7 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 TRACE_EVENT(xe_guc_ct_h2g_flow_control,
 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
 	    TP_ARGS(_head, _tail, size, space, len),
+/* GuC */
 
 	    TP_STRUCT__entry(
 		     __field(u32, _head)
@@ -567,6 +568,46 @@ TRACE_EVENT(xe_guc_ct_g2h_flow_control,
 		      __entry->space, __entry->len)
 );
 
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
 #endif
 
 /* This part must be outside protection */
-- 
2.25.1

