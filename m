Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C2ED29C36
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 15:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D106D10E483;
	Mon, 19 Jan 2026 15:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BafDhfDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EA110E483
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768835024; x=1800371024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dOhReqZweDJ+UKGSxF2dqpY65FI4aakTZf2XYy4MKeg=;
 b=BafDhfDqHb1cRvW23pZPfswJWLxjU1o7k1mcRq5l2AhT6Ssie9AGkJFg
 zJ1Rt5GkqvPmLvg0H2DKAIewP5/+s3e+4rK7H9mzXtbhqFajv/yNF5gzI
 zB4ZGsENxe1BUgUl9CAZvsQfD1gFBewA3yUVws3E2n6MVoQ9B60FQLcws
 8QQBVS7V+kIU8BaHKyv+GVGYdGVZd/LIyR+BZuym+SoyKnQf8nyG0n5Zk
 Xf2VSpcc8hoR1uoQlaBhw3WotvUjtHN1TBBSB89JHqePnUsysqrBC97Iz
 dKlYJuB2Fj2zr4/eDbbX6EkX0PDJHxKKsCOBB7h9poO7KuuTeP/oTcrTK w==;
X-CSE-ConnectionGUID: 8RrQRjqpRnObTl9jQNKGzg==
X-CSE-MsgGUID: O55KmhVERxmz/JJNleJytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81488286"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="81488286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:03:44 -0800
X-CSE-ConnectionGUID: b8I4DyZLT/u9Y01v+6OMvg==
X-CSE-MsgGUID: 1SkbztSPTeKPMzufsQBLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="237162224"
Received: from jtuanzol-mobl2.amr.corp.intel.com (HELO
 soc-PF53RESW.clients.intel.com) ([10.246.46.46])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:03:42 -0800
From: Farah Kassabri <farah.kassabri@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	ilia.levi@intel.com
Subject: [PATCH v2 1/2] drm/xe: s/xe_vm_bind_kernel_bo/xe_kernel_vm_bind_bo
Date: Mon, 19 Jan 2026 17:03:29 +0200
Message-Id: <20260119150330.6537-1-farah.kassabri@intel.com>
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

