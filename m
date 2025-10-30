Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD804CCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92F10E9BE;
	Thu, 30 Oct 2025 14:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtrJSrP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD1110E9BE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761834261; x=1793370261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SUazWkQiEqPbF2d6zgv4NX25Y9jDijq1IWUdFhq/RYA=;
 b=UtrJSrP951N4fWCOJyxywUOu1uWERG9KgxBwihKuotpTjsJshJHDmiAU
 hGpzYopXRooBUzP/IQZjIOTOPPOGdhfFOyZlHmOPenvKStT/Tq1rXvy9O
 pmZn+mIH0B9tiophViVQdKKONKCQnM3J/H4cPKiSTfJYVPwVQG8bjUZc9
 UszcY5yi0nelOZPDqULUrBqgBz0enx5/uEITGLn2LO79fmnpd8mQNSxH3
 C+8MCiXDlRlgi+fODs1AZNGYADLlKGc2dm+SNO5fQtGMZkapFMtz5xjHw
 N55XbdoqtYCl37luiyhgS25p08kGaW53/OiPuHgsBxVfCd+XdEaWHJ8Pa Q==;
X-CSE-ConnectionGUID: DVYJ3qPKT+ONACH9XTbIsA==
X-CSE-MsgGUID: aElQ4WJFQSqEAWRX0iAtZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63181356"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63181356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:24:21 -0700
X-CSE-ConnectionGUID: nnqNbuOuTJO4sy9LjuPMDw==
X-CSE-MsgGUID: Ifxiz4YxSoCuyXOL6COJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216625328"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 07:24:20 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Date: Thu, 30 Oct 2025 20:22:52 +0530
Message-Id: <20251030145253.867189-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
References: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm_types.h |  3 ++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f348a1ca3e54..882968ea9efb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2244,8 +2244,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
+		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
 			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
+			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
+		}
 
 		fallthrough;
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
@@ -2727,7 +2729,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(vma) &&
 			    xe_svm_has_mapping(vm, xe_vma_start(vma),
-					       xe_vma_end(vma)))
+					       xe_vma_end(vma)) &&
+			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
@@ -4295,6 +4298,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 
 	if (is_madvise)
 		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+	else
+		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
 
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
@@ -4371,7 +4376,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
 {
 	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
-	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
 	       xe_vma_has_default_mem_attrs(vma);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 830ed7b05c27..7578ccada2cf 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -470,7 +470,8 @@ struct xe_vma_ops {
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
-#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
+#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(2)
+#define XE_VMA_OPS_ARRAY_OF_BINDS        BIT(3)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

