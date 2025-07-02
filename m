Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B62BC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239410E7B9;
	Wed,  2 Jul 2025 23:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNJNT0dJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADAF10E7B4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499643; x=1783035643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKZE0MCw+scWR20R+Lgeo8iaHYQRGyGiT2Qjok4oGoE=;
 b=SNJNT0dJtT37N9c4vqf/cOU0pau0BzSpe03wumTpT0pwYSfjeRL0fgMF
 SM/bFWLIzq5g/yG8XHJQjvXkXbx7bu1Q/rspEUxep4r9xIxYaQ2vYLWss
 9qnIUHVuiL57XZAXPc/OQ/6RnTgy2BLl0EK1YN/f9TAklYV7CZ1UPH+xZ
 UAa55XAOZ9exSIpdBten9u36FRafM5QSUmX7qlVZv2PXoSPM3M9ulCP1y
 UW854MWTnab2kqRO9NEX5C7HLaALqn0nRsk+iKlibE2eFY+cvlCAucdCU
 KZSveSdHK9F4cw18cd8hfsiRksJQv8Vsm3sZ5FI7ehdusCo6qfrcF5t5e g==;
X-CSE-ConnectionGUID: JeP03/YVSWWCULS5C+dBoA==
X-CSE-MsgGUID: QlOvtFAqQF2WYEYe7RsITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489474"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: WpaSLp9sRS+HexkIFii+Iw==
X-CSE-MsgGUID: VnEJ5b22SMaDavFSKJETag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624535"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Date: Wed,  2 Jul 2025 16:42:18 -0700
Message-Id: <20250702234222.3278264-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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

Add a generic dependency scheduler for GT TLB invalidations, used to
schedule jobs that issue GT TLB invalidations to bind queues.

v2:
 - Use shared GT TLB invalidation queue for dep scheduler
 - Break allocation of dep scheduler into its own function
 - Add define for max number tlb invalidations
 - Skip media if not present

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 48 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 13 +++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..7aaf669cf5fc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
@@ -39,6 +40,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	int i;
+
+	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
+		if (q->tlb_inval[i].dep_scheduler)
+			xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
+
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 	if (q->vm)
@@ -50,6 +57,39 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	kfree(q);
 }
 
+static int alloc_dep_schedulers(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	struct xe_tile *tile = gt_to_tile(q->gt);
+	int i;
+
+	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
+		struct xe_dep_scheduler *dep_scheduler;
+		struct xe_gt *gt;
+		struct workqueue_struct *wq;
+
+		if (i == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
+			gt = tile->primary_gt;
+		else
+			gt = tile->media_gt;
+
+		if (!gt)
+			continue;
+
+		wq = gt->tlb_invalidation.job_wq;
+
+#define MAX_TLB_INVAL_JOBS	16	/* Picking a reasonable value */
+		dep_scheduler = xe_dep_scheduler_create(xe, wq, q->name,
+							MAX_TLB_INVAL_JOBS);
+		if (IS_ERR(dep_scheduler))
+			return PTR_ERR(dep_scheduler);
+
+		q->tlb_inval[i].dep_scheduler = dep_scheduler;
+	}
+#undef MAX_TLB_INVAL_JOBS
+
+	return 0;
+}
+
 static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 						   struct xe_vm *vm,
 						   u32 logical_mask,
@@ -94,6 +134,14 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	else
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
+	if (q->flags & (EXEC_QUEUE_FLAG_MIGRATE | EXEC_QUEUE_FLAG_VM)) {
+		err = alloc_dep_schedulers(xe, q);
+		if (err) {
+			__xe_exec_queue_free(q);
+			return ERR_PTR(err);
+		}
+	}
+
 	if (vm)
 		q->vm = xe_vm_get(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index abdf4a57e6e2..ba443a497b38 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -134,6 +134,19 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+#define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
+#define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT	1
+#define XE_EXEC_QUEUE_TLB_INVAL_COUNT		(XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT  + 1)
+
+	/** @tlb_inval: TLB invalidations exec queue state */
+	struct {
+		/**
+		 * @tlb_inval.dep_scheduler: The TLB invalidation
+		 * dependency scheduler
+		 */
+		struct xe_dep_scheduler *dep_scheduler;
+	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
+
 	/** @pxp: PXP info tracking */
 	struct {
 		/** @pxp.type: PXP session type used by this queue */
-- 
2.34.1

