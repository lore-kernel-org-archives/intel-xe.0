Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2298CFA472
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BCC10E7EC;
	Fri, 21 Nov 2025 03:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWKT1dfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6610E7E8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697142; x=1795233142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hqGGem+BNLrIQ3K5vOs2z1WvE16FlCLSnYSKsAgK3iQ=;
 b=FWKT1dfev3DyA65/kfJWmaDzV418JTFr+4NAL/ZcTC2RoJl8YQd//N5V
 g/2czxxUeQUifgN8WzWWgzBMUCKwxuYl5XPS33ckmY4Hc+fSjAaSTZzep
 RVcTFGfXyFvojGQFsiysmrmf7AwI6NpYSqRFgylA79ZX9I3GWBDXuPrkq
 PuoapoJKkdx4sxgIfzdGfSZUQv62b0gVxRPPiQiEVtEPE6+ASI9qCRYSQ
 w8JIJUrW0F8JFgSQd5XdCXFLTKkQRLhra/i26y3fmFNjcSo0wmxTKa9M9
 DiqL3UlgO6Lf5jhW0LP3dYiP9JgLdN+2gx9/X+Al+LCLHJiFAUQxLgpWN g==;
X-CSE-ConnectionGUID: y8nyv4fgQdGNao21sm46bg==
X-CSE-MsgGUID: TEiP+UViSTS8ifxwH5lQ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76110542"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="76110542"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
X-CSE-ConnectionGUID: fPp6yMquROiwrfkdIh7k1A==
X-CSE-MsgGUID: 2lQgUxaQT066AgVVWZpHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190857829"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 14/18] drm/xe/multi_queue: Support active group after
 primary is destroyed
Date: Thu, 20 Nov 2025 19:51:48 -0800
Message-ID: <20251121035147.766072-34-niranjana.vishwanathapura@intel.com>
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

Add support to keep the group active after the primary queue is
destroyed. Instead of killing the primary queue during exec_queue
destroy ioctl, kill it when all the secondary queues of the group
are killed.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  7 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
 include/uapi/drm/xe_drm.h                |  4 ++
 5 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 037206c8b543..e72294a7d4b1 100644
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
index ab161b74fef0..839fb08f09e7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -417,6 +417,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
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
@@ -629,6 +649,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	kref_init(&group->kill_refcount);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
@@ -704,6 +725,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
 
 	q->multi_queue.pos = pos;
 
+	if (group->primary->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_get(group);
+		q->multi_queue.keep_active = true;
+	}
+
 	return 0;
 }
 
@@ -717,6 +743,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
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
@@ -735,12 +766,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
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
 
@@ -1286,6 +1329,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
+
+	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
+		xe_exec_queue_group_kill_put(q->multi_queue.group);
+		q->multi_queue.keep_active = false;
+	}
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -1312,7 +1360,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
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
index 5721fb4bad1a..c6b80977ff4f 100644
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
 };
@@ -159,6 +161,8 @@ struct xe_exec_queue {
 		u8 valid:1;
 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
 		u8 is_primary:1;
+		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
+		u8 keep_active:1;
 	} multi_queue;
 
 	/** @sched_props: scheduling properties */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 71a851615876..74cbebb24aa5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1260,6 +1260,9 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
+ *    set, then the multi-queue group is kept active after the primary queue is
+ *    destroyed.
  *    All the other non-relevant bits of extension's 'value' field while adding the
  *    primary or the secondary queues of the group must be set to 0.
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
@@ -1307,6 +1310,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.0

