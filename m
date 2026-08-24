Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D738C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272E10E161;
	Mon, 24 Aug 2026 16:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="En5F9AIe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DE410E161
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787590156; x=1819126156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=95/ZHbDg8Y23wpMDyzSwOPPR/qMURX7Gwv6BTcvKyFE=;
 b=En5F9AIe1WRAECvP61y3juC/lwUpm8lGqJCWJea0EFybHs96AKmdlG7l
 cypE+HnaSN4jJF9apN4hg0YTierWyzA+h4DMkj39Q3j3DC1S5KFvx2Iah
 IT9xU2KqC0nYRQ8AvbnJ3yXdeKRt2VMWB1/r+68STvngACaI6sBO5HZtM
 lwNuF+3imsqj0zCZBkwlgW3NZ+0hP8iOidH718Z8LYsod/gR1Gwy3bkvo
 V3pJV0rUjkMlZUzaeOeIeTcb9aHtm9/sVka2EJEv6xHn4+JNnNcas21Wl
 2TK3LHIAEXsvFCW8whuyZ9XLbLIsKaSNGNQ0BCdbGIdZSNNDZCeSmb6/8 Q==;
X-CSE-ConnectionGUID: CSeSJae1RJ6nCHHcSSkbyg==
X-CSE-MsgGUID: y8M7lH17SUCdfP+bm7Fy/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91919261"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="91919261"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:49:15 -0700
X-CSE-ConnectionGUID: ebWf7wzlQ9SEn3FCJJHdSw==
X-CSE-MsgGUID: S573/65GSHWLfHvB20URuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="260908852"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 24 Aug 2026 09:49:13 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, lukas@wunner.de,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Enable SGUnit PCIe error reporting
Date: Mon, 24 Aug 2026 22:18:50 +0530
Message-ID: <20260824164850.607937-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

SGUnit as a PCI endpoint is not AER capable and requires explicit
programming of error reporting registers in it's config space for
upstream error propagation. Hack it.

While at it, add native AER sanity check for upstream port before
programming SGUnit registers.

This is as per pci_enable_pcie_error_reporting() logic implemented
as part of PCIe AER driver.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index de4cb9ef7355..42eef98bed9c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,8 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/aer.h>
+
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -234,6 +236,9 @@ static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 	return pci_upstream_bridge(vsp);
 }
 
+#define PCI_EXP_AER_FLAGS	(PCI_EXP_DEVCTL_CERE | PCI_EXP_DEVCTL_NFERE | \
+				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
+
 static void ras_usp_aer_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -251,6 +256,14 @@ static void ras_usp_aer_init(struct xe_device *xe)
 		return;
 	}
 
+	if (!pcie_aer_is_native(usp)) {
+		dev_warn(&usp->dev, "No native AER support\n");
+		return;
+	}
+
+	pcie_capability_set_word(pdev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+	pci_save_state(pdev);
+
 	/*
 	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
 	 * Status Register.
@@ -279,6 +292,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
 	pci_save_state(usp);
 	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
 }
+MODULE_IMPORT_NS("CXL");
 
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
-- 
2.43.0

