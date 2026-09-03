Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F57C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8CE10F5D3;
	Thu,  3 Sep 2026 14:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euMYCEbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BA510F5EE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788444238; x=1819980238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OuPlWG9+0oy1bo4CpXu5wzpOLYGhMMoHWCydgA3Ma5s=;
 b=euMYCEbqOucqEUMWgz3ydkW77Tdfw1Ty5rYAH3dHp5KG/13Gg+H94CK1
 I50wRxHW5TGfM+qvL37jXYoN6N3pborZbLLUgu9tN/RhiaufYvT6cvmrN
 QbtgmFOM0Tmcl/RGQnQOTKbinQyG7NgPb5hmWZ/M0pcXF5P+pmbzOg0ph
 jS8okE+p9rJ6ljvt8s7LepJ8DymnjUunKebXn7uhtDLThivXMMrVtsLs0
 wpZhhwOom1q71cw/oQEW0p+vvE+tFJJ9lZ8GdN42N33X45/WGP+vnnvbj
 qcTlLHu7/IgFR2m+y7qL9LtfD3qmKFmbDVQKCXAkDVvCijABOx9xfxyQE g==;
X-CSE-ConnectionGUID: QyYajlk0TdurbTxSJUT1Ig==
X-CSE-MsgGUID: cC2fe+kMQYO5wjFfcqsoyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87865981"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87865981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:54 -0700
X-CSE-ConnectionGUID: oP2PYhTFREuEWHoW+8Mpkw==
X-CSE-MsgGUID: N7IOK1WVRSOvjqATpaUB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267150181"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:50 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v4 2/4] drm/xe/sysctrl: Add sysctrl debugfs infrastructure and
 loopback test interface
Date: Thu,  3 Sep 2026 07:03:42 -0700
Message-ID: <20260903140340.83500-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140340.83500-6-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add debugfs support for exercising System Controller mailbox
interface from userspace. This adds the "sc/" debugfs root
directory and a "loopback" entry that sends an arbitrary byte
payload to the Core group's inverted-loopback command (group=0xFF,
cmd=0x03) and reports the response:

  echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback
  cat /sys/kernel/debug/dri/0/sc/loopback

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4 (Rodrigo):
- Squashed debugfs infrastructure and loopback support into a single commit
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   5 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 157 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h       |  14 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  35 ++++
 6 files changed, 214 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..3484e9a523d1 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -128,6 +128,7 @@ xe-y += xe_bb.o \
 	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_sysctrl.o \
+	xe_sysctrl_debugfs.o \
 	xe_sysctrl_event.o \
 	xe_sysctrl_mailbox.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 28135f84e286..74bf8515b49c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,8 @@
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_debugfs.h"
 #include "xe_tile_debugfs.h"
 #include "xe_vsec.h"
 #include "xe_wa.h"
@@ -785,6 +787,9 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_fault_inject_debugfs_register(xe, root);
 
+	if (xe->info.has_sysctrl)
+		xe_sysctrl_debugfs_register(&xe->sc, root);
+
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
 	else if (IS_SRIOV_VF(xe))
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
new file mode 100644
index 000000000000..2144d9d43fba
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/cleanup.h>
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/kstrtox.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "xe_device.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+#include "xe_sysctrl.h"
+#include "xe_sysctrl_debugfs.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
+#include "xe_sysctrl_types.h"
+
+static ssize_t xe_sysctrl_loopback_write(struct file *file, const char __user *ubuf,
+					 size_t len, loff_t *offp)
+{
+	char *kbuf __free(kfree) = NULL;
+	u8 *input __free(kfree) = NULL;
+	struct seq_file *m = file->private_data;
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+	struct xe_sysctrl_mailbox_command cmd = {};
+	char *token, *tmp;
+	unsigned long val;
+	size_t input_len = 0;
+	size_t max_input;
+	size_t out_len = 0;
+
+	if (len == 0 || len >= PAGE_SIZE)
+		return -EINVAL;
+
+	kbuf = kmalloc(len + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
+	input = kmalloc(max_input, GFP_KERNEL);
+	if (!input)
+		return -ENOMEM;
+
+	if (copy_from_user(kbuf, ubuf, len))
+		return -EFAULT;
+	kbuf[len] = '\0';
+
+	tmp = kbuf;
+	while ((token = strsep(&tmp, " \t\n")) != NULL) {
+		if (*token == '\0')
+			continue;
+
+		if (input_len >= max_input) {
+			xe_err(xe, "sysctrl: loopback payload too large (max %d bytes)\n",
+			       XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
+			return -EINVAL;
+		}
+
+		if (kstrtoul(token, 0, &val) || val > 0xFF) {
+			xe_err(xe, "sysctrl: invalid loopback token '%s'\n", token);
+			return -EINVAL;
+		}
+
+		input[input_len++] = (u8)val;
+	}
+
+	if (input_len == 0) {
+		xe_err(xe, "sysctrl: no loopback payload given\n");
+		return -EINVAL;
+	}
+
+	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
+				  input, input_len, entry->response_buf, input_len);
+
+	guard(xe_pm_runtime)(xe);
+	entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+	entry->response_len = entry->status ? 0 : out_len;
+
+	return entry->status ? entry->status : len;
+}
+
+static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	size_t i;
+
+	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
+	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
+	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
+
+	if (entry->response_len) {
+		seq_puts(m, "Response data:\n");
+		for (i = 0; i < entry->response_len; i++) {
+			if (i && (i % 16) == 0)
+				seq_putc(m, '\n');
+			seq_printf(m, "%02x ", entry->response_buf[i]);
+		}
+		seq_putc(m, '\n');
+	}
+
+	return 0;
+}
+
+static int xe_sysctrl_loopback_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, xe_sysctrl_loopback_show, inode->i_private);
+}
+
+static const struct file_operations xe_sysctrl_loopback_fops = {
+	.owner = THIS_MODULE,
+	.open = xe_sysctrl_loopback_open,
+	.read = seq_read,
+	.write = xe_sysctrl_loopback_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
+				      struct xe_sysctrl *sc, const char *name,
+				      u8 group, u8 command,
+				      const struct file_operations *fops)
+{
+	entry->sc = sc;
+	entry->group = group;
+	entry->command = command;
+	entry->response_len = 0;
+	entry->status = 0;
+
+	debugfs_create_file(name, 0644, root, entry, fops);
+}
+
+/**
+ * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
+ * @sc: xe_sysctrl instance
+ * @parent: parent debugfs directory
+ */
+void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir("sc", parent);
+	if (IS_ERR(root))
+		return;
+
+	sc->debugfs.root = root;
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
+				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
+				  &xe_sysctrl_loopback_fops);
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
new file mode 100644
index 000000000000..d1414ac3562e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_SYSCTRL_DEBUGFS_H_
+#define _XE_SYSCTRL_DEBUGFS_H_
+
+struct dentry;
+struct xe_sysctrl;
+
+void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index d756b50cde6b..04c9fcf5aa8a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -47,9 +47,11 @@ enum xe_sysctrl_gfsp_cmd {
 /**
  * enum xe_sysctrl_core_cmd - Commands supported by Core group
  *
+ * @XE_SYSCTRL_CMD_LOOPBACK: Loopback test command
  * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
  */
 enum xe_sysctrl_core_cmd {
+	XE_SYSCTRL_CMD_LOOPBACK				= 0x03,
 	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 98c2f473f7c6..3c8bde2380b1 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -10,7 +10,33 @@
 #include <linux/types.h>
 #include <linux/workqueue_types.h>
 
+#include "xe_sysctrl_mailbox_types.h"
+
 struct xe_mmio;
+struct dentry;
+
+/**
+ * struct xe_sysctrl_debugfs_entry - Debugfs entry for a raw mailbox test command
+ */
+struct xe_sysctrl_debugfs_entry {
+	/** @sc: Back pointer to parent sysctrl instance */
+	struct xe_sysctrl *sc;
+
+	/** @group: Command group ID */
+	u8 group;
+
+	/** @command: Command ID within group */
+	u8 command;
+
+	/** @response_buf: Response data buffer, sized to the maximum mailbox message */
+	u8 response_buf[XE_SYSCTRL_MB_MAX_MESSAGE_SIZE];
+
+	/** @response_len: Actual response length from firmware */
+	size_t response_len;
+
+	/** @status: Last command result */
+	int status;
+};
 
 /**
  * struct xe_sysctrl - System Controller driver context
@@ -31,6 +57,15 @@ struct xe_sysctrl {
 
 	/** @event_lock: Mutex protecting pending events */
 	struct mutex event_lock;
+
+	/** @debugfs: Debugfs entries */
+	struct {
+		/** @debugfs.root: Root debugfs directory */
+		struct dentry *root;
+
+		/** @debugfs.loopback: Loopback test entry */
+		struct xe_sysctrl_debugfs_entry loopback;
+	} debugfs;
 };
 
 #endif
-- 
2.43.0

