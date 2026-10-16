Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475C2CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033C8112612;
	Fri, 16 Oct 2026 07:19:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124D611261A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135130; x=1823671130;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fOobEKSvLlUePPHRUTOARtHoq9Lv6forYhdzEIArc5s=;
 b=mMoN0+9WqKE+sb+9XU/kd9yGQFiqCmqqC1g10kxz4AVrV2H2cux86WcV
 UsVNT0w6pz03rIOmhs8qQBYeNAC8JHAwVxYJQ2FqohloP1R2HNsJWUG8H
 EmWb4L46KZiLUabDeqlakr06X/Aa/uFcWu4j/GMhpELUzQsstJhGGAWig
 OOxU4oU8Nnt3d+/hwnfc4wJTce7zkzcfRRRDLjA5jXZQ108zMrKqMsVPr
 8HNtlptOzsJm94FuwUNWQY7g4ZLEetOOa9X0e7H0eMLxWdhGPsKH0v+ka
 l2i9TtC0Bjljemb4maXIJThEzDy3YkZ8+OaZe4w9C0QLRIiA1XlE+VMWB g==;
X-CSE-ConnectionGUID: 0uAgM/45Sde2T3/zeGI58A==
X-CSE-MsgGUID: LvjZj6zmSuyz5CATOil8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813638"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:46 -0700
X-CSE-ConnectionGUID: mndSjOi/SiKTBcsPwQKKeA==
X-CSE-MsgGUID: BS2MAButSLaHG/QFYYX64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787250"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:46 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 05/18] drm/xe: Keep software waits outside the device I/O
 gate
Date: Fri, 16 Oct 2026 12:48:15 +0530
Message-ID: <20261016071832.222574-6-arvind.yadav@intel.com>
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

xe_drm_ioctl() holds the device I/O gate across the whole ioctl.
Software waits can wait for a fence that userspace has not submitted.
Signalling GT fences cannot end these waits, so device I/O draining
can hang during reset or wedge isolation.

Release the outer gate before syncobj waits, syncobj transfers and
Xe user-fence waits. Protect each Xe user-fence memory read with the
gate, but release it before sleeping.

Wake Xe user-fence waiters when PCI recovery starts, the device wedges
or the device is unplugged, so they can observe the blocked state.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c          | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_error.c       |  1 +
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 12 ++++++++---
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7c4f42ea83d0..0f319415055c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -232,6 +232,19 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
+static bool xe_drm_ioctl_is_wait(unsigned int cmd)
+{
+	switch (DRM_IOCTL_NR(cmd)) {
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_WAIT):
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT):
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_TRANSFER):
+	case DRM_IOCTL_NR(DRM_IOCTL_XE_WAIT_USER_FENCE):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = file->private_data;
@@ -243,6 +256,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if (ret)
 		return ret;
 
+	/* These waits must not hold up device I/O draining. */
+	if (xe_drm_ioctl_is_wait(cmd)) {
+		xe_device_io_put(io_idx);
+		return drm_ioctl(file, cmd, arg);
+	}
+
 	scoped_cond_guard(xe_pm_runtime_ioctl,
 			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
 			  xe) {
@@ -265,6 +284,12 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 	if (ret)
 		return ret;
 
+	/* These waits must not hold up device I/O draining. */
+	if (xe_drm_ioctl_is_wait(cmd)) {
+		xe_device_io_put(io_idx);
+		return drm_compat_ioctl(file, cmd, arg);
+	}
+
 	scoped_cond_guard(xe_pm_runtime_ioctl,
 			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
 			  xe) {
@@ -1138,6 +1163,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	drm_dev_unplug(&xe->drm);
 
+	wake_up_all(&xe->ufence_wq);
+
 	xe_bo_pci_dev_remove_all(xe);
 }
 
@@ -1437,6 +1464,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
+		wake_up_all(&xe->ufence_wq);
 
 		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 3e06f504f1b3..3dfcef03850e 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -21,6 +21,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	/* Block device access until PCI error recovery completes. */
 	xe_device_set_in_reset(xe);
+	wake_up_all(&xe->ufence_wq);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index e241f3ec3547..b5239c002368 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -14,13 +14,19 @@
 #include "xe_macros.h"
 #include "xe_exec_queue.h"
 
-static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
+static int do_compare(struct xe_device *xe, u64 addr, u64 value, u64 mask, u16 op)
 {
 	u64 rvalue;
+	int io_idx;
 	int err;
 	bool passed;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err)
+		return err;
+
 	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
+	xe_device_io_put(io_idx);
 	if (err)
 		return -EFAULT;
 
@@ -136,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 	add_wait_queue(&xe->ufence_wq, &w_wait);
 	for (;;) {
-		err = do_compare(addr, args->value, args->mask, args->op);
+		err = do_compare(xe, addr, args->value, args->mask, args->op);
 		if (err <= 0)
 			break;
 
@@ -155,7 +161,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (!timeout) {
 			LNL_FLUSH_WORKQUEUE(xe->ordered_wq);
-			err = do_compare(addr, args->value, args->mask,
+			err = do_compare(xe, addr, args->value, args->mask,
 					 args->op);
 			if (err <= 0) {
 				drm_dbg(&xe->drm, "LNL_FLUSH_WORKQUEUE resolved ufence timeout\n");
-- 
2.43.0

