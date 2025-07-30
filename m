Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCB6C87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3161010E683;
	Wed, 30 Jul 2025 12:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwA7KPnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B55010E203
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878859; x=1785414859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bt0/DLFE8GP/ztQbfQ4LAVjgGhV3tTYvKkeG1vx8wCA=;
 b=WwA7KPnJhBh9WMpG8212hMMKtLlDIR39fDEg0FcuAzzo2M+TZiqKuCRu
 q9zc9jzbXkgCZc/6iwXqb9EHZDw3eogX/R18odpNXuaOR/AeZUgkrNIiM
 jaP+2nKXJ5lkfd93kibW5AP93EKlqkOYu28L47eH4vf8BPZ1I7yh0zOJl
 Uy/G3l8oCfFyNV+0T6ndT6XmTPi1Gge45QiGDpfCQOOfznHBt5LJFtQ5g
 moZI4co56YUoZ44EOQr+DcRLpzK4U1Io4o0hWf+9H45jci4nyhV91f7qB
 4pak45SI0rBydR4iq0h1HVnzVGCKKCUeS6CjyH79gOX9NLCs2Am5qKLkH Q==;
X-CSE-ConnectionGUID: a9i0htBBRYCOfDq4V1pIhw==
X-CSE-MsgGUID: LNiF+jtYSPyG83Jt8JSxnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450149"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:19 -0700
X-CSE-ConnectionGUID: MIqyL7pXSOGB+XPsjakJqw==
X-CSE-MsgGUID: GgfU5mThRomHp7EjJuY5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649478"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 11/25] drm/xe: Allow CPU address mirror VMA unbind with gpu
 bindings for madvise
Date: Wed, 30 Jul 2025 18:30:36 +0530
Message-Id: <20250730130050.1001648-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..c2a5eda504bb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -919,6 +919,41 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
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
index da9a69ea0bb1..754d56b4d255 100644
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
index 62230283c384..d039779412b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2669,8 +2669,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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

