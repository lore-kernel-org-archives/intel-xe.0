Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6535E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 05:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730B210E2F1;
	Thu, 12 Dec 2024 05:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqnkvMRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5545D10E2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 05:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733981444; x=1765517444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xea/4XTLHrosaL2GXBFu2gViB9QqQfpDBj/5rRtTStI=;
 b=eqnkvMRjm56ydb1d6Nspovq27R2llJvtMvwkdFqKO1TrBf83w0u35ukc
 khez02LaTiAn0Z4kP3i1+Q/M0VjBKmre/syXvYXVVR7YrRJIjxlTOWeyV
 sTjQqncMYKbFdNvML6PXa2lRG15z46vYu9MqTT/C09mUK5XMX6MqBrn2A
 f1mVBHTPea8hk6lBedW9kTy243AwORAoQjaxVzYQtGsMXtO5Ojn5Vsh7Q
 pQsY8PoLsvc8B5iseGV1Jiv2aQ0FdPyimJQyaJRrTkvSf21vR9SJUhZGu
 hbd2r5uCN3BukXQ6YXwEYgGRhI957mn8zNU4i7MtgbQwtcFsM5mQ5Y05d w==;
X-CSE-ConnectionGUID: VbMGN/KrT5+zyCtqbCZ6Hg==
X-CSE-MsgGUID: gi+BzI6ITr+4PvcQu/0yUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34519703"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34519703"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:44 -0800
X-CSE-ConnectionGUID: eT25i1eTQvq9y+2F+8rZlA==
X-CSE-MsgGUID: WbUDkJEAS4me4qzKUjSnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96333009"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:43 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, aravind.iddamsetty@intel.com
Subject: [PATCH 2/2] RFC drm/xe: Enable Boot Survivability mode
Date: Thu, 12 Dec 2024 11:19:45 +0530
Message-ID: <20241212054945.1091894-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212054945.1091894-1-riana.tauro@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
 drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 56d4ffb650da..50ed980e1db9 100644
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
@@ -585,8 +586,12 @@ int xe_device_probe_early(struct xe_device *xe)
 	update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err)
-		return err;
+	if (err) {
+		if (xe->info.platform == XE_BATTLEMAGE && xe_survivability_mode_required(xe))
+			xe_survivability_mode_init(xe);
+
+		return xe->survivability.mode ? 0 : err;
+	}
 
 	err = wait_for_lmem_ready(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7d146e3e8e21..b9dcd36de06d 100644
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
 
+	if (xe->survivability.mode)
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
+	if (!err && xe->survivability.mode)
+		return 0;
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 7e36989efd68..6c1e79b5c15f 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -176,7 +176,10 @@ bool xe_survivability_mode_required(struct xe_device *xe)
  */
 void xe_survivability_mode_remove(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
 	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
+	pci_set_drvdata(pdev, NULL);
 }
 
 /**
-- 
2.47.1

