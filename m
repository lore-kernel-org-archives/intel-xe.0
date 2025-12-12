Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A5AD59D86
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8581810E92D;
	Fri, 12 Dec 2025 18:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1ggRHhW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0627210E92D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564134; x=1797100134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwtkIDBRYin7RZLQt3v+B8JLLVfklPfbaymY8XIUON4=;
 b=i1ggRHhWRNQFb1vjG8otqElIDIkDwRW8zK3qyy151I1vROjKMc96xw5X
 UkRfkT+CNTS8mwU+/TzflGoDkzYydMjbl4FFQp3V9yxk/u/oL5qq4hIn4
 pS2t+hpzcRZalUuTRpZxaUTPpyvIJon/JowfKs3WEg76UmU/cXM/O7qZI
 F/GPkBBlChUB85FNtrb/2bxdDtC5hZw74XzBU8Bqe21ChwyY5JIaihejP
 zuITqeq3Ne0VulRDvLNPkFW9QnUQozn4NLAqXxsoGeDld4mraRWOrcox8
 o+WR4uposPWbrIB7L7ULG/MsLDEAQo8jspyfy20AwDvavUkU+BnPw4Mu0 A==;
X-CSE-ConnectionGUID: iqhs7VpKT6CpS0MV0gNI+A==
X-CSE-MsgGUID: feT4uY1JStKEGj7EQnbJEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432798"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: CTZ/y1ZgTgaBYwEoWGSq7A==
X-CSE-MsgGUID: NX5tpOVHSOemsqaPWkexyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633946"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 3/7] drm/xe: Add debugfs knobs to control long running
 workload timeslicing
Date: Fri, 12 Dec 2025 10:28:43 -0800
Message-Id: <20251212182847.1683222-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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
index 4fa423a82bea..38433c9af59f 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -328,6 +328,74 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
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
@@ -395,6 +463,12 @@ void xe_debugfs_register(struct xe_device *xe)
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
index 339b9aef9499..9f84ce3db1f6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -460,6 +460,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
 	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b35ba29d4d35..7df0da592b50 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -615,6 +615,12 @@ struct xe_device {
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

