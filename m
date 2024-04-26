Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEEAC19F4F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 11:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BAD1121F6;
	Fri, 26 Apr 2024 11:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPaoxdyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793D711226E
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714129897; x=1745665897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GgF1xl0u0uciUny7wJVT6Trp6SQSgqiYbyqlNrk39GQ=;
 b=RPaoxdyjJ4cIz+FaEK0E477i74UaayHes9EiEniMCZRwVYa0NKeQbAJK
 Wg51WqDpcdN51syntQx9zIYAUZ/U4SUjy0qOquDg1hEnavgOSCrpnzyJa
 f6uJNSMDc7jVg2O/ESf/9/SZzsb+0ctLkx6C+NWwjdscko1fLkr8oQjiL
 b0rVRo94LVm8ZqH2NRKmIV7AeoS7aXxv6CX2kodHAHKIrd60k6DDH7mTF
 Vv4B3iJUKVL4F81/9ThxU9LM7erJuyycSVRn0TwJVbMyvewzaifDIJPib
 bRM4BIwylsD9BVnryL2UKlSF2kwCDMOD+LS/eQHXJWf2D8D0lkSUpnWZt w==;
X-CSE-ConnectionGUID: XMzXSqLKTJyINxlGBPmVLg==
X-CSE-MsgGUID: E6zqp1TKQBujLOwt8Mh+/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9712824"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9712824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:11:37 -0700
X-CSE-ConnectionGUID: giUo3/XCRimB1f4I51k2/Q==
X-CSE-MsgGUID: vkUdK89iSzG6ITnMwil06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25384223"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:11:36 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 5/5] drm/xe: Refactor default device atomic settings
Date: Fri, 26 Apr 2024 12:56:55 +0200
Message-ID: <20240426105655.23738-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240426105655.23738-1-nirmoy.das@intel.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
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

v2: Fix platform checks to correct atomics behaviour on PVC.

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
index 8fc37c5a0196..f795016a80d5 100644
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

