Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9631C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765BC10E25E;
	Fri, 13 Jun 2025 12:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtWCznRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269410E296
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817808; x=1781353808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ji9xOckZIq+nY7uf7TXl+jtWCprfYfOdwjTMAs2ivjE=;
 b=PtWCznRrj6BuQ+7dgIcayBm7LCiw9/jW3y3ICpoAQyjsJgwjyfJG2iAr
 LukVfsGqgpJfBbGVyqdovJznJdq944iN+OMmmhtQVd8SxQ0Z4uwCnl/36
 LAckqu+EF6RaRO0kWEXyesSsV5zL+IL/JgUBmxZEwN2jI+hZYaymIMmS1
 qplDDeR2YN7qT55Rx6c3GR7bZiygjAbFMsA7XdxKQ03iGsA+xhIX99SjH
 AzJdsuBgqTudHkhFZ+VuiU9BsfevhjhA8mdFQAJ3v4U1pmNcI71P9QZPt
 rG9XhzfH6MiKbQuAVAN3qP1mRBgAN1/ZdzthFQTkxZ1hbGVz7boDd/JSt w==;
X-CSE-ConnectionGUID: Rwg+beDDQBiA/qR5/6NF9Q==
X-CSE-MsgGUID: 3Q+hewytRVuoyiNd7HZc3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610154"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610154"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:08 -0700
X-CSE-ConnectionGUID: ZUuoZpqXT4mO+vHt6BC0lA==
X-CSE-MsgGUID: mpj807KVQSakcEyVY1EPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290286"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 05/20] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Date: Fri, 13 Jun 2025 18:25:43 +0530
Message-Id: <20250613125558.2607665-6-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9b705526a3e3..4849d4cc806a 100644
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
@@ -2444,7 +2445,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr *attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2473,7 +2474,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2616,6 +2617,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+				},
+				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
+				.pat_index = op->map.pat_index,
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2625,7 +2635,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2673,7 +2683,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2703,7 +2713,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

