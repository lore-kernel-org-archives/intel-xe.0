Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830F7C44507
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 08:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422C810E428;
	Fri, 17 Jul 2026 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWznJ4y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B310E428
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784276575; x=1815812575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3OF6bKA9hGb+LeHwATNUKEN/C6amBk6g0Uorhwbm1DY=;
 b=lWznJ4y1FtKDJgenbxTm4iqhYQG+oevo4tMokFcKI2rKO/2tD77wc7fP
 iFfw3aJsVz4rRlTquDig1LYkcGoPnVkaM2WqQufn3b2OCKAd2YsSS+1cM
 RSEnSfh8sIb5kIwK+s0mleDZioGiL+iPStbySo/EpwON5olDB4v9UVMOe
 ZgCv5d4/aChktUEjiotJBTMgypJ+qcNLvuGN5kNPFG16AuRVo4WvWqag6
 HvXVMqWU+AP9UUVVw8dzFhlmWorCFdT7iMiLBAo2P2zoyPsN32UJ1Fwu1
 X67Kj6x2DDUPCd46+U91sj07xNKoiGeNJBV2Sw4GiXN0m0+iuuRuF/KG0 A==;
X-CSE-ConnectionGUID: X9uMVuIIT5aA/KzhjFYZcA==
X-CSE-MsgGUID: vCh+FqCHQu+X/uX4g90TgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="83929191"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="83929191"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:22:55 -0700
X-CSE-ConnectionGUID: fY90xW9QRISpA/IEbHS1ag==
X-CSE-MsgGUID: 821/epmnR2KDbiMY8Yjr4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="281175421"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 01:22:52 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v2] drm/xe/debugfs: Add knob to wedge on first page fault
Date: Fri, 17 Jul 2026 13:52:43 +0530
Message-ID: <20260717082243.337548-1-arvind.yadav@intel.com>
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
the first page fault is printed and the device is declared wedged
without servicing or acknowledging the fault.

  echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault

v2:
  - Move first-pagefault debug state under xe->wedged. (Matt)
  - Queue the wedge operation on the GT ordered workqueue. (Matt)
  - Drop xe_pagefault_save_to_vm() from the debug path. (Matt)
  - Cancel pending first-pagefault wedge work in pagefault fini.
  - Re-arm pf_wedge_triggered before enabling wedge_on_first_pagefault.
    (Sashiko)
  - Use release/acquire ordering between debugfs enable and PF worker.
    (Sashiko)
  - Do not clear the latch on disable. (Sashiko)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c    | 34 ++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5a3877fcb0f0..e65e233fdfcd 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -614,6 +614,49 @@ static const struct file_operations disable_late_binding_fops = {
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
+			READ_ONCE(xe->wedged.on_first_pagefault) ? 1 : 0);
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
+	if (val) {
+		atomic_set(&xe->wedged.pf_triggered, 0);
+
+		/* Clear the latch before making the enable visible. */
+		smp_store_release(&xe->wedged.on_first_pagefault, true);
+	} else {
+		WRITE_ONCE(xe->wedged.on_first_pagefault, false);
+	}
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
@@ -665,6 +708,11 @@ void xe_debugfs_register(struct xe_device *xe)
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
index 022e08205897..f0862ca9cb5d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -496,6 +496,23 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/**
+		 * @wedged.on_first_pagefault: Debug knob to wedge the device on the
+		 * first GPU page fault instead of servicing it, freezing HW state
+		 * for inspection. Only exposed on USM-capable devices.
+		 */
+		bool on_first_pagefault;
+		/**
+		 * @wedged.pf_triggered: One-shot latch for @on_first_pagefault to
+		 * ensure a single wedge is triggered per arming.
+		 */
+		atomic_t pf_triggered;
+		/**
+		 * @wedged.pf_worker: Declares the device wedged for
+		 * @on_first_pagefault from the GT ordered workqueue, where
+		 * stopping GuC submission is safe.
+		 */
+		struct work_struct pf_worker;
 	} wedged;
 
 	/** @devres_group: devres group */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..7580baeb277a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -288,6 +288,14 @@ static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *p
 	xe_vm_put(vm);
 }
 
+static void xe_pagefault_wedge_work(struct work_struct *w)
+{
+	struct xe_device *xe = container_of(w, struct xe_device, wedged.pf_worker);
+
+	/* GuC submission stop/start must run from the GT ordered workqueue. */
+	xe_device_declare_wedged(xe);
+}
+
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
 	struct xe_pagefault_queue *pf_queue =
@@ -299,11 +307,34 @@ static void xe_pagefault_queue_work(struct work_struct *w)
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
+		 * servicing. Print the fault, then declare the device wedged from the
+		 * GT ordered workqueue (where stopping GuC submission is safe).
+		 */
+		if (unlikely(smp_load_acquire(&xe->wedged.on_first_pagefault))) {
+			if (!atomic_xchg(&xe->wedged.pf_triggered, 1)) {
+				xe_pagefault_print(&pf);
+				xe_gt_err(pf.gt,
+					"wedge_on_first_pagefault: freezing HW after first fault\n");
+				queue_work(pf.gt->ordered_wq, &xe->wedged.pf_worker);
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
@@ -380,6 +411,7 @@ static void xe_pagefault_fini(void *arg)
 	struct xe_device *xe = arg;
 
 	destroy_workqueue(xe->usm.pf_wq);
+	cancel_work_sync(&xe->wedged.pf_worker);
 }
 
 /**
@@ -397,6 +429,8 @@ int xe_pagefault_init(struct xe_device *xe)
 	if (!xe->info.has_usm)
 		return 0;
 
+	INIT_WORK(&xe->wedged.pf_worker, xe_pagefault_wedge_work);
+
 	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
 					WQ_UNBOUND | WQ_HIGHPRI,
 					XE_PAGEFAULT_QUEUE_COUNT);
-- 
2.43.0

