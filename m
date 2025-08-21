Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10529CA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ACD10E39E;
	Thu, 21 Aug 2025 16:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StggOz1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B310E38A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793117; x=1787329117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=myXvhJpbecdqqD2YqxBirwGfiNYJgW21IRFdQkc9e+s=;
 b=StggOz1PQst2+t1hkWrH3VyThq0IjOAUa/bLNQj7Si0LZEzJOrQBmHRv
 D4L6jBnoQWl4CHsy/207WlXvJQurxa+pVMdo7MLpFbMId1uTJxk5xe6Cz
 LSUC6hh+DNdpsHGD6LAgiOtGZx+BKQdrB/GSwoyTIJzNtj/whQzRgfdnW
 QgNAXuxtCEdyH5dj+81dw6UwX5vXNPs8TN/N1axiM0ifVqIqWn3DCX/6R
 70nuVUpT5buA8X+1hlAvcdlYEa/X88KCJjbXM6V386iewgtyKZpDu99lo
 oqeIXn8C4Fk4OtJMUEL3GDJbz+9N8IhmrfAmkdM/5fLQcEZsDmjG/6hfs A==;
X-CSE-ConnectionGUID: +sQUOh0gSpis0ztOAIRNaQ==
X-CSE-MsgGUID: iWGf7pBCSJWmUiNebSfdZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527903"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:37 -0700
X-CSE-ConnectionGUID: MATgmHkKT2u6gmqEKBPxJg==
X-CSE-MsgGUID: osZLZjk7T623ANjMIyb9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326751"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 12/12] drm/xe/configfs: Dump custom settings when binding
Date: Thu, 21 Aug 2025 09:18:07 -0700
Message-ID: <20250821-psmi-v5-12-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
 - Fix typo and improvement xe_configfs_check_device() doc (Vinay)
---
 drivers/gpu/drm/xe/xe_configfs.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c      |  3 +++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 26c5e1b292636..29a12d02443d9 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -442,6 +442,45 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
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
+ * and print a diagnostic message if different than the default value.
+ */
+void xe_configfs_check_device(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+
+	if (!dev)
+		return;
+
+	/* memcmp here is safe as both are zero-initialized */
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
index d1590d67e649f..85841442f7d5c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -18,6 +18,7 @@
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -817,6 +818,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct xe_device *xe;
 	int err;
 
+	xe_configfs_check_device(pdev);
+
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
 		dev_info(&pdev->dev,
 			 "Your graphics device %04x is not officially supported\n"

-- 
2.50.1

