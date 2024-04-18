Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E16C05023
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 20:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB26F113FC3;
	Thu, 18 Apr 2024 20:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9dZQdrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C3710F5EF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 20:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713472500; x=1745008500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=engle99vXs9jc12ToF0D/ToZb5pfMJ7YB1MnAxygcMI=;
 b=T9dZQdrQMIXoQ+goe8AV4T6KMuLlH3B63yozwj7S2XHdTS6DyMeD8u0c
 B71Eg00Iv5HlZlC7BoTuA6Hk+c1Qk5pOuPDIfaimDnN8Ky7NHt02W0jRn
 3uOZtySesJ3aQQgOWADd45NW8dCpGUUMiIS3EByga3a3FIZ3D6Rkd4VVX
 FC7nzcFP/Ne+f8lXolLPp8rr11lJhIbFwW9UxossoPyOWCjAI1ZNoEDR6
 da6eQE14lBIGF1wHvNdn5wfq0In4AYwMqCkjyS91Tuu5x7s6sq/Oh3HTZ
 jSWDE71Y/uChdVIC+Leb+f40ZW863991k/OnswHJvZ84cLyAFO2fzNXxE w==;
X-CSE-ConnectionGUID: kYb0dLUwRZ6GKvr0rir8tg==
X-CSE-MsgGUID: Lfy8R/FJQ9uqbWVTxkD24A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11992057"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="11992057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:35:00 -0700
X-CSE-ConnectionGUID: BJxPxDFpQG2c9PtK5+Fsaw==
X-CSE-MsgGUID: b88uk3W6TFqcrY8g3BXiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="22969858"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:34:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Expose SR-IOV VF control commands over debugfs
Date: Thu, 18 Apr 2024 22:34:41 +0200
Message-Id: <20240418203442.226-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418203442.226-1-michal.wajdeczko@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
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

We already have functions to control the VF.
Allow to control the VF using debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 79 +++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 32ce98698690..8909bb950a8b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -14,6 +14,7 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_pm.h"
@@ -153,6 +154,83 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &preempt_timeout_fops);
 }
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── control { stop, pause, resume }
+ */
+
+static const struct {
+	const char *cmd;
+	int (*fn)(struct xe_gt *gt, unsigned int vfid);
+} control_cmds[] = {
+	{ "stop", xe_gt_sriov_pf_control_stop_vf },
+	{ "pause", xe_gt_sriov_pf_control_pause_vf },
+	{ "resume", xe_gt_sriov_pf_control_resume_vf },
+};
+
+static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int vfid = extract_vfid(parent);
+	int ret = -EINVAL;
+	char cmd[32];
+	size_t n;
+
+	xe_gt_assert(gt, vfid);
+	xe_gt_sriov_pf_assert_vfid(gt, vfid);
+
+	if (*pos)
+		return -ESPIPE;
+
+	if (count > sizeof(cmd) - 1)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(cmd, sizeof(cmd) - 1, pos, buf, count);
+	if (ret < 0)
+		return ret;
+	cmd[ret] = '\0';
+
+	for (n = 0; n < ARRAY_SIZE(control_cmds); n++) {
+		xe_gt_assert(gt, sizeof(cmd) > strlen(control_cmds[n].cmd));
+
+		if (sysfs_streq(cmd, control_cmds[n].cmd)) {
+			xe_pm_runtime_get(xe);
+			ret = control_cmds[n].fn ? (*control_cmds[n].fn)(gt, vfid) : 0;
+			xe_pm_runtime_put(xe);
+			break;
+		}
+	}
+
+	return (ret < 0) ? ret : count;
+}
+
+static ssize_t control_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	char help[128];
+	size_t n;
+
+	help[0] = '\0';
+	for (n = 0; n < ARRAY_SIZE(control_cmds); n++) {
+		strlcat(help, control_cmds[n].cmd, sizeof(help));
+		strlcat(help, "\n", sizeof(help));
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, help, strlen(help));
+}
+
+static const struct file_operations control_ops = {
+	.owner		= THIS_MODULE,
+	.open		= simple_open,
+	.write		= control_write,
+	.read		= control_read,
+	.llseek		= default_llseek,
+};
+
 /**
  * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
  * @gt: the &xe_gt to register
@@ -199,5 +277,6 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 		vfdentry->d_inode->i_private = (void *)(uintptr_t)n;
 
 		pf_add_config_attrs(gt, vfdentry, VFID(n));
+		debugfs_create_file("control", 0600, vfdentry, NULL, &control_ops);
 	}
 }
-- 
2.43.0

