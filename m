Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B84E81A2B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB510E13F;
	Mon, 16 Feb 2026 14:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9f2kfB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9924910E13F
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771253573; x=1802789573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYvo3qbhBcTi+QJiQS1OkDLXQH9XRRzSGmJoR8rFBKY=;
 b=V9f2kfB5GCL7femGnOFzWIYC8EuKRBEw1oVlV3zCUr18CFVsZSmVBxOW
 dB0fkyms3tDz+9fbO+I1RuuczQBNvPBPo8ocEUu1ZeXnNnSXLhQ2RAw0b
 vIodA5Nu4Co1tWV0DLSjsZuhuwiXRNRgHTnp8lfg7DWoP0mxAGNfcED4N
 0pG8f50y8/753kAKo1F1kPH0LetcpmkmFOJdN+3dkfUYNtYuOFy+wdO22
 Z2O/y2oyySha3Jq1R+Q1TFU0r+X/eh3m1twyim4R8Wa1rpRMjgKqPSfwj
 h0yq5oD9kSz2Wn2LHQa53KQQnc8pCUZdE6nNvx4q1w/B8VPSNLcFC+Jpu A==;
X-CSE-ConnectionGUID: abIbrLLVSa6ZTwggTL85sw==
X-CSE-MsgGUID: JzCX+pQOTTOY1rpvKOS9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82663125"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="82663125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:52:53 -0800
X-CSE-ConnectionGUID: QXFgqGnHSYe5D/2czVjqCw==
X-CSE-MsgGUID: uC5FFD4qS4+V5M6bM7F7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="211961502"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:52:50 -0800
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com
Subject: [PATCH v2 4/4] drm/xe/sysctrl: Add RAS error injection interface
Date: Mon, 16 Feb 2026 06:52:36 -0800
Message-ID: <20260216145232.3942399-10-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
References: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
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

