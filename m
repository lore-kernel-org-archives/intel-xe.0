Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B95DC04FF8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01BB11265F;
	Mon, 15 Apr 2024 15:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSiOsrIt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733B011265F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713193604; x=1744729604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ONYWTo/ryCMHgJaux0JMoP5pi0hIRcZHNTrM/Z8KuA=;
 b=HSiOsrIt0zvqvRo8WPNoEmKALjDub/Vhw+nXelsKg3ZDP4LajBWI5Zp7
 u2LIbYNl++DmOqiHdKTa8An16tGr37G5TGLEjOrs0YwrAZYTHmSxl+BWs
 BOfm+RmfnLlZQ/2dk39ASH6hm0jvdOkLFOvmsqYIeXxHJR58TMu04L7F2
 fghbNL14YXwKnGmSRehvFIwkM00AVbGN3W4lJ3SO9Fkd5LvtL7kM8Mv3k
 vn8jrGM8zI89emUODI1eDDWuGYz42RsNTRBQnfdUiDZkE4IOQHPDDkPuW
 GDhP1LI4uGa8sQ8XdYn/MfQhfplv5PTjXWxnftXy8QSqizTtGH/m7fY+E w==;
X-CSE-ConnectionGUID: 9zHNGhaISjO3ZahgOHrbjA==
X-CSE-MsgGUID: v6D9BW4JRzK6zpHmEl3ZRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20013303"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20013303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:42 -0700
X-CSE-ConnectionGUID: 7mBvGNeMRAO24S9uLEbLFQ==
X-CSE-MsgGUID: 7ICLLvzNTNmgYQuEw42tng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22414845"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:41 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
Date: Mon, 15 Apr 2024 16:52:09 +0200
Message-ID: <20240415145214.25641-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Currently decision to set PTE_AE is spread between xe_pt
and xe_vm files and there is no reason to be keep it that
way. Consolidate the logic for better maintainability.

Atomics is not expected on userptr memory so this patch
also making sure PTE_AE is only applied when a buffer object
exist.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 +---
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5b7930f46cf3..7dc13a8bb44f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -597,7 +597,6 @@ static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
 	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
 		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
@@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
-	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
-	    (is_devmem || !IS_DGFX(xe)))
+	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 
 	if (is_devmem) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2dbba55e7785..b1dcaa35b6cc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -806,9 +806,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
 
-	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
-		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
-
 	vma->pat_index = pat_index;
 
 	if (bo) {
@@ -816,6 +813,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 		xe_bo_assert_held(bo);
 
+		if (vm->xe->info.has_atomic_enable_pte_bit &&
+		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
+			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
+
 		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
 		if (IS_ERR(vm_bo)) {
 			xe_vma_free(vma);
-- 
2.42.0

