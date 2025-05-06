Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0483C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 05:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF9410E198;
	Tue,  6 May 2025 05:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izTUNyjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628910E1B5
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746510616; x=1778046616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8pfhsxS+yMN9aUdr/eMKhdiVPbc5RDu17Z7Nr8yggc=;
 b=izTUNyjfc7unhoj0vWUiJxbLbeUz3y1gn4MeYVsewxYcIdshdcURwV32
 PyqYmdPdAjfHuIVJKG7SWl35cfl0dV992rfjEpw3tvpSMGnjkwb3IPNVC
 Z9uI9/K6zLQD5DyWYSaA7Be3koEUstmQx4lgvK0qxnO1NnAU92kw0JLKF
 yHV9O+U1LxBsPWZi+pSLjtd9Q/1BX4mbrmxVIN3qYc9ivUn5K/66XJ0sm
 PFxzkCWpodbydkYzJKx+/4ic9+kjp0mupd/qb7itq0lFGoh1jGEzbWoOY
 izkW0Ll24+1mbEuKrC1CNWWuUEfQefczC5emYfyr2fl1Y3H6/p8duA/BL A==;
X-CSE-ConnectionGUID: 9yAjPudfS0iiWk21Gj0nDQ==
X-CSE-MsgGUID: dhgVkIFsRL6kN578s5wbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48029015"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48029015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 22:50:16 -0700
X-CSE-ConnectionGUID: L6e94dAeTyWIkSn/vBkYnA==
X-CSE-MsgGUID: fY5xiTNTRTiHKc4/lrrfDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136473435"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 05 May 2025 22:50:14 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_device_probe()
Date: Tue,  6 May 2025 11:18:33 +0530
Message-Id: <20250506054835.3395220-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506054835.3395220-1-raag.jadav@intel.com>
References: <20250506054835.3395220-1-raag.jadav@intel.com>
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

Since xe_device_sysfs_init() exposes device specific attributes, a better
place for it is xe_device_probe().

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  5 +++++
 drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_pm.c           |  8 +-------
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c9d3009aa03..79b7b0ecfbae 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -26,6 +26,7 @@
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
+#include "xe_device_sysfs.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
@@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_device_sysfs_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 7efbd4c52791..d4c73acea1cf 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	if (xe->d3cold.capable)
+		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 }
 
 int xe_device_sysfs_init(struct xe_device *xe)
@@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	struct device *dev = xe->drm.dev;
 	int ret;
 
-	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-	if (ret)
-		return ret;
+	if (xe->d3cold.capable) {
+		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+		if (ret)
+			return ret;
+	}
 
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 38514cef817e..693866def183 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -16,7 +16,6 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
-#include "xe_device_sysfs.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
@@ -273,6 +272,7 @@ int xe_pm_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
@@ -344,13 +344,7 @@ int xe_pm_init(struct xe_device *xe)
 	if (!xe_device_uc_enabled(xe))
 		return 0;
 
-	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
-
 	if (xe->d3cold.capable) {
-		err = xe_device_sysfs_init(xe);
-		if (err)
-			goto err_unregister;
-
 		vram_threshold = vram_threshold_value(xe);
 		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
-- 
2.34.1

