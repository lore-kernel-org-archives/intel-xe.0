Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04573D4A5F4
	for <intel-xe@archiver.kernel.org>; Sun, 18 Jan 2026 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2074410E20E;
	Sun, 18 Jan 2026 10:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGEAfbAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9110E20E
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Jan 2026 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768731894; x=1800267894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOhReqZweDJ+UKGSxF2dqpY65FI4aakTZf2XYy4MKeg=;
 b=aGEAfbAwRlPP5cqgPIiXCN5B4LGLK+P/LcUb1oWs/VBJiayqKOMTqZA1
 uV5RIaof8WSJ264qkz5m4EVhG49nv5Y+KnFyf8S71OFz/vLr8Y7LDHbXC
 VLcoHpDYKrlj0UY3sDQy8zR/Kx2rPJV3r/VOVBrIbqFV7bTfJxgRgQESS
 GGHuxA6Q/grmwpLqbeNpW7yOzdL0G2SSDe6xdtcm8VT1PL5+80SE75IFT
 050ecSKouVgFThndZEhf5wHODKdTA7A+dGOCCCYz87JZeKyAS6RET+tdG
 dIRZj4s6rGUl2LOMkgwN5c9JipOjkJXT7hWUqQui0Idy3FfJRzLTF4a0N g==;
X-CSE-ConnectionGUID: xZHgXmlUS6uCZHO9Ez0qlg==
X-CSE-MsgGUID: 5Eae8/J4RkGPjgTvh0PAwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69946890"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="69946890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 02:24:53 -0800
X-CSE-ConnectionGUID: zqHJYtaAQbSV66XVF1tqRg==
X-CSE-MsgGUID: dkFqRkf8RN+NvxA4LfQ8SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="204767898"
Received: from dberech-mobl.ger.corp.intel.com (HELO
 soc-PF53RESW.clients.intel.com) ([10.245.130.193])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 02:24:50 -0800
From: Farah Kassabri <farah.kassabri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	ilia.levi@intel.com
Subject: [PATCH 1/2] drm/xe: s/xe_vm_bind_kernel_bo/xe_kernel_vm_bind_bo
Date: Sun, 18 Jan 2026 12:24:30 +0200
Message-Id: <20260118102431.5085-1-farah.kassabri@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

The existing function `xe_vm_bind_kernel_bo` was originally used to bind
a buffer object to the kernel VM, but the name implies it only works for
kernel BOs. To clarify its purpose, the function is renamed to
`xe_kernel_vm_bind_bo`.

Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 7 +++----
 drivers/gpu/drm/xe/xe_vm.h         | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index e60526e30030..e23ee12d8e1d 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -130,7 +130,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 	if (err)
 		goto vm_out;
 
-	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
+	fence = xe_vm_kernel_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto bo_out;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 694f592a0f01..a27145a4137e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3830,20 +3830,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 }
 
 /**
- * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
+ * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
  * @vm: VM to bind the BO to
  * @bo: BO to bind
  * @q: exec queue to use for the bind (optional)
  * @addr: address at which to bind the BO
  * @cache_lvl: PAT cache level to use
  *
- * Execute a VM bind map operation on a kernel-owned BO to bind it into a
- * kernel-owned VM.
+ * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
  *
  * Returns a dma_fence to track the binding completion if the job to do so was
  * successfully submitted, an error pointer otherwise.
  */
-struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
+struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
 				       struct xe_exec_queue *q, u64 addr,
 				       enum xe_cache_level cache_lvl)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6cc98df47291..ff32f43aa1d8 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -268,7 +268,7 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
-struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
+struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
 				       struct xe_exec_queue *q, u64 addr,
 				       enum xe_cache_level cache_lvl);
 
-- 
2.43.0

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

