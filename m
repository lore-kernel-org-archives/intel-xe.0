Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14804C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF1610E3FD;
	Mon,  7 Apr 2025 09:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6iNCH+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBB010E3FD
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019607; x=1775555607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/f3WDSJKkiL8b0ficrql4l03UDPS1uU5XTCKljv6Eo=;
 b=G6iNCH+6zRqcX2ChpO47xVyKBXH9KO8DUIlrYeDI9mADA4hq3XBbSmc5
 5YWDLQAq8qiHS/PrBO5ShCxwhwC9SBXdATg/1Bq4xOBva4gfG9UdfxNjC
 7OLkpKqMc0Xn54JdmUhwP9wB0XmuHQ6h6Wm9Lu4yf3qnl7L1oVmDd+xgc
 eZJBuDynLgIS7R/PSbzIeW1VRxY8CBb04rq61OvmrrwxIaKe9rQLZnZXj
 JhB6AL2RDVq9iYrOvrZEW9dSDmnagvfrRBZncwshPAvG9yliJ49ZDwN2A
 tVLZyfEogIv6rOyrYnOCa1zobl43o25fLFkXc45kP57h+Ita+jl9CDCMP g==;
X-CSE-ConnectionGUID: VGfsBLrQQJKY45ySE9KiLw==
X-CSE-MsgGUID: RTItfz8xSuWBTDTrEdRR/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029455"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029455"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:27 -0700
X-CSE-ConnectionGUID: uMQbqnXBRXC92E3i0+z0SA==
X-CSE-MsgGUID: tgM/rYxzRs29TY0U1PI3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778875"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 24/32] drm/xe: Allow CPU address mirror VMA unbind with gpu
 bindings for madvise
Date: Mon,  7 Apr 2025 15:47:11 +0530
Message-Id: <20250407101719.3350996-25-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

In the case of the MADVISE ioctl, if the start or end addresses fall
within a VMA and existing SVM ranges are present, remove the existing
SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
unmapping of old one.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7ec7ecd7eb1f..efcba4b77250 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -903,6 +903,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
+ * @start: start addr
+ * @end: end addr
+ *
+ * This function cleans up svm ranges if start or end address are inside them.
+ */
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier, *next;
+
+	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *range, *__next;
+
+		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
+			if (start > drm_gpusvm_range_start(range) ||
+			    end < drm_gpusvm_range_end(range)) {
+				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
+					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
+				__xe_svm_garbage_collector(vm, to_xe_range(range));
+			}
+		}
+	}
+}
+
 /**
  * xe_svm_bo_evict() - SVM evict BO to system memory
  * @bo: BO to evict
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index d5be8229ca7e..d00ba6d6ba53 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -98,6 +98,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					u32 region);
 
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -291,6 +293,11 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return false;
 }
 
+static inline
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c7c012afe9eb..92b8e0cac063 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2362,6 +2362,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			struct xe_vma *old =
+				gpuva_to_vma(op->base.remap.unmap->va);
+			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+
+			if (op->base.remap.prev)
+				start = op->base.remap.prev->va.addr +
+					op->base.remap.prev->va.range;
+			if (op->base.remap.next)
+				end = op->base.remap.next->va.addr;
+
+			if (xe_vma_is_cpu_addr_mirror(old) &&
+			    xe_svm_has_mapping(vm, start, end)) {
+				drm_gpuva_ops_free(&vm->gpuvm, ops);
+				return ERR_PTR(-EBUSY);
+			}
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
@@ -2653,7 +2669,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(old) &&
 			    xe_svm_has_mapping(vm, start, end))
-				return -EBUSY;
+				xe_svm_range_clean_if_addr_within(vm, start, end);
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
-- 
2.34.1

