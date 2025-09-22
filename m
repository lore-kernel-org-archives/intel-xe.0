Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B5BCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 10:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1EA10E409;
	Mon, 22 Sep 2025 10:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNHDXKo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455310E409
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758536128; x=1790072128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gYy8AyZ3USTkgVa1hDpeWMFC822/OF94x2CcmIF2Pmg=;
 b=QNHDXKo/4+lF2joIOR/mt2mRaVKzXQF2QNq6j9Ksfo8SHmmXr/ZjaWu0
 MMD2/lMKmmJIVzBqJ7o3qGwPyZdfL7OC8tNvsI+NGuKJrOs7iplV6hv1u
 yHVe6M9cpcBMYyALTSaU59FVMtOuo+D9mfUXqpkQJddhDpzdRh+ptJPk9
 2facX1jNCItz9Y1pgVzm5t3yyBTGmquWDLJFZY7+8QHW848gUM9FAwavd
 TIiIFtuzNmTl8peiS68BHPtuyfFFc5iytsNxdblTPsEIUPuihG/1MCEIx
 Iruv/o5pG2ifS/URbP789Ks4pXEOdv5u3Yo0Bua9nCqTw2x4jQKiX/CPW A==;
X-CSE-ConnectionGUID: QvykupXZRXactkhZDvBJ1A==
X-CSE-MsgGUID: 5O2kpunFREqkiP5xLxlDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64433405"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="64433405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:15:28 -0700
X-CSE-ConnectionGUID: NHp8oBRiRsCR93Ew4A/alA==
X-CSE-MsgGUID: W3mC+E/PT2O2/WkmboTlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176263387"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 03:15:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/4] drm/xe/svm: Enable UNMAP for VMA merging operations
Date: Mon, 22 Sep 2025 16:13:16 +0530
Message-Id: <20250922104316.263995-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
References: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 198130f71e0f..b3f4f7587f02 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2226,8 +2226,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
 			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
+			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
+		}
 
 		fallthrough;
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
@@ -2723,7 +2725,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(vma) &&
 			    xe_svm_has_mapping(vm, xe_vma_start(vma),
-					       xe_vma_end(vma)))
+					       xe_vma_end(vma)) &&
+			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
@@ -4275,6 +4278,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 
 	if (is_madvise)
 		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+	else
+		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
 
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
@@ -4351,7 +4356,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
 {
 	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
-	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
 	       xe_vma_has_default_mem_attrs(vma);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index da39940501d8..fd4b3c4f1d68 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -476,6 +476,7 @@ struct xe_vma_ops {
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
+#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(2)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

