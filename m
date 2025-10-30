Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE5CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D2910E106;
	Thu, 30 Oct 2025 22:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiDbKgVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE110E106
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863457; x=1793399457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jjooa4EzfhbMAPd50nazt5AV/URFqvJwcO60z5M41ho=;
 b=PiDbKgVydH/Ow+8RkC0EVh6W2O/MFSkDdPEIxCYjKVHCzWPztv0SuM8g
 SJ/GaTHfilnDGtmXuhydjPWxWMbUUMThZF6lBCS1eW7rM3KOIJdrbOSOL
 GetClBOFuT62gvqUixchx2Cg+ZCRcQxLrXKMK2F25iFP6M73ZWdf/NNpX
 MENvG2uaK25aCR2pHCEIN2c3m5XCqC34S8qif7biU84W/C5B8tnYk/0wG
 gZ9FA8AXXO6+jYrTXRcdz0hpyRg5NUEnTPfQllBekVP9FgCN4NjKITLiv
 Bc6fW7ZwRZN0jAwdUK8/8JTGYs5F6WRwI2tfagbM6d8yTmjlaeOraryre A==;
X-CSE-ConnectionGUID: oZEnMjb0Tp2C/Prt9JlMXA==
X-CSE-MsgGUID: A4jxw0RdQWKdi6iws7d0tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75368340"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75368340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:30:56 -0700
X-CSE-ConnectionGUID: V953u4w7QJOJ/ThO13FDIQ==
X-CSE-MsgGUID: KpEbK6hiQM6eSGxorOeHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190422236"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:30:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v2] drm/xe/pf: Allow to lockdown the PF using custom guard
Date: Thu, 30 Oct 2025 23:30:27 +0100
Message-ID: <20251030223031.186685-1-michal.wajdeczko@intel.com>
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

Introduce trivial read-write access counter based on the atomic_t
to allow usages in the scenarios where we can't follow the strict
owner semantics as required by the rw_semaphore.

Before enabling VFs, the PF will try to acquire (arm) the write
access to the dedicated guard.  This will fail if there are some
read accesses already acquired by the other components.

For testing purposes, add debugfs file which will call these new
functions from the open/close hooks.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
v1: https://patchwork.freedesktop.org/series/156687/#rev1
v2: use less confusing names (Matthew/Christoph)
    allow many components to lockdown the PF (Christoph)
---
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_guard.h            | 90 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.c        | 21 +++++
 drivers/gpu/drm/xe/xe_sriov_pf.c         | 97 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.h         |  4 +
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 30 ++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  5 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h   |  4 +
 7 files changed, 251 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_guard.h

diff --git a/drivers/gpu/drm/xe/xe_guard.h b/drivers/gpu/drm/xe/xe_guard.h
new file mode 100644
index 000000000000..8abb9e70093c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guard.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUARD_H_
+#define _XE_GUARD_H_
+
+#include <linux/atomic.h>
+
+/**
+ * struct xe_guard - Simple read-write guard to protect a feature.
+ *
+ * Provides one-writer/many-readers logic that can be used to guarantee
+ * exclusive enabling of the otherwise incompatible features, where we
+ * can't follow the strict owner semantics required by the &rw_semaphore.
+ *
+ * NOTE! It shouldn't be used to protect a data, use &rw_semaphore instead.
+ */
+struct xe_guard {
+	/**
+	 * @exclusive_cnt: implements simple exclusiveness logic:
+	 *                 if < 0 then owned by the writer,
+	 *                 if > 0 then owned by the reader(s).
+	 */
+	atomic_t exclusive_cnt;
+
+	/** @name: the name of the guard (useful for debug) */
+	const char *name;
+
+	/** @owner: the info about the last owner of the guard (for debug) */
+	void *owner;
+};
+
+/**
+ * xe_guard_init() - Initialize the guard.
+ * @guard: the &xe_guard to init
+ * @name: name of the guard
+ */
+static inline void xe_guard_init(struct xe_guard *guard, const char *name)
+{
+	guard->name = name;
+}
+
+/**
+ * xe_guard_arm() - Arm the guard for write/read-only access.
+ * @guard: the &xe_guard to arm
+ * @write: requested access mode
+ * @owner: optional owner info (for debug only)
+ *
+ * Only single write-only access will be granted.
+ * Must call the xe_guard_disarm() to release.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static inline int xe_guard_arm(struct xe_guard *guard, bool write, void *owner)
+{
+	bool done;
+
+	if (write)
+		done = atomic_dec_unless_positive(&guard->exclusive_cnt);
+	else
+		done = atomic_inc_unless_negative(&guard->exclusive_cnt);
+
+	if (!done)
+		return -EBUSY;
+
+	if (write && atomic_add_unless(&guard->exclusive_cnt, 1, -1))
+		return -EPERM;
+
+	guard->owner = owner;
+	return 0;
+}
+
+/**
+ * xe_guard_disarm() - Disarm the guard.
+ * @guard: the &xe_guard to disarm
+ * @write: access mode
+ *
+ * Return: true if successfully disarmed or false in case of mismatch.
+ */
+static inline bool xe_guard_disarm(struct xe_guard *guard, bool write)
+{
+	if (write)
+		return atomic_cmpxchg(&guard->exclusive_cnt, -1, 0) == -1;
+	else
+		return atomic_dec_if_positive(&guard->exclusive_cnt) >= 0;
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 735f51effc7a..2fd4fe6fe83a 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -105,6 +105,20 @@ static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
 	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
 }
 
+static int pf_prepare_vfs_enabling(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	/* check guard to make sure we are not locked-down by other components */
+	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
+}
+
+static void pf_finish_vfs_enabling(struct xe_device *xe)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, true, NULL);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -120,6 +134,10 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err)
 		goto out;
 
+	err = pf_prepare_vfs_enabling(xe);
+	if (err)
+		goto out;
+
 	/*
 	 * We must hold additional reference to the runtime PM to keep PF in D0
 	 * during VFs lifetime, as our VFs do not implement the PM capability.
@@ -157,6 +175,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 failed:
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
+	pf_finish_vfs_enabling(xe);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
@@ -186,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
 
+	pf_finish_vfs_enabling(xe);
+
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d9..1a10ae846b06 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -101,6 +101,8 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_guard_init(&xe->sriov.pf.guard_vfs_enabling, "vfs_enabling");
+
 	xe_sriov_pf_service_init(xe);
 
 	return 0;
@@ -157,6 +159,101 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_sriov_pf_arm_guard() - Arm the guard for read/write access.
+ * @xe: the PF &xe_device
+ * @guard: the &xe_guard to arm
+ * @write: requested access mode
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
+			  bool write, void *who)
+{
+	void *new_owner = who ?: __builtin_return_address(0);
+	int err;
+
+	err = xe_guard_arm(guard, write, new_owner);
+	if (err) {
+		xe_sriov_dbg(xe, "%s/%s (%pe) %ps, last owner %ps\n",
+			     guard->name ?: "?", str_write_read(write),
+			     ERR_PTR(err), new_owner, guard->owner);
+		return err;
+	}
+
+	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
+			     guard->name ?: "?", str_write_read(write), new_owner);
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_disarm_guard() - Disarm the guard.
+ * @xe: the PF &xe_device
+ * @guard: the &xe_guard to disarm
+ * @write: requested access mode
+ * @who: the address of the indirect owner, or NULL if it's a caller
+ *
+ * This function can only be called on PF.
+ *
+ * It is a simple wrapper for xe_guard_disarm() with additional debug
+ * messages and xe_assert() to easily catch any illegal calls.
+ */
+void xe_sriov_pf_disarm_guard(struct xe_device *xe, struct xe_guard *guard,
+			      bool write, void *who)
+{
+	bool disarmed;
+
+	xe_sriov_dbg_verbose(xe, "%s/%s by %ps\n",
+			     guard->name ?: "?", str_write_read(write),
+			     who ?: __builtin_return_address(0));
+
+	disarmed = xe_guard_disarm(guard, write);
+	xe_assert_msg(xe, disarmed, "%s/%s not armed? last owner %ps",
+		      guard->name ?: "?", str_write_read(write), guard->owner);
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
+	return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false,
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
+	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false,
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
index c753cd59aed2..a2c1b7daeec0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_guard.h"
 #include "xe_sriov_pf_provision_types.h"
 #include "xe_sriov_pf_service_types.h"
 
@@ -33,6 +34,9 @@ struct xe_device_pf {
 	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
 	u16 driver_max_vfs;
 
+	/** @guard_vfs_enabling: guards VFs enabling */
+	struct xe_guard guard_vfs_enabling;
+
 	/** @master_lock: protects all VFs configurations across GTs */
 	struct mutex master_lock;
 
-- 
2.47.1

