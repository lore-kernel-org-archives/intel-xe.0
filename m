Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E9C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 13:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7E10E278;
	Tue, 23 Apr 2024 13:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez92Xfbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23D10E4C1
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 13:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713877985; x=1745413985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amzfV+8TldBwqBRlvcb0EQSGdOWTM5LRFQO05CixzCc=;
 b=ez92XfbedQBwhkIeEOajd7UyPxd8kEE54LYVE5QjrjltzV9Te5YPdr9k
 b4ed/Lb92j5sjEQna0ZOG1bMHOehPi0ezGwaT4LrXKlgqntaCwEuJnQ/u
 JMzyysIG9lamKU5wpG7qNzRT5UtM5AG3Ajz12hfwIKzLLj+9M9G0TcGhS
 idoSyvF1J5R04zdVo+MfLk3p6yHFMDGQp1rS3Z4EqkRHSf9CkkRzq4U6P
 LLQUCBmUyyjxpGb+0CtieCJpt8VTJMs75LNIrDYSoVgk+S8MybM9prm4F
 hBSoFlDOKG0+GT9iMpZmPa9vIioyWcQ0NgCcFuuHmO3dlsf/IBDLGgPTK w==;
X-CSE-ConnectionGUID: 5l/IVSYzT9ewiHBsS4wCXQ==
X-CSE-MsgGUID: tILXAeSyQPijWk06zpoLWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20070874"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20070874"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:13:02 -0700
X-CSE-ConnectionGUID: ztQ2jiQzRHaU5somihNpAQ==
X-CSE-MsgGUID: IytMBmpXQxy3lFiwIvhZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55321552"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 06:13:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pf: Expose SR-IOV VF control commands over
 debugfs
Date: Tue, 23 Apr 2024 15:12:43 +0200
Message-Id: <20240423131244.2045-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240423131244.2045-1-michal.wajdeczko@intel.com>
References: <20240423131244.2045-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

