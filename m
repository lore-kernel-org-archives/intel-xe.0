Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F93CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8806310F304;
	Thu, 30 Apr 2026 10:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSHhqTsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF2A10F304
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546348; x=1809082348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3BCZs25pHxuQSrAprDqgN7RxykDinyRTq5RW1n3/Sw=;
 b=nSHhqTsloN60ktX5FpWyqtFF+vTzdW/i/Ar0xFjSAiypyN0/T6GW6UmD
 f7jEB25+DDWnWK7eBywievvT8iPz5MtOuu3j0h0chG2gaJaea2Ozlj53y
 yaDCSnL3bZMfBOQ1nUjxUx4HOHKOKYBJNiSe5P2bHVlGKWR6738FruXxM
 rq1kCzAnsJaMLififXMcpi8gotyYb4V9nJhnrwGaIdGRTUm8Qxe82rCpF
 +mZoVzeis3BBu1Diz+YGsQZporQjIVyQ72M0aNl4T8KOm6xQcO7RoEKN7
 gX5LHoAeUG866yE6fVvq+LhF28pnUJkEtWqKsWJJrHSivAiUBSs0NlivI g==;
X-CSE-ConnectionGUID: 8qt7uc0ZSpezZQYFSP0RrA==
X-CSE-MsgGUID: uA5lP32nQtKofMUvYjE2LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585921"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:24 -0700
X-CSE-ConnectionGUID: tU+yNQnfTrCB+E9njqM2lw==
X-CSE-MsgGUID: jALik7QOTuKZsSVb13XfGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518543"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:52:18 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/24] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Thu, 30 Apr 2026 13:51:02 +0300
Message-ID: <20260430105121.712843-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c       | 46 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
 drivers/gpu/drm/xe/xe_lrc.c              | 10 ++++++
 include/uapi/drm/xe_drm.h                |  2 ++
 6 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 64ac465725c5..7c553881a617 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -795,7 +795,7 @@ static int exec_queue_create_event(struct xe_eudebug *d,
 	int i;
 	int ret;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
@@ -849,7 +849,7 @@ static int exec_queue_destroy_event(struct xe_eudebug *d,
 	int i;
 	int ret, err = 0;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2e01a4e67578..d2b6203aef11 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -357,6 +357,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
 		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		flags |= XE_LRC_CREATE_RUNALONE;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -993,6 +996,45 @@ static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_e
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
+	if (XE_IOCTL_DBG(xe, !xe_eudebug_is_enabled(xe)))
+		return -EPERM;
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
@@ -1007,6 +1049,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
 							exec_queue_set_state_cache_perf_fix,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
 };
 
 /**
@@ -1103,7 +1146,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a82d99bd77bc..f7babd1e2940 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -179,4 +179,6 @@ static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
 	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
 }
 
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..10be00a3a7af 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,6 +143,13 @@ struct xe_exec_queue {
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
index 9db914584347..8675897ff071 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1636,6 +1636,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	if (vm && vm->xef)
 		xe_drm_client_add_bo(vm->xef->client, lrc->bo);
 
+	if (init_flags & XE_LRC_CREATE_RUNALONE) {
+		u32 ctx_control = xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL);
+
+		drm_dbg(&xe->drm, "read CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
+		ctx_control |= REG_MASKED_FIELD_ENABLE(CTX_CTRL_RUN_ALONE);
+		drm_dbg(&xe->drm, "written CTX_CONTEXT_CONTROL: 0x%x\n", ctx_control);
+
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL, ctx_control);
+	}
+
 	return 0;
 
 err_lrc_finish:
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index acacd9e7e1e0..ed53a56ad71b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1442,6 +1442,8 @@ struct drm_xe_exec_queue_create {
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 #define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		7
+#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

