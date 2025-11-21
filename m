Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9020DCFA479
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E710E7F1;
	Fri, 21 Nov 2025 03:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjYcGGlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853E710E7E5
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697142; x=1795233142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9grbG+IpkXUZNxJA1TFyfHaWbWNarpImoHYrcl2qYo=;
 b=QjYcGGlg2iBhZlOxfaoawMmEqY9hNBORnssW5fXjxPugrk96DBgws56N
 2y2blHGdJaSVXTxBtGDzJ8ShO5+tP0pi+tgr8u91TjAWBGQ1iBCFA+mmB
 JUem4azBFQLZLPCYPX8E/Nfi3N/cQVMlryY4CFXdd011eXJ/wjNHSXcvM
 hdh11i9X5uWmeBPS5Yq1hlz7dzkMTz7zUUk9xUN5bLlDDkLEFDvDpCPLo
 RvhlA8iM/zfa2BQYScO/DnZ1T+6Ny+EbTVZESooLcGCCrezphtoEVMR+l
 r++SoaDDv81SEugv5zLjlypokbRgl5b9xB5DLrKQ6wScQzCp/nBp9mo3u A==;
X-CSE-ConnectionGUID: JKDbbRR0Tb2wvR8dYZQx4A==
X-CSE-MsgGUID: 1iIKqVhHQ3GG7MpSRz8WIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76110540"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="76110540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
X-CSE-ConnectionGUID: BjxdT8XFSOOMfLt/IFmdyA==
X-CSE-MsgGUID: 3+MQUMCCQ5CSdR+IDL7wvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190857826"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 13/18] drm/xe/multi_queue: Tracepoint support
Date: Thu, 20 Nov 2025 19:51:47 -0800
Message-ID: <20251121035147.766072-33-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
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

Add xe_exec_queue_create_multi_queue event with
multi-queue information.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  5 +++-
 drivers/gpu/drm/xe/xe_trace.h      | 41 ++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 932be1e5001e..fbe3de30af60 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2051,7 +2051,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		mutex_unlock(&group->list_lock);
 	}
 
-	trace_xe_exec_queue_create(q);
+	if (xe_exec_queue_is_multi_queue(q))
+		trace_xe_exec_queue_create_multi_queue(q);
+	else
+		trace_xe_exec_queue_create(q);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index c9d0748dae9d..6d12fcc13f43 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 
 #include "xe_exec_queue_types.h"
+#include "xe_exec_queue.h"
 #include "xe_gpu_scheduler_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
@@ -97,11 +98,51 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			      __entry->guc_state, __entry->flags)
 );
 
+DECLARE_EVENT_CLASS(xe_exec_queue_multi_queue,
+		    TP_PROTO(struct xe_exec_queue *q),
+		    TP_ARGS(q),
+
+		    TP_STRUCT__entry(
+			     __string(dev, __dev_name_eq(q))
+			     __field(enum xe_engine_class, class)
+			     __field(u32, logical_mask)
+			     __field(u8, gt_id)
+			     __field(u16, width)
+			     __field(u32, guc_id)
+			     __field(u32, guc_state)
+			     __field(u32, flags)
+			     __field(u32, primary)
+			     ),
+
+		    TP_fast_assign(
+			   __assign_str(dev);
+			   __entry->class = q->class;
+			   __entry->logical_mask = q->logical_mask;
+			   __entry->gt_id = q->gt->info.id;
+			   __entry->width = q->width;
+			   __entry->guc_id = q->guc->id;
+			   __entry->guc_state = atomic_read(&q->guc->state);
+			   __entry->flags = q->flags;
+			   __entry->primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
+			   ),
+
+		    TP_printk("dev=%s, %d:0x%x, gt=%d, width=%d guc_id=%d, guc_state=0x%x, flags=0x%x, primary=%d",
+			      __get_str(dev), __entry->class, __entry->logical_mask,
+			      __entry->gt_id, __entry->width, __entry->guc_id,
+			      __entry->guc_state, __entry->flags,
+			      __entry->primary)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_create,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue_multi_queue, xe_exec_queue_create_multi_queue,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_supress_resume,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.43.0

