Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE07C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 09:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A42910E8B3;
	Wed, 26 Feb 2025 09:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8+vN183";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB92D10E8B5
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740563136; x=1772099136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HI1FJop89rCF+c44IqfJlXQIgj0/ByQuy5MyzH2sEpo=;
 b=X8+vN183PLbmejnYkdcatj52S45nGcWc42+1DafGUiBSeLEM2t+taDjw
 X4u9k+nWwHulM6tlgOX60ufT+I2xSLBITYWrFzEfHZmPlGrHT0tMV7Y9F
 usWu5YRVZxMT+6NreIIbJ0esYBxAKI1xrP26vkyCUci3qezhibY8Mn8w8
 ZRQFAg+Gx5ZePBWVzF62kFNLV+tMCKk4IYsA69vA5aX5gAHHAR+hZqTkX
 kWJznAMVdZUo6Nl2vj2N8nqTCbST/G4Z2LUjjZE3f2ESgtLeSGhe2S92R
 e6bBRs3D4ka/F5vuSYz1Xsh2aiYe2Z9uInpyiPSsXF2LsAaXTubr72CtV A==;
X-CSE-ConnectionGUID: RFeEIoBZQpmtZVB8ZNLG4w==
X-CSE-MsgGUID: pU1rpK1LSoqm5ZBW5TOgXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41598372"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41598372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:45:36 -0800
X-CSE-ConnectionGUID: WIscupZWSrWuEoTCkUfs+A==
X-CSE-MsgGUID: vgpuorJBSVODSVRgtjyAjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117143682"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:45:33 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V10] drm/xe/uapi: Use hint for guc to set GT frequency
Date: Wed, 26 Feb 2025 15:22:24 +0530
Message-Id: <20250226095224.650351-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Allow user to provide a low latency hint. When set, KMD sends a hint
to GuC which results in special handling for that process. SLPC will
ramp the GT frequency aggressively every time it switches to this
process.

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

Compute PR: https://github.com/intel/compute-runtime/pull/794
Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214

V10(Lucas):
  - Remove doc from drm-uapi.rst
v9(Vinay):
  - remove extra line, align commit message
v8(Vinay):
  - Add separate example for using low latency hint
v7(Jose):
  - Update UMD PR
  - applicable to all gpus
V6:
  - init flags, remove redundant flags check (MAuld)
V5:
  - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
  - Modify logic to restrict exec queue flags (MAuld)
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
  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 planned for other hint(Szymon)
  - Add motivation to description (Lucas)

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
 drivers/gpu/drm/xe/xe_query.c                 |  2 ++
 include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-
 7 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
index 85abe4f09ae2..b28c8fa061f7 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
@@ -174,6 +174,9 @@ struct slpc_task_state_data {
 	};
 } __packed;
 
+#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
+#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
+
 struct slpc_shared_data_header {
 	/* Total size in bytes of this shared buffer. */
 	u32 size;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 23a9f519ce1c..7c5c003d3c40 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -604,11 +604,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
+	u32 flags = 0;
 	u32 id;
 	u32 len;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->flags) ||
+	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -625,6 +626,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
+		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
+
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
@@ -633,8 +637,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		for_each_tile(tile, xe, id) {
 			struct xe_exec_queue *new;
-			u32 flags = EXEC_QUEUE_FLAG_VM;
 
+			flags |= EXEC_QUEUE_FLAG_VM;
 			if (id)
 				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
 
@@ -680,7 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe, flags,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..cc1cffb5c87f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -85,6 +85,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+/* flag to indicate low latency hint to guc */
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 02409eedb914..25040efa043f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
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
@@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
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
index b6a2dd742ebd..b95934055f72 100644
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
+		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
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
index ebfae746f861..e802bf34c02c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -339,6 +339,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 892f54d3aa09..6e510287eaf5 100644
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
@@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
  *     };
  *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
  *
+ *     Allow users to provide a hint to kernel for cases demanding low latency
+ *     profile. Please note it will have impact on power consumption. User can
+ *     indicate low latency hint with flag while creating exec queue as
+ *     mentioned below,
+ *
+ *     struct drm_xe_exec_queue_create exec_queue_create = {
+ *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
+ *          .extensions = 0,
+ *          .vm_id = vm,
+ *          .num_bb_per_exec = 1,
+ *          .num_eng_per_bb = 1,
+ *          .instances = to_user_pointer(&instance),
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
+ *
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
@@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
 
-	/** @flags: MBZ */
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
+	/** @flags: flags to use for this exec queue */
 	__u32 flags;
 
 	/** @exec_queue_id: Returned exec queue ID */
-- 
2.34.1

