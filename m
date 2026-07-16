Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75055C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 05:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACAF10E1F7;
	Thu, 16 Jul 2026 05:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRpwiKe8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2CD10E1F7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784178893; x=1815714893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ROTyijVW4e3v8dfnwX/jKU5XH4yDB5NbOrluOhcSSZE=;
 b=LRpwiKe8aAfS6ybymaS8FcSc4xBmHnzS875jWT235tnOpJfE8AI7IFxV
 vKwqe2FsJ0LXH6R6dCo1KvEUDSN2xNQHn/zIhM5QzuEKH7lHvnL9PRZrU
 b1tKeEhGNuAnJ7eQaMFr8z5GbBWxaj/xPNe3C/zbKrnGRAp9EZU8Kn4pt
 45Rkr7ME2Mi0TPhaOt89HqEl3q5nDDmsnjwvqfCBBcTCtAB/nnN+hU9cf
 gqqNCDcyMhOKq7IjXW/A5G7rvzHmhccXJ0A1cSjYCFyL3T6aKP2aAoayY
 zGdYNidmemVlDZqck+T8RRJ5ZB1Vu/zqZETPA3odieLOYFKoDxMfRI7s9 Q==;
X-CSE-ConnectionGUID: 5QrePfyCRRSIswJh21h+sg==
X-CSE-MsgGUID: tGmhNAKNRhajsipxpVWGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84856426"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84856426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:14:52 -0700
X-CSE-ConnectionGUID: Gcc5xhUfSUq/rzINpx20Hw==
X-CSE-MsgGUID: jC878hwDSJm2tGXo1u/XgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="259966836"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:14:51 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/debugfs: Add knob to wedge on first page fault
Date: Thu, 16 Jul 2026 10:44:13 +0530
Message-ID: <20260716051413.3626570-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a debugfs knob to wedge the device on the first GPU page fault.

This is intended for debug where preserving the faulting HW
state is more useful than servicing the fault. When enabled,
the first page fault is printed, saved to the VM fault list,
and the device is declared wedged without servicing or acknowledging
the fault.

  echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 42 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++
 drivers/gpu/drm/xe/xe_pagefault.c    | 23 +++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..d22f73241d89 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -564,6 +564,43 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+static ssize_t wedge_on_first_pagefault_show(struct file *f, char __user *ubuf,
+					     size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[8];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n",
+			READ_ONCE(xe->wedge_on_first_pagefault) ? 1 : 0);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t wedge_on_first_pagefault_set(struct file *f,
+					    const char __user *ubuf,
+					    size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	bool val;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, size, &val);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(xe->wedge_on_first_pagefault, val);
+	atomic_set(&xe->pf_wedge_triggered, 0);
+
+	return size;
+}
+
+static const struct file_operations wedge_on_first_pagefault_fops = {
+	.owner = THIS_MODULE,
+	.read = wedge_on_first_pagefault_show,
+	.write = wedge_on_first_pagefault_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -617,6 +654,11 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	/* Debug: wedge on first page fault to freeze HW state for inspection. */
+	if (xe->info.has_usm)
+		debugfs_create_file("wedge_on_first_pagefault", 0600, root, xe,
+				     &wedge_on_first_pagefault_fops);
+
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..c208b99fc577 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -530,6 +530,18 @@ struct xe_device {
 	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
 	u32 min_run_period_pf_ms;
 
+	/**
+	 * @wedge_on_first_pagefault: Debug knob to wedge device on first GPU
+	 * page fault instead of recovery, freezing HW state for inspection.
+	 */
+	bool wedge_on_first_pagefault;
+
+	/**
+	 * @pf_wedge_triggered: One-shot latch preventing repeated wedge
+	 * handling.
+	 */
+	atomic_t pf_wedge_triggered;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..82496c5511b3 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -299,11 +299,34 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
 	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
+		struct xe_device *xe;
 		int err;
 
 		if (!pf.gt)	/* Fault squashed during reset */
 			continue;
 
+		xe = gt_to_xe(pf.gt);
+
+		/*
+		 * Debug mode: if armed via debugfs, wedge on first fault instead of
+		 * servicing. Dumps fault info and freezes HW for inspection.
+		 */
+		if (unlikely(READ_ONCE(xe->wedge_on_first_pagefault))) {
+			if (!atomic_xchg(&xe->pf_wedge_triggered, 1)) {
+				xe_pagefault_print(&pf);
+				xe_gt_err(pf.gt,
+					"wedge_on_first_pagefault: freezing HW after first fault\n");
+				xe_pagefault_save_to_vm(xe, &pf);
+				xe_device_declare_wedged(xe);
+			}
+
+			/*
+			 * Do not service or ack. Stop processing this queue so the
+			 * captured state stays close to the first fault.
+			 */
+			return;
+		}
+
 		err = xe_pagefault_service(&pf);
 		if (err) {
 			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
-- 
2.43.0

