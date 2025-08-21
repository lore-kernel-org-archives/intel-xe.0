Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE89ACA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314310E38A;
	Thu, 21 Aug 2025 17:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfmjV4Ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D6E10E38A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795834; x=1787331834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mfCBoYU8JasibU6JXZTa1vY5woe8vkUTHbYHQHgK5hE=;
 b=XfmjV4IaTUgiAqBJ1CnjxQZMAZTbtHuDVup904MixcilJN3B62iTo2+I
 3FfxSSqWw2m3IabRDqCSAW6kRqMQ3NUJc9J0gqCDiFmkUtBQLe8EXMp3E
 DjmbcPhq2EIlhHvO2G5Du2Ahl2TcAnbpTfmPiM+msP/CUDnOVJ4EOm1Dg
 rXsno/cVqNu/0iyVvJvy7auGW0E9broqTOcdVN2XS4kn9ApcF3srJwmOe
 3S+YzX8mA9GLGWzG0C/vBB+oN1HtVxKWTJqaXh3sxGwprt5FEKGDjXdvj
 b1fazyJ2uPDCbkSZbriNmpFviumcoUnmS0fyQ+iJEgZpftNcdhoXm2Ddd g==;
X-CSE-ConnectionGUID: keMQt/sWQ8anIzKy7MlkcQ==
X-CSE-MsgGUID: QIWLA+7WScKZwySvHkd05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805831"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:03:52 -0700
X-CSE-ConnectionGUID: 1f0Mt0bdQfyKKuATv+/GOw==
X-CSE-MsgGUID: p//EIwE7TPCjzUdqgZiGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143730"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:03:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 04/20] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Date: Thu, 21 Aug 2025 23:00:48 +0530
Message-Id: <20250821173104.3030148-5-himal.prasad.ghimiray@intel.com>
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
index d7f829fba49c..4d98a0ae510d 100644
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
@@ -2471,7 +2472,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr *attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2500,7 +2501,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2643,6 +2644,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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
@@ -2652,7 +2662,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2700,7 +2710,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2730,7 +2740,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->attr.pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

