Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBDFE7BDBD
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 13:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8FA10E39C;
	Mon, 16 Feb 2026 13:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5nZBOZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB17C10E046
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771249699; x=1802785699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYvo3qbhBcTi+QJiQS1OkDLXQH9XRRzSGmJoR8rFBKY=;
 b=j5nZBOZB4jJuN2eG3+6vPvo2SFwQLZU0/NOemTuKJ3c0pdWBQHDH0KRQ
 3UNK7cO3IfjsuwsV8Zj6vldDm7UENzqLdD7RRsVyiwN7s8uVlsl7DkEJL
 r17XPrXlO4cfq8o+pEP+MJVHLCA5nqbj+bh/3+kEXLpxtHOupC6YcZ63w
 e4eYn2Ba76fOmhn4wMKY4URrXuj6DujexURJBL8yYk5rKW8hvc7zx4Ybr
 bvLneG+GFgj1pxOD4iodp2WqHsitsGjCuFkUPYLNgUGNCXhFv6OEfvmqq
 N80pZGhpe47YZpXPyK0iDDI0rgSnsSKezQW3SGom4zDY+lm6MZDJNu9Sa g==;
X-CSE-ConnectionGUID: 5qEkmZmvQdiXTYkt+m6kyA==
X-CSE-MsgGUID: g76fI9nIQIiIDhl4/78VcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72398344"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72398344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:19 -0800
X-CSE-ConnectionGUID: 36WvTnHsQv+78cv7wWXwPQ==
X-CSE-MsgGUID: rfNU6fAQRVyS8ceoKpjwLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218147965"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:48:15 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v1 4/4] drm/xe/sysctrl: Add RAS error injection interface
Date: Mon, 16 Feb 2026 05:48:01 -0800
Message-ID: <20260216134757.3891177-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
References: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
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

Add debugfs interface for RAS error injection testing.
This allows validation of error detection and recovery paths.

Command details:
- Group ID: 0x02 (Diag group)
- Command ID: 0xFC (error injection)
- Usage: echo "0x01 0x02 0x03" > /sys/kernel/debug/dri/0/sc/ras_error_inject
         cat /sys/kernel/debug/dri/0/sc/ras_error_inject

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h |  3 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
index 28e46695c900..d6ffd8a8185f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
@@ -136,6 +136,38 @@ static ssize_t xe_sysctrl_cmd_write(struct xe_sysctrl_debugfs_entry *entry,
 	return len;
 }
 
+static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *data)
+{
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+
+	seq_puts(m, "System Controller RAS Error Injection\n");
+	seq_puts(m, "======================================\n");
+	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n",
+		   entry->group, entry->command);
+	seq_printf(m, "Status: %d (%s)\n",
+		   entry->status, entry->status ? "FAILED" : "SUCCESS");
+	seq_puts(m, "\nUsage:\n");
+	seq_puts(m, "  echo \"<ras block> <sub block> <Injection Type> [params]>\" > ras_error_inject\n");
+	seq_puts(m, "  cat ras_error_inject  # Check injection status\n");
+
+	return 0;
+}
+
+static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file,
+						 const char __user *ubuf,
+						 size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	struct xe_sysctrl_debugfs_entry *entry = m->private;
+
+	return xe_sysctrl_cmd_write(entry, ubuf, len);
+}
+
+static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, xe_sysctrl_ras_error_inject_show, inode->i_private);
+}
+
 static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
 {
 	struct xe_sysctrl_debugfs_entry *entry = m->private;
@@ -186,6 +218,15 @@ static const struct file_operations xe_sysctrl_loopback_fops = {
 	.release = single_release,
 };
 
+static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
+	.owner = THIS_MODULE,
+	.open = xe_sysctrl_ras_error_inject_open,
+	.read = seq_read,
+	.write = xe_sysctrl_ras_error_inject_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 static void xe_sysctrl_register_cmd(struct dentry *root,
 				    struct xe_sysctrl_debugfs_entry *entry,
 				    struct xe_sysctrl *sc,
@@ -235,6 +276,17 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 		.mode = 0644,
 	};
 
+	static const struct xe_sysctrl_cmd_desc ras_error_inject_desc = {
+		.name = "ras_error_inject",
+		.group = XE_SYSCTRL_GROUP_DIAG,
+		.command = XE_SYSCTRL_RAS_ERROR_INJECT_CMD,
+		.resp_len_type = XE_SYSCTRL_RESP_LEN_NONE,
+		.fixed_resp_len = 0,
+		.user_resp_len = 0,
+		.fops = &xe_sysctrl_ras_error_inject_fops,
+		.mode = 0644,
+	};
+
 	root = debugfs_create_dir("sc", parent);
 	if (IS_ERR(root))
 		return;
@@ -246,4 +298,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
 
 	xe_sysctrl_register_cmd(root, &sc->debugfs.loopback_inv, sc,
 				&loopback_inv_desc);
+
+	xe_sysctrl_register_cmd(root, &sc->debugfs.ras_error_inject, sc,
+				&ras_error_inject_desc);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
index 26bd8c62b916..374aa73b180a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
@@ -14,10 +14,13 @@ struct dentry;
 struct xe_sysctrl;
 
 #define XE_SYSCTRL_GROUP_CORE		0xFF
+#define XE_SYSCTRL_GROUP_DIAG		0x02
 
 #define XE_SYSCTRL_LOOPBACK_CMD		0x01
 #define XE_SYSCTRL_LOOPBACK_INV_CMD	0x03
 
+#define XE_SYSCTRL_RAS_ERROR_INJECT_CMD	0xFC
+
 struct xe_sysctrl_cmd_desc {
 	/** @name: Command name for debugfs file */
 	const char *name;
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 30d8b34dee47..46e68ea3a32f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -91,6 +91,9 @@ struct xe_sysctrl {
 
 		/** @loopback_inv: Loopback test entry (inverted) */
 		struct xe_sysctrl_debugfs_entry loopback_inv;
+
+		/** @ras_error_inject: RAS error injection entry */
+		struct xe_sysctrl_debugfs_entry ras_error_inject;
 	} debugfs;
 };
 
-- 
2.43.0

