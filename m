Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB5CC41513
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 10:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBCD10E190;
	Mon, 16 Oct 2023 10:12:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2610E190
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697451152; x=1728987152;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=srRLHWjPXmyJ43nCftd/SoNVZTcli8+XxB08vpTqREE=;
 b=K9JfMkWWlaw6yXLdJ9pxrFxE6oELmBMP+EVM/NE+n2zm9BF+LeAtzhXj
 fz9eAViYRVTuDHojuWCSnfw7U6nZRpoW6rD7K1xquDoehFKNYLyKFL3f9
 pv0Osb8nmCS0wE4w6+TszHqa58zqbm5m5tgvQTfSpq9doI5kaEWtEKan2
 AO/fZq4swda3qzGHV1ywNDR17IgTH8SnfBxe1L/tbKhBw/LKmgMmmzKRo
 60+etSeR/VPrNQGJ2lS1gKDUVMI/J0dAgjiodFUdKv+ZTrE4bjvnWgoHH
 q1MWkIji1dUWiNF3k90pJoE8PNLNXdWbaTHvNOoCFMWyAtAk/GbpHMdyn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416560453"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="416560453"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825948511"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="825948511"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:12:31 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 15:47:20 +0530
Message-Id: <20231016101720.1657746-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/trace: Optimize trace definition
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

Make use of EVENT_CLASS to group similar trace events

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 83 +++++++++++++++--------------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 456c776f4be1..233b982f34da 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -517,55 +517,44 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
-TRACE_EVENT(xe_guc_ct_h2g_flow_control,
-	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	    TP_ARGS(_head, _tail, size, space, len),
 /* GUC */
+DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
+		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
+		    TP_ARGS(_head, _tail, size, space, len),
 
-	    TP_STRUCT__entry(
-		     __field(u32, _head)
-		     __field(u32, _tail)
-		     __field(u32, size)
-		     __field(u32, space)
-		     __field(u32, len)
-		     ),
-
-	    TP_fast_assign(
-		   __entry->_head = _head;
-		   __entry->_tail = _tail;
-		   __entry->size = size;
-		   __entry->space = space;
-		   __entry->len = len;
-		   ),
-
-	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
-		      __entry->_head, __entry->_tail, __entry->size,
-		      __entry->space, __entry->len)
-);
-
-TRACE_EVENT(xe_guc_ct_g2h_flow_control,
-	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	    TP_ARGS(_head, _tail, size, space, len),
-
-	    TP_STRUCT__entry(
-		     __field(u32, _head)
-		     __field(u32, _tail)
-		     __field(u32, size)
-		     __field(u32, space)
-		     __field(u32, len)
-		     ),
-
-	    TP_fast_assign(
-		   __entry->_head = _head;
-		   __entry->_tail = _tail;
-		   __entry->size = size;
-		   __entry->space = space;
-		   __entry->len = len;
-		   ),
-
-	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
-		      __entry->_head, __entry->_tail, __entry->size,
-		      __entry->space, __entry->len)
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
 );
 
 DECLARE_EVENT_CLASS(xe_guc_ctb,
-- 
2.25.1

