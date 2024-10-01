Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC1CEACDC
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F110E646;
	Tue,  1 Oct 2024 14:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJEaTyYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111910E2C0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794421; x=1759330421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TYU3KbgUx52W6mPWBNooXAjHkyc1rBWyTK6AnGCp840=;
 b=mJEaTyYVqVRGmlnQiY872f5WwLb2BzBEbQE+oV0u+vhnXERwiYE536ie
 6gFPuXbV2EqbCqoBAhrqQUpa/MlOfuOA8cY/mCWRXljds+biCrS+/kVKU
 E8j8dSBE/MviR2ajQq+Ow+hWV084tGQY8OCqSWQDb4iacxg0KPvxkErsX
 medvuVYrnN7FZBu40pYtvvUgwiXSGbYYf2x3tgntsdbWimBn1QHP7B2Kz
 wXFhrPOTHvK2dWMSCCcVxPYMH5aOjTWxUefP2NZw38chL0DiOHdVyMzPa
 9FapogR4awx3+p1dfXJuilMf10MP8ti0b+w0bxeSvX9nGy7E6Ces+BK7O w==;
X-CSE-ConnectionGUID: 1xkwEwTzS8CWDL1LxxI+Og==
X-CSE-MsgGUID: BYvaUZPWRv+Bw3aXhscONg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091389"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:40 -0700
X-CSE-ConnectionGUID: dnk53DBxTd+rEvTBVMyFGw==
X-CSE-MsgGUID: CykGZBcURjG1oHZ8SnfdsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048657"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:39 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/18] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Tue,  1 Oct 2024 17:42:54 +0300
Message-Id: <20241001144306.1991001-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduce exec queue immutable property of eudebug
with a flags as value to enable eudebug specific feature(s).

For now engine lrc will use this flag to set up runalone
hw feature. Runalone is used to ensure that only one hw engine
of group [rcs0, ccs0-3] is active on a tile.

Note: unlike the i915, xe allows user to set runalone
also on devices with single render/compute engine. It should not
make much difference, but leave control to the user.

v2: - check CONFIG_DRM_XE_EUDEBUG and LR mode (Matthew)
    - disable preempt (Dominik)
    - lrc_create remove from engine init

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c          |  4 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 46 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 16 +++++++--
 drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
 include/uapi/drm/xe_drm.h                |  3 +-
 8 files changed, 74 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index f90b15fc4964..15a3f8b087a0 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -1279,7 +1279,7 @@ static int exec_queue_create_event(struct xe_eudebug *d,
 	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
 	int i;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
@@ -1331,7 +1331,7 @@ static int exec_queue_destroy_event(struct xe_eudebug *d,
 	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
 	int i;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e6b2487de48e..c2d6993ac103 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -109,6 +109,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_vm *vm = q->vm;
+	u32 flags = 0;
 	int i, err;
 
 	if (vm) {
@@ -117,8 +118,11 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			return err;
 	}
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		flags |= LRC_CREATE_RUNALONE;
+
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -393,6 +397,42 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
+static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
+				  u64 value)
+{
+	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+
+	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
+			      q->class != XE_ENGINE_CLASS_COMPUTE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, (value & ~known_flags)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_lr(q)))
+		return -EINVAL;
+	/*
+	 * We want to explicitly set the global feature if
+	 * property is set.
+	 */
+	if (XE_IOCTL_DBG(xe,
+			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
+		return -EINVAL;
+
+	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+	q->sched_props.preempt_timeout_us = 0;
+
+	return 0;
+}
+
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q)
+{
+	return q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -400,6 +440,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -419,7 +460,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 90c7f73eab88..421d8dc89814 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -85,4 +85,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 7deb480e26af..9eced5867f07 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -90,6 +90,13 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
+	/**
+	 * @eudebug_flags: immutable eudebug flags for this exec queue.
+	 * Set up with DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG.
+	 */
+#define EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		BIT(0)
+	unsigned long eudebug_flags;
+
 	union {
 		/** @multi_gt_list: list head for VM bind engines if multi-GT */
 		struct list_head multi_gt_list;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f3b71fe7a96d..b425c48ca49d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f0976230012a..68a411722f09 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -893,7 +893,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u32 flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -1010,6 +1010,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
+	if (flags & LRC_CREATE_RUNALONE) {
+		u32 ctx_control = xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL);
+
+		drm_dbg(&xe->drm, "read CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
+		ctx_control |= _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE);
+		drm_dbg(&xe->drm, "written CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
+
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL, ctx_control);
+	}
+
 	return 0;
 
 err_lrc_finish:
@@ -1029,7 +1039,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1038,7 +1048,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..16a9264fdcfa 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -22,8 +22,10 @@ struct xe_vm;
 
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
+#define LRC_CREATE_RUNALONE	BIT(0)
+
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7e66e9117f49..985dcf852458 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1110,7 +1110,8 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
+#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

