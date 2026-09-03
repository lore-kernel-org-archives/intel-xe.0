Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F2C624DA
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E44F10F66D;
	Thu,  3 Sep 2026 15:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loLwh3MD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86C210F653
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447630; x=1819983630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/T6KZPZWgihmefcne7i6FbYRzlBsqthMyAhljTPlZME=;
 b=loLwh3MDtXOQPSYLt7pyDmnb1up75MXQ3btKGPmLSROkhtqUPFmcX1Pc
 VA8/wdHCzpiLxLMIHf5qdeyf5nI9vQoRYRmO3WU+Frf1UEzojj6r/CVwO
 rQP5gVJp1aAdrozgUpAFQhGn5+0aDUVeboWXXq1Xl3rhDL8v7Hvo5LRli
 1yboltqLuurlGRXJpUfAX8TKDyTuufl0gYq7jvlYkVCUIUXL+mkS2/n9j
 xdbPZV+SplM6+0aoGid+Aklog8FW62oZYgFilO117jeM3a+2YqOWeXFd4
 FNG1ldMS7HQwR5hVvDhiSmfHeYZaK40YqgvNDdL1uYDIgsFgBzttbxZLY A==;
X-CSE-ConnectionGUID: 7z0O+JToQPGmEU6SDhAtmQ==
X-CSE-MsgGUID: Jmx4J5nZQki5QfzZ4N/VaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486654"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:30 -0700
X-CSE-ConnectionGUID: HNU4y/XiR8eUw7G4gcA0Bg==
X-CSE-MsgGUID: ZKe8pCmYRdC79K57NYUDQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440562"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:25 -0700
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
Subject: [PATCH v10 05/27] drm/xe: Add EUDEBUG_ENABLE exec queue property
Date: Thu,  3 Sep 2026 17:59:29 +0300
Message-ID: <20260903145952.848051-6-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Introduce an immutable eudebug property for exec_queues,
using a flags value to enable eudebug-specific features. For now, the
engine LRC uses this flag to enable the runalone hardware feature.
Runalone ensures that only one hardware engine in a group
[rcs0, ccs0-3] is active on a tile.

v2: - check CONFIG_DRM_XE_EUDEBUG and LR mode (Matthew)
    - disable preempt (Dominik)
    - lrc_create remove from engine init

v3: - remove redundant runalone setup (Sashiko)
v4: - deny if pxp is on (Sashiko)
    - deny if secondary mq (Sashiko)
    - deny if parallel (Sashiko)
    - really deny if pxp (Claude)

Assisted-by: Claude:claude-opus-5
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 63 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++
 include/uapi/drm/xe_drm.h                |  2 +
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a663c55b386d..d13f69eb025c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -358,6 +358,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
 		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
 
+	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
+		flags |= XE_LRC_CREATE_RUNALONE;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -991,6 +994,51 @@ static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_e
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
+
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe,
+			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !xe_eudebug_is_enabled(xe)))
+		return -EPERM;
+
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_uses_pxp(q)))
+		return -EPERM;
+
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue_secondary(q)))
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
@@ -1005,6 +1053,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 							exec_queue_set_multi_queue_priority,
 	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
 							exec_queue_set_state_cache_perf_fix,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG] = exec_queue_set_eudebug,
 };
 
 /**
@@ -1077,6 +1126,17 @@ static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
 			 (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
 		return -EINVAL;
 
+	/*
+	 * A debugger can inspect and modify the EU state and memory of a
+	 * debuggable queue, so it must not be combined with protected content.
+	 * Test the property mask rather than the queue state, as the extensions
+	 * are applied in the order userspace chained them and either one may be
+	 * processed first.
+	 */
+	if (XE_IOCTL_DBG(xe, (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG)) &&
+			 (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -1112,7 +1172,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..fb090704dd9f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -162,4 +162,6 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
 
+int xe_exec_queue_is_debuggable(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 95f75d61a647..67c4c974d13d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -154,6 +154,13 @@ struct xe_exec_queue {
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
index 03cb1181c169..a938a9f095ce 100644
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
2.53.0

