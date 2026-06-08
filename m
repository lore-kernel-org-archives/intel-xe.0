Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F86FCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AF10F6BA;
	Mon,  8 Jun 2026 16:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5OvD7lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6610F6BF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780935447; x=1812471447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZjY59NCtlpNVE71wuZrOF8mVqzDD9doZYBALHAXLAA=;
 b=R5OvD7lcgfWVG6YOqcaBujXZmhqnkjj+550HvXxCjPvSOstkO9zRwCij
 SKOPiHZ/Ue0zN9u+c/S0LmodtmdpwQbEYB6FYgbcpEyMNfgNy4BJeMf4S
 eZtFyB+UkHgL6E735vIsRpd/Jxn3uXsPQlgsNUIms5nICRH1gSHT/IYQg
 4fCH2QJpnJqiHnENWJFLxoZU17ulZPS9/J7lLWZ4AM9aZr9rhLEJZlQ0F
 DDt4Dp1I8mu6y0h8ZJLkrnqDuU1AYf6NMdIVo99qowlk1cDDkUXnjjowZ
 f9dlomJQeIC0RIAdEsfuvFV6bRePIMMKDn3o6gFARdnu5hkB48t8kghyR Q==;
X-CSE-ConnectionGUID: 1iM3ZsmkSoK4ridocOZGEw==
X-CSE-MsgGUID: +ot8NBCzSZaOWpO+Fy/eCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85531802"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85531802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:26 -0700
X-CSE-ConnectionGUID: N8zneuv1Q6a8jaeqjIFY+g==
X-CSE-MsgGUID: 3F2297+uT4a9eH51Bj/IYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247457563"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO mkuoppal-desk.intel.com)
 ([10.245.251.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:17:21 -0700
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
Subject: [PATCH 05/18] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Mon,  8 Jun 2026 19:16:23 +0300
Message-ID: <20260608161639.1652127-6-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
References: <20260608161639.1652127-1-mika.kuoppala@linux.intel.com>
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

v3: - remove redundant runalone setup (Sashiko)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 46 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       | 19 ++++++++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++
 include/uapi/drm/xe_drm.h                |  2 ++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1a8d3f5ecc25..496ca0300dd4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -361,6 +361,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
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
index 0225426c57b0..f7babd1e2940 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -162,4 +162,23 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
 
+/**
+ * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
+ * @q: The exec_queue
+ *
+ * If an exec queue is not parallel and is idle, the suspend steps can be
+ * skipped in the submission backend immediatley signaling the suspend fence.
+ * Parallel queues cannot skip this step due to limitations in the submission
+ * backend.
+ *
+ * Return: True if exec queue is idle and can skip suspend steps, False
+ * otherwise
+ */
+static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
+{
+	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
+}
+
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bfd7cbfd2ff5..065966a0f271 100644
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

