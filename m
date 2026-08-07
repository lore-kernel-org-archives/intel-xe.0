Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D80C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 14:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89DE10E425;
	Fri,  7 Aug 2026 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iT2vKjrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21D10E36A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786114600; x=1817650600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sq4TQ5vxhQxXp3NaKyNGFyPZCltRHROQY2oiTUjshfs=;
 b=iT2vKjrSDcorhQGilnjPzG+fi4g/wYeaKXyqhhktEFY+PQt/Rt8XvHPn
 SgTJIUEJ2CncepJdtHdCaJ6RuwhL/1soSTGp1vrqNm+pvx4/G0Z+wI/bf
 sgS8ceaOi6QXUcYFXtNjJKLsUme/lQC5IYXPsX08zRAbDK9xcA1hAtrcW
 0XYgv5JMZ97NTgI4d7ir89wl/6hiPQvcjkz10ESUvgyvRoB+QSwrw8j+0
 7DKDXYsS+GRHFZSPDBYeOMYTv5cj0tkDchFF6c1Ph8g2/Dkz8KRT3zPIq
 pePd1KYxkqhVhL6My8L5COMqzWnSiR51KDsgSKYarLv+SxynROG9NxGsh A==;
X-CSE-ConnectionGUID: layXxx+0RZmeGFjR96xmPQ==
X-CSE-MsgGUID: 2qDTskkuSfuZM32rHo4I7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90604300"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90604300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:40 -0700
X-CSE-ConnectionGUID: wdicK60yT42JQl67SGel0A==
X-CSE-MsgGUID: zoq7X46cSACbDVQepN29QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258116241"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:36 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 3/4] drm/xe/sysctrl: Add loopback test debugfs interface
Date: Fri,  7 Aug 2026 07:56:24 -0700
Message-ID: <20260807145621.2938848-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
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

Add debugfs interface for testing sysctrl mailbox loopback
functionality. This allows userspace to send test payloads
and verify firmware communication.

Command details:
- Group ID: 0xFF (core group)
- Command ID: 0x03 (Inverted loopback)
- Usage: echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback
         cat /sys/kernel/debug/dri/0/sc/loopback

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 130 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  28 ++++
 3 files changed, 160 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 0238ff093831..2144d9d43fba 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -3,13 +3,139 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/kstrtox.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
 
 #include "xe_device.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_debugfs.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
 
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
 /**
  * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
  * @sc: xe_sysctrl instance
@@ -24,4 +150,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 		return;
 
 	sc->debugfs.root = root;
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
+				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
+				  &xe_sysctrl_loopback_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index b507e1553cbb..ed80fe63e1c4 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -43,9 +43,11 @@ enum xe_sysctrl_gfsp_cmd {
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
index d50a35fefb7a..53d82e61383a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -10,9 +10,34 @@
 #include <linux/types.h>
 #include <linux/workqueue_types.h>
 
+#include "xe_sysctrl_mailbox_types.h"
+
 struct xe_mmio;
 struct dentry;
 
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
+
 /**
  * struct xe_sysctrl - System Controller driver context
  *
@@ -40,6 +65,9 @@ struct xe_sysctrl {
 	struct {
 		/** @debugfs.root: Root debugfs directory */
 		struct dentry *root;
+
+		/** @debugfs.loopback: Loopback test entry */
+		struct xe_sysctrl_debugfs_entry loopback;
 	} debugfs;
 };
 
-- 
2.43.0

