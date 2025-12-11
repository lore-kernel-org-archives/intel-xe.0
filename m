Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E50D41D43
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7497F10E274;
	Thu, 11 Dec 2025 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ny+jHCUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992B10E274
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486838; x=1797022838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k21xFqeCuVcMVgL1oAgs1xYiGN8su5o31sqmAHkSgXU=;
 b=ny+jHCUhEZqO5auldGmpICoXxLTkTIS3w0pTGEcKvI+L0c2WKbBjY6Xg
 tS1n4tR3bSETj4HSiE/P2EUNMNGWDHaORt4kpeyc6gKDy8FXuL4SDBwOu
 v2I2zOFpO1o8J2TQ2ucoEIeAvXNDsNiXoZK1QgEJuXNo82j7+SmnpFe/e
 TMBs8+2lfngcT+DvFaQglFp+iJ5CVCywTbRr4G/xG30ydB0ybmRUn0WaA
 GSHLEqahmFy0HIYdxIhadpJ5QBp4iw4zghA6z8oYitCFMnA1hsl5Tfwdi
 3Q/Tc2G3a9SZtfEcOb4blwTtV3cFM+W7ton6VFXHROiysPPHXXM5Gcr/+ Q==;
X-CSE-ConnectionGUID: FtDIvunPSTGMCpCGfFykUw==
X-CSE-MsgGUID: 1t42ecBTS926M6NpPKq9cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649720"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649720"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: 24S3BEu3Rb60utN+FKf+fQ==
X-CSE-MsgGUID: snqKABqhRXCdVLd94DlRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297950"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 3/6] drm/xe: Add debugfs knobs to control long running
 workload timeslicing
Date: Thu, 11 Dec 2025 13:00:29 -0800
Message-Id: <20251211210032.1520113-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211210032.1520113-1-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
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

Add debugfs knobs to control timeslicing for long-running workloads,
allowing quick tuning of values when running benchmarks.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 74 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++
 drivers/gpu/drm/xe/xe_vm.c           |  4 +-
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0f8a96a05a8e..25237f6610c8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -326,6 +326,74 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static ssize_t min_run_period_lr_ms_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_lr_ms);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t min_run_period_lr_ms_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 min_run_period_lr_ms;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &min_run_period_lr_ms);
+	if (ret)
+		return ret;
+
+	xe->min_run_period_lr_ms = min_run_period_lr_ms;
+
+	return size;
+}
+
+static const struct file_operations min_run_period_lr_ms_fops = {
+	.owner = THIS_MODULE,
+	.read = min_run_period_lr_ms_show,
+	.write = min_run_period_lr_ms_set,
+};
+
+static ssize_t min_run_period_pf_ms_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_pf_ms);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t min_run_period_pf_ms_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 min_run_period_pf_ms;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &min_run_period_pf_ms);
+	if (ret)
+		return ret;
+
+	xe->min_run_period_pf_ms = min_run_period_pf_ms;
+
+	return size;
+}
+
+static const struct file_operations min_run_period_pf_ms_fops = {
+	.owner = THIS_MODULE,
+	.read = min_run_period_pf_ms_show,
+	.write = min_run_period_pf_ms_set,
+};
+
 static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
 					 size_t size, loff_t *pos)
 {
@@ -393,6 +461,12 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file("min_run_period_lr_ms", 0600, root, xe,
+			    &min_run_period_lr_ms_fops);
+
+	debugfs_create_file("min_run_period_pf_ms", 0600, root, xe,
+			    &min_run_period_pf_ms_fops);
+
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef77..00e179f0703f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -453,6 +453,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
 	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9de73353223f..682b1815d33e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -613,6 +613,12 @@ struct xe_device {
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
+	/** @min_run_period_lr_ms: LR VM (preempt fence mode) timeslice */
+	u32 min_run_period_lr_ms;
+
+	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
+	u32 min_run_period_pf_ms;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4648f8a458cf..a1363f675b51 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1509,9 +1509,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	if (flags & XE_VM_FLAG_FAULT_MODE)
-		vm->preempt.min_run_period_ms = 0;
+		vm->preempt.min_run_period_ms = xe->min_run_period_pf_ms;
 	else
-		vm->preempt.min_run_period_ms = 5;
+		vm->preempt.min_run_period_ms = xe->min_run_period_lr_ms;
 
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
-- 
2.34.1

