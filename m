Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA7C5ACAB
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 14:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9110E429;
	Fri,  7 Aug 2026 14:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NU++PDUA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D33910E424
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786114604; x=1817650604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrZoikK7YTNmkuTyFjn0R3lAWapf3u80g65qq96/EK0=;
 b=NU++PDUAVWJtTy18+vCT2oVESDrzivS0ly1n8Bfip+g7rnT0/e933KQM
 wf5QMRtB90Z6TfCkfl/1fy6yUw/agv+AMgE02wXscvqd/XznERxKMZCcZ
 hNeP4qahGFsD5t2/Kq0Jwd8jzncHPF/ymdM4mjpKXtKBax/KKYj5WOQj6
 w8vWIIuIYmHjzXIkuZrLE7ATg/oMJKW08SjmhugCrQGVAWKYkHUDxrX80
 TTI+l+AXmH+ekdhfie7PII1nnNbOFu0DHdqJwa5T2iXuVvVIfUnwR7D53
 qL1F3vmNwvcFUUYWZgUkFdqrzcgd6RwO8p7bpaNRirGSYJblICUng4+wr w==;
X-CSE-ConnectionGUID: otaU9O2iQ8eRHFlgCJUiBw==
X-CSE-MsgGUID: fkFS/WXmQ1u8tOQ/aO0/xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90604302"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90604302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:43 -0700
X-CSE-ConnectionGUID: tEZ4SFKuSSKiOGHU1lO7HQ==
X-CSE-MsgGUID: j2hN5goZS8SvISUWTbs/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258116263"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 07:56:39 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Date: Fri,  7 Aug 2026 07:56:25 -0700
Message-ID: <20260807145621.2938848-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
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
boot and initialization (late-bind loaded); writes are rejected with
-ENODEV until xe_sysctrl_is_diag_fw_ready() reports the diag firmware
as ready.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 123 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
 3 files changed, 157 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 2144d9d43fba..7b8846d739cb 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/uaccess.h>
 
 #include "xe_device.h"
@@ -122,6 +123,124 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
 	.release = single_release,
 };
 
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
+	unsigned int nfields = 0;
+	char *token, *tmp;
+	unsigned long val;
+	size_t out_len = 0;
+
+	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
+		xe_err(xe, "sysctrl: diag firmware not ready, cannot inject RAS error\n");
+		return -ENODEV;
+	}
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
+	tmp = kbuf;
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
+			req.ras_block_id = val;
+			break;
+		case 1:
+			if (val > U16_MAX)
+				goto inval;
+			req.ras_sub_block_id = val;
+			break;
+		case 2:
+			if (val > U16_MAX)
+				goto inval;
+			req.err_type = val;
+			break;
+		case 3:
+			if (val > U32_MAX)
+				goto inval;
+			req.params = val;
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
+	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
+				  &req, sizeof(req), resp_hdr_only,
+				  sizeof(resp_hdr_only));
+
+	guard(xe_pm_runtime)(xe);
+	entry->status = xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
+
+	return entry->status ? entry->status : len;
+
+inval:
+	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
+	return -EINVAL;
+}
+
+static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+
+	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry->group, entry->command);
+	seq_printf(m, "Diag firmware ready: %s\n",
+		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));
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
@@ -154,4 +273,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
 				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
 				  &xe_sysctrl_loopback_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
+				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
+				  &xe_sysctrl_ras_error_inject_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index ed80fe63e1c4..43ae0049b316 100644
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
 
@@ -51,6 +53,35 @@ enum xe_sysctrl_core_cmd {
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
index 53d82e61383a..3a97a10d1b7d 100644
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

