Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A523DC0218B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 13:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0B10E586;
	Tue, 21 Jan 2025 13:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkcHtxzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD04E10E586
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737465532; x=1769001532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZTiWzYHB1zB+H91+wwsBIb5FngIme31b0pBKqcFO4Io=;
 b=RkcHtxzGYaBe7hHfG0FTY8UaWoUU4br5tsinKNKjoOCGGejynzyq4Fan
 1w+0Wa0SGkCo4ncY+XUtI57qK7IqItf1Vw6++sXc8LedOdD3PrSrGnir/
 4H16RCPNBq+90lMgv7+i/TKdJdI+KudFaprQZ3svQC8MAcy0G+tk0/Ttt
 W6+20ucx9+clnbLsxWeW2gzmb841Z1WlTC5B1ViF59jWI6OtBhxhkbUzM
 DR/wRDnjZjzUnSseyU92OroBKwe/TPbWNqD3kalYmFSPQsXgGEEvpsPPi
 uO/2b+q8XmlyeS6Gr5TsIZP9nG5f0D/B9rduR1uljaKCkME/wzWgFnm8h Q==;
X-CSE-ConnectionGUID: kVTm6YwvT2G4Ac8w6OOtig==
X-CSE-MsgGUID: qROrgnPXTL6z7AL6bb0wGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55287412"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="55287412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:18:52 -0800
X-CSE-ConnectionGUID: NR55p0U8Qd6wvVBg41J8Ow==
X-CSE-MsgGUID: alqOcG5rRDOlc7J4p21NVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106597563"
Received: from ayaz-z790i-aorus-ultra.iind.intel.com (HELO
 tejasupaayaz.iind.intel.com) ([10.190.238.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:18:49 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, vinay.belgaumkar@intel.com,
 szymon.morek@intel.com, jose.souza@intel.com
Subject: [PATCH V4] drm/xe/uapi: Use hint for guc to set GT frequency
Date: Tue, 21 Jan 2025 18:46:05 +0530
Message-ID: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
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

Allow user to provide a low latency hint. When set,
KMD sends a hint to GuC which results in special handling for that process.
SLPC will ramp the GT frequency aggressively every time
it switches to this process.

We need to enable the use of SLPC Compute strategy during init, but
it will apply only to processes that set this bit during process
creation.

Improvement with this approach as below:

Before,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz
    Kernel launch latency : 283.16 us

After,

:~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
Platform: Intel(R) OpenCL Graphics
  Device: Intel(R) Graphics [0xe20b]
    Driver version  : 24.52.0 (Linux x64)
    Compute units   : 160
    Clock frequency : 2850 MHz

    Kernel launch latency : 63.38 us

UMD will indicate low latency hint with flag as mentioned below,

*     struct drm_xe_exec_queue_create exec_queue_create = {
*          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
*          .extensions = 0,
*          .vm_id = vm,
*          .num_bb_per_exec = 1,
*          .num_eng_per_bb = 1,
*          .instances = to_user_pointer(&instance),
*     };
*     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);

Link to UMD PR : https://github.com/intel/compute-runtime/pull/794

V4:
  - To make it clear, dont use exec queue word (Vinay)
  - Correct typo in description of flag (Jose/Vinay)
  - rename set_strategy api and replace ctx with exec queue(Vinay)
  - Start with 0th bit to indentify user flags (Jose)
V3:
  - Conver user flag to kernel internal flag and use (Oak)
  - Support query config for use to check kernel support (Jose)
  - Dont need to take runtime pm (Vinay)
V2:
  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
  - Add motivation to description (Lucas)

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 11 ++++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  8 ++++++++
 drivers/gpu/drm/xe/xe_query.c                 |  3 ++-
 include/uapi/drm/xe_drm.h                     |  7 ++++++-
 7 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 85abe4f09ae2..c50075b8270f 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -174,6 +174,9 @@ struct slpc_task_state_data {
 	};
 } __packed;
 
+#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE	REG_BIT(28)
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 struct slpc_shared_data_header {
 	/* Total size in bytes of this shared buffer. */
 	u32 size;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8948f50ee58f..bd33fb318677 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -544,6 +544,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
+	unsigned long flags;
 	struct xe_vm *vm;
 	struct xe_gt *gt;
 	struct xe_tile *tile;
@@ -553,7 +554,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags) ||
+	if (XE_IOCTL_DBG(xe, args->flags &&
+			 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -570,6 +572,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
+		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -578,8 +583,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -626,7 +631,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5af5419cec7a..30dc129a6b09 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,7 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
-
+/* flag to indicate low latency hint to guc */
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
 	 * bit
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 44b5211066ef..e926f89e4ce9 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1014,6 +1014,17 @@ static int slpc_set_policies(struct xe_guc_pc *pc)
 	return 0;
 }
 
+static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
+{
+	int ret = 0;
+
+	ret = pc_action_set_param(pc,
+				  SLPC_PARAM_STRATEGIES,
+				  val);
+
+	return ret;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1077,6 +1088,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	}
 
 	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
+	if (ret)
+		goto out;
+
+	/* Enable SLPC Optimized Strategy for compute */
+	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
 out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 913c74d6e2ae..be7551756eb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -15,6 +15,7 @@
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
+#include "abi/guc_actions_slpc_abi.h"
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
@@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
 MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
 MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
+MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
 static const int xe_exec_queue_prio_to_guc[] = {
@@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 	struct exec_queue_policy policy;
 	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
+	u32 slpc_exec_queue_freq_req = 0;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
+	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
+		slpc_exec_queue_freq_req |= SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
+
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
 	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
+	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
+							     slpc_exec_queue_freq_req);
 
 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
 		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c059639613f7..136280c0c6b9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -334,7 +334,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
-			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM |
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index cac607a30f6d..1abad0c6e242 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
+ *      has low latency hint support
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -1124,6 +1127,7 @@ struct drm_xe_vm_bind {
  *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
  *     };
  *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
  *          .extensions = 0,
  *          .vm_id = vm,
  *          .num_bb_per_exec = 1,
@@ -1150,7 +1154,8 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
-- 
2.43.0

