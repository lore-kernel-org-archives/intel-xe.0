Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9301C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 23:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F110E03B;
	Mon, 13 Jul 2026 23:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGRWF3/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396D610E39D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 23:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783986374; x=1815522374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HBke8rca0nRfQv6WtUGPYuLhrQKfbbp8VZGbS/UcrB0=;
 b=aGRWF3/4U5o4lCJe4HJJwxLq3q9h9tScW0GUlCQ3g8iwWjNatG4X4Ep0
 ur8nOzPdAKrkhJmvFuxTtib0fcta9BJ2F7KxScQTjpTULKxti67Bnd7xW
 gHqdSRc4GW6yD4M6ERPFwyGqKLHZAFgfYDH02jqocRDmwl5VtjzTysrR7
 2IA5RWopldlbRD2kVSfrEY0ryqq9ULY6dLyxGpsTH6tyMYxEJvJQf/OHW
 wi1qYCOqmQgqjlDu34Ol2mg5VxyUk49pmp02NvVjCVTTvuaysHmOnUQ9D
 DPrM+Rs+sNPliWY8VZBnvp/L5FrR9fOUHIVikQtTr8URhIMy36rvuezwS w==;
X-CSE-ConnectionGUID: /aNlYOhhQy67wLUcFXAcKg==
X-CSE-MsgGUID: D8dTXElrR22UHHqZBT9bHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95207235"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95207235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 16:46:13 -0700
X-CSE-ConnectionGUID: 1WZIo7qYRUqvgYzrZaNBGA==
X-CSE-MsgGUID: vddhUCKWQpiNStf/DpmgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="293879206"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 16:46:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH 2/2] drm/xe: Set BO TTM priority based on VM exec queue
 priority band
Date: Mon, 13 Jul 2026 16:46:06 -0700
Message-Id: <20260713234606.3367215-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713234606.3367215-1-matthew.brost@intel.com>
References: <20260713234606.3367215-1-matthew.brost@intel.com>
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

Add XE_BO_PRIORITY_LOW/HIGH/HIGHEST defines alongside the existing
XE_BO_PRIORITY_NORMAL, and use them in xe_bo_init_locked() to select
the TTM LRU priority for a newly created bo.

Kernel internal buffers (non ttm_bo_type_device) and buffers that can
be shared cross-process, i.e. not private to a single VM (no VM
pointer available), should not be evicted ahead of user buffers, so
they are always given the highest priority. For buffers private to a
user VM, prioritize the buffer based on the highest priority band of
any exec queue userspace has created against that VM, since that
reflects the importance userspace has assigned to work using the VM:

 - ttm_bo_type != ttm_bo_type_device, or no VM: XE_BO_PRIORITY_HIGHEST
 - VM with a HIGH priority exec queue: XE_BO_PRIORITY_HIGH
 - VM with a NORMAL priority exec queue: XE_BO_PRIORITY_NORMAL
 - VM with a LOW priority exec queue: XE_BO_PRIORITY_LOW
 - VM with no exec queues at all: XE_BO_PRIORITY_NORMAL

This relies on the per-priority-band exec queue counts tracked in
vm->exec_queues.priority_count, read under vm->exec_queues.lock in
read mode. xe_bo_init_locked() now takes a struct xe_vm * parameter;
all callers that create ttm_bo_type_kernel/ttm_bo_type_sg bos pass
NULL since they always get XE_BO_PRIORITY_HIGHEST regardless.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 28 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h       |  3 ++-
 drivers/gpu/drm/xe/xe_bo_types.h |  3 +++
 drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
 4 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 85e6d9a0f575..9da75ade8eaf 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1346,7 +1346,8 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 			break;
 
-		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+		backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
+					   xe_bo_size(bo),
 					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 					   XE_BO_FLAG_PINNED, &exec);
@@ -1486,7 +1487,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 			break;
 
 		if (!backup) {
-			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
+			backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
 						   xe_bo_size(bo),
 						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
@@ -2276,6 +2277,9 @@ void xe_bo_free(struct xe_bo *bo)
  * if the function should allocate a new one.
  * @tile: The tile to select for migration of this bo, and the tile used for
  * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @vm: The VM this bo will be associated with, used to determine the bo's
+ * TTM LRU priority based on the priority band of the VM's exec queues, or
+ * NULL if the bo is not associated with a user VM.
  * @resv: Pointer to a locked shared reservation object to use for this bo,
  * or NULL for the xe_bo to use its own.
  * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
@@ -2291,7 +2295,8 @@ void xe_bo_free(struct xe_bo *bo)
  * Return: The buffer object on success. Negative error pointer on failure.
  */
 struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
-				struct xe_tile *tile, struct dma_resv *resv,
+				struct xe_tile *tile, struct xe_vm *vm,
+				struct dma_resv *resv,
 				struct ttm_lru_bulk_move *bulk, size_t size,
 				u16 cpu_caching, enum ttm_bo_type type,
 				u32 flags, struct drm_exec *exec)
@@ -2353,7 +2358,20 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
-	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
+	if (type != ttm_bo_type_device || !vm) {
+		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
+	} else {
+		down_read(&vm->exec_queues.lock);
+		if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH])
+			bo->ttm.priority = XE_BO_PRIORITY_HIGH;
+		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_NORMAL])
+			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
+		else if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_LOW])
+			bo->ttm.priority = XE_BO_PRIORITY_LOW;
+		else
+			bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
+		up_read(&vm->exec_queues.lock);
+	}
 	INIT_LIST_HEAD(&bo->pinned_link);
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
@@ -2496,7 +2514,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
+	bo = xe_bo_init_locked(xe, bo, tile, vm, vm ? xe_vm_resv(vm) : NULL,
 			       vm && !xe_vm_in_fault_mode(vm) &&
 			       flags & XE_BO_FLAG_USER ?
 			       &vm->lru_bulk_move : NULL, size,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6340317f7d2e..12625740a47a 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -115,7 +115,8 @@ struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
-				struct xe_tile *tile, struct dma_resv *resv,
+				struct xe_tile *tile, struct xe_vm *vm,
+				struct dma_resv *resv,
 				struct ttm_lru_bulk_move *bulk, size_t size,
 				u16 cpu_caching, enum ttm_bo_type type,
 				u32 flags, struct drm_exec *exec);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index fcc63ae3f455..95904b03c71f 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -24,7 +24,10 @@ struct xe_vm;
 #define XE_BO_MAX_PLACEMENTS	3
 
 /* TODO: To be selected with VM_MADVISE */
+#define	XE_BO_PRIORITY_LOW	0
 #define	XE_BO_PRIORITY_NORMAL	1
+#define	XE_BO_PRIORITY_HIGH	2
+#define	XE_BO_PRIORITY_HIGHEST	3
 
 /**
  * struct xe_bo - Xe buffer object
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 8a920e58245c..a80831fabd1d 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -300,7 +300,7 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 		if (ret)
 			break;
 
-		bo = xe_bo_init_locked(xe, NULL, NULL, resv, NULL, dma_buf->size,
+		bo = xe_bo_init_locked(xe, NULL, NULL, NULL, resv, NULL, dma_buf->size,
 				       0, /* Will require 1way or 2way for vm_bind */
 				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
 		drm_exec_retry_on_contention(&exec);
-- 
2.34.1

