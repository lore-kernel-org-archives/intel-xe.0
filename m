Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83014C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE2110E979;
	Fri,  8 Aug 2025 17:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9o8wGMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4D10E971
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G6DW5IYmJofj982xa+zwvgXTp9JCSP4CamNavqTDQGY=;
 b=B9o8wGMk/hHVoRgT3Gq+jJpKIVSvs16HU9Pw6PEA8SLyAKJR6L8c4vj7
 fHwfYo5g/F53v0mdTg6arnwdy7KVVRFD9JsbueU9ygQDwtK/t3WQCTu2y
 bSt+h70Hb88+S8u6S/qynV5uHI4fphg65sh+khZNjfVxypNfJ6TAL9Sbi
 IPn1wlRg3ssRhBIYEB3vkLuBf5mL8lO8GU/tUharILM/QA4eJvWhb+xzY
 6T+ukcI9ee9ADcL/PwIsGeLP2851UBUV9k/g/0vUqPu3DT+IZPBOmN4U7
 NBz5EYm4DfkbKGKIVVmriPW5rl0REt0SnftlM3ch4ic6lb6ZWdVXdSb65 w==;
X-CSE-ConnectionGUID: 8qSLr6aVRN2W4uXc5sOKkQ==
X-CSE-MsgGUID: itAzlHzDRHyrEkM5llqUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109829"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: Ks0cRNiVSmO+PL3lBOXccQ==
X-CSE-MsgGUID: nSzhdc3ETHW3oEcCHDW4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387434"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 13/13] drm/xe/configfs: Dump custom settings when binding
Date: Fri,  8 Aug 2025 10:29:56 -0700
Message-ID: <20250808-psmi-v3-13-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Device configuration using configfs could be prepared long time prior
the driver load. Currently all the xe configfs entries are for things
that are important to have in the log if a non-default value is being
used. Add a info-level message about that with the individual entries
that are different than the default.

Based on previous patch by Michal Wajdeczko.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c      |  3 +++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 3b9d24c0bb588..9a283b713ff9d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -480,6 +480,45 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
 	return to_xe_config_group_device(item);
 }
 
+static void dump_custom_dev_config(struct pci_dev *pdev,
+				   struct xe_config_group_device *dev)
+{
+#define PRI_CUSTOM_ATTR(fmt_, attr_) do { \
+		if (dev->config.attr_ != device_defaults.attr_) \
+			pci_info(pdev, "configfs: " __stringify(attr_) " = " fmt_ "\n", \
+				 dev->config.attr_); \
+	} while (0)
+
+	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", survivability_mode);
+
+#undef PRI_CUSTOM_ATTR
+}
+
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
+	/* memcmp here is safe as both as zero-initialized */
+	if (memcmp(&dev->config, &device_defaults, sizeof(dev->config))) {
+		pci_info(pdev, "Found custom settings in configfs\n");
+		dump_custom_dev_config(pdev, dev);
+	}
+
+	config_group_put(&dev->group);
+}
+
 /**
  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 603dd7796c8b2..58c8c31640008 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -13,6 +13,7 @@ struct pci_dev;
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
+void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
@@ -20,6 +21,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
+static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 52d46c66ae1eb..9ce6e6dca5bc7 100644
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
2.50.1

