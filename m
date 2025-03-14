Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21246C28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8A710E984;
	Fri, 14 Mar 2025 07:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFlcfo49";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585210E984
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937926; x=1773473926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MY0hkFxvN1WmTvPoe74i881ws9tNm8A7CbOrsCFwevw=;
 b=IFlcfo49DocpDYAp18hEKAn3IST5aPu0syUhZdv6hu+Pan8H9cZRpHvg
 KjFEJ/Lj4F9H2pBzzE665CoT4UsAqYrupRU8ZfTtA7qTUbvfcKy1vfLul
 GRfjjuo9Z+AIIRGYbsioCyzQdSZnPEyj9z3Lq8FrnrOdMkQHmE8nFiIN3
 yP6RkB0Z2P4TNp1cVZRjqU0OGJPPyM3CANLnXYmIUgSt1pjuLSGfIy+Tk
 NMN2gmNqrMRIX7c+I/xfUnURkYgAMxFK8pY1ojD+Wufmed3b6JluEGscY
 Zo5b9lKCtwUyBO7dcBqaZ/LSJr2esiibtox2CVUm4f2Qv9yjNlKqWqTQM A==;
X-CSE-ConnectionGUID: m4uSwhP+SWy3JUkXbRNc/Q==
X-CSE-MsgGUID: XsMeQXuITMa/My9mPHO/9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446048"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446048"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:45 -0700
X-CSE-ConnectionGUID: eieDRNxETlibN9BaBgjgOQ==
X-CSE-MsgGUID: XX+ogPR5RtGWFm0FQaoy+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043824"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 17/29] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Date: Fri, 14 Mar 2025 13:32:14 +0530
Message-Id: <20250314080226.2059819-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a428562d9eb8..b892b43d6665 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2391,8 +2391,16 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
+static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
+{
+	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
+	dst->preferred_loc.devmem_fd =  dst->preferred_loc.devmem_fd;
+	dst->atomic_access = src->atomic_access;
+	dst->pat_index = src->pat_index;
+}
+
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2421,7 +2429,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr.pat_index, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2440,11 +2448,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		vma = ERR_PTR(err);
 	}
 
-	/*TODO: assign devmem_fd of local vram once multi device
-	 * support is added.
-	 */
-	vma->attr.preferred_loc.devmem_fd = 1;
-	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
+	cp_mem_attr(&vma->attr, &attr);
 
 	return vma;
 }
@@ -2570,6 +2574,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+						  /*TODO: assign devmem_fd of local vram
+						   * once multi device support is added.
+						   */
+						   .devmem_fd = IS_DGFX(vm->xe) ? 1 : 0,
+						   .migration_policy = 1,	},
+				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
+				.pat_index = op->map.pat_index
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2579,7 +2594,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2625,7 +2640,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->attr.pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2655,7 +2670,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->attr.pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

