Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A801C624D6
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C33310F5CE;
	Thu,  3 Sep 2026 14:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAJGyyOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599E110F5EE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788444241; x=1819980241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tPr7pagml61jkf5oLLNLen2Lr8Rc03HsH4BbCbg77G4=;
 b=WAJGyyOERHIkgC7IOH0SQZv8BUn+uaot5xelc8l40RCZh2gE1mzL6Vqg
 CO06pTGDeQ/0ZkldKNAuFLw/tDZKncFSRUBa2i9NByuaSZ/aVkMfx/Obt
 xfmJh4VsbbCkPco+3JjQJ0rNAG0CnlwFW4rXwXGMrgP/J7z4AkkSvLYZN
 8RLcX9bMwAtxAGdPpoO0/hJC7jdtsuWyWgT4hAPDb/5A1XlTQb09HLjrP
 UPxC9LlQh6mQx0Q5Nvr4Ggn9HFsoKRB0MHKlNIzvmN8oW0y05kvd/rdMw
 pUyfdsxoIhL5p/d8wVCgh/WR0hSVgS0YMGIMhMqZgqBuV+jgN8hYvBpI/ g==;
X-CSE-ConnectionGUID: UPEuNgpISEeQ1OSEFhcVvg==
X-CSE-MsgGUID: puHgex2kRmmaci+bS/xJmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87865991"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87865991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:04:01 -0700
X-CSE-ConnectionGUID: l7dOL6GSRsKXE8Sl8pWpsA==
X-CSE-MsgGUID: NsFS1QjASSK9tGXqz9pg1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267150203"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:58 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v4 4/4] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
Date: Thu,  3 Sep 2026 07:03:44 -0700
Message-ID: <20260903140340.83500-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140340.83500-6-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
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
mailbox command to be issued for bring-up and debug.

group and command are supplied by the caller as the
first two tokens of every write, e.g.:

  echo "<group> <command> [byte0 byte1 ...]" > mailbox
  cat mailbox

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v4:
- Added a generic mailbox debugfs entry
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 122 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |   3 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 258479d605cb..e5bc0a5dc31f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -258,6 +258,125 @@ static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_deb
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
+	token = strsep(&tmp, " \t\n");
+	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {
+		xe_err(xe, "sysctrl: invalid mailbox group id\n");
+		return -EINVAL;
+	}
+	group = (u8)val;
+
+	token = strsep(&tmp, " \t\n");
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
+	entry->group = group;
+	entry->command = command;
+
+	xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NULL, input_len,
+				  entry->response_buf, XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
+
+	guard(xe_pm_runtime)(xe);
+	entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+	entry->response_len = entry->status ? 0 : out_len;
+
+	return entry->status ? entry->status : len;
+}
+
+static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
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
@@ -280,4 +399,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
 				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
 				  &xe_sysctrl_ras_error_inject_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.mailbox, sc, "mailbox", 0, 0,
+				  &xe_sysctrl_mailbox_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 595be477f750..c47eb3ac0e98 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -68,6 +68,9 @@ struct xe_sysctrl {
 
 		/** @debugfs.ras_error_inject: RAS error injection test entry */
 		struct xe_sysctrl_debugfs_entry ras_error_inject;
+
+		/** @debugfs.mailbox: Generic, user-parameterized mailbox entry */
+		struct xe_sysctrl_debugfs_entry mailbox;
 	} debugfs;
 };
 
-- 
2.43.0

