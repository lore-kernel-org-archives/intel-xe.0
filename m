Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A668C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507AC112CEA;
	Tue, 30 Apr 2024 16:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3h2PYTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BD5112CEE
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495219; x=1746031219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EK23igEBN3T1RwBYxY4IU18at0s76i1kUo8UzCtFQlg=;
 b=O3h2PYTAcuksc75ZeBf7DeQf8SBhBcyZsTdqr/Q6QtAS8hhVQ4sbmLmR
 9imUA/tTVjKD/tOO2HiyDWkHp7JCm/P2BNbZBeaDC5D6pcnaqHQ68tHlL
 /PU77qJoR8Mz0txajkI6AK0uBWdHKba2XtCyunlQCd3A39ihzJ99NJI36
 G1P9h1AkB3dxFgCAQGeD8z9/qyay+/rI7gN6WEkmY1BCEdc3JfahAAsE7
 dNfuqF2QmFXf+63I1Y4I7oEMmSEkR0m0tLZ060vT+O/IRc8k9z3unLElP
 VymJMBWHxn/80fEqF1pN5XY6Bs4NpP9Q/C4lUFPkvJ9m2J5Ab4K6u6z/b Q==;
X-CSE-ConnectionGUID: REgiYduDS/+oMGJAmpZMyw==
X-CSE-MsgGUID: d4EAn0JJRuOmeBE/oUIMgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10073962"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10073962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:19 -0700
X-CSE-ConnectionGUID: Owspuhr6SZO2bOfSaeZQWA==
X-CSE-MsgGUID: fUpssW5BSSS9bpFyVMvQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26519153"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH v6 5/5] drm/xe: Refactor default device atomic settings
Date: Tue, 30 Apr 2024 18:25:29 +0200
Message-ID: <20240430162529.21588-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
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

The default behavior of device atomics depends on the
VM type and buffer allocation types. Device atomics are
expected to function with all types of allocations for
traditional applications/APIs. Additionally, in compute/SVM
API scenarios with fault mode or LR mode VMs, device atomics
must work with single-region allocations. In all other cases
device atomics should be disabled by default also on platforms
where we know device atomics doesn't on work on particular
allocations types.

v3: fault mode requires LR mode so only check for LR mode
    to determine compute API(Jose).
    Handle SMEM+LMEM BO's migration to LMEM where device
    atomics is expected to work. (Brian).
v2: Fix platform checks to correct atomics behaviour on PVC.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 37 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c |  2 +-
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8d3765d3351e..87975e45622a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -619,9 +619,40 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
-	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
-	    (is_devmem || !IS_DGFX(xe)))
-		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+	/**
+	 * Default atomic expectations for different allocation scenarios are as follows:
+	 *
+	 * 1. Traditional API: When the VM is not in LR mode:
+	 *    - Device atomics are expected to function with all allocations.
+	 *
+	 * 2. Compute/SVM API: When the VM is in LR mode:
+	 *    - Device atomics are the default behavior when the bo is placed in a single region.
+	 *    - In all other cases device atomics will be disabled with AE=0 until an application
+	 *      request differently using a ioctl like madvise.
+	 */
+	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
+		if (xe_vm_in_lr_mode(xe_vma_vm(vma))) {
+			if (bo && xe_bo_has_single_placement(bo))
+				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+			/**
+			 * If a SMEM+LMEM allocation is backed by SMEM, a device
+			 * atomics will cause a gpu page fault and which then
+			 * gets migrated to LMEM, bind such allocations with
+			 * device atomics enabled.
+			 */
+			else if (is_devmem && !xe_bo_has_single_placement(bo))
+				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		} else {
+			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		}
+
+		/**
+		 * Unset AE if the platform(PVC) doesn't support it on an
+		 * allocation
+		 */
+		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
+			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
+	}
 
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f1357e2a3b10..d17192c8b7de 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -888,7 +888,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
 
-	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
+	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	vma->pat_index = pat_index;
-- 
2.42.0

