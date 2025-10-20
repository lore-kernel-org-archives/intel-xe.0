Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CECBCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B955E10E4B2;
	Mon, 20 Oct 2025 18:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IE+5lq3A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBFF10E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984695; x=1792520695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NJWo8di0tdd49KqvgmkLWQHIVN0JWW/kQ5D2Yi3CaE=;
 b=IE+5lq3Aio2tq1XBmRoPcsrSj+YNVHSiMzXLFP4GBXfD6Z+nHnRyKyr2
 cNciwmzuKhhZNoy28LefihEsTM3TKjwPODfMSfeHpNBFCwUlTaRGGs1z8
 KfBZupRd8rS4rPrbfdpBF848zg0Uf6EhynP5SOMU64gbsBgow/0zF34He
 m0hgmpxMLViFtlHVmlpSdjVaIpySTTLT0DpGYzaVrfk957rdhDn639NIh
 YBQ+o6iWSqFBpV6UBfSHalSgfXx2OBTg0Evt3ctcKRJpz69CvaXZSAIcr
 HIP88X1yQWlShZ76EPB1rEFI2PE/DOXx6mHxmZfDwLK7arwKsmxXfYeN4 A==;
X-CSE-ConnectionGUID: VEjVOcKXT2K6J3PagR2KHg==
X-CSE-MsgGUID: GZ8SZTz4TaOXH3sOMQ52EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013084"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:55 -0700
X-CSE-ConnectionGUID: 9zWZxKoqT82Oz8f5gO4Exw==
X-CSE-MsgGUID: mouHMmvhToCIl1X09Z4WfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802171"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 12/14] drm/xe/pf: Add sysfs device symlinks to enabled VFs
Date: Mon, 20 Oct 2025 20:24:12 +0200
Message-ID: <20251020182414.576-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

For convenience, for every enabled VF add 'device' symlink from
our SR-IOV admin VF folder to enabled sysfs PCI VF device entry.
Remove all those links when disabling PCI VFs.

For completeness, add static 'device' symlink for the PF itself.

  /sys/bus/pci/drivers/xe/BDF/sriov_admin/
  ├── pf
  │   └── device -> ../../../BDF	# PF BDF
  ├── vf1
  │   └── device -> ../../../BDF'	# VF1 BDF
  ├── vf2
  │   └── device -> ../../../BDF"	# VF2 BDF

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c      |  5 ++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 93 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h |  3 +
 3 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 678e76703cd8..fb2fd1d9066d 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -20,6 +20,7 @@
 #include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
+#include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
 
 static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
@@ -138,6 +139,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
 
+	xe_sriov_pf_sysfs_link_vfs(xe, num_vfs);
+
 	pf_engine_activity_stats(xe, num_vfs, true);
 
 	return num_vfs;
@@ -165,6 +168,8 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pf_engine_activity_stats(xe, num_vfs, false);
 
+	xe_sriov_pf_sysfs_unlink_vfs(xe, num_vfs);
+
 	pci_disable_sriov(pdev);
 
 	pf_reset_vfs(xe, num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index a6be3c88fa4f..c68acf6cd34f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_pci_sriov.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -43,12 +44,14 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     │   └── sched_priority
  *     ├── pf/
  *     │   ├── ...
+ *     │   ├── device -> ../../../BDF
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
  *     │       └── sched_priority
  *     ├── vf1/
  *     │   ├── ...
+ *     │   ├── device -> ../../../BDF.1
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
@@ -422,6 +425,11 @@ static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
 	return err;
 }
 
+static void pf_sysfs_note(struct xe_device *xe, int err, const char *what)
+{
+	xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
+}
+
 static void action_put_kobject(void *arg)
 {
 	struct kobject *kobj = arg;
@@ -488,6 +496,29 @@ static int pf_setup_tree(struct xe_device *xe)
 	return 0;
 }
 
+static void action_rm_device_link(void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_link(kobj, "device");
+}
+
+static int pf_link_pf_device(struct xe_device *xe)
+{
+	struct kobject *kobj = xe->sriov.pf.vfs[PFID].kobj;
+	int err;
+
+	err = sysfs_create_link(kobj, &xe->drm.dev->kobj, "device");
+	if (err)
+		return pf_sysfs_error(xe, err, "PF device link");
+
+	err = devm_add_action_or_reset(xe->drm.dev, action_rm_device_link, kobj);
+	if (err)
+		return pf_sysfs_error(xe, err, "PF unlink action");
+
+	return 0;
+}
+
 /**
  * xe_sriov_pf_sysfs_init() - Setup PF's SR-IOV sysfs tree.
  * @xe: the PF &xe_device to setup sysfs
@@ -509,5 +540,67 @@ int xe_sriov_pf_sysfs_init(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = pf_link_pf_device(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
+
+/**
+ * xe_sriov_pf_sysfs_link_vfs() - Add VF's links in SR-IOV sysfs tree.
+ * @xe: the &xe_device where to update sysfs
+ * @num_vfs: number of enabled VFs to link
+ *
+ * This function is specific for the PF driver.
+ *
+ * This function will add symbolic links between VFs represented in the SR-IOV
+ * sysfs tree maintained by the PF and enabled VF PCI devices.
+ *
+ * The @xe_sriov_pf_sysfs_unlink_vfs() shall be used to remove those links.
+ */
+void xe_sriov_pf_sysfs_link_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	unsigned int totalvfs = xe_sriov_pf_get_totalvfs(xe);
+	struct pci_dev *pf_pdev = to_pci_dev(xe->drm.dev);
+	struct pci_dev *vf_pdev = NULL;
+	unsigned int n;
+	int err;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs <= totalvfs);
+
+	for (n = 1; n <= num_vfs; n++) {
+		vf_pdev = xe_pci_sriov_get_vf_pdev(pf_pdev, VFID(n));
+		if (!vf_pdev)
+			return pf_sysfs_note(xe, -ENOENT, "VF link");
+
+		err = sysfs_create_link(xe->sriov.pf.vfs[VFID(n)].kobj,
+					&vf_pdev->dev.kobj, "device");
+
+		/* must balance xe_pci_sriov_get_vf_pdev() */
+		pci_dev_put(vf_pdev);
+
+		if (err)
+			return pf_sysfs_note(xe, err, "VF link");
+	}
+}
+
+/**
+ * xe_sriov_pf_sysfs_unlink_vfs() - Remove VF's links from SR-IOV sysfs tree.
+ * @xe: the &xe_device where to update sysfs
+ * @num_vfs: number of VFs to unlink
+ *
+ * This function shall be called only on the PF.
+ * This function will remove "device" links added by @xe_sriov_sysfs_link_vfs().
+ */
+void xe_sriov_pf_sysfs_unlink_vfs(struct xe_device *xe, unsigned int num_vfs)
+{
+	unsigned int n;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
+
+	for (n = 1; n <= num_vfs; n++)
+		sysfs_remove_link(xe->sriov.pf.vfs[VFID(n)].kobj, "device");
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
index 1e6698cc29d3..ae92ed1766e7 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
@@ -10,4 +10,7 @@ struct xe_device;
 
 int xe_sriov_pf_sysfs_init(struct xe_device *xe);
 
+void xe_sriov_pf_sysfs_link_vfs(struct xe_device *xe, unsigned int num_vfs);
+void xe_sriov_pf_sysfs_unlink_vfs(struct xe_device *xe, unsigned int num_vfs);
+
 #endif
-- 
2.47.1

