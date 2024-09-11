Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D73EE57C0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D45110E9C1;
	Wed, 11 Sep 2024 15:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxM9Ic+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2EC10E9C1
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726068323; x=1757604323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XtIb8bD0GYUmh0hYbziQAwp7jqzytXnxCmpc2+TjWYk=;
 b=SxM9Ic+XN7lMvjaM100yQi/8i9/14GS+64FbVWXcAdQqyKC4MtJzyERj
 PZHod5JAwZww/i3qtsBQ0eZcu7dg/kV2tjLhCYY8IbbicP/BeBiTB7Ol7
 4U20Pxj3cUyBZaWYU3oOm5Szbko2kPPeIK0y18gdfcPsCXjC5G5WmBhBJ
 Gi/Lwd2hNF+1tEfdGBM4dX5j8PcP2BuZITTJMp1eFJ7J1Y1+2qcfrfSpI
 jbALGUSZYXxbVMrJDL1nwv7vERA4XEqwrdsKiqvWm9tKhFpBBDNH4kMsT
 OV5tgkW+nwecZIN8l6xeNzK6DZP77oQAzvOrhidbgHlU4Hl00BADqzpG4 Q==;
X-CSE-ConnectionGUID: VjwmrfuJSEajeqfAyJ1Nkg==
X-CSE-MsgGUID: AAW1OnLNR4WvJ9ugsgGPhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24811844"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24811844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:25:23 -0700
X-CSE-ConnectionGUID: hGzUTtU7TpGa/lHl4orvKw==
X-CSE-MsgGUID: Yu4exkK7QGOJgHlcff5IWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98112295"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:25:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, paulo.r.zanoni@intel.com, kenneth.w.graunke@intel.com
Subject: [PATCH] drm/xe: Use bookkeep slots for external BO's in exec IOCTL
Date: Wed, 11 Sep 2024 08:26:22 -0700
Message-Id: <20240911152622.903058-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix external BO's dma-resv usage in exec IOCTL using bookkeep slots
rather than write slots. This leaves syncing to user space rather than
the KMD blindly enforcing write semantics on every external BO.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2673
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7b38485817dc..f23ac1e2ed88 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -41,11 +41,6 @@
  * user knows an exec writes to a BO and reads from the BO in the next exec, it
  * is the user's responsibility to pass in / out fence between the two execs).
  *
- * Implicit dependencies for external BOs are handled by using the dma-buf
- * implicit dependency uAPI (TODO: add link). To make this works each exec must
- * install the job's fence into the DMA_RESV_USAGE_WRITE slot of every external
- * BO mapped in the VM.
- *
  * We do not allow a user to trigger a bind at exec time rather we have a VM
  * bind IOCTL which uses the same in / out fence interface as exec. In that
  * sense, a VM bind is basically the same operation as an exec from the user
@@ -59,8 +54,8 @@
  * behind any pending kernel operations on any external BOs in VM or any BOs
  * private to the VM. This is accomplished by the rebinds waiting on BOs
  * DMA_RESV_USAGE_KERNEL slot (kernel ops) and kernel ops waiting on all BOs
- * slots (inflight execs are in the DMA_RESV_USAGE_BOOKING for private BOs and
- * in DMA_RESV_USAGE_WRITE for external BOs).
+ * slots (inflight execs are in the DMA_RESV_USAGE_BOOKKEEP for private BOs and
+ * for external BOs).
  *
  * Rebinds / dma-resv usage applies to non-compute mode VMs only as for compute
  * mode VMs we use preempt fences and a rebind worker (TODO: add link).
@@ -304,7 +299,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_arm(job);
 	if (!xe_vm_in_lr_mode(vm))
 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
-					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
+					 DMA_RESV_USAGE_BOOKKEEP,
+					 DMA_RESV_USAGE_BOOKKEEP);
 
 	for (i = 0; i < num_syncs; i++) {
 		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
-- 
2.34.1

