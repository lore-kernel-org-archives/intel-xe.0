Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334BFF01804
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 07:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76FC10E130;
	Fri,  6 Mar 2026 07:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JavTc9DQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7509A10E130
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783596; x=1804319596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XYJl3bCaSTDw1H1WSqb9auuw9UJ3E1NTzHMgR5vm1kA=;
 b=JavTc9DQvrF6lCCJ/H1Ac8xLvaQFUBUn//KnUqVTot+9wpsYy64F1CjE
 1X8403L1KIXDpM6FL7a75x+v2V3IuEmkkFNt/dDtCjPEk+tJPjkJY7yX0
 s9jMIETGvrZaVWyyJ3Q6H/Wctwu+PK0AYEKFTj7UN4PLJ8oqH920EWgB8
 W2wnSzktHfCLzVJRzKidvIWEW4C2t8hBt+OhFdcg/PYfbt6wrLa/MkxGf
 SoE/DU9bmhA2Sm8iIGahZ/kSDj0TkUDkOzMSH9DFCnydp0FHf+lEuiGRs
 RdmFtCMcrL6W0UYIJVmDgjS+7V6TGMQlB7cmaw05pBkLN9wN65phcLzq+ w==;
X-CSE-ConnectionGUID: aW+liy+GS+SySm27ZeY9HA==
X-CSE-MsgGUID: jke1dYLLRiGn4uCvrR16Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76490657"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="76490657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:53:15 -0800
X-CSE-ConnectionGUID: Aq+/6ilqSUqUDF1bYGltmQ==
X-CSE-MsgGUID: g9DmQ3O2SH6qslT39FjE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="214873739"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 lglandwe-mobl5.intel.com) ([10.245.244.186])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:53:13 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [v6] drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3
 bit13
Date: Fri,  6 Mar 2026 09:55:03 +0200
Message-ID: <20260306075504.1288676-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.43.0
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

Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
that instead of putting the register on the allowlist for UMD to
program, the KMD is doing the programming at context initialization
based on a queue creation flag.

This is a recommended tuning setting for both gen12 and Xe_HP
platforms.

If a render queue is created with
DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
be programmed at initialization to enable the render color cache to
key with BTP+BTI (binding table pool + binding table entry) instead of
just BTI (binding table entry). This enables the UMD to avoid emitting
render-target-cache-flush + stall-at-pixel-scoreboard every time a
binding table entry pointing to a render target is changed.

v2: Use xe_lrc_write_ring()

v3: Update xe_query.c to report availability

v4: Rename defines to add DISABLE_

v5: update commit message

v6: rebase

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39982

Bspec: 73993, 73994, 72161, 31870, 68331
Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 19 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  1 +
 drivers/gpu/drm/xe/xe_query.c            |  2 ++
 include/uapi/drm/xe_drm.h                |  8 ++++++++
 7 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 66ddad767ad44..aa6dd6885fbee 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -180,6 +180,7 @@
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
 #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
+#define   DISABLE_STATE_CACHE_PERF_FIX			REG_BIT(13)
 #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
 #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
 #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index be698579cadee..b287d0e0e60a4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -353,6 +353,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
+	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
+		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -978,6 +981,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
 	return q->ops->set_multi_queue_priority(q, value);
 }
 
+static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
+					       u64 value)
+{
+	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
+		return -EOPNOTSUPP;
+
+	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX : 0;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -990,6 +1004,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
 							exec_queue_set_multi_queue_priority,
+	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
+							exec_queue_set_state_cache_perf_fix,
 };
 
 /**
@@ -1085,7 +1101,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index a1f3938f4173b..8ce78e0b1d502 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -134,6 +134,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 /* for migration (kernel copy, clear, bind) jobs */
 #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+/* for programming COMMON_SLICE_CHICKEN3 on first submission */
+#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a408bb9d58e48..aa26c71ae34f5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -14,6 +14,7 @@
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_gfx_state_commands.h"
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
@@ -1446,6 +1447,7 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
 	u32 arb_enable;
+	u32 state_cache_perf_fix[3];
 	int err;
 
 	/*
@@ -1546,6 +1548,13 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
 
+	if (init_flags & XE_LRC_DISABLE_STATE_CACHE_PERF_FIX) {
+		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
+		state_cache_perf_fix[2] = REG_MASKED_FIELD_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
+		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
+	}
+
 	map = __xe_lrc_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 48f7c26cf1298..e7c975f9e2d97 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_RUNALONE		BIT(0)
 #define XE_LRC_CREATE_PXP		BIT(1)
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
+#define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 34db266b723fa..4852fdcb4b959 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0264c32ceb2c..f074871b4d96c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
  *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
  *      This is exposed only on Xe2+.
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
+ *      if a queue can be creaed with
+ *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -425,6 +428,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1285,6 +1289,9 @@ struct drm_xe_vm_bind {
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
  *    priority within the multi-queue group. Current valid priority values are 0–2
  *    (default is 1), with higher values indicating higher priority.
+ *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
+ *    enable render color cache keying on BTP+BTI instead of just BTI
+ *    (only valid for render queues).
  *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
@@ -1329,6 +1336,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
+#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

