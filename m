Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2E0CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2D10E41F;
	Mon,  6 Oct 2025 11:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPUwgc46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279B910E41C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749463; x=1791285463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fu7W0lSpZ/8kbxKUBC1qOrNHUbTS2fccnqv3JgZDBPw=;
 b=lPUwgc46uoavZtfQjT0ZaRBhml7hFLZFJWs0WrkVMR/mUCI+6yVThn50
 saDCZMFAgh0jjeqogVxvcb4GFoZzLpGgpGhAbU9A9eljl1MVQZCPADTW9
 R/y0YwrYRK/VS9jidq5vZ2qNTTPWmzg1UkCXaN7TqH+dSdBlX8pnKMvfA
 mOD/+Q0grClFLc/Hz3/bHqHPtT7B14AiqaMusjU+iKhImun5pE7DxognC
 9UASX362lsFpgarnh7vh8A8BjmgHnb8T9+dAzORYDN2DRH4ohltBINi8G
 VsTV8YPq1YBoqV56KFwpKLtqRIFzwHNbhEgeHqKyuspZmLDtLZkUWSZDl g==;
X-CSE-ConnectionGUID: pANIsbBRRru7Xem4te+Ltg==
X-CSE-MsgGUID: 7Bg84atuQ4K3S0spbR7Q/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61825408"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61825408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:43 -0700
X-CSE-ConnectionGUID: D/kkwY93S+6E/H8yixIq9Q==
X-CSE-MsgGUID: ePkH4FFlSF6XGU4bov6HRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="216946915"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.245.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:17:39 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 04/20] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Mon,  6 Oct 2025 14:16:54 +0300
Message-ID: <20251006111711.201906-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

This patch introduces an immutable eudebug property for exec_queues,
using a flags value to enable eudebug-specific features. For now, the
engine LRC uses this flag to enable the runalone hardware feature.
Runalone ensures that only one hardware engine in a group
[rcs0, ccs0-3] is active on a tile.

v2: - check CONFIG_DRM_XE_EUDEBUG and LR mode (Matthew)
    - disable preempt (Dominik)
    - lrc_create remove from engine init

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c          |  4 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 43 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
 drivers/gpu/drm/xe/xe_lrc.c              | 10 ++++++
 include/uapi/drm/xe_drm.h                |  2 ++
 6 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 2b8efa438716..a6c0d2391e0e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -726,7 +726,7 @@ static int exec_queue_create_event(struct xe_eudebug *d,
 	int i;
 	int ret;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
@@ -780,7 +780,7 @@ static int exec_queue_destroy_event(struct xe_eudebug *d,
 	int i;
 	int ret;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d->res, XE_EUDEBUG_RES_TYPE_VM, q->vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dc049da6fac3..02f4e412fcdf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -206,6 +206,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		flags |= XE_LRC_CREATE_RUNALONE;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -530,6 +533,42 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
 	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
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
@@ -538,6 +577,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -558,7 +598,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 8821ceb838d0..cd4141f6ffbf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -94,4 +94,6 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 27b76cf9da89..52fd850c7ab0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -96,6 +96,13 @@ struct xe_exec_queue {
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
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index af09f70f6e78..dc7405108261 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1534,6 +1534,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (err)
 		goto err_lrc_finish;
 
+	if (init_flags & XE_LRC_CREATE_RUNALONE) {
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 54868095952b..ba98da4320da 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1275,6 +1275,8 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
+#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

