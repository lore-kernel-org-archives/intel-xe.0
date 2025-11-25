Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7741DCFD379
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F0810E357;
	Tue, 25 Nov 2025 07:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqO6uiiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD1D10E108
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764055647; x=1795591647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4zErKoEsa0unCh6PYBKji1RelkX/lw34/1e02b+jD9k=;
 b=XqO6uiiIwwhsXPedfA7CJ6krcozznE1zMbCRhOmxB4AmPxblZ4sv3FcK
 tnh+FesdNWM0z1YC5M+yaoxRVyDV8xfKGtzlAWRk7a03rQHET5YjTSFKD
 5JbXPzfv3NAA9YWLZbWfnpKke5xSKiENg1S8u82/uGvC/mEjxwL3JmXdB
 E3ERvZtF+gKNzxFaWXqLRLODrcOIHbpNnbYWg0EfqSaTUCtA2QlmoJnmy
 5dQHdoIflolQNFEJZMvI3YVX4rOKxUnTvZbRbtDBsW5Nj2fGUg4mb3L6F
 Z/S3w9C4UUtFiM9DPdxzzaU0hF5KJK28UZYTYou0WHysd4WTPN7HQRlAK A==;
X-CSE-ConnectionGUID: OI6j3KtmRK2Tpe/k5Kwozg==
X-CSE-MsgGUID: ehdoD4+dS5eEbD+7H516ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91553153"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="91553153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:27:27 -0800
X-CSE-ConnectionGUID: 5oG0zX07Tx+HyCazzL+w9A==
X-CSE-MsgGUID: Jxm8g5vHS+WTw4MeJypPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="191698555"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 23:27:25 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Date: Tue, 25 Nov 2025 13:26:27 +0530
Message-Id: <20251125075628.1182481-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

ALLOW UNMAP of VMAs associated with SVM mappings when the MAP operation
is intended to merge adjacent CPU_ADDR_MIRROR VMAs.

v2
- Remove mapping exist check in garbage collector

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      |  3 ---
 drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e895a95af126..46977ec1e0de 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -314,9 +314,6 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
 	has_default_attr = xe_vma_has_default_mem_attrs(vma);
 
 	if (has_default_attr) {
-		if (xe_svm_has_mapping(vm, xe_vma_start(vma), xe_vma_end(vma)))
-			return 0;
-
 		start = xe_vma_start(vma);
 		end = xe_vma_end(vma);
 	} else if (xe_vma_start(vma) == start && xe_vma_end(vma) == end) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2681039f3221..a7a21966e390 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2246,8 +2246,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
 			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
+			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
+		}
 
 		fallthrough;
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
@@ -2729,7 +2731,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(vma) &&
 			    xe_svm_has_mapping(vm, xe_vma_start(vma),
-					       xe_vma_end(vma)))
+					       xe_vma_end(vma)) &&
+			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
@@ -4315,6 +4318,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 
 	if (is_madvise)
 		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+	else
+		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
 
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
@@ -4391,7 +4396,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
 {
 	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
-	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
 	       xe_vma_has_default_mem_attrs(vma);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ccd6cc090309..3bf912bfbdcc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -467,6 +467,7 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
 #define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
+#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

