Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E416D3B7F8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2599E10E49A;
	Tue,  9 Dec 2025 03:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVxKHwQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438210E48B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250467; x=1796786467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QC43GfV/wM+R2zA9P5GI97hKj2cZjNoaOWrK9KaXTeY=;
 b=hVxKHwQb3foHlfep463mxAGDe0yCNUtzzwunT5PW7lgduqyC3kEmy5z+
 V1ivUUGpmM/4UoWyQ5E1NsVWqyDggMKKkWVdsfuW7+99/OkzWKsdG5Rom
 69Lsd+GihefWLJV/G1RDjqf8y2j1cLCNe1rTwYlzrdtFGvXr6CvJ55o5p
 vjHoyOK7qfGAO9UcH/D5Pj1EUtK1I6zgSp8s/Mj08HWXMKoPkvYAds2qT
 CouukrRj3tNv6QcqtOFVbHdTSmlmwJWjQjdPH1NlPSIL/OketLjkOR1Wd
 4AeVrIB2tmozy5i1ktTA9KsR5pjAzOg/08dGtY+YVr1L1XmQ6Gdex0k4C A==;
X-CSE-ConnectionGUID: AM7pDSYMS2GqI6rXbu6T1Q==
X-CSE-MsgGUID: gFnS58VJR+qCGdXpJakghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254151"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
X-CSE-ConnectionGUID: 1KH/JesuSBijrEsclpcnFg==
X-CSE-MsgGUID: TzgPcVEUR8mC7GKI1pPV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289655"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 14/18] drm/xe/multi_queue: Tracepoint support
Date: Mon,  8 Dec 2025 19:21:04 -0800
Message-ID: <20251209032055.1539229-34-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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
index 3d6eda29a819..82a5ef270c28 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,7 +2008,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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

