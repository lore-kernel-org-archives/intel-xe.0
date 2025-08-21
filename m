Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3135ACA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EA610E393;
	Thu, 21 Aug 2025 17:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3skqCKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C3A10E38D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795836; x=1787331836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eci/9V9phSg279nqrKZFnifyuDqkk/NVWChvO0HI3QA=;
 b=a3skqCKLZ2SAG3xSrRSmE09Uk4KQ2ljfWRG+iTgWkkuo4o+X+n4XRAND
 MQBc3uxKtdNdbIzoClU6CGcLfcd7QxE+NXyHkR+qCuXu1n1OeIYmZnErC
 LNtl9o7WU+Ka86pIl8wogtE8iyCh+xulXT8Air52LsL5sqgwWiYzToWMv
 Z2Ab0ED2UzRtK+zhb3Z6ZG11AIHy9fHEFhVTJnb1geWaoCKICJwFffYYX
 70L284TXZlsK/rlcfaE6qXvSHHYbUVD0Bn/7ziWZtlTPhhmmYHEPCh+kX
 SRV4PAFOeroOsd9ATYVDoIKnskbEwEV1AkbZS/JjdMHGujBj1M5CCH87p w==;
X-CSE-ConnectionGUID: 1GXxiujHR8Se03i4YUJz2g==
X-CSE-MsgGUID: 7GhvT0KwRUW3C/u2N639/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805836"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:03:55 -0700
X-CSE-ConnectionGUID: WkY4XtNWQlmx2fVnESl6ow==
X-CSE-MsgGUID: Ni4eF7PsTGSl+Se5xmzhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143757"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:03:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 06/20] drm/xe: Allow CPU address mirror VMA unbind with gpu
 bindings for madvise
Date: Thu, 21 Aug 2025 23:00:50 +0530
Message-Id: <20250821173104.3030148-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

v2 (Matthew Brost)
- Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
- Rename the function

v3
- Fix doc

v4
- check if range is already in garbage collector (Matthew Brost)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e35c6d4def20..ce42100cb753 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -932,6 +932,41 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
+ * @vm: The VM
+ * @start: start addr
+ * @end: end addr
+ *
+ * This function UNMAPS svm ranges if start or end address are inside them.
+ */
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier, *next;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *range, *__next;
+
+		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
+			if (start > drm_gpusvm_range_start(range) ||
+			    end < drm_gpusvm_range_end(range)) {
+				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
+					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
+				drm_gpusvm_range_get(range);
+				__xe_svm_garbage_collector(vm, to_xe_range(range));
+				if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
+					spin_lock(&vm->svm.garbage_collector.lock);
+					list_del(&to_xe_range(range)->garbage_collector_link);
+					spin_unlock(&vm->svm.garbage_collector.lock);
+				}
+				drm_gpusvm_range_put(range);
+			}
+		}
+	}
+}
+
 /**
  * xe_svm_bo_evict() - SVM evict BO to system memory
  * @bo: BO to evict
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4bdccb56d25f..184b3f4f0b2a 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -90,6 +90,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -303,6 +305,11 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
 	return ULONG_MAX;
 }
 
+static inline
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 831e9e574e58..100e9e8c9da3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2690,8 +2690,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				end = op->base.remap.next->va.addr;
 
 			if (xe_vma_is_cpu_addr_mirror(old) &&
-			    xe_svm_has_mapping(vm, start, end))
-				return -EBUSY;
+			    xe_svm_has_mapping(vm, start, end)) {
+				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
+					xe_svm_unmap_address_range(vm, start, end);
+				else
+					return -EBUSY;
+			}
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
-- 
2.34.1

