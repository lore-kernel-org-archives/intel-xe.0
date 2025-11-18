Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613B2CEBF93
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13E10E466;
	Tue, 18 Nov 2025 09:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoRzPEL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095CE10E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456783; x=1794992783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j95yVGKEJsnUWBSBu/yqYziG5neMpijYpuQG+Xdn3yI=;
 b=XoRzPEL12PFQWXdHk0nsbnaotbL+mZ4/1lKPKPBvcMslZaBOMAnPZDwJ
 HAR/WVnkQb5qBiY9vqfB+NWY5NLVHBdvdSjTfqf8FrDxIcx7t3uolIemE
 RhUZ6U2JXRB8UCWF1ZbpnphaYs2uUQ6NEFphZtVvTgCPj/QqVsBoKW7B2
 n8S73HVXcdPSisCzWefVmVWstXkoNtYi2b1uSp2YhtkN94C6a56lkUYUw
 9ars1L8zyAy+BwoQx50tNXBp7LeXxKP9DgbAUjmDuGZ23irFQhPooQlqZ
 6Xv3M7qdOJcOCrzh5bpKULTcDb2NIcZ5bPGugp64GCx1hFc82cL7YsWqN g==;
X-CSE-ConnectionGUID: 9CVuBirxS0uFECMnM+W2SQ==
X-CSE-MsgGUID: zbUm7B8+Ql+s/VmcGXPHTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83097827"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="83097827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:06:23 -0800
X-CSE-ConnectionGUID: e5Lhj5YCQ5aPW3V4G/Gh7w==
X-CSE-MsgGUID: A8bUAVqgStq2d/JE7QE9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190500901"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009.jf.intel.com with ESMTP; 18 Nov 2025 01:06:16 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 11/11] drm/xe: Add debugfs support for page reclamation
Date: Tue, 18 Nov 2025 17:05:52 +0800
Message-ID: <20251118090552.246243-12-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Allow for runtime modification to page reclamation feature through
debugfs configuration. This parameter will only take effect if the
platform supports the page reclamation feature by default.

Move xe_match_desc to common header for debugfs access to read default
device values of xe driver for current platform.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 11 +-------
 drivers/gpu/drm/xe/xe_debugfs.c  | 47 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c   | 10 +++++++
 drivers/gpu/drm/xe/xe_device.h   |  2 ++
 4 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9f6251b1008b..efc6d0690b27 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -15,6 +15,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_device.h"
 #include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
@@ -925,16 +926,6 @@ static const struct config_item_type xe_config_sriov_type = {
 	.ct_attrs	= xe_config_sriov_attrs,
 };
 
-static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
-{
-	struct device_driver *driver = driver_find("xe", &pci_bus_type);
-	struct pci_driver *drv = to_pci_driver(driver);
-	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
-	const struct pci_device_id *found = pci_match_id(ids, pdev);
-
-	return found ? (const void *)found->driver_data : NULL;
-}
-
 static struct pci_dev *get_physfn_instead(struct pci_dev *virtfn)
 {
 	struct pci_dev *physfn = pci_physfn(virtfn);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index e91da9589c5f..572c61ee1e29 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -19,6 +19,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_mmio.h"
+#include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_psmi.h"
 #include "xe_pxp_debugfs.h"
@@ -297,6 +298,49 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[8];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_reclaim_hw_assist_set(struct file *f, const char __user *ubuf,
+					  size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	const struct xe_device_desc *desc = xe_match_desc(pdev);
+	unsigned int val;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &val);
+	if (ret)
+		return ret;
+
+	/**
+	 * Don't modify if page reclamation support isn't normally
+	 * supported by the HW.
+	 */
+
+	if (!desc || !desc->has_page_reclaim_hw_assist)
+		return -ENODEV;
+
+	xe->info.has_page_reclaim_hw_assist = !!val;
+
+	return size;
+}
+
+static const struct file_operations page_reclaim_hw_assist_fops = {
+	.owner = THIS_MODULE,
+	.read = page_reclaim_hw_assist_show,
+	.write = page_reclaim_hw_assist_set,
+};
+
 static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
 					    size_t size, loff_t *pos)
 {
@@ -403,6 +447,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
+			    &page_reclaim_hw_assist_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d373c70f0f..16afddc5e35e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1295,3 +1295,13 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
 	}
 }
+
+const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
+{
+	struct device_driver *driver = driver_find("xe", &pci_bus_type);
+	struct pci_driver *drv = to_pci_driver(driver);
+	const struct pci_device_id *ids = drv ? drv->id_table : NULL;
+	const struct pci_device_id *found = pci_match_id(ids, pdev);
+
+	return found ? (const void *)found->driver_data : NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..a66e8e4b3e01 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -193,6 +193,8 @@ void xe_device_declare_wedged(struct xe_device *xe);
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
+const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev);
+
 int xe_is_injection_active(void);
 
 /*
-- 
2.51.2

