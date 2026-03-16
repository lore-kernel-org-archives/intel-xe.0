Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB9F53D7E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 18:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932310E088;
	Mon, 16 Mar 2026 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/r+ev5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2837A10E088
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773684503; x=1805220503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cYa+sPlMXAR3Nink4tf3U/Rw9/gbhqAUtpX9k3taPi8=;
 b=S/r+ev5pvRqGxVC7RmrQRoxesDwJ1q0zBwC7QcVijlAcArauQAsph9vx
 N9KLCbkwqPK1pVxZ+mxfTS2MwHVzWrFpvJr7UcWtx2ZstClPdLz7Aa7ZR
 +nuAeuxjTVyMVOxV27E3Od5u4q+xaVW75DSMME6GuGeB8HOepsOH4Nv2f
 TW3cn6RU/4OeskCGkJ/5CBqFZpL81jSVctjMv2dSjMUcz6POG3s69mjbi
 4VDH1TNYsNEwdrxiwfk5FIxtpu7JhJqTIRBGdEx/Otgq6EWMQQKjDEE+9
 X7ZtzeW81dB1hu6S/l1l+n+YqUhyY3bsrBMrLuq/I/VZXpjbWi5LB5SDT A==;
X-CSE-ConnectionGUID: vWxvO+3nTdCCzg5jcXvsHw==
X-CSE-MsgGUID: 9I6NSkzpRaKohQOHIkxY4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85025991"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85025991"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:08:23 -0700
X-CSE-ConnectionGUID: Y+CLd9lnQ8it4pOS4O2M1Q==
X-CSE-MsgGUID: K1CJUpKhQDqp7P/mDVMuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222213709"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 11:08:22 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 1/4] drm/xe: Fix stale and mismatched kernel-doc member tags
 in header files
Date: Mon, 16 Mar 2026 18:03:16 +0000
Message-ID: <20260316180322.1721237-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316180322.1721237-6-shuicheng.lin@intel.com>
References: <20260316180322.1721237-6-shuicheng.lin@intel.com>
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

- xe_device_types.h: @mem.sys_mgr -> @mem.shrinker,
  @pinned.external -> @pinned.late.external,
  @vram_usefault.list -> @vram_userfault.list
- xe_exec_queue_types.h: @last_fence -> @tlb_inval.last_fence
- xe_gt_sriov_pf_types.h: Remove stale @migration doc for non-existent
  member
- xe_gt_types.h: @info->engine_mask -> @info.engine_mask
- xe_guc_submit_types.h: @valid -> @multi_queue.valid
- xe_hw_engine_types.h: @sched_props.set_job_timeout ->
  @sched_props.job_timeout_ms
- xe_oa_types.h: duplicate @format -> @bo
- xe_vm_types.h: @read_only -> @invalidate_on_bind

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h      | 6 +++---
 drivers/gpu/drm/xe/xe_exec_queue_types.h  | 2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h | 1 -
 drivers/gpu/drm/xe/xe_gt_types.h          | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h   | 2 +-
 drivers/gpu/drm/xe/xe_oa_types.h          | 2 +-
 drivers/gpu/drm/xe/xe_vm_types.h          | 2 +-
 8 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 615218d775b1..968b89eee759 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -273,7 +273,7 @@ struct xe_device {
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
-		/** @mem.sys_mgr: system memory shrinker. */
+		/** @mem.shrinker: system memory shrinker. */
 		struct xe_shrinker *shrinker;
 	} mem;
 
@@ -334,7 +334,7 @@ struct xe_device {
 			struct list_head kernel_bo_present;
 			/** @pinned.late.evicted: pinned BO that have been evicted */
 			struct list_head evicted;
-			/** @pinned.external: pinned external and dma-buf. */
+			/** @pinned.late.external: pinned external and dma-buf. */
 			struct list_head external;
 		} late;
 	} pinned;
@@ -369,7 +369,7 @@ struct xe_device {
 		struct {
 			/**
 			 * @mem_access.vram_userfault.lock: Protects access to
-			 * @vram_usefault.list Using mutex instead of spinlock
+			 * @vram_userfault.list Using mutex instead of spinlock
 			 * as lock is applied to entire list operation which
 			 * may sleep
 			 */
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
index 8b55cf25a75f..c61606f7e989 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -355,7 +355,7 @@ struct xe_gt {
 	/** @user_engines: engines present in GT and available to userspace */
 	struct {
 		/**
-		 * @user_engines.mask: like @info->engine_mask, but take in
+		 * @user_engines.mask: like @info.engine_mask, but take in
 		 * consideration only engines available to userspace
 		 */
 		u64 mask;
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
index 69e80c94138a..73f2825d7b35 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -375,7 +375,7 @@ struct xe_vma_op_map {
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

