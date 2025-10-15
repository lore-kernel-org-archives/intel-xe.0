Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3F3CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 09:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF18F10E3AB;
	Wed, 15 Oct 2025 09:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nia/439y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B3C10E107
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760519576; x=1792055576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8k+wBPQEa5YXShwxcqpKB/KYUKrxOhDeCO5lF1ZIMw4=;
 b=nia/439ywbhzWpyQaKnJjVD23jhBPv9JtSWR4MmrgVKJShNpGduv8opF
 WyzO2NJUKDL+qL96U9/OgwfU7n8StRBZwvoioguP5oPjUd6kdxRu4W7Ed
 1Mu4PBKBRLzjdyduXk3DZFD+WzaychVKtda1L6zav9xobihDv+p9ABadU
 Gk2pzXSwBALf77yE8E+coRds3clQDLX+rz/t6ZWM00LBFGw3Nd0zB8+R5
 4T4P97OjelY4RikP+RjcUpf3NaUaCWFes3YIWxxwoPwscIQ0TiFZioas3
 K4hMtALq1QDKrRN40CYRBSucJqldpW7VCk+Fx5D+YcaOVF4kKj/bLol+q w==;
X-CSE-ConnectionGUID: Dffi5AGXSG60FohCKDU/OQ==
X-CSE-MsgGUID: j8+w8sL0RBOKYYZp4zyFsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66515812"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66515812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:56 -0700
X-CSE-ConnectionGUID: BbbPMoeSTG+3z9CxTj7dBQ==
X-CSE-MsgGUID: ZVJ2lHp8TuGy+p6O1xzvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="213065723"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 02:12:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe/pf: Promote VFs provisioning helpers
Date: Wed, 15 Oct 2025 11:12:06 +0200
Message-ID: <20251015091211.592-2-michal.wajdeczko@intel.com>
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

As we plan to add more VFs provisioning methods, start moving
related code into single place.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c          | 45 ++----------
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 83 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h | 14 ++++
 4 files changed, 102 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 84321fad3265..edae0c2a6e2f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
 	xe_sriov_pf_debugfs.o \
+	xe_sriov_pf_provision.o \
 	xe_sriov_pf_service.o \
 	xe_tile_sriov_pf_debugfs.o
 
diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 9c1c9e669b04..735f51effc7a 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -19,46 +19,9 @@
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_provision.h"
 #include "xe_sriov_printk.h"
 
-static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
-{
-	unsigned int n;
-
-	for (n = 1; n <= num_vfs; n++)
-		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
-			return false;
-
-	return true;
-}
-
-static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-	int result = 0, err;
-
-	for_each_gt(gt, xe, id) {
-		if (!pf_needs_provisioning(gt, num_vfs))
-			continue;
-		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
-		result = result ?: err;
-	}
-
-	return result;
-}
-
-static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-	unsigned int n;
-
-	for_each_gt(gt, xe, id)
-		for (n = 1; n <= num_vfs; n++)
-			xe_gt_sriov_pf_config_release(gt, n, true);
-}
-
 static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	unsigned int n;
@@ -168,7 +131,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	 */
 	xe_pm_runtime_get_noresume(xe);
 
-	err = pf_provision_vfs(xe, num_vfs);
+	err = xe_sriov_pf_provision_vfs(xe, num_vfs);
 	if (err < 0)
 		goto failed;
 
@@ -192,7 +155,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
-	pf_unprovision_vfs(xe, num_vfs);
+	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
@@ -218,7 +181,7 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pf_reset_vfs(xe, num_vfs);
 
-	pf_unprovision_vfs(xe, num_vfs);
+	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 
 	/* not needed anymore - see pf_enable_vfs() */
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
new file mode 100644
index 000000000000..c24803312231
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_gt_sriov_pf_config.h"
+#include "xe_sriov.h"
+#include "xe_sriov_pf_helpers.h"
+#include "xe_sriov_pf_provision.h"
+
+static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
+{
+	unsigned int n;
+
+	for (n = 1; n <= num_vfs; n++)
+		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
+			return false;
+
+	return true;
+}
+
+static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		if (!pf_needs_provisioning(gt, num_vfs))
+			continue;
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
+/**
+ * xe_sriov_pf_provision_vfs() - Provision VFs in auto-mode.
+ * @xe: the PF &xe_device
+ * @num_vfs: the number of VFs to auto-provision
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	return pf_provision_vfs(xe, num_vfs);
+}
+
+/**
+ * xe_sriov_pf_unprovision_vfs() - Unprovision VFs in auto-mode.
+ * @xe: the PF &xe_device
+ * @num_vfs: the number of VFs to unprovision
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
+	pf_unprovision_vfs(xe, num_vfs);
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
new file mode 100644
index 000000000000..f6a902190ad7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_PF_PROVISION_H_
+#define _XE_SRIOV_PF_PROVISION_H_
+
+struct xe_device;
+
+int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
+int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
+
+#endif
-- 
2.47.1

