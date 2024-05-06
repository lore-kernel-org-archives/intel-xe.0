Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F0C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 18:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5C10F4C8;
	Mon,  6 May 2024 18:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyzDLP8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8646112305
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715020899; x=1746556899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMnHr/FwNyfpR4r+Vml0AHBfEgX7bsRG/gWNyYa9U5g=;
 b=lyzDLP8ooZNzMCdmO102I4FZizqE7fIBLWO/7tj7dcxSKWjVcgxjSJCE
 lkffwEJVvObVRSrlAFrJNwE5rqX1wGNX8kJLrvel7blVGH0FF/cKq97F8
 QWgAyb84943gJ/lYql0EygL6jh8IcBe/yF8Pxe2zKQuUMSzpEvXGUkgXp
 ylaylBJZUda0mztzUiq9pttcGYmhkn7yh0sM9rrPi0GXu2kYcTMMLQM0X
 25+LSIGdrwD5epwNks3ocUzMRAnOd8qeLJmC9o4YyPlC1EpQHWw4ldDvS
 J1eF3+3HDHVyLXnYJuABdeTnVi/cWH9nw0iBK0ZZhUwu5i4vB9mWpq/DG w==;
X-CSE-ConnectionGUID: jPWZ/QEWTw+Tvr40W4WHsQ==
X-CSE-MsgGUID: Nozf2sKIR5u31y64SOdRew==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22187858"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="22187858"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:41:38 -0700
X-CSE-ConnectionGUID: ScImRGanSkWb96zxzOPxuw==
X-CSE-MsgGUID: Z9Y1HBgJSQ+6EY2ReZMHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="33048315"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:41:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/pf: Implement pci_driver.sriov_configure callback
Date: Mon,  6 May 2024 20:41:21 +0200
Message-Id: <20240506184121.2615-1-michal.wajdeczko@intel.com>
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
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #v2
---
v2: check result of VFs provisioning (Piotr)
    use xe_sriov_pf_get_totalvfs consistently (Piotr)
    prefer VFID instead of plain a VF number (Piotr)
v3: improve comment why PF takes extra RPM ref (Badal)
    use _noresume variant for extra RPM ref (Rodrigo)
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   4 +
 drivers/gpu/drm/xe/xe_pci_sriov.c | 143 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h |  13 +++
 4 files changed, 161 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_sriov.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b620389761d5..38da5a575deb 100644
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
index 912b59fe9567..353ec44592c3 100644
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
@@ -959,6 +960,9 @@ static struct pci_driver xe_pci_driver = {
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
index 000000000000..06d0fceb5114
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -0,0 +1,143 @@
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
+		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
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
+static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int total_vfs = xe_sriov_pf_get_totalvfs(xe);
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs > 0);
+	xe_assert(xe, num_vfs <= total_vfs);
+	xe_sriov_dbg(xe, "enabling %u VF%s\n", num_vfs, str_plural(num_vfs));
+
+	/*
+	 * We must hold additional reference to the runtime PM to keep PF in D0
+	 * during VFs lifetime, as our VFs do not implement the PM capability.
+	 *
+	 * With PF being in D0 state, all VFs will also behave as in D0 state.
+	 * This will also keep GuC alive with all VFs' configurations.
+	 *
+	 * We will release this additional PM reference in pf_disable_vfs().
+	 */
+	xe_pm_runtime_get_noresume(xe);
+
+	err = pf_provision_vfs(xe, num_vfs);
+	if (err < 0)
+		goto failed;
+
+	err = pci_enable_sriov(pdev, num_vfs);
+	if (err < 0)
+		goto failed;
+
+	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
+		      num_vfs, total_vfs, str_plural(total_vfs));
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
+	if (num_vfs > xe_sriov_pf_get_totalvfs(xe))
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

