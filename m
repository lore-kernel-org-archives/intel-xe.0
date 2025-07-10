Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A30C83F18
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 07:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C0C10E367;
	Thu, 10 Jul 2025 07:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a724MGXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC910E367
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 07:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752132631; x=1783668631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KM9VnUhksaFmad3GSCvC6UjzUEFhYqQiuou7EtMusrw=;
 b=a724MGXdYnL/6mpflCsVwIE4YUgP6Bzf38Knz+htOPNKvjbHHgq025Ks
 /4CraLU3ux4an76rDIniTv/j9qAd3ymzBFdffLoQJ4RCJgE+JuwWc2Srd
 UpQR90zeouenSxcSjYmJdpIQSS5kdhi+TscYMMa7jcIkwkD+PdbT3gQNs
 XQCYyLenTroKEmBATgp/74Xy2CTN3KLL2Z2N3kcnv02rIz+FVTJQ+Izhs
 nQPxYYGvYGCR+VJ3EKRW/TG6LHdjKWRqSMPiWMCjn8KWhogri/0vpTliF
 1JTPanNribp5R9nJZdlR9e6CztZCAm53vUQyWJa+BxKGm/EGZxdHQQkJ6 A==;
X-CSE-ConnectionGUID: N5PrbRzLSLS50CVCmSlsMw==
X-CSE-MsgGUID: kwahB3WDRSCEcZH3Jjlkzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79841942"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79841942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:30:30 -0700
X-CSE-ConnectionGUID: nY15K9fZRi+P7j5lY7zTMg==
X-CSE-MsgGUID: 11+RGhafSLSNgKbQZedmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156481513"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by orviesa008.jf.intel.com with ESMTP; 10 Jul 2025 00:30:27 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: matthew.brost@intel.com
Cc: tejas.upadhyay@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 himal.prasad.ghimiray@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Date: Thu, 10 Jul 2025 13:24:35 +0530
Message-Id: <20250710075435.407068-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY device query flag
which indicates whether a device supports DIS_NULL_QUERY (Disable null
anyhit shader query mechanism). The intent is for UMDs
to use this query and opt-in DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY flag
to disable null query mechanism for anyhit shader by setting
DIS_NULL_QUERY bit of RT_CTRL register for Xe2.

v2:
   - Use xe_rtp_match_first_render_or_compute() api to check
     render_or_compute. (Tejas)
   - Validate args->flags (Tejas/Matthew)
   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)

v3:
   - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
     DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
   - Move implementaion from exec queue creation time to
     WA BB program. (Matthew)

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi,

Please note the review comments from previous rev2, addressed in this patch.
https://patchwork.freedesktop.org/patch/660580/?series=150601&rev=2


 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  4 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  1 -
 drivers/gpu/drm/xe/xe_lrc.c                   | 65 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_query.c                 |  3 +-
 include/uapi/drm/xe_drm.h                     | 12 ++++
 8 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index e3f5e8bb3ebc..84e889528464 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -80,4 +80,8 @@
 #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
 #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
 
+#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
+#define  MI_SEMAPHORE_POLL		(1 << 15)
+#define  MI_SEMAPHORE_SAD_EQ_SDD	(4 << 12)
+#define  MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5cd5ab8529c5..8234789f05b7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -55,6 +55,8 @@
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
+#define STEER_SEMAPHORE				XE_REG(0xFD0)
+
 #define PS_INVOCATION_COUNT			XE_REG(0x2348)
 
 #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8991b4aed440..18a0bee38eed 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (q->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
+		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
@@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
+	if (XE_IOCTL_DBG(xe, args->flags &
+	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -616,6 +620,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
 		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)
+		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..b62502a18c1b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -87,6 +87,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 /* flag to indicate low latency hint to guc */
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+/* flag to indicate disable null query hint */
+#define EXEC_QUEUE_DISABLE_NULL_QUERY		BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 64a2f0d6aaf9..a7624b30d0c9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -46,7 +46,6 @@
  * MCR registers are not available on Virtual Function (VF).
  */
 
-#define STEER_SEMAPHORE		XE_REG(0xFD0)
 
 static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
 {
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d2ad8fe737eb..6fc09df67442 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -13,6 +13,7 @@
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_gfx_state_commands.h"
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
@@ -25,6 +26,7 @@
 #include "xe_map.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_rtp.h"
 #include "xe_sriov.h"
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
@@ -972,9 +974,56 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
 	return cmd - batch;
 }
 
+/*
+ * wa_bb_disable_null_query() - Emit commands in the WA BB
+ * to disable or enable NULL Anyhit Shader Query Mechanism.
+ *
+ * Some platforms require a workaround to disable (or enable) the
+ * Anyhit Shader NULL QUERY for specific engines (typically the
+ * first render or compute engine). This function emits a sequence
+ * of MI commands into the workaround batch buffer (WA BB) to perform
+ * a multicast write to the RT_CTRL register, setting or clearing the
+ * DIS_NULL_QUERY bit.
+ *
+ * The sequence includes a semaphore wait to ensure proper ordering,
+ * followed by MI_LOAD_REGISTER_IMM commands to write the desired value
+ * to the RT_CTRL register, and finally restores the semaphore state.
+ *
+ */
+static ssize_t wa_bb_disable_null_query(struct xe_gt *gt, struct xe_hw_engine *hwe,
+					u32 *batch, size_t max_size, u32 value)
+{
+	u32 *cmd = batch;
+	struct xe_reg_mcr reg_mcr = RT_CTRL;
+	struct xe_reg reg = reg_mcr.__reg;
+	struct xe_reg reg_sema = STEER_SEMAPHORE;
+
+	/* Add WARN_ON check for minimum required space (10 DWORDs) */
+	if (xe_gt_WARN_ON(gt, max_size < 10))
+		return -ENOSPC;
+
+	if (xe_rtp_match_first_render_or_compute(gt, hwe)) {
+		*cmd++ = (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
+			  MI_SEMAPHORE_SAD_EQ_SDD | MI_SEMAPHORE_REGISTER_POLL);
+		*cmd++ = 1;
+		*cmd++ = reg_sema.addr;
+		*cmd++ = 0;
+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
+		*cmd++ = reg.addr;
+		*cmd++ = value;
+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
+		*cmd++ = reg_sema.addr;
+		*cmd++ = 1;
+	}
+
+	return cmd - batch;
+}
+
 struct wa_bb_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
+	ssize_t (*disable_null_query)(struct xe_gt *gt, struct xe_hw_engine *hwe,
+				      u32 *batch, size_t max_size, u32 value);
 };
 
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
@@ -982,6 +1031,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	const size_t max_size = LRC_WA_BB_SIZE;
 	static const struct wa_bb_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
+		{ .disable_null_query = wa_bb_disable_null_query },
 	};
 	ssize_t remain;
 	u32 *cmd, *buf = NULL;
@@ -1000,6 +1050,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
 
+		if (((GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) &&
+		     (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30))) {
+			if (lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
+				len += funcs[i].disable_null_query(lrc->gt, hwe,
+								   cmd, remain,
+								   DIS_NULL_QUERY);
+			else
+				len += funcs[i].disable_null_query(lrc->gt, hwe,
+								   cmd, remain,
+								   ~DIS_NULL_QUERY);
+		}
+
 		remain -= len;
 
 		/*
@@ -1175,6 +1237,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
+	if (init_flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
+		lrc->flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
+
 	err = setup_wa_bb(lrc, hwe);
 	if (err)
 		goto err_lrc_finish;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d517ec9ddcbf..5b48befd32cd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
-			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
+			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY);
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e2426413488f..adab49e63757 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
  *      has low latency hint support
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
  *      device has CPU address mirroring support
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY - Flag is set if the
+ *      device has null query support for anyhit shader.
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -415,6 +417,7 @@ struct drm_xe_query_config {
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY	(1 << 3)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
+	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
+	 *	Flag is set if the device has low latency hint support
+	 */
 #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+
+	/** DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY - \
+	 *	flag is use to disable null query check for Anyhit shader
+	 */
+#define DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY	(1 << 1)
+
 	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
-- 
2.25.1

