Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2E7D11192
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73EC10E6EF;
	Wed, 26 Nov 2025 19:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu8amxFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460F10E709
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZC8sHt1UZ6HnOSZZOBhRcysFJZij8/QecohqiYcyqnw=;
 b=cu8amxFg9P16qvaJj55cKWGMaYCpxKEOWYcAINCPuENNCfoou+LU6bqV
 eH9GbIxhH6gJI9JljMFIl16kOVU1Hs8BJRshjJtWwmUyQNNW0IolTFDtw
 xokJgmcpmrmPeL0R0QVMAUuY5bkdAJAnBMjAsNsM18+yuaQBcHldt/bzG
 XV3U9cqiSsZVa5ame/hNx/PDGV2kCAnRcquD1fE+37Gp6eoG6Aj2w3Sx5
 S9NZJ/9uuCunYKSWlD9KH2eWlOQqMm/OFgVOYvAoA2vOHI0ApfcJ7eZJK
 1mcwDBLJ9LvlYRgUJGSTdnCo973FrDtdESCwqWhKwAxabyHpjs00Klvli A==;
X-CSE-ConnectionGUID: YZo/lky8QFm7b4LQ1GYYgg==
X-CSE-MsgGUID: yGxa5FdTTOu2edxSdjJKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269529"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269529"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: jIHuL8e3Td+dWDTnfll0yQ==
X-CSE-MsgGUID: 8i2ACogcSrK+P+QncwrFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121217"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 9/9] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Wed, 26 Nov 2025 10:59:52 -0800
Message-Id: <20251126185952.546277-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
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

Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
queue default state to user data passed in. The intent is for a Mesa
tool to use this replay GPU hangs.

v2:
 - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
 - Fix the page size math calculation to avoid a crash
v4:
 - Use vmemdup_user (Maarten)
 - Copy default state first into LRC, then replay state (Testing, Carlos)

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 26 +++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 42 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
 5 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8724f8de67e2..226d07a3d852 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -79,6 +79,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (q->xef)
 		xe_file_put(q->xef);
 
+	kvfree(q->replay_state);
 	kfree(q);
 }
 
@@ -225,8 +226,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 		struct xe_lrc *lrc;
 
 		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
-				    q->msix_vec, flags);
+		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+				    xe_lrc_ring_size(), q->msix_vec, flags);
 		if (IS_ERR(lrc)) {
 			err = PTR_ERR(lrc);
 			goto err_lrc;
@@ -567,6 +568,23 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
 	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
 }
 
+static int exec_queue_set_hang_replay_state(struct xe_device *xe,
+					    struct xe_exec_queue *q,
+					    u64 value)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
+	u64 __user *address = u64_to_user_ptr(value);
+	void *ptr;
+
+	ptr = vmemdup_user(address, size);
+	if (XE_IOCTL_DBG(xe, IS_ERR(ptr)))
+		return PTR_ERR(ptr);
+
+	q->replay_state = ptr;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -575,6 +593,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
+	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -595,7 +614,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 771ffe35cd0c..3ba10632dcd6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -167,6 +167,9 @@ struct xe_exec_queue {
 	/** @ufence_timeline_value: User fence timeline value */
 	u64 ufence_timeline_value;
 
+	/** @replay_state: GPU hang replay state */
+	void *replay_state;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 769d05517f93..46c17a18a3f4 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2deca095607c..a05060f75e7e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -91,13 +91,19 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
 	return false;
 }
 
-size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+/**
+ * xe_gt_lrc_hang_replay_size() - Hang replay size
+ * @gt: The GT
+ * @class: Hardware engine class
+ *
+ * Determine size of GPU hang replay state for a GT and hardware engine class.
+ *
+ * Return: Size of GPU hang replay size
+ */
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	size_t size;
-
-	/* Per-process HW status page (PPHWSP) */
-	size = LRC_PPHWSP_SIZE;
+	size_t size = 0;
 
 	/* Engine context image */
 	switch (class) {
@@ -123,11 +129,18 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size += 1 * SZ_4K;
 	}
 
+	return size;
+}
+
+size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
+{
+	size_t size = xe_gt_lrc_hang_replay_size(gt, class);
+
 	/* Add indirect ring state page */
 	if (xe_gt_has_indirect_ring_state(gt))
 		size += LRC_INDIRECT_RING_STATE_SIZE;
 
-	return size;
+	return size + LRC_PPHWSP_SIZE;
 }
 
 /*
@@ -1387,7 +1400,8 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 }
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
+		       struct xe_vm *vm, void *replay_state, u32 ring_size,
+		       u16 msix_vec,
 		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1402,9 +1416,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->gt = gt;
-	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
+	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
 	lrc->size = lrc_size;
 	lrc->flags = 0;
 	lrc->ring.size = ring_size;
@@ -1441,11 +1453,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * scratch.
 	 */
 	map = __xe_lrc_pphwsp_map(lrc);
-	if (gt->default_lrc[hwe->class]) {
+	if (gt->default_lrc[hwe->class] || replay_state) {
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
 				 lrc_size - LRC_PPHWSP_SIZE);
+		if (replay_state)
+			xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
+					 replay_state, lrc->replay_size);
 	} else {
 		void *init_data = empty_lrc_data(hwe);
 
@@ -1553,6 +1568,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * xe_lrc_create - Create a LRC
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
+ * @replay_state: GPU hang replay state
  * @ring_size: LRC ring size
  * @msix_vec: MSI-X interrupt vector (for platforms that support it)
  * @flags: LRC initialization flags
@@ -1563,7 +1579,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags)
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1572,7 +1588,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c3288625d0c7..a32472b92242 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -50,7 +50,7 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec, u32 flags);
+			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
@@ -87,6 +87,7 @@ static inline size_t xe_lrc_ring_size(void)
 	return SZ_16K;
 }
 
+size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.34.1

