Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91633E63F2E
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4903110E39B;
	Mon, 16 Feb 2026 13:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NN9oxlYz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5E110E39B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771249695; x=1802785695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dRYskaSul2NjgpvcivvwC8fbSxS8U1jZad6VcUB6gMg=;
 b=NN9oxlYzoovxMppQgKrf/VQUdfTwxDOJBUxTOxjdsUeEMvuNvnkbKxPX
 FBy0/etndUZPbTGOE2PwtGaFjE/i/iWKxVVQPy35ezx8FUzvjLmsWhYUK
 hJtg56HiQJopZ7/xBdD6Y+vH6pdHftwSfFcBGsevyeKOGqjjZbquRwoA8
 OI/5ejGowrbHtBljqbYJnP/53uU4bBacKJrYqLzIZj0L97jx3TleO30d6
 Mf5dIDuJdHDomZmAsQtCxac/NPNs/eHJnVZf55b4GEE+ES7pYs3gMdhXv
 QWhEM9LlW7RfEnqDaZiXpAPixJbUhxFnJCM7d14yPGX+aRyJvWuYGE/8U w==;
X-CSE-ConnectionGUID: AHCRATdpRZSIiSsC3cAu1g==
X-CSE-MsgGUID: r/+cawxiTjehypIKhAZeug==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72398342"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72398342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:15 -0800
X-CSE-ConnectionGUID: iLiDydKAT42Q4P5WDunHJA==
X-CSE-MsgGUID: nJwh68eATfemwRSEz1iLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218147925"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:12 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v1 3/4] drm/xe/sysctrl: Add loopback test debugfs interface
Date: Mon, 16 Feb 2026 05:48:00 -0800
Message-ID: <20260216134757.3891177-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
References: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
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
- Command ID: 0x01 (loopback)
- Command ID: 0x03 (Inverted loopback)
- Usage: echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback
         cat /sys/kernel/debug/dri/0/sc/loopback
         echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback_inv
         cat /sys/kernel/debug/dri/0/sc/loopback_inv

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl.c         |  10 ++
 drivers/gpu/drm/xe/xe_sysctrl.h         |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 222 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h |  35 ++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c |   6 -
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |   6 +
 6 files changed, 275 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 430bccbdc3b9..ff84080fb580 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -35,6 +35,16 @@ static void xe_sysctrl_fini(void *arg)
 	xe->soc_remapper.set_sysctrl_region(xe, 0);
 }
 
+/**
+ * sc_to_xe - Get xe device from sysctrl pointer
+ * @sc: System Controller pointer
+ * Return: Pointer to xe device containing given system controller pointer
+ */
+struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
+{
+	return container_of(sc, struct xe_device, sc);
+}
+
 /**
  * xe_sysctrl_init - Initialize System Controller subsystem
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index ee7826fe4c98..1261e9b0d388 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -6,8 +6,10 @@
 #ifndef _XE_SYSCTRL_H_
 #define _XE_SYSCTRL_H_
 
+struct xe_sysctrl;
 struct xe_device;
 
+struct xe_device *sc_to_xe(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
 
 #endif /* _XE_SYSCTRL_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 0238ff093831..28e46695c900 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -3,12 +3,206 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitfield.h>
 #include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
 
 #include "xe_device.h"
+#include "xe_printk.h"
 #include "xe_sysctrl.h"
 #include "xe_sysctrl_debugfs.h"
+#include "xe_sysctrl_mailbox.h"
+#include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
+#include "regs/xe_sysctrl_regs.h"
+
+static size_t xe_sysctrl_calculate_resp_len(const struct xe_sysctrl_debugfs_entry *entry,
+					    size_t input_len)
+{
+	size_t resp_len;
+
+	switch (entry->resp_len_type) {
+	case XE_SYSCTRL_RESP_LEN_NONE:
+		resp_len = 0;
+		break;
+
+	case XE_SYSCTRL_RESP_LEN_FIXED:
+		resp_len = entry->fixed_resp_len;
+		break;
+
+	case XE_SYSCTRL_RESP_LEN_MATCH_CMD:
+		resp_len = input_len;
+		break;
+
+	case XE_SYSCTRL_RESP_LEN_USER_CFG:
+		resp_len = entry->user_resp_len ?: SYSCTRL_MB_MAX_MESSAGE_SIZE;
+		break;
+	}
+
+	return min_t(size_t, resp_len, SYSCTRL_MB_MAX_MESSAGE_SIZE);
+}
+
+static ssize_t xe_sysctrl_cmd_write(struct xe_sysctrl_debugfs_entry *entry,
+				    const char __user *ubuf, size_t len)
+{
+	struct xe_sysctrl *sc = entry->sc;
+	struct xe_device *xe = sc_to_xe(sc);
+	struct xe_sysctrl_mailbox_command cmd = {0};
+	char *token, *tmp;
+	unsigned long val;
+	size_t input_len = 0;
+	size_t expected_resp_len;
+	ssize_t ret;
+	u32 hdr;
+
+	if (len == 0 || len > PAGE_SIZE)
+		return -EINVAL;
+
+	u8 *input __free(kfree) = NULL;
+	input = kmalloc(SYSCTRL_MB_MAX_MESSAGE_SIZE, GFP_KERNEL);
+	if (!input)
+		return -ENOMEM;
+
+	char *kbuf __free(kfree) = NULL;
+	kbuf = kmalloc(len + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(kbuf, ubuf, len))
+		return -EFAULT;
+
+	kbuf[len] = '\0';
+
+	tmp = kbuf;
+	while ((token = strsep(&tmp, " \t\n")) != NULL) {
+		if (*token == '\0')
+			continue;
+
+		if (input_len >= SYSCTRL_MB_MAX_MESSAGE_SIZE) {
+			xe_err(xe, "sysctrl: Payload too large (%zu > %d)\n",
+			       input_len, SYSCTRL_MB_MAX_MESSAGE_SIZE);
+			return -EINVAL;
+		}
+
+		if (kstrtoul(token, 0, &val) || val > 0xFF) {
+			xe_err(xe, "sysctrl: Invalid token '%s'\n", token);
+			return -EINVAL;
+		}
+
+		input[input_len++] = (u8)val;
+	}
+
+	if (input_len == 0) {
+		xe_err(xe, "sysctrl: No valid input data\n");
+		return -EINVAL;
+	}
+
+	expected_resp_len = xe_sysctrl_calculate_resp_len(entry, input_len);
+
+	memset(entry->response_buf, 0, sizeof(entry->response_buf));
+	entry->response_len = 0;
+	entry->status = 0;
+
+	hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, entry->group) |
+		  FIELD_PREP(APP_HDR_COMMAND_MASK, entry->command) |
+		  FIELD_PREP(APP_HDR_VERSION_MASK, 0) |
+		  FIELD_PREP(APP_HDR_RESERVED_MASK, 0);
+	cmd.header.data = cpu_to_le32(hdr);
+	cmd.data_in = input;
+	cmd.data_in_len = input_len;
+	cmd.data_out = entry->response_buf;
+	cmd.data_out_len = expected_resp_len;
+
+	if (cmd.data_in && cmd.data_in_len > 0) {
+		size_t i;
+		char buf[128];
+		size_t pos = 0;
+		u8 *data_ptr = (u8 *)cmd.data_in;
+
+		for (i = 0; i < cmd.data_in_len && pos < sizeof(buf) - 4; i++)
+			pos += scnprintf(buf + pos, sizeof(buf) - pos, "%02x ", data_ptr[i]);
+		buf[pos] = '\0';
+	}
+
+	ret = xe_sysctrl_send_command(xe, &cmd, &entry->response_len);
+	entry->status = ret;
+
+	if (ret) {
+		xe_err(xe, "sysctrl: Command failed with error %zd\n", ret);
+		return ret;
+	}
+
+	return len;
+}
+
+static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	size_t i;
+
+	seq_puts(m, "System Controller loopback_test\n");
+	seq_puts(m, "===========================\n");
+	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n",
+		   entry->group, entry->command);
+	seq_printf(m, "Status: %d (%s)\n",
+		   entry->status, entry->status ? "FAILED" : "SUCCESS");
+	seq_printf(m, "Response: %zu bytes\n\n", entry->response_len);
+
+	if (entry->response_len > 0) {
+		seq_puts(m, "Response data:\n");
+		for (i = 0; i < entry->response_len; i++) {
+			if (i > 0 && (i % 16) == 0)
+				seq_putc(m, '\n');
+			seq_printf(m, "%02x ", entry->response_buf[i]);
+		}
+		seq_puts(m, "\n\n");
+	}
+
+	return 0;
+}
+
+static ssize_t xe_sysctrl_loopback_write(struct file *file,
+					 const char __user *ubuf,
+					 size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+
+	return xe_sysctrl_cmd_write(entry, ubuf, len);
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
+static void xe_sysctrl_register_cmd(struct dentry *root,
+				    struct xe_sysctrl_debugfs_entry *entry,
+				    struct xe_sysctrl *sc,
+				    const struct xe_sysctrl_cmd_desc *desc)
+{
+	entry->sc = sc;
+	entry->name = desc->name;
+	entry->group = desc->group;
+	entry->command = desc->command;
+	entry->resp_len_type = desc->resp_len_type;
+	entry->fixed_resp_len = desc->fixed_resp_len;
+	entry->user_resp_len = 0;
+	entry->response_len = 0;
+	entry->status = 0;
+
+	debugfs_create_file(desc->name, desc->mode, root, entry, desc->fops);
+}
 
 /**
  * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
@@ -19,9 +213,37 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 {
 	struct dentry *root;
 
+	static const struct xe_sysctrl_cmd_desc loopback_desc = {
+		.name = "loopback",
+		.group = XE_SYSCTRL_GROUP_CORE,
+		.command = XE_SYSCTRL_LOOPBACK_CMD,
+		.resp_len_type = XE_SYSCTRL_RESP_LEN_MATCH_CMD,
+		.fixed_resp_len = 0,
+		.user_resp_len = 0,
+		.fops = &xe_sysctrl_loopback_fops,
+		.mode = 0644,
+	};
+
+	static const struct xe_sysctrl_cmd_desc loopback_inv_desc = {
+		.name = "loopback_inv",
+		.group = XE_SYSCTRL_GROUP_CORE,
+		.command = XE_SYSCTRL_LOOPBACK_INV_CMD,
+		.resp_len_type = XE_SYSCTRL_RESP_LEN_MATCH_CMD,
+		.fixed_resp_len = 0,
+		.user_resp_len = 0,
+		.fops = &xe_sysctrl_loopback_fops,
+		.mode = 0644,
+	};
+
 	root = debugfs_create_dir("sc", parent);
 	if (IS_ERR(root))
 		return;
 
 	sc->debugfs.root = root;
+
+	xe_sysctrl_register_cmd(root, &sc->debugfs.loopback, sc,
+				&loopback_desc);
+
+	xe_sysctrl_register_cmd(root, &sc->debugfs.loopback_inv, sc,
+				&loopback_inv_desc);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
index a393eaa42404..26bd8c62b916 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
@@ -6,9 +6,44 @@
 #ifndef _XE_SYSCTRL_DEBUGFS_H_
 #define _XE_SYSCTRL_DEBUGFS_H_
 
+#include <linux/types.h>
+
+#include "xe_sysctrl_types.h"
+
 struct dentry;
 struct xe_sysctrl;
 
+#define XE_SYSCTRL_GROUP_CORE		0xFF
+
+#define XE_SYSCTRL_LOOPBACK_CMD		0x01
+#define XE_SYSCTRL_LOOPBACK_INV_CMD	0x03
+
+struct xe_sysctrl_cmd_desc {
+	/** @name: Command name for debugfs file */
+	const char *name;
+
+	/** @group: Command group ID */
+	u8 group;
+
+	/** @command: Command ID within group */
+	u8 command;
+
+	/** @resp_len_type: Response length determination policy */
+	enum xe_sysctrl_resp_len_type resp_len_type;
+
+	/** @fixed_resp_len: Fixed response length (for RESP_LEN_FIXED mode) */
+	size_t fixed_resp_len;
+
+	/** @user_resp_len: User-specified response length (for RESP_LEN_USER_CFG mode) */
+	size_t user_resp_len;
+
+	/** @fops: File operations for debugfs entry */
+	const struct file_operations *fops;
+
+	/** @mode: File permissions for debugfs entry (e.g., 0644) */
+	umode_t mode;
+};
+
 void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
 
 #endif /* _XE_SYSCTRL_DEBUGFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 15a186a6f057..c0e8790d200b 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -5,7 +5,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
-#include <linux/container_of.h>
 #include <linux/errno.h>
 #include <linux/minmax.h>
 #include <linux/mutex.h>
@@ -42,11 +41,6 @@
 #define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
 	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
 
-static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
-{
-	return container_of(sc, struct xe_device, sc);
-}
-
 static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
 					      unsigned int timeout_ms)
 {
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index ede945a33ea3..30d8b34dee47 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -85,6 +85,12 @@ struct xe_sysctrl {
 	struct {
 		/** @root: Root debugfs directory */
 		struct dentry *root;
+
+		/** @loopback: Loopback test entry */
+		struct xe_sysctrl_debugfs_entry loopback;
+
+		/** @loopback_inv: Loopback test entry (inverted) */
+		struct xe_sysctrl_debugfs_entry loopback_inv;
 	} debugfs;
 };
 
-- 
2.43.0

