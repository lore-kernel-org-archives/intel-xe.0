Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5677DC88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 17:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A73D10E2BF;
	Thu, 10 Sep 2026 17:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ6w3oIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A010E298
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 17:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789062996; x=1820598996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mvb05kfhwKdjePpwf5h7ue1ksYmQI3OZgeMKmRJbYn4=;
 b=HZ6w3oIH25lcg0VZcBA6n3MNSLeOcFyDJSg1icNYl3ucmkYPctmnWuDw
 AVzTMnhlZu35hpyMp9WkBuOSB9cPSlXOAtCSbyDp1eCWGhCOwiVFAJ8M/
 N4hwfKoHNoRqv6+ixn8ZYcwmOYQnh92CEo1rsD9/Vi6LI7e4MwbuPE2IA
 /vakrcwWme/vh20Q+v6t5f/ifu2Bw+W6TiKB3lrt3Z4z/pN5+lNJA6kei
 EjaT944JrrbIcf3+0y+NisCARl+Oyrf9LqHWzfhyOXptiSwm8Io2ZfVB3
 rjcXwCTviyEzZh4CzzeR/4btYQu2lLvn66tWaAZnpGvnbwKAHBG+vdqQ7 w==;
X-CSE-ConnectionGUID: 1+NqJjDJQ5CajALbHeXDrg==
X-CSE-MsgGUID: sb3ljcdZRzyezcahNXvxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100183575"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100183575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:56:36 -0700
X-CSE-ConnectionGUID: j7Y38hgrSqaF+eB+//hC7A==
X-CSE-MsgGUID: 2fuWDaJeRAqyBuVSfh6Ecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271677872"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:56:33 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v5 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
Date: Thu, 10 Sep 2026 10:56:22 -0700
Message-ID: <20260910175619.3176089-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add a "mailbox" debugfs entry that allows any System Controller
mailbox command to be issued for bring-up and debug. group and
command are supplied by the caller as the first two tokens of every
write:

- Usage: echo "<group> <command> [byte0 byte1 ...]" \
             > /sys/kernel/debug/dri/0/sc/mailbox
         cat /sys/kernel/debug/dri/0/sc/mailbox

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v5:
- Add per-entry locking for debugfs accesses
- Skip empty mailbox group/command tokens

v4:
- Added a generic mailbox debugfs entry
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 132 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |   3 +
 2 files changed, 135 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 0c537248b30d..c6c58ba7e5a6 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -281,6 +281,135 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
 	debugfs_create_file(name, 0644, root, entry, fops);
 }
 
+static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __user *ubuf,
+					size_t len, loff_t *offp)
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
+	u8 group, command;
+	int status;
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
+
+	do {
+		token = strsep(&tmp, " \t\n");
+	} while (token && *token == '\0');
+	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
+		xe_err(xe, "sysctrl: invalid mailbox group id\n");
+		return -EINVAL;
+	}
+	group = (u8)val;
+
+	do {
+		token = strsep(&tmp, " \t\n");
+	} while (token && *token == '\0');
+	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
+		xe_err(xe, "sysctrl: invalid mailbox command id\n");
+		return -EINVAL;
+	}
+	command = (u8)val;
+
+	while ((token = strsep(&tmp, " \t\n")) != NULL) {
+		if (*token == '\0')
+			continue;
+
+		if (input_len >= max_input) {
+			xe_err(xe, "sysctrl: mailbox payload too large (max %d bytes)\n",
+			       XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
+			return -EINVAL;
+		}
+
+		if (kstrtoul(token, 0, &val) || val > 0xFF) {
+			xe_err(xe, "sysctrl: invalid mailbox payload byte '%s'\n", token);
+			return -EINVAL;
+		}
+
+		input[input_len++] = (u8)val;
+	}
+
+	scoped_guard(mutex, &entry->lock) {
+		entry->group = group;
+		entry->command = command;
+
+		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
+					  entry->response_buf, XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
+
+		guard(xe_pm_runtime)(xe);
+		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+		entry->status = status;
+		entry->response_len = status ? 0 : out_len;
+	}
+
+	return status ? status : len;
+}
+
+static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	size_t i;
+
+	guard(mutex)(&entry->lock);
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
+	seq_puts(m, "\nUsage:\n");
+	seq_puts(m, "  echo \"<group> <command> [byte0 byte1 ...]\" > mailbox\n");
+	seq_puts(m, "  cat mailbox\n");
+
+	return 0;
+}
+
+static int xe_sysctrl_mailbox_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, xe_sysctrl_mailbox_show, inode->i_private);
+}
+
+static const struct file_operations xe_sysctrl_mailbox_fops = {
+	.owner = THIS_MODULE,
+	.open = xe_sysctrl_mailbox_open,
+	.read = seq_read,
+	.write = xe_sysctrl_mailbox_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 /**
  * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
  * @sc: xe_sysctrl instance
@@ -303,4 +432,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
 				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
 				  &xe_sysctrl_ras_error_inject_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
+				  &xe_sysctrl_mailbox_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 8ea6e1f29ddd..77cbd7403d1a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -71,6 +71,9 @@ struct xe_sysctrl {
 
 		/** @debugfs.ras_error_inject: RAS error injection test entry */
 		struct xe_sysctrl_debugfs_entry ras_error_inject;
+
+		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
+		struct xe_sysctrl_debugfs_entry mailbox;
 	} debugfs;
 };
 
-- 
2.43.0

