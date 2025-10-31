Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DEFCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DAA10E306;
	Fri, 31 Oct 2025 18:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBPrEr73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306BB10E2FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935384; x=1793471384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vC8vfukaL3jCKlZxRSgEKb6In6WB5iQWkx1oqb9kWyQ=;
 b=KBPrEr73Ssltk7h+lHmjGoDhPU3Hb3b9DnNZdQ5y3r9bUD9BjHY9VDdb
 smw8DzYhx62Oeq8ESrEjMQQy4VAWpa5CT4i6EhXLfH6xuAv9DVaqFYRAO
 J6ryZvpwsaDYzKuY2b0+EMW8Uj53FQ0e8ebdzdqnbDL6y4QG+J4ZVxOEP
 1YOejvkNCBkBLmU6AvFA14bR95xF2tuXBlg+QqZESX/2RDBhuP6jRolpy
 AP1Lc/WleUuV+JWRuDxM11bqOtwRTRRNiAZFv0wxGuC3FADCQI9ERxrLG
 xtFaeodCu/emuizqIEw45+tgsjBZ2in6ffv7VrX4ArDzj8fHJ3Km4/Fx8 w==;
X-CSE-ConnectionGUID: +ujSOtn6QZG2NL+NPmVPVQ==
X-CSE-MsgGUID: N/ptIpXVTwuDjZDtbMF7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123853"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123853"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: edHnM0IIR/KZkGFXZFAxww==
X-CSE-MsgGUID: py8gVZLsTpy6KN7YFiRMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987631"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/16] drm/xe/multi_queue: Add multi queue priority property
Date: Fri, 31 Oct 2025 11:29:24 -0700
Message-ID: <20251031182936.1882062-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Add support for queues of a multi queue group to set
their priority within the queue group by adding property
DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
This is the only other property supported by secondary
queues of a multi queue group, other than
DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 17 ++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
 drivers/gpu/drm/xe/xe_lrc.c              | 32 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  5 ++++
 include/uapi/drm/xe_drm.h                |  3 +++
 6 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 86404a7c9fe4..0da256428916 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -177,6 +177,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -722,6 +723,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
 	return xe_exec_queue_group_validate(xe, q, value);
 }
 
+static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
+					       u64 value)
+{
+	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
+		return -EINVAL;
+
+	q->multi_queue.priority = value;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -731,6 +743,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
+							exec_queue_set_multi_queue_priority,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -752,7 +766,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 38e47b003259..964a0e6654c7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -31,6 +31,12 @@ enum xe_exec_queue_priority {
 	XE_EXEC_QUEUE_PRIORITY_COUNT
 };
 
+enum xe_multi_queue_priority {
+	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
+	XE_MULTI_QUEUE_PRIORITY_NORMAL,
+	XE_MULTI_QUEUE_PRIORITY_HIGH,
+};
+
 /**
  * struct xe_exec_queue_group - Execution multi queue group
  *
@@ -134,6 +140,8 @@ struct xe_exec_queue {
 	struct {
 		/** @multi_queue.group: Queue group information */
 		struct xe_exec_queue_group *group;
+		/** @multi_queue.priority: Queue priority within the multi-queue group */
+		enum xe_multi_queue_priority priority;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
 		u8 pos;
 		/** @multi_queue.valid: Queue belongs to a multi queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d2aa9a2524e7..5ec144c1c2dc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -634,6 +634,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 		return;
 	}
 
+	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
 	xe_guc_exec_queue_group_cgp_update(xe, q);
 
 	WRITE_ONCE(group->sync_pending, true);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5083c99dd50..45fc5bc5de5c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -44,6 +44,11 @@
 #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
 
+#define LRC_PRIORITY				GENMASK_ULL(10, 9)
+#define LRC_PRIORITY_LOW			0
+#define LRC_PRIORITY_NORMAL			1
+#define LRC_PRIORITY_HIGH			2
+
 /*
  * Layout of the LRC and associated data allocated as
  * lrc->bo:
@@ -1386,6 +1391,33 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 }
 
+static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+
+	/* xe_multi_queue_priority is directly mapped to LRC priority values */
+	if (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
+	    priority <= XE_MULTI_QUEUE_PRIORITY_HIGH)
+		return priority;
+
+	/* Fallback to NORMAL if out of range */
+	drm_warn(&xe->drm, "Unknown multi queue priority: %d, defaulting to NORMAL\n", priority);
+	return LRC_PRIORITY_NORMAL;
+}
+
+/**
+ * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
+ * @lrc: Logical Ring Context
+ * @priority: Multi queue priority of the exec queue
+ *
+ * Convert @priority to LRC multi queue priority and update the @lrc descriptor
+ */
+void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
+{
+	lrc->desc &= ~LRC_PRIORITY;
+	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
+}
+
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
 		       u32 init_flags)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 2fb628da5c43..3e6b356e0d1c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -8,11 +8,14 @@
 #include <linux/types.h>
 
 #include "xe_lrc_types.h"
+#include "xe_exec_queue_types.h"
 
 struct drm_printer;
 struct xe_bb;
 struct xe_device;
 struct xe_exec_queue;
+enum xe_exec_queue_priority;
+enum xe_multi_queue_priority;
 enum xe_engine_class;
 struct xe_gt;
 struct xe_hw_engine;
@@ -133,6 +136,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
 
 u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 
+void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
+
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d903b3a55ec1..8ab44413646a 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1258,6 +1258,8 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue id is specified in the 'value' field.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
+ *    priority within the multi-queue group.
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1300,6 +1302,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

