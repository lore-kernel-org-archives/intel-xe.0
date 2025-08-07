Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEAFC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6C10E887;
	Thu,  7 Aug 2025 16:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k08Xlyqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D95410E0E9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583413; x=1786119413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZUK5ENcX0yj9kg9nRoiFjIBd5mA/zUi99jBlGGwVH2I=;
 b=k08XlyqsncwBGwANo3dKLmnmB4zMUMthnXw23wJ2/O0+MpJcVRyMgGV7
 FjVb8LH65mZBqKi65VrDYddNW6tpzd+rExvwCGmaVrPRqoJys9x3ikA0G
 559VBAySS6qLbt7GTUP0aJHvrBVvPmTOtAzY6537i7hI7A/PATwoeAxBl
 NMRPXjmJlhXgQX4EvrAZwy29+kZQU7VvrLMgo85/3/FRt5weMw/APeNdP
 YsBtulGzbvugcho31Wji56R8BwI7mfTl7LW6XbSiW6mHX540cF7f5ilPl
 QOTBzyfQ1OnzPrhSUTgkEI8Rq8DOygaIhKftRzGneJd1ZVl8kF7PdllQV g==;
X-CSE-ConnectionGUID: h9n+v6TXQbea1WpbUEDoNw==
X-CSE-MsgGUID: gujic1FSTbmBUdL0USC6EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845559"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845559"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:16:53 -0700
X-CSE-ConnectionGUID: 3yfoOeHCQVWTOJaTEdw/7w==
X-CSE-MsgGUID: vto2BuF5SD20k9RNrm+hiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937788"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:16:52 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 08/26] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Date: Thu,  7 Aug 2025 22:13:20 +0530
Message-Id: <20250807164338.1832254-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

This change simplifies the logic by ensuring that remapped previous or
next VMAs are created with the same memory attributes as the original VMA.
By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
in memory attributes.

-v2
 *dst = *src (Matthew Brost)

-v3 (Matthew Brost)
 Drop unnecessary helper
 pass attr ptr as input to new_vma and vma_create

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index eba334920247..c5fe475b1fcc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1168,7 +1168,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
-				    u16 pat_index, unsigned int flags)
+				    struct xe_vma_mem_attr *attr,
+				    unsigned int flags)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -1223,7 +1224,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->attr.pat_index = pat_index;
+	vma->attr = *attr;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2450,7 +2451,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr *attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2479,7 +2480,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2622,6 +2623,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+				},
+				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+				.pat_index = op->map.pat_index,
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2631,7 +2641,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2679,7 +2689,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2709,7 +2719,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

