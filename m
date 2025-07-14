Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BFFC83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 08:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D479610E425;
	Mon, 14 Jul 2025 08:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbXo3RsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DEC10E41D
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752481848; x=1784017848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ioXE2ijrto/6Z4rUU85Q96ut6DIdMLJhmfYGbHi3RPs=;
 b=lbXo3RsY4eFRHP9iORGvs2rtjlbHIDqfEmZ4JViC+kPTWSYKZGybBNKT
 OKmWS7hmynX3VjLbMk/cwJWFdU31zLW6SExieydt5xF67VEwH03owbh7x
 +UYnTFxjSGvBISrYg0EeB2PkKob1+7sOsaesr//lg48i2M9q7OugorZc2
 jiWqzT+z9kMEVfFH7SwU3axAm1/mcFQiNHoMEl7Mb0PBUvmh2kYrTDrMG
 GtRKXXflLkvG9UsKEWCG12qq4r6WA1VuGkP555vwD6ykhHwm7AG98Phpl
 krpXOeNJgjdY7HWjX+a2FV5gR4xqqkfYr2fc3zSQHptwPN4/75ehbRbwP A==;
X-CSE-ConnectionGUID: rg5y3RTxRHWf66FFD9E3vQ==
X-CSE-MsgGUID: +Yq+dQl5S0mrR++iGCmMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65732700"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="65732700"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:30:47 -0700
X-CSE-ConnectionGUID: MHc4zIlNTLebT3bJqmlEkg==
X-CSE-MsgGUID: S1eGeOY/QY+T2PfU3R5iyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="161205581"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa003.jf.intel.com with ESMTP; 14 Jul 2025 01:30:45 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: lucas.demarchi@intel.com,
	matthew.brost@intel.com
Cc: tejas.upadhyay@intel.com, intel-xe@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY and exec queue control
Date: Mon, 14 Jul 2025 14:24:36 +0530
Message-Id: <20250714085436.1295787-1-nitin.r.gote@intel.com>
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

This patch introduces support for disabling the NULL anyhit shader query
mechanism via a new device query flag and exec queue flag in the Xe driver.

- Adds `DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY` to the device
  query, allowing userspace to detect if the device supports disabling
  the NULL query mechanism for anyhit shaders.

- Introduces `DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY` as an exec queue
  creation flag, enabling userspace to request that the driver disables
  the NULL query mechanism for a given exec queue.

- Implements the corresponding WA BB in `wa_bb_disable_null_query()`,
  which emits the necessary MI commands to set or clear the
  `DIS_NULL_QUERY` bit in the `RT_CTRL` register for supported
  platforms and engines.

This enables userspace to detect and control the NULL query mechanism
for improved compatibility and flexibility on Xe2 platforms.

Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36068

v4:
   - Improve commit message. (Lucas)
   - Sort MI definitions as per its number.(Lucas)
   - Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE
     as per bspec. (Lucas)
   - Move version and flag check to setup function and
     avoid local variables. (Lucas)

v3:
   - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
     DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
   - Move implementation from exec queue creation time to
     WA BB program. (Matthew)

v2:
   - Use xe_rtp_match_first_render_or_compute() api to check
     render_or_compute. (Tejas)
   - Validate args->flags (Tejas/Matthew)
   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  6 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 58 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_query.c                 |  3 +-
 include/uapi/drm/xe_drm.h                     | 12 ++++
 8 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index e3f5e8bb3ebc..94242a7b58eb 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -31,6 +31,12 @@
 
 #define MI_BATCH_BUFFER_END		__MI_INSTR(0xA)
 #define MI_TOPOLOGY_FILTER		__MI_INSTR(0xD)
+
+#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
+#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
+#define   MI_SEMAPHORE_POLL		REG_BIT(15)
+#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(GENMASK(14, 12), 4)
+
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5cd5ab8529c5..f96b2e2b3064 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -42,7 +42,7 @@
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
-#define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
+#define STEER_SEMAPHORE				XE_REG(0xfd0)
 #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
 #define SF_MCR_SELECTOR				XE_REG(0xfd8)
 #define MCR_SELECTOR				XE_REG(0xfdc)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8991b4aed440..3fb8036e318b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY)
+		flags |= EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY;
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
+		flags |= EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..1a3dfb7cc054 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -87,6 +87,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
 /* flag to indicate low latency hint to guc */
 #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+/* flag to indicate disable null query hint */
+#define EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY	BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 64a2f0d6aaf9..28fd52cc75e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -46,7 +46,6 @@
  * MCR registers are not available on Virtual Function (VF).
  */
 
-#define STEER_SEMAPHORE		XE_REG(0xFD0)
 
 static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
 {
@@ -533,7 +532,7 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
 		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
 			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
 
-		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR, steer_val);
+		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, steer_val);
 		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR, steer_val);
 		/*
 		 * For GAM registers, all reads should be directed to instance 1
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d2ad8fe737eb..11e37500c8ed 100644
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
@@ -972,6 +974,58 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
 	return cmd - batch;
 }
 
+/**
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
+static ssize_t wa_bb_disable_null_query(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+					u32 *batch, size_t max_size)
+{
+	u32 *cmd = batch;
+#define EXPECTED_WA_SIZE 10
+
+	if (xe_gt_WARN_ON(lrc->gt, max_size < EXPECTED_WA_SIZE))
+		return -ENOSPC;
+
+	if ((GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) &&
+	    (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30) &&
+	    xe_rtp_match_first_render_or_compute(lrc->gt, hwe)) {
+		u32 value = lrc->flags & EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY ?
+			    DIS_NULL_QUERY : ~DIS_NULL_QUERY;
+		*cmd++ = (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
+			  MI_SEMAPHORE_SAD_EQ_SDD |
+			  MI_SEMAPHORE_REGISTER_POLL);
+		*cmd++ = 1;
+		*cmd++ = STEER_SEMAPHORE.addr;
+		*cmd++ = 0;
+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
+			 MI_LRI_MMIO_REMAP_EN;
+		*cmd++ = RT_CTRL.__reg.addr;
+		*cmd++ = value;
+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
+			 MI_LRI_MMIO_REMAP_EN;
+		*cmd++ = STEER_SEMAPHORE.addr;
+		*cmd++ = 1;
+	}
+	xe_gt_assert(lrc->gt, ((cmd - batch) <= EXPECTED_WA_SIZE));
+
+#undef EXPECTED_WA_SIZE
+
+	return cmd - batch;
+}
+
 struct wa_bb_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
@@ -982,6 +1036,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	const size_t max_size = LRC_WA_BB_SIZE;
 	static const struct wa_bb_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
+		{ .setup = wa_bb_disable_null_query },
 	};
 	ssize_t remain;
 	u32 *cmd, *buf = NULL;
@@ -1175,6 +1230,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
+	if (init_flags & EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY)
+		lrc->flags |= EXEC_QUEUE_FLAG_DISABLE_NULL_QUERY;
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

