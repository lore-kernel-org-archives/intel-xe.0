Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B98C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAD710F546;
	Fri, 12 Apr 2024 09:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHwc+U5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E3110F54B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914640; x=1744450640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2qSwgO6WL0vFlUjMYuYiYpqP+2JCsN23vbZUA2+2fOs=;
 b=hHwc+U5YR7Wo8yd8F5Foau9hndJrX7FPk6qfQ9ImDEyuXwhOKAgpsuPQ
 gxSGasI4+vsRwWDVgTb2WO3t7aUe+z8j39/yIShdMpICjlBTylCpA3IqI
 ZeV6HnOXRR39FCV7h71pspfvWRpVwSNrA0eUKcDxscIToPmJo2gVmNtyG
 pHsW57uaBdPYPr/KiKx0ippNNkM3fcQkb598rH+RAtFFnS8H3CO7LabV3
 fsoUfD3rGUo/0VP4ztFk4Sq1Q6T5XJvM/qqSyISO3sCTWu3uqSUDx9uXZ
 8LJMgbBitGfHSqJ3JKANtxU73xoHud9jelBgdAMgbKjcHW2JhMpC6AQxB A==;
X-CSE-ConnectionGUID: 3ZFFSTZEQVeU8PgjPI0Jlg==
X-CSE-MsgGUID: 2pUs5OG+S7C0fi+3WsglDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075939"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:00 -0700
X-CSE-ConnectionGUID: vXe+BrN4S2ycFSQDlEFXeA==
X-CSE-MsgGUID: BbSrqEobSHyzwZVGg0Ou2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342148"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:36:59 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 2/7] drm/xe: Consolidate setting PTE_AE into one place
Date: Fri, 12 Apr 2024 11:22:44 +0200
Message-ID: <20240412092249.3636-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
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
index a196dbe65252..7991d88fba22 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -904,9 +904,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
 
-	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
-		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
-
 	vma->pat_index = pat_index;
 
 	if (bo) {
@@ -914,6 +911,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
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

