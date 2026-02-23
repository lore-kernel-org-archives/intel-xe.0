Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A438EA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC20B10E42D;
	Mon, 23 Feb 2026 14:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI9aRNSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16810E42D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855440; x=1803391440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dmd5QTXKCYweu7SOMURUQv+3kCBuoIR6EABhr6o4RaU=;
 b=JI9aRNSdRZFBZuso2GLa8+9sMYERTVrJ1HcVKqZ9cB1/DYl49P3nzBPe
 Q/DGTZVelYd/eMiudcJnRnu2TpctCCBb8LpiSZpEyFhmr247KvqDXgzzZ
 9sqIu/komh/1ku0D1e/A/jZ9w/DYx4rrj9LuLOOj7IoP0L/FefuWgV6vd
 uTflm+Et95Ew/T5txjpdr0vv1r+wp7zQ8er9Xp5+37PODKjvnGNx/gS4o
 6rr83XzrsMBt6Fqzl+7yOLYshenCgRuB+GRkmzJsRGnvmQg/LKHv8GnQJ
 WX583iyzjO2veDo5+8GgK9RSmnLLH8RjhGxlu0qKEJIxmPybcADs4Q1o4 w==;
X-CSE-ConnectionGUID: T1R7fwgSS3S25wnUVE/YRg==
X-CSE-MsgGUID: av9HGL7VS52c4Zbrh2Br3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76460861"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76460861"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:04:00 -0800
X-CSE-ConnectionGUID: nAF6ek17QfGtM8R4fi4smw==
X-CSE-MsgGUID: rnPzEylBRG6JCvoQT/eomA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214656313"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.3])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:56 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 06/22] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Mon, 23 Feb 2026 16:03:01 +0200
Message-ID: <20260223140318.1822138-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
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
index d8ea7378d328..a89363544e35 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -798,7 +798,7 @@ static int exec_queue_create_event(struct xe_eudebug *d,
 	int i;
 	int ret;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
@@ -852,7 +852,7 @@ static int exec_queue_destroy_event(struct xe_eudebug *d,
 	int i;
 	int ret;
 
-	if (!xe_exec_queue_is_lr(q))
+	if (!xe_exec_queue_is_debuggable(q))
 		return 0;
 
 	h_vm = find_handle(d, XE_EUDEBUG_RES_TYPE_VM, q->vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 24badaef9847..53cb6634248e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -293,6 +293,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		flags |= XE_LRC_CREATE_RUNALONE;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -851,6 +854,45 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
 	return q->ops->set_multi_queue_priority(q, value);
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
@@ -863,6 +905,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
 							exec_queue_set_multi_queue_priority,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
 };
 
 int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
@@ -947,7 +990,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index c9e3a7c2d249..299c61fe09c1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -178,4 +178,6 @@ static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
 	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
 }
 
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3791fed34ffa..f186ea77dbf4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -141,6 +141,13 @@ struct xe_exec_queue {
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
index 9590b4605952..e9a41b401edf 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1593,6 +1593,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
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
index 97b479b51c73..630f6c15779b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1325,6 +1325,8 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
+#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

