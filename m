Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CFDE7719A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87A10E83F;
	Wed,  8 Jan 2025 10:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtRJRsKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C87010E83F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736331618; x=1767867618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QqtvZzJSkvUKCeGF0MxBAt+Lb474jyYtRodPevhAdWA=;
 b=LtRJRsKkhtICSPRo9TymHVQ8sYlG3ZtATZTANMpK6vhODpwGKzBp1AQz
 NQTBF8s+somup6ldI8lFXwfhpnS3wndDGglotUosmQpP2K6ob6vzjyYbu
 Dk+/3GZJMlwXvjKpFQU2jzLgtg/jY2ucZRPmeMviTlf9qqvGcDQRL9j47
 0HwgvV6XiGY/0IeIGpZ3Rllh8dRZU1GdOYjrkGt5/cvBNDLgOezL19CXM
 mZRMSojXCoWdYLd3aCpLGk10v7EhFfk1TlvmV8sM+waMok3nWRx+wuirZ
 XDdqrAwGKCl7VNU2UFj3Dl1KT02S9JcilyZwVAENwh/B2WW5Byw5K1y3T w==;
X-CSE-ConnectionGUID: WexFuhabSpuNZp7II6k4AQ==
X-CSE-MsgGUID: b5Q387dmQUKKlB/fLkNReA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59014981"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="59014981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:17 -0800
X-CSE-ConnectionGUID: Q0ClkNcxQG2GIzbhsdiDSw==
X-CSE-MsgGUID: /Joa7P17SAebwc848EHzuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133950065"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:14 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 matthew.d.roper@intel.com, alexander.usyskin@intel.com
Subject: [PATCH v2 2/3] drm/xe: Enable Boot Survivability mode
Date: Wed,  8 Jan 2025 16:09:58 +0530
Message-ID: <20250108103959.1219312-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108103959.1219312-1-riana.tauro@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
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

Enable boot survivability mode if pcode initialization fails and
if boot status indicates a failure. In this mode, drm card is not
exposed and driver probe returns success after loading the bare minimum
to allow firmware to be flashed via mei.

v2: abstract survivability mode variable
    add BMG check inside function (Jani, Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
 drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bf36e4fb4679..6a4d76533555 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -51,6 +51,7 @@
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_sriov.h"
+#include "xe_survivability_mode.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -587,8 +588,12 @@ int xe_device_probe_early(struct xe_device *xe)
 	update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err)
-		return err;
+	if (err) {
+		if (xe_survivability_mode_required(xe))
+			xe_survivability_mode_init(xe);
+
+		return xe_survivability_mode_enabled(xe) ? 0 : err;
+	}
 
 	err = wait_for_lmem_ready(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7d146e3e8e21..f2637d8a71eb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -30,6 +30,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_survivability_mode.h"
 #include "xe_tile.h"
 
 enum toggle_d3cold {
@@ -768,6 +769,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
+	if (xe_survivability_mode_enabled(xe))
+		return xe_survivability_mode_remove(xe);
+
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
 	pci_set_drvdata(pdev, NULL);
@@ -840,6 +844,15 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe_early(xe);
+
+	/*
+	 * In Boot Survivability mode, no drm card is exposed
+	 * and driver is loaded with bare minimum to allow
+	 * for firmware to be flashed through mei
+	 */
+	if (!err && xe_survivability_mode_enabled(xe))
+		return 0;
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 077422ae009d..4a978c7018c9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -154,6 +154,19 @@ static void enable_survivability_mode(struct xe_device *xe)
 	}
 }
 
+/**
+ * xe_survivability_mode_enabled - check if survivability mode is enabled
+ * @xe: xe device instance
+ *
+ * Returns true if in survivability mode, false otherwise
+ */
+bool xe_survivability_mode_enabled(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+
+	return survivability->mode;
+}
+
 /**
  * xe_survivability_mode_required- checks if survivability mode is required
  * @xe: xe device instance
@@ -168,6 +181,9 @@ bool xe_survivability_mode_required(struct xe_device *xe)
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	u32 data;
 
+	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
+		return false;
+
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index 410e3ee5f5d1..f530507a22c6 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -12,6 +12,7 @@ struct xe_device;
 
 void xe_survivability_mode_init(struct xe_device *xe);
 void xe_survivability_mode_remove(struct xe_device *xe);
+bool xe_survivability_mode_enabled(struct xe_device *xe);
 bool xe_survivability_mode_required(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
-- 
2.47.1

