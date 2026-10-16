Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D190CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB99112613;
	Fri, 16 Oct 2026 07:18:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD57A112613
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135129; x=1823671129;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2HfLgKDwvleAcCr6sH8rY8rTMY3lvgzlKHR/QpcklgM=;
 b=WUPLFoiiDLkwTf07OMYrrz5iOZDDeO9wUnQHtqPdCsYO5CZpjTgIdSEg
 Z7iNy37SZUr1/U2yTWbZNjvh+5GSi1VsLJkgB0TRkwiSv8DEIx/olKwIt
 Y6EeHmWaIMPGnPrBFMFG76ZgxVxrdCudNVAnq01Bs9lAd6U8c9mI56ZgB
 Ahbpgk0nK0rTKhr9ajN3bIgm+KhGKmRLEKJiKyi/0BpjoDs5YUqPUjLwM
 akroMVTUSd7tcCvCouNpmppQXm4aCHkZq718J3HQNtiho6gL1SJLbJXop
 X7y4UOtBYK4MmUf2Kd6Rk5oDH6mrqsqLoHfsXbtS5qycSC3oXp0CL7H+m w==;
X-CSE-ConnectionGUID: WAJVxTlAQqaGFbmpnoI42A==
X-CSE-MsgGUID: tMKcFvbzTsOzb/WK9iXJ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813636"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:45 -0700
X-CSE-ConnectionGUID: 25DQnXhsTN2ygJ+h+m749A==
X-CSE-MsgGUID: i3IjKK3hTKuwBSuj+E9YWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787246"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:44 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 04/18] drm/xe: Protect device I/O with DRM device SRCU
Date: Fri, 16 Oct 2026 12:48:14 +0530
Message-ID: <20261016071832.222574-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

A device state check alone cannot stop reset or wedging from racing with
a caller that has already passed the check.

Add xe_device_io_get() and xe_device_io_put() wrappers around
drm_dev_enter() and drm_dev_exit(). Check the device state inside the
DRM SRCU critical section so new access is rejected after PCI recovery
starts or the device becomes wedged.

After blocking new access, PCI recovery wedges the GTs to signal pending
fences and drains existing readers before disabling the PCI device.

Permanent wedge isolation uses the same DRM SRCU domain to drain active
hardware users before stopping interrupts and DMA.

v3:
- Replace the private device I/O SRCU domain with DRM device SRCU.
  (Thomas)
- Keep the device I/O gate held until forcewake cleanup completes.
  (Sashiko)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c            |  6 ++---
 drivers/gpu/drm/xe/xe_device.c        | 33 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_device.h        | 29 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c        |  9 ++++++-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 34 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_pci_error.c     |  6 +++++
 6 files changed, 88 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 203a0e0309f0..7ee0eade172a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2201,9 +2201,9 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	struct drm_exec exec;
 	vm_fault_t ret;
 	int err = 0;
-	int idx;
+	int io_idx;
 
-	if (xe_device_io_blocked(xe) || !drm_dev_enter(&xe->drm, &idx))
+	if (xe_device_io_get(xe, &io_idx))
 		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
@@ -2290,7 +2290,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	if (retry_after_wait)
 		xe_bo_put(bo);
 out:
-	drm_dev_exit(idx);
+	xe_device_io_put(io_idx);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 778f18926530..7c4f42ea83d0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -236,16 +236,20 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = file->private_data;
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	int io_idx;
 	long ret;
 
-	if (xe_device_io_blocked(xe))
-		return -ECANCELED;
+	ret = xe_device_io_get(xe, &io_idx);
+	if (ret)
+		return ret;
 
-	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
-	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	scoped_cond_guard(xe_pm_runtime_ioctl,
+			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
+			  xe) {
 		ret = drm_ioctl(file, cmd, arg);
+	}
 
+	xe_device_io_put(io_idx);
 	return ret;
 }
 
@@ -254,16 +258,20 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 {
 	struct drm_file *file_priv = file->private_data;
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	int io_idx;
 	long ret;
 
-	if (xe_device_io_blocked(xe))
-		return -ECANCELED;
+	ret = xe_device_io_get(xe, &io_idx);
+	if (ret)
+		return ret;
 
-	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
-	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	scoped_cond_guard(xe_pm_runtime_ioctl,
+			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
+			  xe) {
 		ret = drm_compat_ioctl(file, cmd, arg);
+	}
 
+	xe_device_io_put(io_idx);
 	return ret;
 }
 #else
@@ -439,6 +447,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
+void xe_device_io_drain(struct xe_device *xe)
+{
+	drm_dev_srcu_synchronize(&xe->drm);
+}
+
 static void xe_device_parse_modparam(struct xe_device *xe)
 {
 	xe->atomic_svm_timeslice_ms = 5;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e3c8ba9597b4..ac70db479d77 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -6,6 +6,7 @@
 #ifndef _XE_DEVICE_H_
 #define _XE_DEVICE_H_
 
+#include <drm/drm_drv.h>
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
@@ -224,6 +225,34 @@ static inline bool xe_device_io_blocked(struct xe_device *xe)
 	return xe_device_wedged(xe) || xe_device_is_in_reset(xe);
 }
 
+/**
+ * xe_device_io_get - Enter a device access critical section
+ * @xe: Xe device
+ * @idx: SRCU index returned on success
+ *
+ * Return: 0 on success, -ENODEV after unplug, or -ECANCELED when
+ * device I/O is blocked.
+ */
+static inline int xe_device_io_get(struct xe_device *xe, int *idx)
+{
+	if (!drm_dev_enter(&xe->drm, idx))
+		return -ENODEV;
+
+	if (xe_device_io_blocked(xe)) {
+		drm_dev_exit(*idx);
+		return -ECANCELED;
+	}
+
+	return 0;
+}
+
+static inline void xe_device_io_put(int idx)
+{
+	drm_dev_exit(idx);
+}
+
+void xe_device_io_drain(struct xe_device *xe);
+
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static inline bool xe_debug_page_size_supported(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b52d5ca0b47e..ec2f6a77154c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1061,6 +1061,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				struct g2h_fence *g2h_fence, bool defer_flush)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
+	bool io_held = false;
+	int io_idx;
 	u16 seqno;
 	int ret;
 
@@ -1071,11 +1073,13 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_device_io_blocked(ct_to_xe(ct))) {
+	if (xe_device_io_get(ct_to_xe(ct), &io_idx)) {
 		ret = guc_ct_cancel_errno(ct);
 		goto out;
 	}
 
+	io_held = true;
+
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
@@ -1132,6 +1136,9 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	if (g2h_len)
 		spin_unlock_irq(&ct->fast_lock);
 out:
+	if (io_held)
+		xe_device_io_put(io_idx);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 8daa9c968f4f..6150e2e8a661 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -66,15 +66,13 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
+	int io_idx;
 
 	/*
 	 * Returning -ECANCELED in this function is squashed at the caller and
 	 * signals waiters.
 	 */
 
-	if (xe_device_io_blocked(xe))
-		return -ECANCELED;
-
 	if (xe_guc_ct_enabled(&guc->ct) && guc->submission_state.enabled) {
 		u32 action[] = {
 			XE_GUC_ACTION_TLB_INVALIDATION,
@@ -84,21 +82,27 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
 	} else if (xe_device_uc_enabled(xe)) {
-		struct xe_mmio *mmio = &gt->mmio;
-
-		if (IS_SRIOV_VF(xe))
+		if (xe_device_io_get(xe, &io_idx))
 			return -ECANCELED;
 
-		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
-		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
-					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
-					PVC_GUC_TLB_INV_DESC0_VALID);
-		} else {
-			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
-					GUC_TLB_INV_CR_INVALIDATE);
+		if (!IS_SRIOV_VF(xe)) {
+			struct xe_mmio *mmio = &gt->mmio;
+
+			CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
+						    XE_FW_GT);
+			if (xe->info.platform == XE_PVC ||
+			    GRAPHICS_VER(xe) >= 20) {
+				xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
+						PVC_GUC_TLB_INV_DESC1_INVALIDATE);
+				xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
+						PVC_GUC_TLB_INV_DESC0_VALID);
+			} else {
+				xe_mmio_write32(mmio, GUC_TLB_INV_CR,
+						GUC_TLB_INV_CR_INVALIDATE);
+			}
 		}
+
+		xe_device_io_put(io_idx);
 	}
 
 	return -ECANCELED;
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 4b09e74af92e..3e06f504f1b3 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -25,6 +25,12 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
+	/*
+	 * GT wedging signals pending fences. Existing hardware users can now
+	 * finish without blocking reset.
+	 */
+	xe_device_io_drain(xe);
+
 	pci_disable_device(pdev);
 }
 
-- 
2.43.0

