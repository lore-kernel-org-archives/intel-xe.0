Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2EDFB5166
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C4D10E2A0;
	Mon,  6 Apr 2026 20:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXygd0w5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DB010E2A0
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775507711; x=1807043711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pEbp02zhP+LqD4odbzQb9QMxRfumtaXF4hhuuCyaXGk=;
 b=HXygd0w5dmu5mrUTIYiFNKzwaJmnU+K0Ailz4oOTdADIHdzRHZPm9sMm
 t2SP62GyUKQUvhRvnOguFG0T6ubiyEEGKK+whMV2xrtG7NpcTumSqWPoH
 PJd78NEpKONJP6RlzrUhexBbeqW0v4BGO/H9jQegaDupGlStQb6Rhi9my
 98xgtTiNp3j8bms13l7NDTcdYxn11gROWl2Td7fgzgOGlYG4xaVPRu1IA
 rr8Zc6k0S+AcAP1w9zd65rU+e4ks9VhfWtT7GHQ/caIYWNzi9+MlaZa2K
 kniTJucX6OHE/U8Vsawsv6WwVojF34OtrQzHHHGHsL6G6FcmM9yU0UV9Q w==;
X-CSE-ConnectionGUID: qPG+ZzPeRVW7TTsYkbdNeQ==
X-CSE-MsgGUID: bpRd9zFqRHmk2McA0KSK8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75503322"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75503322"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:35:11 -0700
X-CSE-ConnectionGUID: wTEZNfbpTFKkzCIycw8UzA==
X-CSE-MsgGUID: hQNHTmEiQGSK0LlB1pBoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227137293"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 13:35:09 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 1/4] drm/xe: Fix stale and mismatched kernel-doc member
 tags in header files
Date: Mon,  6 Apr 2026 20:31:18 +0000
Message-ID: <20260406203122.3392365-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260406203122.3392365-1-shuicheng.lin@intel.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
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

Fix kernel-doc member tags that do not match the actual struct member
names, which would cause warnings with scripts/kernel-doc or produce
incorrect documentation:

- xe_bo_types.h: @atomic_access -> @attr.atomic_access
- xe_device_types.h: @mem.sys_mgr -> @mem.shrinker,
  @pinned.external -> @pinned.late.external,
  @vram_usefault.list -> @vram_userfault.list,
  @usm.asid -> @usm.asid_to_vm,
  @usm.pagemap_shrinker -> @usm.dpagemap_shrinker,
  @vm.xe -> @vm.xa
- xe_exec_queue_types.h: @last_fence -> @tlb_inval.last_fence
- xe_gt_sriov_pf_types.h: Remove stale @migration doc for non-existent
  member
- xe_gt_types.h: @info->engine_mask -> @info.engine_mask,
  @multi_queue_engine_class_mask -> @info.multi_queue_engine_class_mask
- xe_guc_ct_types.h: @ctbs.send -> @ctbs.h2g,
  @ctbs.recv -> @ctbs.g2h
- xe_guc_submit_types.h: @valid -> @multi_queue.valid
- xe_hw_engine_types.h: @sched_props.set_job_timeout ->
  @sched_props.job_timeout_ms
- xe_oa_types.h: duplicate @format -> @bo
- xe_vm_types.h: @read_only -> @invalidate_on_bind

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h          |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h      | 12 ++++++------
 drivers/gpu/drm/xe/xe_exec_queue_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  1 -
 drivers/gpu/drm/xe/xe_gt_types.h          |  4 ++--
 drivers/gpu/drm/xe/xe_guc_ct_types.h      |  4 ++--
 drivers/gpu/drm/xe/xe_guc_submit_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  2 +-
 drivers/gpu/drm/xe/xe_oa_types.h          |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h          |  2 +-
 10 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ff8317bfc1ae..0bcd9178be9e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -66,7 +66,7 @@ struct xe_bo {
 	/** @attr: User controlled attributes for bo */
 	struct {
 		/**
-		 * @atomic_access: type of atomic access bo needs
+		 * @attr.atomic_access: type of atomic access bo needs
 		 * protected by bo dma-resv lock
 		 */
 		u32 atomic_access;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..2b3fdebfc692 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -276,7 +276,7 @@ struct xe_device {
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
-		/** @mem.sys_mgr: system memory shrinker. */
+		/** @mem.shrinker: system memory shrinker. */
 		struct xe_shrinker *shrinker;
 	} mem;
 
@@ -298,7 +298,7 @@ struct xe_device {
 
 	/** @usm: unified memory state */
 	struct {
-		/** @usm.asid: convert a ASID to VM */
+		/** @usm.asid_to_vm: convert an ASID to VM */
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
@@ -315,7 +315,7 @@ struct xe_device {
 		/** @usm.pf_queue: Page fault queues */
 		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
-		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
+		/** @usm.dpagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
 #endif
 	} usm;
@@ -337,7 +337,7 @@ struct xe_device {
 			struct list_head kernel_bo_present;
 			/** @pinned.late.evicted: pinned BO that have been evicted */
 			struct list_head evicted;
-			/** @pinned.external: pinned external and dma-buf. */
+			/** @pinned.late.external: pinned external and dma-buf. */
 			struct list_head external;
 		} late;
 	} pinned;
@@ -372,7 +372,7 @@ struct xe_device {
 		struct {
 			/**
 			 * @mem_access.vram_userfault.lock: Protects access to
-			 * @vram_usefault.list Using mutex instead of spinlock
+			 * @vram_userfault.list Using mutex instead of spinlock
 			 * as lock is applied to entire list operation which
 			 * may sleep
 			 */
@@ -584,7 +584,7 @@ struct xe_file {
 
 	/** @vm: VM state for file */
 	struct {
-		/** @vm.xe: xarray to store VMs */
+		/** @vm.xa: xarray to store VMs */
 		struct xarray xa;
 		/**
 		 * @vm.lock: Protects VM lookup + reference and removal from
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8ce78e0b1d50..2f5ccf294675 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -214,7 +214,7 @@ struct xe_exec_queue {
 		 */
 		struct xe_dep_scheduler *dep_scheduler;
 		/**
-		 * @last_fence: last fence for tlb invalidation, protected by
+		 * @tlb_inval.last_fence: last fence for tlb invalidation, protected by
 		 * vm->lock in write mode
 		 */
 		struct dma_fence *last_fence;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 667b8310478d..6296483c44ec 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -49,7 +49,6 @@ struct xe_gt_sriov_pf_workers {
  * @service: service data.
  * @control: control data.
  * @policy: policy data.
- * @migration: migration data.
  * @spare: PF-only provisioning configuration.
  * @vfs: metadata for all VFs.
  */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b55cf25a75f..7351aadd238e 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -136,7 +136,7 @@ struct xe_gt {
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
 		/**
-		 * @multi_queue_engine_class_mask: Bitmask of engine classes with
+		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
 		 * multi queue support enabled.
 		 */
 		u16 multi_queue_engine_class_mask;
@@ -355,7 +355,7 @@ struct xe_gt {
 	/** @user_engines: engines present in GT and available to userspace */
 	struct {
 		/**
-		 * @user_engines.mask: like @info->engine_mask, but take in
+		 * @user_engines.mask: like @info.engine_mask, but take in
 		 * consideration only engines available to userspace
 		 */
 		u64 mask;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 5da1ce5dc372..c81996f8915a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -134,9 +134,9 @@ struct xe_guc_ct {
 	spinlock_t fast_lock;
 	/** @ctbs: buffers for sending and receiving commands */
 	struct {
-		/** @ctbs.send: Host to GuC (H2G, send) channel */
+		/** @ctbs.h2g: Host to GuC (H2G, send) channel */
 		struct guc_ctb h2g;
-		/** @ctbs.recv: GuC to Host (G2H, receive) channel */
+		/** @ctbs.g2h: GuC to Host (G2H, receive) channel */
 		struct guc_ctb g2h;
 	} ctbs;
 	/** @g2h_outstanding: number of outstanding G2H */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 5ccc5f959bb3..7824f61b1290 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -138,7 +138,7 @@ struct xe_guc_submit_exec_queue_snapshot {
 		u32 primary;
 		/** @multi_queue.pos: Position of the exec queue within the multi queue group */
 		u8 pos;
-		/** @valid: The exec queue is part of a multi queue group */
+		/** @multi_queue.valid: The exec queue is part of a multi queue group */
 		bool valid;
 	} multi_queue;
 };
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e4191a7a2c31..0f87128c6529 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -79,7 +79,7 @@ struct xe_hw_engine_class_intf {
 	 * @defaults: default scheduling properties
 	 */
 	struct {
-		/** @sched_props.set_job_timeout: Set job timeout in ms for engine */
+		/** @sched_props.job_timeout_ms: Set job timeout in ms for engine */
 		u32 job_timeout_ms;
 		/** @sched_props.job_timeout_min: Min job timeout in ms for engine */
 		u32 job_timeout_min;
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index b03ffd513483..acd78bc14822 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -159,7 +159,7 @@ struct xe_oa_buffer {
 	/** @format: data format */
 	const struct xe_oa_format *format;
 
-	/** @format: xe_bo backing the OA buffer */
+	/** @bo: xe_bo backing the OA buffer */
 	struct xe_bo *bo;
 
 	/** @vaddr: mapped vaddr of the OA buffer */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a94827d7fbec..61ef881c4ac1 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -415,7 +415,7 @@ struct xe_vma_op_map {
 	unsigned int vma_flags;
 	/** @immediate: Immediate bind */
 	bool immediate;
-	/** @read_only: Read only */
+	/** @invalidate_on_bind: Invalidate on bind */
 	bool invalidate_on_bind;
 	/** @request_decompress: schedule decompression for GPU map */
 	bool request_decompress;
-- 
2.43.0

