Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2776C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B594610E61E;
	Tue, 29 Jul 2025 11:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFFyRquS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111710E611
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789362; x=1785325362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fhj4FbF3zUBpHtvNsYmKDuE18GtQZWgGfxM/RDskXTk=;
 b=cFFyRquS/x2mMdc3TjPyOIky5jTBLtBbhaSn1Ua8BoKk6bxCXDw1qcqW
 7I4e7YX1uBQYTcdmpXp1XoaQbmm2Pih2+QMZoQHP5Ewin2zeQzRy3h0gX
 mpx3Am8BGIks6oXBqvIc1OVu6LvsLRGUAyriVMKJV6OI5WimoGHsvPDL6
 bMCiCL1wdss6ZpYzCKF8j7aV4hdd9hgfNj+wJzJLEy69vKzRjz/uZ/7Ha
 uKzl/Eg9c/tHxD1+cbaruzO4gSyFL3gCL03SogmBR0rPvUIyFZUzDGi4H
 f/TeMfcoWSCed7aEAapicQySX4SAvRe7p6cdXSUG4NCuYiD5OsNDCHzaB A==;
X-CSE-ConnectionGUID: pMR6gVc6QCuOtWMIK1BX7g==
X-CSE-MsgGUID: LWXTRZP7SEi6qAn4NRRKrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755595"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:42 -0700
X-CSE-ConnectionGUID: lmyztv3vRXyQbK2lw4MhNw==
X-CSE-MsgGUID: zIGe2TxSS8quQRZC38bTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946960"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 09/11] drm/xe/configfs: Check if device was preconfigured
Date: Tue, 29 Jul 2025 13:42:13 +0200
Message-ID: <20250729114215.177586-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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

Since device configuration using configfs could be prepared long
time prior the driver load, add a debug log whether the current
device driver probe is using custom or default settings.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
v2: make function void, rename helpers (Lucas) and rebased
---
 drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c      |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 150e7f2becc8..5f145ccdf535 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -107,6 +107,11 @@ static void set_device_defaults(struct xe_config_device *config)
 	*config = device_defaults;
 }
 
+static bool config_device_is_default(const struct xe_config_device *config)
+{
+	return !memcmp(config, &device_defaults, sizeof(*config));
+}
+
 struct engine_info {
 	const char *cls;
 	u64 mask;
@@ -339,6 +344,26 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
 	return to_xe_config_group_device(item);
 }
 
+/**
+ * xe_configfs_check_device() - Test if device was configured by configfs
+ * @pdev: the &pci_dev device to test
+ *
+ * Try to find the configfs group that belongs to the specified pci device
+ * and print a diagnostic message if found.
+ */
+void xe_configfs_check_device(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+
+	if (!dev)
+		return;
+
+	pci_dbg(pdev, "found %s settings in configfs\n",
+		config_device_is_default(&dev->config) ? "default" : "custom");
+
+	config_group_put(&dev->group);
+}
+
 /**
  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb8764008089..fa4ea7f0c375 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -13,12 +13,14 @@ struct pci_dev;
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
+void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
+static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 52d46c66ae1e..9ce6e6dca5bc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct xe_device *xe;
 	int err;
 
+	xe_configfs_check_device(pdev);
+
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
 		dev_info(&pdev->dev,
 			 "Your graphics device %04x is not officially supported\n"
-- 
2.47.1

