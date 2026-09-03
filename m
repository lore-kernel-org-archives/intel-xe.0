Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618D4C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A2010F5EE;
	Thu,  3 Sep 2026 14:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hljhwb1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482BF10F5EE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788444239; x=1819980239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8YPMRKGe/MRFTRM4/IX/fk5X9OSNurHzLtWgdpdvk28=;
 b=Hljhwb1cP8kP9Vu48gecx+kiMt+mNGJRIPvH1RFa4M1pQXCAzFkETcz1
 E36T5HqXuYWy36L51WTE6y9sxOAXxBDg1JrReZx3J9gw6LwR8mjy8ICAY
 VjJdvdlY0518SCmAkuSPUXfdlVpq6ioGRtjvr2trtruEFkE4y7jAgWPx5
 xMuZsWuEitHZOpGPBj997topmNN+qniNbZIxDXQ/2aO/Za0+wrYajDGVl
 S8AbMQx3RHhkavGQoED2bVBGJw5mWiTO/IO2ByQ3dqEw9N98cHIFLFplo
 gXlnRUZ5IwiRI5HdtHjx3cRU2bpMYsTgCa0uHr9JfImx4gnqA0pXQTHsm Q==;
X-CSE-ConnectionGUID: eB8zGIDvS+OSpjDmaTOvYw==
X-CSE-MsgGUID: xugeB8TjSmSRHWu6Y7q+Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87865988"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="87865988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:57 -0700
X-CSE-ConnectionGUID: 8Hwhe6TrRf6j+b2VKC8zyQ==
X-CSE-MsgGUID: Ghf93hWvQeCY8zG+xnWVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267150190"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:03:54 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v4 3/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
Date: Thu,  3 Sep 2026 07:03:43 -0700
Message-ID: <20260903140340.83500-9-anoop.c.vijay@intel.com>
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
v4 (Rodrigo, Anshuman):
- Gated ras_error_inject on diag firmware readiness in .open()
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 126 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 2144d9d43fba..258479d605cb 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/uaccess.h>
 
 #include "xe_device.h"
@@ -122,6 +123,127 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
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
+	struct xe_sysctrl_debugfs_entry *entry = inode->i_private;
+	struct xe_device *xe = sc_to_xe(entry->sc);
+
+	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
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
@@ -154,4 +276,8 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc, "loopback",
 				  XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_LOOPBACK,
 				  &xe_sysctrl_loopback_fops);
+
+	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc, "ras_error_inject",
+				  XE_SYSCTRL_GROUP_DIAG, XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
+				  &xe_sysctrl_ras_error_inject_fops);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 04c9fcf5aa8a..99fa6d86b974 100644
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
index 3c8bde2380b1..595be477f750 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -65,6 +65,9 @@ struct xe_sysctrl {
 
 		/** @debugfs.loopback: Loopback test entry */
 		struct xe_sysctrl_debugfs_entry loopback;
+
+		/** @debugfs.ras_error_inject: RAS error injection test entry */
+		struct xe_sysctrl_debugfs_entry ras_error_inject;
 	} debugfs;
 };
 
-- 
2.43.0

