Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10B0C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 10:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913C810E3DB;
	Mon, 28 Apr 2025 10:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub09licc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBEB10E3D7
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745834845; x=1777370845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MlRz/dMumcUP5q62pJhErznpV9BWoB/EdcgFSViOTM=;
 b=Ub09licc7zNBEH3PCLSgHyMW9zI+uYWUuvZNL2jkySaFWr61m2Pts+cC
 eAO2iuQ5GbKfLLCyR8JuVvAe7mgR0HNewyD4+AGL0zxQDd8OuYHQaxJg6
 2e+4IBBARpwQC5/5gE7VRP+lLV2kqAXte80RSaN/wsSjefAskj4JpYbyF
 1A4umeoUBE6KqlcZzwdxz1EBI/5b9u3ZKcCF2tq5/4+KRhFfjHjO1EaPg
 ugcCKMWIbPQYa03KYl68fckH9QYumxdH7nFpqI4RwYgZ7cIaRlppy+uiO
 koG2CGb0vrSsiPwr9s8XMwh2rGGxvnLKe2VVKSd2VnboFhZbdAphRBPyb Q==;
X-CSE-ConnectionGUID: WKlXLTRfSSWtXQIg23KokA==
X-CSE-MsgGUID: W+VHJGYqSieTGKnSpRuOSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="58783927"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58783927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 03:07:25 -0700
X-CSE-ConnectionGUID: 9927FMjhRUGMzEqhfvS86Q==
X-CSE-MsgGUID: Ng22wEZASUGpFhy20WknzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="138291473"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 28 Apr 2025 03:07:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 05/18] drm/xe: Add atomic_svm_timeslice_ms debugfs entry
Date: Mon, 28 Apr 2025 16:02:11 +0530
Message-Id: <20250428103224.69534-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Add some informal control for atomic SVM fault GPU timeslice to be able
to play around with values and tweak performance.

v2:
 - Reduce timeslice default value to 5ms

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_svm.c          |  3 ++-
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..d83cd6ed3fa8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -191,6 +191,41 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
+					    size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t atomic_svm_timeslice_ms_set(struct file *f,
+					   const char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 atomic_svm_timeslice_ms;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &atomic_svm_timeslice_ms);
+	if (ret)
+		return ret;
+
+	xe->atomic_svm_timeslice_ms = atomic_svm_timeslice_ms;
+
+	return size;
+}
+
+static const struct file_operations atomic_svm_timeslice_ms_fops = {
+	.owner = THIS_MODULE,
+	.read = atomic_svm_timeslice_ms_show,
+	.write = atomic_svm_timeslice_ms_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +246,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
+			    &atomic_svm_timeslice_ms_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..abf3c72baaa6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -444,6 +444,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 495bc00ebed4..59babadeb9d1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -571,6 +571,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
+	u32 atomic_svm_timeslice_ms;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d5376a76cdd1..de4eb04fc78e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -784,7 +784,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
-- 
2.34.1

