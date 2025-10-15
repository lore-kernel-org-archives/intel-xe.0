Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DADCCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045DD10E766;
	Wed, 15 Oct 2025 09:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYfkWCcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614BE10E763
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519581; x=1792055581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aF9m65EKEtKlxYwaV1vcrPlOJ3Ecevb8mW04yYcHZ5w=;
 b=CYfkWCcF0Mncyjg69HqceG5157p8cwvGVYK2baK1RjBhfYNjfoT0dMkk
 Ti+u2Z1aC8iU2k3GrFR7H1kLGr4WcbQpPFJkiheyXSMjUROsQm/bpjiBr
 7DHxSCvq1UUiDRmzBwU1uovP1O/nM50EsMk1+1d3IiEANm8opjrN/nGBf
 gHX+v2cZ08d/XRoCIIE7HPaHS/wtkdxEP9r1Bq6IwZCzpq741zEkCvAg4
 K9ya0KXdplCPqvEd8CJQVwpD26VFuMER/4AiM/g4ZEDdl0IFpXQKtoqhP
 xNZQdgwbfYEYuHyNEaDFh4waDrMKzbGOJx0Hqh6mea8k5pPMkIES4IZ/5 A==;
X-CSE-ConnectionGUID: ZmrVmQ8IRsKPB/TW7jDuEg==
X-CSE-MsgGUID: EAiOc8FjTpmriPDxkL3ogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66515816"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66515816"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:13:01 -0700
X-CSE-ConnectionGUID: SNScPIAVTD2BSRSt9d8WlQ==
X-CSE-MsgGUID: ETIX/nObR7mThodF0xbJIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="213065746"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe/pf: Allow to restore auto-provisioning mode
Date: Wed, 15 Oct 2025 11:12:09 +0200
Message-ID: <20251015091211.592-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015091211.592-1-michal.wajdeczko@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

After doing tweaks to the VFs provisioning we may want to restore
back the auto-provisioning mode. Allow that unless VFs are still
enabled. This can be also used to release all VFs resources.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c   | 63 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h   | 11 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 18 +++++++
 3 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
index 97636ed86fb8..a81aa05c5532 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
@@ -13,6 +13,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile_sriov_pf_debugfs.h"
@@ -43,6 +44,66 @@ static unsigned int extract_vfid(struct dentry *d)
 	return p == extract_xe(d) ? PFID : (uintptr_t)p;
 }
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      │   ├── restore_auto_provisioning
+ *      │   :
+ *      │   ├── pf/
+ *      │   ├── vf1
+ *      │   │   ├── ...
+ */
+
+static ssize_t from_file_write_to_xe_call(struct file *file, const char __user *userbuf,
+					  size_t count, loff_t *ppos,
+					  int (*call)(struct xe_device *))
+{
+	struct dentry *dent = file_dentry(file);
+	struct xe_device *xe = extract_xe(dent);
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
+		ret = call(xe);
+		xe_pm_runtime_put(xe);
+	}
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+#define DEFINE_SRIOV_ATTRIBUTE(OP)						\
+static int OP##_show(struct seq_file *s, void *unused)				\
+{										\
+	return 0;								\
+}										\
+static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
+			  size_t count, loff_t *ppos)				\
+{										\
+	return from_file_write_to_xe_call(file, userbuf, count, ppos,		\
+					  xe_sriov_pf_##OP);			\
+}										\
+DEFINE_SHOW_STORE_ATTRIBUTE(OP)
+
+static inline int xe_sriov_pf_restore_auto_provisioning(struct xe_device *xe)
+{
+	return xe_sriov_pf_provision_set_mode(xe, XE_SRIOV_PROVISIONING_MODE_AUTO);
+}
+
+DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
+
+static void pf_populate_root(struct xe_device *xe, struct dentry *dent)
+{
+	debugfs_create_file("restore_auto_provisioning", 0200, dent, xe,
+			    &restore_auto_provisioning_fops);
+}
+
 static int simple_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
@@ -167,6 +228,8 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
 		return;
 	dent->d_inode->i_private = xe;
 
+	pf_populate_root(xe, dent);
+
 	/*
 	 *      /sys/kernel/debug/dri/BDF/
 	 *      ├── sriov		# d_inode->i_private = (xe_device*)
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
index dd1df950b021..4a4340fb633a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
@@ -37,6 +37,17 @@ static inline int xe_sriov_pf_get_totalvfs(struct xe_device *xe)
 	return xe->sriov.pf.driver_max_vfs;
 }
 
+/**
+ * xe_sriov_pf_num_vfs() - Number of enabled VFs on the PF.
+ * @xe: the PF &xe_device
+ *
+ * Return: Number of enabled VFs on the PF.
+ */
+static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
+{
+	return pci_num_vf(to_pci_dev(xe->drm.dev));
+}
+
 static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 7e74175db972..32c281c1dc5d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -70,6 +70,11 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_config_release(gt, n, true);
 }
 
+static void pf_unprovision_all_vfs(struct xe_device *xe)
+{
+	pf_unprovision_vfs(xe, xe_sriov_pf_get_totalvfs(xe));
+}
+
 /**
  * xe_sriov_pf_provision_vfs() - Provision VFs in auto-mode.
  * @xe: the PF &xe_device
@@ -117,6 +122,10 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
  * When changing from AUTO to CUSTOM mode, any already allocated VFs resources
  * will remain allocated and will not be released upon VFs disabling.
  *
+ * When changing back to AUTO mode, if VFs are not enabled, already allocated
+ * VFs resources will be immediately released. If VFs are still enabled, such
+ * mode change is rejected.
+ *
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -128,6 +137,15 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
 	if (mode == xe->sriov.pf.provision.mode)
 		return 0;
 
+	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
+		if (xe_sriov_pf_num_vfs(xe)) {
+			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
+				     mode_to_string(mode));
+			return -EBUSY;
+		}
+		pf_unprovision_all_vfs(xe);
+	}
+
 	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
 		     mode_to_string(xe->sriov.pf.provision.mode),
 		     mode_to_string(mode), __builtin_return_address(0));
-- 
2.47.1

