Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1070BECD995
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 18:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA9410E074;
	Thu,  5 Feb 2026 18:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMejMr0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F247D10E074
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770317470; x=1801853470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NfAaaCzPIK6uurHGgEo4x2wauUT7W5DoMm6/4T/gT1w=;
 b=UMejMr0THmRLjCZru9L/wCYzbLvRMjc5M9nPybxS0u//KVk5WOR9ZA2j
 jhSFxAH/7R2FCQExeFbinbzko2JcYqqTryF1SWThrkEJ60Yy/Oc9oUZ4b
 iye4Ip+4aGTviQ2TvuQAST0g4B/XORxPDH9YvotFcVjmuyWZghT13Pf6R
 qD2wLa25O0vDGbkuPJ7cJn/DcpcrR7ga57JFpr9/QIFwxpdsbjQLug169
 poKV5k4/dD/vp8xhoKOLXv+XfP2xElYlyfBhJ5+QdZ6yIXeolepUBeJmZ
 bcslywAaPmH1XQf6GRKmAccrP0GmqfWUIsFVyBmo7evmx5nrUEMKA6nY9 w==;
X-CSE-ConnectionGUID: WRi4OhyuTH68Qx66op3NjA==
X-CSE-MsgGUID: zn4YJVEaSZOsCHYb8cEsaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71516633"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="71516633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:51:09 -0800
X-CSE-ConnectionGUID: bZwAOERTTQazjebsocMe2g==
X-CSE-MsgGUID: U+oL8WTMQkePE9idProJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210432085"
Received: from vpanait-mobl.ger.corp.intel.com (HELO lglandwe-mobl5.intel.com)
 ([10.245.244.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 10:51:08 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH] drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3
 bit13
Date: Thu,  5 Feb 2026 20:52:48 +0200
Message-ID: <20260205185248.994531-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.43.0
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

Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
people have decided to not rely on putting the register on the
allowlist for UMD to program and instead have context/queue creation
flag.

This is a recommended tuning setting for both gen12 and Xe_HP
platforms.

Bspec: 73993, 73994, 31870, 68331
Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 20 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
 drivers/gpu/drm/xe/xe_lrc.h              |  1 +
 include/uapi/drm/xe_drm.h                |  1 +
 6 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 24fc64fc832e9..a1b89f0a22e14 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -172,6 +172,7 @@
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
 #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
+#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
 #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
 #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
 #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 66d0e10ee2c4a..d20b4d84bbe06 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
+	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
+		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
+
 	err = q->ops->init(q);
 	if (err)
 		return err;
@@ -850,6 +853,19 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
 	return q->ops->set_multi_queue_priority(q, value);
 }
 
+static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
+					       u64 value)
+{
+	if (XE_IOCTL_DBG(xe,
+			 q->class != XE_ENGINE_CLASS_RENDER &&
+                         q->class != XE_ENGINE_CLASS_COMPUTE))
+		return -EOPNOTSUPP;
+
+	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
+
+	return 0;
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -862,6 +878,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
 							exec_queue_set_multi_queue_priority,
+	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
 };
 
 int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
@@ -946,7 +963,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
 			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3791fed34ffa5..f4f72d01eb8c8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -134,6 +134,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 /* for migration (kernel copy, clear, bind) jobs */
 #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+/* for programming COMMON_SLICE_CHICKEN2 on first submission */
+#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3db7968aa5e22..571d7ef303e1e 100644
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
@@ -1443,6 +1444,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
 	u32 arb_enable;
+	u32 state_cache_perf_fix[3];
 	u32 bo_flags;
 	int err;
 
@@ -1575,6 +1577,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
 
+	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
+		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
+		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
+		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
+	}
+
 	map = __xe_lrc_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c307a3fd9ea28..083a2167aeef8 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_RUNALONE		BIT(0)
 #define XE_LRC_CREATE_PXP		BIT(1)
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
+#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 077e66a682e29..b69b95a56bd82 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1329,6 +1329,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
+#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

