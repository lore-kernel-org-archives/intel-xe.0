Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9422FC3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6910E402;
	Mon,  7 Apr 2025 09:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3xLtX2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDF310E402
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019600; x=1775555600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GqIcWWI2J0s1pEWkwNWAIMr0KbnBvzy9hpyWPs3pXsw=;
 b=i3xLtX2ZJg33NKy+N9EiFvsOh+TYVrRXc/fbMJig15nn55TeHeBd+98m
 wjMzDW9o3ez+vpjb1Q7jX/NnHwgmJDVGyueJrwQhZ0cDl6xFoK0py3Gej
 MqJqI7MYH3QZw9hM2d2EVT+wxa1H0DDo887kOEXvV+zCCQnqRas1BE5xf
 JJFWwIR2UOctAjVy7MZ+W61e1O+2LM/02PvKHWPkS8TsGGFxk0cH0Yiz3
 tXKl/M0wLQ3Rxk6sRLf1KE3pYhCd47jICIep0D9+YD06HyoijvqEuxhqN
 R3CAhYETht6LhbcvAhoB3m6Sf5oSEue5X7wY1DtOufymGUSbjq9Xww5kk A==;
X-CSE-ConnectionGUID: q+euDlDaS7+EAAqk5e5kDQ==
X-CSE-MsgGUID: yD5U0RPQR4e0uvb8Zs0UfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029442"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:20 -0700
X-CSE-ConnectionGUID: JSZIGNggRx22KyyscCwMxQ==
X-CSE-MsgGUID: lc5dEN5kQZKw1meXq+AGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778824"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 20/32] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Date: Mon,  7 Apr 2025 15:47:07 +0530
Message-Id: <20250407101719.3350996-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 59e2a951db25..6e5ba58d475e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2421,8 +2421,16 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
+static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
+{
+	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
+	dst->preferred_loc.devmem_fd =  src->preferred_loc.devmem_fd;
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
@@ -2451,7 +2459,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr.pat_index, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2468,14 +2476,10 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
 		vma = ERR_PTR(err);
+	} else {
+		cp_mem_attr(&vma->attr, &attr);
 	}
 
-	/*TODO: assign devmem_fd of local vram once multi device
-	 * support is added.
-	 */
-	vma->attr.preferred_loc.devmem_fd = 1;
-	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
-
 	return vma;
 }
 
@@ -2600,6 +2604,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
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
@@ -2609,7 +2624,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2657,7 +2672,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->attr.pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2687,7 +2702,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->attr.pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

