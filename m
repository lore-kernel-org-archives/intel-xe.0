Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC13C48BC3
	for <intel-xe@archiver.kernel.org>; Sat, 17 Feb 2024 06:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C310E545;
	Sat, 17 Feb 2024 06:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLAryMlr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807510E545
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Feb 2024 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708149752; x=1739685752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i7biYuVw22IM3zTp+Kk6pv9cOxlzF01UAfY926ajgaQ=;
 b=ZLAryMlrCLFkofxfb4O03Lr/UbVRCNu3XNGq4m6jfNNKPESieRZlkmDF
 7fN6D8vQKczB73oC3CQJW0Lzgt0z+JA7ti6DDtQFEUUqwXXKPU6ap7/XG
 DpdADX+kcK8blONt6GDPTZ7Si9P45NvzXSYyolTCrS/v959esSGLH2io4
 HGCo7Nn6BIQ3SNMxjPOQMe4tCHbJbGOa1zxUfzHOtrCqortFPTfGBRnjx
 8I3a6eBLW685k0Igtf63j+qM0G4tI3qwEJEg6sqt4goNCPvxjb7PYstTz
 5F6CQSa1cgl30VMQD1A8YpL6es6c/6FX26OenSt8soYP9xt/Pzl0UCyGd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6114833"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="6114833"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 22:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8709348"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 22:02:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe: Don't skip compact PT entry remap
Date: Fri, 16 Feb 2024 22:03:13 -0800
Message-Id: <20240217060313.3556429-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 1 +
 drivers/gpu/drm/xe/xe_vm.c       | 9 +++++----
 drivers/gpu/drm/xe/xe_vm_types.h | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1e35c7525447..48d276d01a2d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -554,6 +554,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			walk->shifts = xe_compact_pt_shifts;
 			flags |= XE_PDE_64K;
 			xe_child->is_compact = true;
+			xe_walk->vma->gpuva.flags |= XE_VMA_PTE_COMPACT;
 		}
 
 		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..f1e77c8c5d7a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2188,7 +2188,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 
 static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 {
-	if (vma->gpuva.flags & XE_VMA_PTE_1G)
+	if (vma->gpuva.flags & (XE_VMA_PTE_1G | XE_VMA_PTE_COMPACT))
 		return SZ_1G;
 	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
 		return SZ_2M;
@@ -2198,7 +2198,7 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 	return SZ_1G;	/* Uninitialized, used max size */
 }
 
-static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
+static void xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 {
 	switch (size) {
 	case SZ_1G:
@@ -2207,9 +2207,10 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 	case SZ_2M:
 		vma->gpuva.flags |= XE_VMA_PTE_2M;
 		break;
+	case SZ_4K:
+		vma->gpuva.flags |= XE_VMA_PTE_4K;
+		break;
 	}
-
-	return SZ_4K;
 }
 
 static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5ac9c5bebabc..97847459a235 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -29,6 +29,7 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
-- 
2.34.1

