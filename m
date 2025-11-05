Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFC4CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 12:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3F810E74C;
	Wed,  5 Nov 2025 12:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cn5CO5RM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEB10E73D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762347396; x=1793883396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXtgix2v6ZzjfHHb1F0uF0INRYMImFqVMqMQWBsWuWQ=;
 b=cn5CO5RMtyIdTWfEJYg3Bv/SFw0iKw8Xoezkmst7CKRSKxGMMUt5PtmL
 swJkFUcFcE8wiaSRvRF8pyOc3jCMU8afJIIDbpst4M4LLmvkDjiCgmWVZ
 ErOaJx+x9/Vtp0ySkoaJNm/1/7z8XrhxkxBrpDGKgljhVuvQ0XDGL5nXA
 /uCkzAAX4mOlHa5POr3QRL2mQUUMQ2qESbrnlqvtom0j01CZUmeDE2VEx
 s9r6LEseLxtX1AxGhRVrCa0YDOcKTm9cc1RO4lTZHpRpPePmtrFyDZBeC
 c/KNsHGHvX6M3g7aozr1g05mkYLdsYTEkOEBc1zcrrRaxjsPCHbyI+8IL g==;
X-CSE-ConnectionGUID: m96IF46oTQi3qZDy//Eb1A==
X-CSE-MsgGUID: CUGcEclPRt2vxW5wfxacOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82088088"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="82088088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:56:36 -0800
X-CSE-ConnectionGUID: W6qjOfJvQEq7CkdeSwfkBQ==
X-CSE-MsgGUID: IvYYCM9IR6ydvnJhVaFGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="218092370"
Received: from mtripa2-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.236])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:56:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v3] drm/xe/pf: Allow to lockdown the PF using custom guard
Date: Wed,  5 Nov 2025 13:56:21 +0100
Message-ID: <20251105125622.562-1-michal.wajdeczko@intel.com>
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

Some driver components, like eudebug or ccs-mode, can't be used
when VFs are enabled.  Add functions to allow those components
to block the PF from enabling VFs for the requested duration.

Introduce trivial counter to allow lockdown or exclusive access
that can be used in the scenarios where we can't follow the strict
owner semantics as required by the rw_semaphore implementation.

Before enabling VFs, the PF will try to arm the "vfs_enabling"
guard for the exclusive access.  This will fail if there are
some lockdown requests already initiated by the other components.

For testing purposes, add debugfs file which will call these new
functions from the file's open/close hooks.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
v1: https://patchwork.freedesktop.org/series/156687/#rev1
v2: https://patchwork.freedesktop.org/series/156795/#rev1
    use less confusing names (Matthew/Christoph)
    allow many components to lockdown the PF (Christoph)
v3: no atomic_t, just use spinlock (Matthew)
---
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_guard.h            | 119 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.c        |  21 ++++
 drivers/gpu/drm/xe/xe_sriov_pf.c         |  98 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h         |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c |  30 ++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |   5 +
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   |   4 +
 7 files changed, 281 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guard.h

diff --git a/drivers/gpu/drm/xe/xe_guard.h b/drivers/gpu/drm/xe/xe_guard.h
new file mode 100644
index 000000000000..333f8e13b5a1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guard.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUARD_H_
+#define _XE_GUARD_H_
+
+#include <linux/spinlock.h>
+
+/**
+ * struct xe_guard - Simple logic to protect a feature.
+ *
+ * Implements simple semaphore-like logic that can be used to lockdown the
+ * feature unless it is already in use.  Allows enabling of the otherwise
+ * incompatible features, where we can't follow the strict owner semantics
+ * required by the &rw_semaphore.
+ *
+ * NOTE! It shouldn't be used to protect a data, use &rw_semaphore instead.
+ */
+struct xe_guard {
+	/**
+	 * @counter: implements simple exclusive/lockdown logic:
+	 *           if == 0 then guard/feature is idle/not in use,
+	 *           if < 0 then feature is active and can't be locked-down,
+	 *           if > 0 then feature is lockded-down and can't be activated.
+	 */
+	int counter;
+
+	/** @name: the name of the guard (useful for debug) */
+	const char *name;
+
+	/** @owner: the info about the last owner of the guard (for debug) */
+	void *owner;
+
+	/** @lock: protects guard's data */
+	spinlock_t lock;
+};
+
+/**
+ * xe_guard_init() - Initialize the guard.
+ * @guard: the &xe_guard to init
+ * @name: name of the guard
+ */
+static inline void xe_guard_init(struct xe_guard *guard, const char *name)
+{
+	spin_lock_init(&guard->lock);
+	guard->counter = 0;
+	guard->name = name;
+}
+
+/**
+ * xe_guard_arm() - Arm the guard for the exclusive/lockdown mode.
+ * @guard: the &xe_guard to arm
+ * @lockdown: arm for lockdown(true) or exclusive(false) mode
+ * @who: optional owner info (for debug only)
+ *
+ * Multiple lockdown requests are allowed.
+ * Only single exclusive access can be granted.
+ * Will fail if the guard is already in exclusive mode.
+ * On success, must call the xe_guard_disarm() to release.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static inline int xe_guard_arm(struct xe_guard *guard, bool lockdown, void *who)
+{
+	guard(spinlock)(&guard->lock);
+
+	if (lockdown) {
+		if (guard->counter < 0)
+			return -EBUSY;
+		guard->counter++;
+	} else {
+		if (guard->counter > 0)
+			return -EPERM;
+		if (guard->counter < 0)
+			return -EUSERS;
+		guard->counter--;
+	}
+
+	guard->owner = who;
+	return 0;
+}
+
+/**
+ * xe_guard_disarm() - Disarm the guard from exclusive/lockdown mode.
+ * @guard: the &xe_guard to disarm
+ * @lockdown: disarm from lockdown(true) or exclusive(false) mode
+ *
+ * Return: true if successfully disarmed or false in case of mismatch.
+ */
+static inline bool xe_guard_disarm(struct xe_guard *guard, bool lockdown)
+{
+	guard(spinlock)(&guard->lock);
+
+	if (lockdown) {
+		if (guard->counter <= 0)
+			return false;
+		guard->counter--;
+	} else {
+		if (guard->counter != -1)
+			return false;
+		guard->counter++;
+	}
+	return true;
+}
+
+/**
+ * xe_guard_mode_str() - Convert guard mode into a string.
+ * @lockdown: flag used to select lockdown or exclusive mode
+ *
+ * Return: "lockdown" or "exclusive" string.
+ */
+static inline const char *xe_guard_mode_str(bool lockdown)
+{
+	return lockdown ? "lockdown" : "exclusive";
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index d0fcde66a774..8d8b291bdfd9 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -94,6 +94,20 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
 	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
 }
 
+static int pf_prepare_vfs_enabling(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	/* make sure VFs enabling was not locked-down by other components */
+	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
+}
+
+static void pf_finish_vfs_enabling(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	/* allow other components to lockdown VFs enabling */
+	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -109,6 +123,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err)
 		goto out;
 
+	err = pf_prepare_vfs_enabling(xe);
+	if (err)
+		goto out;
+
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -148,6 +166,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 failed:
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
+	pf_finish_vfs_enabling(xe);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
@@ -179,6 +198,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
 
+	pf_finish_vfs_enabling(xe);
+
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index b8af93eb5b5f..7ec33f083fe6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -102,6 +102,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_guard_init(&xe->sriov.pf.guard_vfs_enabling, "vfs_enabling");
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
@@ -162,6 +164,102 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_arm_guard() - Arm the guard for exclusive/lockdown mode.
+ * @xe: the PF &xe_device
+ * @guard: the &xe_guard to arm
+ * @lockdown: arm for lockdown(true) or exclusive(false) mode
+ * @who: the address of the new owner, or NULL if it's a caller
+ *
+ * This function can only be called on PF.
+ *
+ * It is a simple wrapper for xe_guard_arm() with additional debug
+ * messages.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_arm_guard(struct xe_device *xe, struct xe_guard *guard,
+			  bool lockdown, void *who)
+{
+	void *new_owner = who ?: __builtin_return_address(0);
+	int err;
+
+	err = xe_guard_arm(guard, lockdown, new_owner);
+	if (err) {
+		xe_sriov_dbg(xe, "%s/%s mode denied (%pe) last owner %ps\n",
+			     guard->name, xe_guard_mode_str(lockdown),
+			     ERR_PTR(err), guard->owner);
+		return err;
+	}
+
+	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
+			     guard->name, xe_guard_mode_str(lockdown),
+			     new_owner);
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_disarm_guard() - Disarm the guard.
+ * @xe: the PF &xe_device
+ * @guard: the &xe_guard to disarm
+ * @lockdown: disarm from lockdown(true) or exclusive(false) mode
+ * @who: the address of the indirect owner, or NULL if it's a caller
+ *
+ * This function can only be called on PF.
+ *
+ * It is a simple wrapper for xe_guard_disarm() with additional debug
+ * messages and xe_assert() to easily catch any illegal calls.
+ */
+void xe_sriov_pf_disarm_guard(struct xe_device *xe, struct xe_guard *guard,
+			      bool lockdown, void *who)
+{
+	bool disarmed;
+
+	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
+			     guard->name, xe_guard_mode_str(lockdown),
+			     who ?: __builtin_return_address(0));
+
+	disarmed = xe_guard_disarm(guard, lockdown);
+	xe_assert_msg(xe, disarmed, "%s/%s not armed? last owner %ps",
+		      guard->name, xe_guard_mode_str(lockdown), guard->owner);
+}
+
+/**
+ * xe_sriov_pf_lockdown() - Lockdown the PF to prevent VFs enabling.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ *
+ * Once the PF is locked down, it will not enable VFs.
+ * If VFs are already enabled, the -EBUSY will be returned.
+ * To allow the PF enable VFs again call xe_sriov_pf_end_lockdown().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_lockdown(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	/* lockdown the VFs enabling by taking read-only guard access */
+	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true,
+				     __builtin_return_address(0));
+}
+
+/**
+ * xe_sriov_pf_end_lockdown() - Allow the PF to enable VFs again.
+ * @xe: the PF &xe_device
+ *
+ * This function can only be called on PF.
+ * See xe_sriov_pf_lockdown() for details.
+ */
+void xe_sriov_pf_end_lockdown(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true,
+				 __builtin_return_address(0));
+}
+
 /**
  * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
  * @xe: the &xe_device to print info from
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
index cba3fde9581f..b5bee3a549c1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
@@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
 int xe_sriov_pf_init_early(struct xe_device *xe);
 int xe_sriov_pf_init_late(struct xe_device *xe);
 int xe_sriov_pf_wait_ready(struct xe_device *xe);
+int xe_sriov_pf_lockdown(struct xe_device *xe);
+void xe_sriov_pf_end_lockdown(struct xe_device *xe);
 void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
 #else
 static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
 static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
 static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
+int xe_sriov_pf_lockdown(struct xe_device *xe) { return 0; }
+void xe_sriov_pf_end_lockdown(struct xe_device *xe) { }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index a81aa05c5532..1c5d19ce7b63 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -98,10 +98,40 @@ static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
 
 DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
 
+static int lockdown_vfs_enabling_open(struct inode *inode, struct file *file)
+{
+	struct dentry *dent = file_dentry(file);
+	struct xe_device *xe = extract_xe(dent);
+	ssize_t ret;
+
+	ret = xe_sriov_pf_lockdown(xe);
+	if (ret < 0)
+		return ret;
+
+	file->private_data = xe;
+	return nonseekable_open(inode, file);
+}
+
+static int lockdown_vfs_enabling_release(struct inode *inode, struct file *file)
+{
+	struct xe_device *xe = file->private_data;
+
+	xe_sriov_pf_end_lockdown(xe);
+	return 0;
+}
+
+static const struct file_operations lockdown_vfs_enabling_fops = {
+	.owner		= THIS_MODULE,
+	.open		= lockdown_vfs_enabling_open,
+	.release	= lockdown_vfs_enabling_release,
+};
+
 static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
 {
 	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
 			    &restore_auto_provisioning_fops);
+	debugfs_create_file("lockdown_vfs_enabling", 0400, dent, xe,
+			    &lockdown_vfs_enabling_fops);
 }
 
 static int simple_show(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index 4a4340fb633a..a348fd31a91f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -54,4 +54,9 @@ static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
 	return &xe->sriov.pf.master_lock;
 }
 
+int xe_sriov_pf_arm_guard(struct xe_device *xe, struct xe_guard *guard,
+			  bool write, void *who);
+void xe_sriov_pf_disarm_guard(struct xe_device *xe, struct xe_guard *guard,
+			      bool write, void *who);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index b3cd9797194b..2fb5f426d588 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_guard.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -38,6 +39,9 @@ struct xe_device_pf {
 	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
 	u16 driver_max_vfs;
 
+	/** @guard_vfs_enabling: guards VFs enabling */
+	struct xe_guard guard_vfs_enabling;
+
 	/** @master_lock: protects all VFs configurations across GTs */
 	struct mutex master_lock;
 
-- 
2.47.1

