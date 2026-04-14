Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A790DF9D0F6
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 22:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FDC10E035;
	Tue, 14 Apr 2026 22:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sdc5ij3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80110E035
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 22:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776207538; x=1807743538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HyF4RaYXKpiOM47EsUnXmF/OvtLRWnNOrcmz8Mb5Edg=;
 b=Sdc5ij3oUmytpAL1yrMRMhc1WvOmrIgiZCxAj5XjsU2HdzWuoWmiL/S7
 7t6RiYnb/2j+N9KABOnfDsNpi0Evok+PpwXOmYhPHk/nVPgL3Yorl85UL
 hxJRLrZ4Tg3a8/X3g4G2BGUZIh+npYcxLZz+pN1lj3WnZM6bRYZcky/Gg
 t9vlF5VhX9RqSEFWplExfdYxoMjifFCPZhMckm3GpKVk4qwHgMAehvQau
 GVSVa2sNG3UIWLG2Srk36SkiHyMG53Xo0HzJHGTKp+scZsDrUNaqzKkdC
 UU/zuUjJZma2EvQcr5HhMup/1Ce9A0eRJSqbbTE6YT/wbOXiQjpFnAJ8o g==;
X-CSE-ConnectionGUID: eIKEElDuQN+Y4WWX/s35XQ==
X-CSE-MsgGUID: XEmzB8qfSayUfpSPooaf2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77056627"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77056627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 15:58:58 -0700
X-CSE-ConnectionGUID: tE55Vq2fT5+vrz7iwcHXDw==
X-CSE-MsgGUID: FEk4YJ2bR5m4h7fX8ZnLPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253442365"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 15:58:56 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v3 1/4] drm/xe: Fix stale and mismatched kernel-doc member
 tags in header files
Date: Tue, 14 Apr 2026 22:54:30 +0000
Message-ID: <20260414225457.3687449-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260414225457.3687449-1-shuicheng.lin@intel.com>
References: <20260414225457.3687449-1-shuicheng.lin@intel.com>
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
  @vram_usefault.list -> @mem_access.vram_userfault.list,
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
- xe_vm_types.h: @read_only -> @invalidate_on_bind,
  add missing @vma_flags doc

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
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
 drivers/gpu/drm/xe/xe_vm_types.h          |  3 ++-
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 9d19940b8fc0..9c199badd9b2 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -67,7 +67,7 @@ struct xe_bo {
 	/** @attr: User controlled attributes for bo */
 	struct {
 		/**
-		 * @atomic_access: type of atomic access bo needs
+		 * @attr.atomic_access: type of atomic access bo needs
 		 * protected by bo dma-resv lock
 		 */
 		u32 atomic_access;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..2ebe33a0dc07 100644
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
+			 * @mem_access.vram_userfault.list Using mutex instead of spinlock
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
index a94827d7fbec..635ed29b9a69 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -412,10 +412,11 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	/** @vma_flags: VMA flags for this operation */
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

