Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD31ED3E784
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A4B10E6C2;
	Thu, 11 Dec 2025 01:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSW/4Gd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AFE10E6B5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g+9GaEhbdgejnhHLKNvBDhG8xDEiSyHTemXEOdBksEg=;
 b=XSW/4Gd/fhkQriNYIgnTOI733NVfhauOA9SR6wUgrwOPlRuwKbWV3cBN
 +up5h6BQ65AX5XCfElHU+FMimaartebUdzEi0NQWHPr5+G83H5pDCVvu1
 A3ctfC7O1OhFYnRpeggw2QXh5V8mK35pZqv0DqhdW5pOYsEfzJgaFlJtw
 +T/NoKcPBGVs5RGJtU7Vi7JhrHlMgJ/Hagt3fC3zBly0yWrAoqyVPZZKw
 vwk/lrWEVS8Z5BpaiSf7StfwdJ5AuDcOwCPX7rsSFbHzyoz6YIPDlBi77
 i9McYD3geQ+XCN1N0dqS7x8sate9vB7yF8TaJXwL219p4zNOcoqIc//eZ g==;
X-CSE-ConnectionGUID: iw1F7SQFT4e8HToVtdWbwg==
X-CSE-MsgGUID: QDdlVnuVT3Slxrkk+HpRyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442863"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442863"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
X-CSE-ConnectionGUID: nRVJr68hS6CLE6DBsKcZEg==
X-CSE-MsgGUID: c+FQ5Vc4SR2b+0z+QEijrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664091"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 04/17] drm/xe/multi_queue: Add multi queue priority property
Date: Wed, 10 Dec 2025 17:02:52 -0800
Message-ID: <20251211010249.1647839-23-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

v2: Add kernel doc for enum xe_multi_queue_priority,
    Add assert for priority values, fix includes and
    declarations (Matt Brost)
v3: update uapi kernel-doc (Matt Brost)
v4: uapi change due to rebase

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 17 +++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 16 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
 drivers/gpu/drm/xe/xe_lrc.c              | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +++
 include/uapi/drm/xe_drm.h                |  4 ++++
 6 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f76ec277c5af..aa46d154d04a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -180,6 +180,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -764,6 +765,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
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
@@ -774,6 +786,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
+							exec_queue_set_multi_queue_priority,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -796,7 +810,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 06fb518b8533..46e5f4715a0d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
 	XE_EXEC_QUEUE_PRIORITY_COUNT
 };
 
+/**
+ * enum xe_multi_queue_priority - Multi Queue priority values
+ *
+ * The priority values of the queues within the multi queue group.
+ */
+enum xe_multi_queue_priority {
+	/** @XE_MULTI_QUEUE_PRIORITY_LOW: Priority low */
+	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
+	/** @XE_MULTI_QUEUE_PRIORITY_NORMAL: Priority normal */
+	XE_MULTI_QUEUE_PRIORITY_NORMAL,
+	/** @XE_MULTI_QUEUE_PRIORITY_HIGH: Priority high */
+	XE_MULTI_QUEUE_PRIORITY_HIGH,
+};
+
 /**
  * struct xe_exec_queue_group - Execution multi queue group
  *
@@ -131,6 +145,8 @@ struct xe_exec_queue {
 	struct {
 		/** @multi_queue.group: Queue group information */
 		struct xe_exec_queue_group *group;
+		/** @multi_queue.priority: Queue priority within the multi-queue group */
+		enum xe_multi_queue_priority priority;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
 		u8 pos;
 		/** @multi_queue.valid: Queue belongs to a multi queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index bafe42393d22..7cca03d4296c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -640,6 +640,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 		return;
 	}
 
+	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
 	xe_guc_exec_queue_group_cgp_update(xe, q);
 
 	WRITE_ONCE(group->sync_pending, true);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a05060f75e7e..70eae7d03a27 100644
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
@@ -1399,6 +1404,30 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 }
 
+static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
+{
+	struct xe_device *xe = gt_to_xe(lrc->gt);
+
+	xe_assert(xe, (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
+		       priority <= XE_MULTI_QUEUE_PRIORITY_HIGH));
+
+	/* xe_multi_queue_priority is directly mapped to LRC priority values */
+	return priority;
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
 		       struct xe_vm *vm, void *replay_state, u32 ring_size,
 		       u16 msix_vec,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a32472b92242..8acf85273c1a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -13,6 +13,7 @@ struct drm_printer;
 struct xe_bb;
 struct xe_device;
 struct xe_exec_queue;
+enum xe_multi_queue_priority;
 enum xe_engine_class;
 struct xe_gt;
 struct xe_hw_engine;
@@ -135,6 +136,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
 
 u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 
+void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
+
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19a8ae856a17..fd79d78de2e9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
  *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
  *    All the other non-relevant bits of extension's 'value' field while adding the
  *    primary or the secondary queues of the group must be set to 0.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
+ *    priority within the multi-queue group. Current valid priority values are 0–2
+ *    (default is 1), with higher values indicating higher priority.
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1323,6 +1326,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

