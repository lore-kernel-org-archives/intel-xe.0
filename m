Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3129C02190
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 07:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3EE10E4A4;
	Mon, 27 Jan 2025 07:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfxol3lQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159910E49C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737964015; x=1769500015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tiu3B/8UsXup1pdSXvLL8tB37HLI1XLEmUkZBdxF0c8=;
 b=bfxol3lQocG0y2iKyCnq7Hozy8AjfxchOCYBTRvcu/h4VuQYcCtxoy2S
 JhGZaQDExrKFY2Ak2ipL9MlRk9R5MkjHZeBagh6LD+65889AjyL3lwSTQ
 fhPYg+4+5Kny4WY2zePjrcc0ZawBSvqiiN9R5CgV5edxp02/N0coizo9b
 u0oE71V88tV546ZSiRVH/CKVe4vULRAHeJUO2TjzGjJfi5sqDYOeoMMPQ
 PJyCV26B/IHrOZF6p5vVXT7nlhk0s1l2n3BFFNE15RdPiwNq0j7WWsj4m
 /t+Z7JUBkSybLYnIpvOmVj6nQFeAA1l+y2Z44EnXdKVGTiq38PVyr9ejU Q==;
X-CSE-ConnectionGUID: 13G8oJDgSFSonmzUwTA47Q==
X-CSE-MsgGUID: Nrh/vrLjQa+/UmXpWH5Few==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="37669027"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="37669027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:46:55 -0800
X-CSE-ConnectionGUID: q1qSoSR0Qk6uGO5mkVXArQ==
X-CSE-MsgGUID: +m/hHsMAQ0+49SABR5q5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113504316"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:46:53 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [PATCH v5 2/3] drm/xe: Enable Boot Survivability mode
Date: Mon, 27 Jan 2025 13:37:15 +0530
Message-ID: <20250127080716.643697-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127080716.643697-1-riana.tauro@intel.com>
References: <20250127080716.643697-1-riana.tauro@intel.com>
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

v3: return -EBUSY during system suspend (Anshuman)
    check survivability mode in pci probe only
    on error

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  7 ++++++-
 drivers/gpu/drm/xe/xe_pci.c                | 23 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_survivability_mode.c | 16 +++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
 4 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bd6191e1ed3e..0a938bd0e34d 100644
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
@@ -692,8 +693,12 @@ int xe_device_probe_early(struct xe_device *xe)
 	update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err)
+	if (err) {
+		if (xe_survivability_mode_required(xe))
+			xe_survivability_mode_init(xe);
+
 		return err;
+	}
 
 	err = wait_for_lmem_ready(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e6ad189294c1..b483c5c90132 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -30,6 +30,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
+#include "xe_survivability_mode.h"
 #include "xe_tile.h"
 
 enum toggle_d3cold {
@@ -766,6 +767,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
+	if (xe_survivability_mode_enabled(xe))
+		return xe_survivability_mode_remove(xe);
+
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
 	pci_set_drvdata(pdev, NULL);
@@ -838,8 +842,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe_early(xe);
-	if (err)
+
+	/*
+	 * In Boot Survivability mode, no drm card is exposed
+	 * and driver is loaded with bare minimum to allow
+	 * for firmware to be flashed through mei. Return
+	 * success if survivability mode is enabled.
+	 */
+	if (err) {
+		if (xe_survivability_mode_enabled(xe))
+			return 0;
+
 		return err;
+	}
 
 	err = xe_info_init(xe, desc->graphics, desc->media);
 	if (err)
@@ -926,9 +941,13 @@ static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
 static int xe_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
-	err = xe_pm_suspend(pdev_to_xe_device(pdev));
+	if (xe_survivability_mode_enabled(xe))
+		return -EBUSY;
+
+	err = xe_pm_suspend(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 9911e9f6b99b..633f5effa349 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -144,6 +144,19 @@ static void enable_survivability_mode(struct pci_dev *pdev)
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
  * xe_survivability_mode_required - checks if survivability mode is required
  * @xe: xe device instance
@@ -158,6 +171,9 @@ bool xe_survivability_mode_required(struct xe_device *xe)
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	u32 data;
 
+	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE)
+		return false;
+
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
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

