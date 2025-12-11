Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B94D3E784
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D3A10E6B5;
	Thu, 11 Dec 2025 01:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCy4w+V9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B51710E6CC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414979; x=1796950979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HiOXEzEJnhpztXvOLkCsRtu5GXyaISlUKbYL+bgpzrw=;
 b=QCy4w+V9eG2b7ncpupZzXrcGpO4CZc9rx1fjigl+dsHb4U7AdgCMMe1/
 Kb3J791gBOdMdedzo7/gRHqUuid4FQCGWEfupDb1niKU/gOcFc3gRLYRd
 1CryNvN12qyKBaYQ8pIGwh0oSZevryHW7cg4Lu7tdWYWDV4pHlGz3xx6n
 D5Yr3LlLWum2inddRJYRqPSYGtWansgq5uFlkTK+2KBhA3QEq6SFGjJwq
 1atDJgOLk6Mj/IXdv+bp0nRm/Bhj98qdsPXwIjWDDgttGb/OH7DJD8L/J
 x7IYJleIBZBLZpCD7reaqTAhxhzXQQVRumhWKcFATsLSphuTjAC3wANdu w==;
X-CSE-ConnectionGUID: +iCI5CAjR3+Ymn0hkt62lQ==
X-CSE-MsgGUID: VYqZ/LNaSeazz34r8Gnnhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442876"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:59 -0800
X-CSE-ConnectionGUID: Pmm1ItKtREmfjcXI783O4Q==
X-CSE-MsgGUID: 4yfcPJWMTQ2ANqYzTi/zPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664138"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 15/17] drm/xe/multi_queue: Support active group after
 primary is destroyed
Date: Wed, 10 Dec 2025 17:03:03 -0800
Message-ID: <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Add support to keep the group active after the primary queue is
destroyed. Instead of killing the primary queue during exec_queue
destroy ioctl, kill it when all the secondary queues of the group
are killed.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  7 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
 include/uapi/drm/xe_drm.h                |  4 ++
 5 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7a498c8db7b1..24efb6a3e0ea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
-		xe_exec_queue_kill(q);
+
+		if (xe_exec_queue_is_multi_queue_primary(q))
+			xe_exec_queue_group_kill_put(q->multi_queue.group);
+		else
+			xe_exec_queue_kill(q);
+
 		xe_exec_queue_put(q);
 	}
 	xa_for_each(&xef->vm.xa, idx, vm)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d337b7bc2b80..3f4840d135a0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -418,6 +418,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 }
 ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 
+static void xe_exec_queue_group_kill(struct kref *ref)
+{
+	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
+							 kill_refcount);
+	xe_exec_queue_kill(group->primary);
+}
+
+static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
+{
+	kref_get(&group->kill_refcount);
+}
+
+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
+{
+	if (!group)
+		return;
+
+	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
+}
+
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
@@ -650,6 +670,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	kref_init(&group->kill_refcount);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
@@ -725,6 +746,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 
 	q->multi_queue.pos = pos;
 
+	if (group->primary->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_get(group);
+		q->multi_queue.keep_active = true;
+	}
+
 	return 0;
 }
 
@@ -738,6 +764,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
 	lrc = xa_erase(&group->xa, q->multi_queue.pos);
 	xe_assert(xe, lrc);
 	xe_lrc_put(lrc);
+
+	if (q->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_put(group);
+		q->multi_queue.keep_active = false;
+	}
 }
 
 static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
@@ -759,12 +790,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
 		return -EINVAL;
 
 	if (value & DRM_XE_MULTI_GROUP_CREATE) {
-		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
+		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
+					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
+			return -EINVAL;
+
+		/*
+		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
+		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
+		 */
+		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
+				 xe_vm_in_preempt_fence_mode(q->vm)))
 			return -EINVAL;
 
 		q->multi_queue.valid = true;
 		q->multi_queue.is_primary = true;
 		q->multi_queue.pos = 0;
+		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
+			q->multi_queue.keep_active = true;
+
 		return 0;
 	}
 
@@ -1312,6 +1355,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
+
+	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_put(q->multi_queue.group);
+		q->multi_queue.keep_active = false;
+	}
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -1338,7 +1386,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (q->vm && q->hwe->hw_engine_group)
 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 
-	xe_exec_queue_kill(q);
+	if (xe_exec_queue_is_multi_queue_primary(q))
+		xe_exec_queue_group_kill_put(q->multi_queue.group);
+	else
+		xe_exec_queue_kill(q);
 
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ffcc1feb879e..10abed98fb6b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
 }
 
+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
+
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5fc516b0bb77..67ea5eebf70b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -62,6 +62,8 @@ struct xe_exec_queue_group {
 	struct list_head list;
 	/** @list_lock: Secondary queue list lock */
 	struct mutex list_lock;
+	/** @kill_refcount: ref count to kill primary queue */
+	struct kref kill_refcount;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 	/** @banned: Group banned */
@@ -161,6 +163,8 @@ struct xe_exec_queue {
 		u8 valid:1;
 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
 		u8 is_primary:1;
+		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
+		u8 keep_active:1;
 	} multi_queue;
 
 	/** @sched_props: scheduling properties */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 705081bf0d81..bd6154e3b728 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
+ *    set, then the multi-queue group is kept active after the primary queue is
+ *    destroyed.
  *    All the other non-relevant bits of extension's 'value' field while adding the
  *    primary or the secondary queues of the group must be set to 0.
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
@@ -1328,6 +1331,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.0

