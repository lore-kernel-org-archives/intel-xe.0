Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40EFC71151
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9440E10E296;
	Fri, 13 Jun 2025 12:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymx8KtbJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828710E20F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817818; x=1781353818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jcJGl5tds6sml7sMwsnE2CMR9eS1ymFdrIKqPFjzb/Y=;
 b=Ymx8KtbJZ8HrH2dx2+erGlNNjWjLMcsH+GIhPuFXotRZwplSKA7y8uTU
 /Deus9xtK8CsoIm5icszfsZ+CraVmW9FGa8CwQn7GpMi/5cY2/Pe3NrQE
 6OGnk53omEvbOPIzCkW/H7i2wFGwHjpn2g2Ke3bmj7MUPAh2nWBH7rXRa
 7/HH66mJoWzgJZ2WeQVTWsDD5sdDOQS3aK9pN10AZabfeHQbta5aCDtaV
 2MGZi+i0I+PB9VOVIxD3pPfAWWAoP2QU37x4Kufkjxz8o4hp/8/2nVZ8b
 18/5RZB4UXqOZyTwS5bHMQ/BUxGIbIjDmWq2uEqPZcZ73tcgqJwroHG4k A==;
X-CSE-ConnectionGUID: ca5LuwrCQf2pwCZDiGs2RA==
X-CSE-MsgGUID: KQttxdC5Q9qZ8S/zlo7oOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610171"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:18 -0700
X-CSE-ConnectionGUID: 2FTm0KG3QcGaOxEU/Ppqpw==
X-CSE-MsgGUID: IOEXMp21TkGX44yChUCEQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290335"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind with gpu
 bindings for madvise
Date: Fri, 13 Jun 2025 18:25:49 +0530
Message-Id: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 19420635f1fa..df6992ee2e2d 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -935,6 +935,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
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
index af8f285b6caa..4e5d42323679 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
 u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
+
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 	return 0;
 }
 
+static inline
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e059d9810d26..0872df8d0b15 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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

