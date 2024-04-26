Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C741C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CED510F2FA;
	Fri, 26 Apr 2024 09:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcHWhtAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9BA10F2A6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714124143; x=1745660143;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=e642YcSy/+VIecHW1NssnVDr1lBXIB4GhEU1EPMI7HE=;
 b=lcHWhtAK1y5KNiQCq1XedxlphpYLuSaiAChS2T+mCi5ePEpsrB/b8Ej5
 LxQyjuWGH5ZWhK9ZXiI4bvP+QiYOjGYYs+/5xnbTzJ02WtR9WopMRhkr+
 dnwc7VB59s5Ty1ZKUCx2iQA+TGs8srshubi0UHRMmxrULL1uTfXoIJXNd
 v7zkjnlUrmMO5yiMnIRMwGOklnXMpwADWR+FPfaeiWGQA7TKaITQgEouG
 PdMumG2EazTq1b2fdYtLSfD32oT4UwuI9j+rFQeVgriREvzkaLTk8+14Q
 OJbYZshwWrMGd2HknxBj82vvLjCuG7Vx4Iud/EzCJkbujh55ZAp+qOHzl A==;
X-CSE-ConnectionGUID: GtCmxfBhR5Gx+dCnmbUFfA==
X-CSE-MsgGUID: wOM/kd9HTvin/K2127HmGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20467107"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="20467107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:35:43 -0700
X-CSE-ConnectionGUID: +iiFBTUURMyD3AwjxSWz3w==
X-CSE-MsgGUID: Q507Dw2bSSmESzqzIU011Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25373023"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:35:43 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 5/5] drm/xe: Refactor default device atomic settings
Date: Fri, 26 Apr 2024 11:20:53 +0200
Message-ID: <20240426092053.2863-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240426092053.2863-1-nirmoy.das@intel.com>
References: <20240426092053.2863-1-nirmoy.das@intel.com>
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
device atomics should be disabled by default.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c |  2 +-
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5b7930f46cf3..237e4a4985a4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -619,9 +619,30 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
-	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
-	    (is_devmem || !IS_DGFX(xe)))
-		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+	/**
+	 * Default atomic expectations for different allocation scenarios are as follows:
+	 *
+	 * 1. Traditional API: When the VM is not in fault mode or LR mode:
+	 *    - Device atomics are expected to function with all allocations.
+	 *
+	 * 2. Compute/SVM API: When the VM is either in fault mode or LR mode:
+	 *    - Device atomics are the default behavior when the bo is placed in a single region.
+	 *    - In all other cases device atomics will be disabled with AE=0 until an application
+	 *      request differently using a ioctl like madvise.
+	 */
+	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
+		if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
+		    xe_vm_in_lr_mode(xe_vma_vm(vma))) {
+			if (bo && xe_bo_has_single_placement(bo))
+				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		} else {
+			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
+		}
+
+		/* Unset AE if the platform(PVC) doesn't support it */
+		if (!xe->info.has_device_atomics_on_smem && !is_devmem)
+			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
+	}
 
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e41345c1627d..a32c0c4f900c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -805,7 +805,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
 
-	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
+	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	vma->pat_index = pat_index;
-- 
2.42.0

