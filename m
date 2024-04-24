Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB43C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 21:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE49113DE2;
	Wed, 24 Apr 2024 21:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR222s+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45442113DE2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713993705; x=1745529705;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHjlnL20kuYBRuXYZHPXFe8ClLHytGySL34A/davbwI=;
 b=DR222s+ZR+OOjm8zElKWDsD4Wm2acLNGs/Q+s+fJOaHZHo32JVdxnqe5
 UMzC4P8NudB1u94hfw3RO42hneW40zArr27nws8ZYsiRDH4bts4+HG5iu
 I+x/zsSRxTveyFEACRHH+6qTJ5U8Xp6SELiJgRQDpsusMqJ8FOI8b8XPn
 h/GAyk4mQkcfd9GpaFW7zMQlasV7mVXWpDjLbE+iZ1ExT6CAu1dTn0d5W
 +H0NjGftSj15erIjm0LFHwdHbgwMHOz5muFOvcOfb941SB9VRyVHdZg20
 qbRvxDR5NAcfuL6BaLCLpRAf6ojnUxgPXOxcjYgsNJhkavLnC943PGyy/ A==;
X-CSE-ConnectionGUID: DAlBnZXeTimiGHYYCctilw==
X-CSE-MsgGUID: DkTY/VAyT06eQwbLMLjWlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13485642"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="13485642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:21:45 -0700
X-CSE-ConnectionGUID: 0k3kcsC+QSSBgWfgGOacIg==
X-CSE-MsgGUID: ZFepWm/JQPe04spXnrlGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="29303543"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.46.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:21:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/pf: Implement pci_driver.sriov_configure callback
Date: Wed, 24 Apr 2024 23:21:01 +0200
Message-Id: <20240424212101.2221-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The PCI subsystem already exposes the "sriov_numvfs" attribute
that users can use to enable or disable SR-IOV VFs. Add custom
implementation of the .sriov_configure callback defined by the
pci_driver to perform additional steps, including fair VFs
provisioning with the resources, as required by our platforms.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   4 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 137 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
 4 files changed, 155 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a67977edff5b..6acde66f0827 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -169,6 +169,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
+	xe_pci_sriov.o \
 	xe_sriov_pf.o
 
 # include helpers for tests even when XE is built-in
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a0cf5dd803c2..f3efde939df4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -23,6 +23,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -952,6 +953,9 @@ static struct pci_driver xe_pci_driver = {
 	.probe = xe_pci_probe,
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
+#ifdef CONFIG_PCI_IOV
+	.sriov_configure = xe_pci_sriov_configure,
+#endif
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
new file mode 100644
index 000000000000..b4f312ebef80
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_config.h"
+#include "xe_pci_sriov.h"
+#include "xe_pm.h"
+#include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_printk.h"
+
+static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0, err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_config_set_fair(gt, 1, num_vfs);
+		result = result ?: err;
+	}
+
+	return result;
+}
+
+static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	unsigned int n;
+
+	for_each_gt(gt, xe, id)
+		for (n = 1; n <= num_vfs; n++)
+			xe_gt_sriov_pf_config_release(gt, n, true);
+}
+
+static int pf_enable_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
+	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
+
+	/*
+	 * hold additional reference to the runtime PM as long as VFs are
+	 * enabled to keep GuC alive - will be released in pf_disable_vfs()
+	 */
+	xe_pm_runtime_get(xe);
+
+	err = pf_provision_vfs(xe, num_vfs);
+
+	err = pci_enable_sriov(pdev, num_vfs);
+	if (err < 0)
+		goto failed;
+
+	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
+		      num_vfs, pci_sriov_get_totalvfs(pdev),
+		      str_plural(pci_sriov_get_totalvfs(pdev)));
+	return num_vfs;
+
+failed:
+	pf_unprovision_vfs(xe, num_vfs);
+	xe_pm_runtime_put(xe);
+
+	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
+			num_vfs, str_plural(num_vfs), ERR_PTR(err));
+	return err;
+}
+
+static int pf_disable_vfs(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u16 num_vfs = pci_num_vf(pdev);
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_sriov_dbg(xe, "disabling %u VF%s\n", num_vfs, str_plural(num_vfs));
+
+	if (!num_vfs)
+		return 0;
+
+	pci_disable_sriov(pdev);
+
+	pf_unprovision_vfs(xe, num_vfs);
+
+	/* not needed anymore - see pf_enable_vfs() */
+	xe_pm_runtime_put(xe);
+
+	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
+	return 0;
+}
+
+/**
+ * xe_pci_sriov_configure - Configure SR-IOV (enable/disable VFs).
+ * @pdev: the &pci_dev
+ * @num_vfs: number of VFs to enable or zero to disable all VFs
+ *
+ * This is the Xe implementation of struct pci_driver.sriov_configure callback.
+ *
+ * This callback will be called by the PCI subsystem to enable or disable SR-IOV
+ * Virtual Functions (VFs) as requested by the used via the PCI sysfs interface.
+ *
+ * Return: number of configured VFs or a negative error code on failure.
+ */
+int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
+
+	if (!IS_SRIOV_PF(xe))
+		return -ENODEV;
+
+	if (num_vfs < 0)
+		return -EINVAL;
+
+	if (num_vfs > pci_sriov_get_totalvfs(pdev))
+		return -ERANGE;
+
+	if (num_vfs && pci_num_vf(pdev))
+		return -EBUSY;
+
+	xe_pm_runtime_get(xe);
+	if (num_vfs > 0)
+		ret = pf_enable_vfs(xe, num_vfs);
+	else
+		ret = pf_disable_vfs(xe);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.h b/drivers/gpu/drm/xe/xe_pci_sriov.h
new file mode 100644
index 000000000000..3b8bfbf7e1d9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_PCI_SRIOV_H_
+#define _XE_PCI_SRIOV_H_
+
+struct pci_dev;
+
+int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs);
+
+#endif
-- 
2.43.0

