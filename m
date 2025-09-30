Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A787CCAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764710E2E5;
	Tue, 30 Sep 2025 23:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELsOZvZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2683210E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275339; x=1790811339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkoeaGe65kuXtwiq+jXUFwjTYYRER1nhQYPFZESnzSU=;
 b=ELsOZvZtxfcxE3TqwaYFBMbFbhpL9+2l4eR2tzOo+rAlxajRgzheoRgW
 EA/fpwD9PaZrjr8f97zkIsQsuBYepISUQA/scjgokCpTW00U4vn4hZJlw
 mwMn+m+2zac28+wGeK3zRHBhnVaZx1J3zYWkBnkTXse4U+jwsWROZPCUI
 NYUQkk98HOOhVbaBODMLPsBARuE8gxFkSQC1tE51y9YPE7mFFA54HHcEs
 LijFHHv1psiBH4hFzHY1OnhP00kZmDl0oQocFw9RdSUYUkqO2lWGoRArL
 V+uGZZ/NQGxBQyDSEFpcbkpFfrGzzFyJo1sdZ5D1W0srUhBMG4nM8gP4Y Q==;
X-CSE-ConnectionGUID: YOyk+MZxQfe9x3Xqvg2PDA==
X-CSE-MsgGUID: c1CBXkv2QMyZPrZrYSNSrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646731"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646731"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:39 -0700
X-CSE-ConnectionGUID: E/9vb/JSSMqLcfRcB41ckg==
X-CSE-MsgGUID: jDui4XvtRuioZX+6EpjYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775510"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/6] drm/xe/pf: Expose VF control operations over debugfs
Date: Wed,  1 Oct 2025 01:35:21 +0200
Message-ID: <20250930233525.201263-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

To allow the user to control the activity of individual VFs,
expose basic VF control operations (pause, resume, stop, reset)
over the debugfs as write-only files:

  /sys/kernel/debug/dri/BDF/sriov/
  ├── vf1
  │   ├── pause
  │   ├── reset
  │   ├── resume
  │   ├── stop
  │   :
  ├── vf2
  :   :

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 2ab0b1f4818a..97636ed86fb8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -8,13 +8,41 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_pm.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile_sriov_pf_debugfs.h"
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov		# d_inode->i_private = (xe_device*)
+ *      │   ├── pf		# d_inode->i_private = (xe_device*)
+ *      │   ├── vf1		# d_inode->i_private = VFID(1)
+ *      :   :
+ *      │   ├── vfN		# d_inode->i_private = VFID(N)
+ */
+
+static void *extract_priv(struct dentry *d)
+{
+	return d->d_inode->i_private;
+}
+
+static struct xe_device *extract_xe(struct dentry *d)
+{
+	return extract_priv(d->d_parent);
+}
+
+static unsigned int extract_vfid(struct dentry *d)
+{
+	void *p = extract_priv(d);
+
+	return p == extract_xe(d) ? PFID : (uintptr_t)p;
+}
+
 static int simple_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
@@ -39,6 +67,70 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
 	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
 }
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      │   ├── vf1
+ *      │   │   ├── pause
+ *      │   │   ├── reset
+ *      │   │   ├── resume
+ *      │   │   ├── stop
+ *      │   │   :
+ *      │   ├── vf2
+ *      │   │   ├── ...
+ */
+
+static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
+					  size_t count, loff_t *ppos,
+					  int (*call)(struct xe_device *, unsigned int))
+{
+	struct dentry *dent = file_dentry(file)->d_parent;
+	struct xe_device *xe = extract_xe(dent);
+	unsigned int vfid = extract_vfid(dent);
+	bool yes;
+	int ret;
+
+	if (*ppos)
+		return -EINVAL;
+	ret = kstrtobool_from_user(userbuf, count, &yes);
+	if (ret < 0)
+		return ret;
+	if (yes) {
+		xe_pm_runtime_get(xe);
+		ret = call(xe, vfid);
+		xe_pm_runtime_put(xe);
+	}
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+#define DEFINE_VF_CONTROL_ATTRIBUTE(OP)						\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return 0;								\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_control_##OP);		\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
+DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
+DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
+
+static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
+{
+	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
+	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
+	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
+	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
+}
+
 static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
 {
 	struct xe_tile *tile;
@@ -103,6 +195,7 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
 			return;
 		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
 
+		pf_populate_vf(xe, vfdent);
 		pf_populate_with_tiles(xe, vfdent, VFID(n));
 	}
 }
-- 
2.47.1

