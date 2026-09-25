Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BDC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 13:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4481910FAC8;
	Fri, 25 Sep 2026 13:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFnWDC8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD24310FAC8
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790344548; x=1821880548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Yn1+cLl3lGM7Q7mDKDRWwR0ooARiGgCKqSn1OD/DWA=;
 b=JFnWDC8C38kAQxqRicpqvx7QklJVASBG+XiW5vxRr298tunscK2eUWzM
 +2Ls6CxkMDEUiolZGXWOesyAiIO/0OftFXjCE9irLZf/N9aubqGH98yMY
 mPxIMMWBJoiOB0QWKktZ4RYSJBCMgCFjNxbiRgPsnM2PJHZUbvPES9bAG
 N/cSjcx+lyyTrBxLTM+pkNc4R6+y8vE6kPtV1lrDzTZZlEUFFxyxCwfIm
 6Jc59Ik8Qw2ejFTQhTZmNDtxpfbI+OAVOskC1AU/FcATy8SX9lrLDN8Ca
 t2SQLzsDD2/2Xe3aa/PeBo1gpoM4PlQ0Qgl9MWH1d0LfvwDMDibFMxxec Q==;
X-CSE-ConnectionGUID: 3u7EPl+cTC2ZpfHDMCHDKw==
X-CSE-MsgGUID: UTcy9WZUR7+VJPuvdWfzVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90993031"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90993031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:47 -0700
X-CSE-ConnectionGUID: 3AgQum0ATn+WvGj42BroJQ==
X-CSE-MsgGUID: IOjUWWAQTZSyEiCIa+5Y5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272914947"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 06:55:43 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michal.wajdeczko@intel.com, michael.j.ruhl@intel.com,
 paul.e.luse@intel.com, mohamed.mansoor.v@intel.com, kam.nasim@intel.com,
 anoop.c.vijay@intel.com
Subject: [PATCH v7 2/3] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Date: Fri, 25 Sep 2026 06:55:22 -0700
Message-ID: <20260925135521.1804299-7-anoop.c.vijay@intel.com>
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

Add debugfs interface for exercising System Controller's RAS error
injection command, used to validate RAS error detection and recovery
paths.

Command details:
- Group ID: 0x02 (diag group)
- Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
- Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]" \
             > /sys/kernel/debug/dri/0/sc/ras_error_inject
         cat /sys/kernel/debug/dri/0/sc/ras_error_inject

This command requires the diag application to have completed firmware
boot and initialization (late-bind loaded). Both cat and echo are
rejected with -ENODEV until xe_sysctrl_is_diag_fw_ready() reports the
diag firmware as ready: the readiness check is done in .open(), so the
file stays visible under sc/ but is inaccessible for both read and
write until the diag firmware becomes ready.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v6 (Rodrigo):
- Reject non-zero offset writes for ras_error_inject entry
- Account for mailbox header size when validating input payload length
- Refactor token parsing to simplify cleanup and error handling

v5:
- Add per-entry locking for debugfs accesses
- Add xe_pm_runtime guards for ras_error_inject readiness checks
- Simplify ras_error_inject write-path flow

v4 (Rodrigo, Anshuman):
- Gated ras_error_inject on diag firmware readiness in .open()
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 152 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
 3 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index dfd614e7e54b..10675cd774ee 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/uaccess.h>
 
 #include "xe_pm.h"
@@ -134,6 +135,153 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
 	.release = single_release,
 };
 
+static int sysctrl_parse_ras_error_inject(struct xe_device *xe, char *tmp,
+					  struct xe_sysctrl_diag_ras_err_inj_req *req)
+{
+	unsigned int nfields = 0;
+	char *token;
+	unsigned long val;
+
+	while ((token = strsep(&tmp, " \t\n")) != NULL) {
+		if (*token == '\0')
+			continue;
+
+		if (kstrtoul(token, 0, &val))
+			goto inval;
+
+		switch (nfields) {
+		case 0:
+			if (val > U16_MAX)
+				goto inval;
+			req->ras_block_id = val;
+			break;
+		case 1:
+			if (val > U16_MAX)
+				goto inval;
+			req->ras_sub_block_id = val;
+			break;
+		case 2:
+			if (val > U16_MAX)
+				goto inval;
+			req->err_type = val;
+			break;
+		case 3:
+			if (val > U32_MAX)
+				goto inval;
+			req->params = val;
+			break;
+		default:
+			xe_err(xe, "sysctrl: too many ras_error_inject arguments\n");
+			return -EINVAL;
+		}
+		nfields++;
+	}
+
+	if (nfields < 3) {
+		xe_err(xe,
+		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id> <err_type> [params]\n");
+		return -EINVAL;
+	}
+
+	return 0;
+
+inval:
+	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
+	return -EINVAL;
+}
+
+static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, const char __user *ubuf,
+						 size_t len, loff_t *offp)
+{
+	char *kbuf __free(kfree) = NULL;
+	struct seq_file *m = file->private_data;
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+	struct xe_sysctrl_diag_ras_err_inj_req req = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	u8 resp_hdr_only[sizeof(u32)];
+	size_t out_len = 0;
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
+	if (copy_from_user(kbuf, ubuf, len))
+		return -EFAULT;
+	kbuf[len] = '\0';
+
+	status = sysctrl_parse_ras_error_inject(xe, kbuf, &req);
+	if (status)
+		return status;
+
+	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
+				  &req, sizeof(req), resp_hdr_only,
+				  sizeof(resp_hdr_only));
+
+	scoped_guard(mutex, &entry->lock) {
+		guard(xe_pm_runtime)(xe);
+		status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+		entry->status = status;
+	}
+
+	return status ? status : len;
+}
+
+static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+	bool fw_ready;
+
+	scoped_guard(xe_pm_runtime, xe)
+		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
+
+	guard(mutex)(&entry->lock);
+
+	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
+	seq_printf(m, "Diag firmware ready: %s\n", str_yes_no(fw_ready));
+	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAILED" : "SUCCESS");
+
+	seq_puts(m, "\nUsage:\n");
+	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id> <err_type> [params]\" > ras_error_inject\n");
+	seq_puts(m, "  cat ras_error_inject\n");
+
+	return 0;
+}
+
+static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct file *file)
+{
+	struct xe_sysctrl_debugfs_entry *entry = inode->i_private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+	bool fw_ready;
+
+	scoped_guard(xe_pm_runtime, xe)
+		fw_ready = xe_sysctrl_is_diag_fw_ready(xe);
+
+	if (!fw_ready) {
+		xe_err(xe, "sysctrl: diag firmware not ready, ras_error_inject unavailable\n");
+		return -ENODEV;
+	}
+
+	return single_open(file, xe_sysctrl_ras_error_inject_show, inode->i_private);
+}
+
+static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
+	.owner = THIS_MODULE,
+	.open = xe_sysctrl_ras_error_inject_open,
+	.read = seq_read,
+	.write = xe_sysctrl_ras_error_inject_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 static void xe_sysctrl_register_entry(struct dentry *root, struct xe_sysctrl_debugfs_entry *entry,
 				      struct xe_sysctrl *sc, const char *name,
 				      u8 group, u8 command,
@@ -173,4 +321,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
 				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
 				  &xe_sysctrl_loopback_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
+				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
+				  &xe_sysctrl_ras_error_inject_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6a8284a424c3..2554848e7484 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -14,10 +14,12 @@
  * enum xe_sysctrl_group - System Controller command groups
  *
  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
+ * @XE_SYSCTRL_GROUP_DIAG: Diag group
  * @XE_SYSCTRL_GROUP_CORE: Core group
  */
 enum xe_sysctrl_group {
 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
+	XE_SYSCTRL_GROUP_DIAG			= 0x02,
 	XE_SYSCTRL_GROUP_CORE			= 0xFF,
 };
 
@@ -55,6 +57,35 @@ enum xe_sysctrl_core_cmd {
 	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
 };
 
+/**
+ * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
+ *
+ * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection
+ */
+enum xe_sysctrl_diag_cmd {
+	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
+};
+
+/**
+ * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT request payload
+ *
+ * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The mailbox layer
+ * prepends the application message header before sending.
+ *
+ * @ras_block_id: RAS block (subsystem) to inject the error into
+ * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
+ * @err_type: Type of test error to inject
+ * @reserved: Must be zero
+ * @params: Optional injection parameters (default 0)
+ */
+struct xe_sysctrl_diag_ras_err_inj_req {
+	u16 ras_block_id;
+	u16 ras_sub_block_id;
+	u16 err_type;
+	u16 reserved;
+	u32 params;
+} __packed;
+
 /**
  * struct xe_sysctrl_app_status_req - Get application status request
  *
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 9ad3c40de97a..8ea6e1f29ddd 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -68,6 +68,9 @@ struct xe_sysctrl {
 
 		/** @debugfs.loopback: Loopback test entry */
 		struct xe_sysctrl_debugfs_entry loopback;
+
+		/** @debugfs.ras_error_inject: RAS error injection test entry */
+		struct xe_sysctrl_debugfs_entry ras_error_inject;
 	} debugfs;
 };
 
-- 
2.43.0

