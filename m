Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE2CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 05:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF8110E373;
	Mon,  3 Nov 2025 05:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6/yXHxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9E10E373
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 05:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762148481; x=1793684481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T90dfvrdLF+JZ867G9UYCy4WHgLvrOIRGALzZSl1Tt4=;
 b=M6/yXHxZH0EixBxJo/fVAESKpUSAcB62+123YUP8hXEK5vOymkiU04oQ
 ZxHahYL5tphwdxYppRFLOTy00eOvVznNoM/39uT0cHkHM8SChQTCI3OhL
 1Z6r3CSfC6CvskUWZR4e+ldVpIGaSpFbYF+SEiNIMLkASfakG2mRaYx6F
 HTMDiNKjfQlIyZqT4D+oSPDdgfbaNWPLOXJZPNfFvAY8ud1TrC46UMYMq
 GTSJRx2J2W9IX/kjIFZ09LMP5nK9vJe/7iAvQfTA9FazCDrYkKEWWpDQM
 HtejaPH2BRT6WpH1vFmr32PGz6RbBtMfm8TkYjfOEySTsidz5XH/uwPuJ g==;
X-CSE-ConnectionGUID: ywj+H/xNT5CrM3DVnNusGQ==
X-CSE-MsgGUID: fTEd6RmrTb65CZpfIbcpAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74896317"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="74896317"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 21:41:21 -0800
X-CSE-ConnectionGUID: M4d+eATbRdmiY+EXXbwa7A==
X-CSE-MsgGUID: g6DIaBR0SqOuEUZxQA5hxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936215"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 21:41:20 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Date: Mon,  3 Nov 2025 11:39:56 +0530
Message-Id: <20251103060957.957760-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
References: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
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
index d78eb95a954f..12354e03c3e2 100644
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

