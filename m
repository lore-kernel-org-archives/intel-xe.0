Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA1C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 17:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3B210EA43;
	Thu,  3 Apr 2025 17:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYcHPsd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8CA10EA3F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702502; x=1775238502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mTEJh0kTpQJWUScgnyjrNuhu3QrCUnDx98NTJwOdu3E=;
 b=IYcHPsd6KXd/jjVayaR1NJuroyl59T+ZSygc1AImgks0bvlmOzLzHiuA
 OvTvwQqRxBUu9+3wlpXGxA/kREwgATTDeppjC4BjT5Izw78J86l5li6bC
 L2EQCIjxqUqOH1rsShdo5oktl58Ns42fk4KOKomdzMRsuen0PMmmaNE6Q
 VEQZIKJd/lg4ZRXpdfq7+s4tMwdIu1CfHaNNhakZGi2RN7HxNWjfLiVZI
 qs4eHh5zqq2YHbsUw4smIv7eMZSNl/cWnUuN5MFqWUG+xx7fgVrzgY1ZI
 v4Mg3Xl6f4sdtEPLssFD9WrLXynad0t6YR7WY7oo2gSQlytKzN5qUO1sd Q==;
X-CSE-ConnectionGUID: kPiixMndQH2VA1X8E8fAkA==
X-CSE-MsgGUID: t0Dwny1mQ6GJjVCwV78IPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758437"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758437"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:22 -0700
X-CSE-ConnectionGUID: mhgyR/icTfCKQQZ4kvordg==
X-CSE-MsgGUID: EBdVPwM9RrmnFYdnn8APkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132201577"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 10:48:20 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to xe_pci_probe()
Date: Thu,  3 Apr 2025 23:17:40 +0530
Message-Id: <20250403174742.1294227-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403174742.1294227-1-raag.jadav@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
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

Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
non-PM attributes as well.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
 drivers/gpu/drm/xe/xe_pm.c           |  5 -----
 3 files changed, 13 insertions(+), 9 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 58347fa91841..246682b2a2be 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -18,6 +18,7 @@
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
+#include "xe_device_sysfs.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
@@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_driver_cleanup;
 
+	/* We have PM related attributes, so do it after xe_pm_init(). */
+	err = xe_device_sysfs_init(xe);
+	if (err)
+		return err;
+
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b6b754ad6eb..6af1de78dae8 100644
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
@@ -306,10 +305,6 @@ int xe_pm_init(struct xe_device *xe)
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
-		err = xe_device_sysfs_init(xe);
-		if (err)
-			return err;
-
 		vram_threshold = vram_threshold_value(xe);
 		err = xe_pm_set_vram_threshold(xe, vram_threshold);
 		if (err)
-- 
2.34.1

