Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860CFCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 09:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88A10E4B3;
	Thu, 19 Oct 2023 09:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E61010E4B3
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697707610; x=1729243610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gXOjX4sBI7qDC14JGQx31F2FNGO2tn8uycNL4JFVZLA=;
 b=lqUngiTAuB1cgTyaLSGaXIHqvnqkSM6I8pbVq3mnfbhbarCvR8ZlyFVx
 L2h2BkjKEwLiuek5CDI0Iayb5AP+v1tTvpAoFLECa59tiN+ueSmKwXcyA
 nKG3Oe4d6UWtFeiGnnc6GN3aNGpcCK8vi0i/ME2ODU5v3+hGsAUFStvrl
 NJa2v3gmZtm2jXg5zLLmH2aFiLbWb2vtRwGrlEfepbjRxhgBenkYIG95p
 etip8F15/HjLaNp4N6dFXI6/FPcyzlBRT9+60tN6WvQw1pBxYqKzBSbY0
 oC0i3Wb5twHJHBGDawRngrujretUafrM1JY/xmG9YLjbAxIGvMZoGebY1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="386037766"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="386037766"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900671230"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="900671230"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:24:42 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:01:40 +0530
Message-Id: <20231019093140.1901665-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019093140.1901665-1-balasubramani.vivekanandan@intel.com>
References: <20231019093140.1901665-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/trace: Optimize trace definition
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
Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 83 +++++++++++++++--------------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index d493aa183ed6..d55dd1521df3 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -517,55 +517,44 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
-TRACE_EVENT(xe_guc_ct_h2g_flow_control,
-	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
-	    TP_ARGS(_head, _tail, size, space, len),
 /* GuC */
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

