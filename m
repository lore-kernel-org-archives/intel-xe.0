Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B18C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 13:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0410FAD7;
	Fri, 25 Sep 2026 13:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJZ+feHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172C310FAC9
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790344552; x=1821880552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zyOvt+iOUiiI8+J0H3Hp724cCAnuLJTid3pararCP9U=;
 b=SJZ+feHAPQndDRVWqCPqWEoyQvx8PrzmRKe+ysBxoN2UC+tPAPsWP387
 eJUUZvjINYZsXUtKNXBWA8elykUtxWxThZ9UC8nHP7AHE6j8nI60hsAJg
 b1a5ci/41AeOzkVDveylIhv6Xik+T96NoCs6Uoxbin6LdYCkrygwAK/mB
 he93pbgl4HfCj6VtFlDiZSbByQ0AId55BNt+3AoMah4UfIBViysfXcIVW
 mqzoZT02OQnJ3sLx4loxc7MmwaFfptmNwlTcZ4BpABuVu5AHl5j4o8/fh
 a/rSFNVsYZ31RmDQXRY2fQm7ucHz8btXcth3tgBp2waRsh4OcCIJxJmMZ Q==;
X-CSE-ConnectionGUID: oj0JPYoDTVKNRIDVXRzPIw==
X-CSE-MsgGUID: 4HoiW4JwQ46ZuZ9j6IvMIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90993037"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90993037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:52 -0700
X-CSE-ConnectionGUID: 9zJFvt57QrS9mcQFpHjd7A==
X-CSE-MsgGUID: YQhsaC+JRjmclUb/fJCdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272914962"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:48 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michal.wajdeczko@intel.com, michael.j.ruhl@intel.com,
 paul.e.luse@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v7 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
Date: Fri, 25 Sep 2026 06:55:23 -0700
Message-ID: <20260925135521.1804299-8-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
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
write, followed by optional per-command response timeout and
response-length overrides and the payload bytes:

- Usage: echo "<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]" \
             > /sys/kernel/debug/dri/0/sc/mailbox
         cat /sys/kernel/debug/dri/0/sc/mailbox

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v7:
- Add per-command timeout override to mailbox debugfs
- Add per-command response-length override to mailbox debugfs

v6 (Rodrigo):
- Reject non-zero offset writes for mailbox entry
- Account for mailbox header size when validating input payload length

v5:
- Add per-entry locking for debugfs accesses
- Skip empty mailbox group/command tokens

v4:
- Added a generic mailbox debugfs entry
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 172 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   1 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |   6 +
 3 files changed, 179 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 10675cd774ee..ba904cb24512 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -299,10 +299,179 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
 	entry->command = command;
 	entry->response_len = 0;
 	entry->status = 0;
+	entry->timeout_ms = 0;
 
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
+	unsigned int timeout_ms = 0;
+	size_t input_len = 0;
+	size_t max_input;
+	size_t out_len = 0;
+	size_t resp_len = XE_SYSCTRL_MB_MAX_DATA_SIZE;
+	u8 group, command;
+	int status;
+
+	if (*offp)
+		return -ESPIPE;
+
+	if (len == 0 || len >= PAGE_SIZE)
+		return -EINVAL;
+
+	kbuf = kmalloc(len + 1, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	max_input = min_t(size_t, len, XE_SYSCTRL_MB_MAX_DATA_SIZE);
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
+	if (!token || kstrtoul(token, 0, &val) || val > SYSCTRL_HDR_COMMAND_MAX) {
+		xe_err(xe, "sysctrl: invalid mailbox command id (max 0x%x)\n",
+		       SYSCTRL_HDR_COMMAND_MAX);
+		return -EINVAL;
+	}
+	command = (u8)val;
+
+	do {
+		token = strsep(&tmp, " \t\n");
+	} while (token && *token == '\0');
+	if (token && strstarts(token, "timeout=")) {
+		if (kstrtouint(token + strlen("timeout="), 0, &timeout_ms) ||
+		    timeout_ms > XE_SYSCTRL_MB_MAX_TIMEOUT_MS) {
+			xe_err(xe, "sysctrl: invalid mailbox timeout (max %u ms)\n",
+			       XE_SYSCTRL_MB_MAX_TIMEOUT_MS);
+			return -EINVAL;
+		}
+		token = strsep(&tmp, " \t\n");
+	}
+
+	if (token && strstarts(token, "resplen=")) {
+		unsigned int resplen;
+
+		if (kstrtouint(token + strlen("resplen="), 0, &resplen) ||
+		    resplen > XE_SYSCTRL_MB_MAX_DATA_SIZE) {
+			xe_err(xe, "sysctrl: invalid mailbox resplen (max %zu bytes)\n",
+			       (size_t)XE_SYSCTRL_MB_MAX_DATA_SIZE);
+			return -EINVAL;
+		}
+		resp_len = resplen;
+		token = strsep(&tmp, " \t\n");
+	}
+
+	while (token) {
+		if (*token == '\0') {
+			token = strsep(&tmp, " \t\n");
+			continue;
+		}
+
+		if (input_len >= max_input) {
+			xe_err(xe, "sysctrl: mailbox payload too large (max %zu bytes)\n",
+			       max_input);
+			return -EINVAL;
+		}
+
+		if (kstrtoul(token, 0, &val) || val > 0xFF) {
+			xe_err(xe, "sysctrl: invalid mailbox payload byte '%s'\n", token);
+			return -EINVAL;
+		}
+
+		input[input_len++] = (u8)val;
+		token = strsep(&tmp, " \t\n");
+	}
+
+	scoped_guard(mutex, &entry->lock) {
+		entry->group = group;
+		entry->command = command;
+		entry->timeout_ms = timeout_ms;
+
+		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
+					  entry->response_buf, resp_len);
+		cmd.timeout_ms = timeout_ms;
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
+	seq_printf(m, "Timeout: %u ms%s\n", entry->timeout_ms ?: XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS,
+		   entry->timeout_ms ? "" : " (default)");
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
+	seq_puts(m, "  echo \"<group> <command> [timeout=<ms>] [resplen=<N>] [byte0 byte1 ...]\" > mailbox\n");
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
@@ -325,4 +494,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
 				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
 				  &xe_sysctrl_ras_error_inject_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
+				  &xe_sysctrl_mailbox_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 2554848e7484..a0628eb47bff 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -155,5 +155,6 @@ struct xe_sysctrl_mailbox_command {
 	(XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(u32))
 
 #define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
+#define XE_SYSCTRL_MB_MAX_TIMEOUT_MS		60000
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 8ea6e1f29ddd..f12455f2886d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -39,6 +39,9 @@ struct xe_sysctrl_debugfs_entry {
 
 	/** @status: Last command result */
 	int status;
+
+	/** @timeout_ms: Last mailbox response timeout used (0 for default) */
+	unsigned int timeout_ms;
 };
 
 /**
@@ -71,6 +74,9 @@ struct xe_sysctrl {
 
 		/** @debugfs.ras_error_inject: RAS error injection test entry */
 		struct xe_sysctrl_debugfs_entry ras_error_inject;
+
+		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
+		struct xe_sysctrl_debugfs_entry mailbox;
 	} debugfs;
 };
 
-- 
2.43.0

