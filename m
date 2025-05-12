Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC487C3ABD4
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18110E3C0;
	Mon, 12 May 2025 12:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDUg2bqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D443C10E3CD
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747053055; x=1778589055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HRR92dVe/ZpTS1PmYHVUSw8nNOqHoiV8jD7zZUyWMsU=;
 b=LDUg2bqPVN0pb5vqgC8sBb8xeKq2NiqLqe0nnUpbb5gIxkx1BOwGJv8D
 GlqbCubaOUvOu8ngDI8YgGl+i+QGVIuAuXqV0ip0yFUYaD4BBmj+FL4z9
 UeHoCDR6v68VO5+wJBSa7loHvkwn9mtFigbjO2lvjO6fQQWq4CafV0W/P
 Pl7pIWkhDn6uRuz9kaOxnliUKOf6jxMnWwPeOv8f9pNiOrW6wLsAVEIX7
 XmCSgtu5TP162t7ThxUL/brojty8gOHsbR4FNMOV6c/1S9scP1APpDGpx
 SJTLACrN3qAd61D51Y5GCQtIq4eV7bhRAnqKcHmJy6OYKs/gNu/oDbNRs Q==;
X-CSE-ConnectionGUID: mQH12ZfwT1+aJ4IMgBqjbA==
X-CSE-MsgGUID: aTmTtnUHRku/VnrNVqFGgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48711659"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48711659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:54 -0700
X-CSE-ConnectionGUID: Qkh0uKRYQmyWSuqt2daImg==
X-CSE-MsgGUID: DSDlQ/eERlWtElgRwAv7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142464445"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v7 5/5] drm/xe: Add atomic_svm_timeslice_ms debugfs entry
Date: Mon, 12 May 2025 05:32:17 -0700
Message-Id: <20250512123217.1373106-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512123217.1373106-1-matthew.brost@intel.com>
References: <20250512123217.1373106-1-matthew.brost@intel.com>
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
index 06c65dace026..c9aaef0a34c5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -570,6 +570,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
+	u32 atomic_svm_timeslice_ms;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 33354670d79e..e027c22f032f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -798,7 +798,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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

