Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89FDC5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 05:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05AE10E131;
	Tue, 25 Aug 2026 05:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm9F4lMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826410E131
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 05:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787636635; x=1819172635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NckCnP6OWUrT+a8Ar5FSx/z1JUqU1muMHZoGOJ3whYU=;
 b=Cm9F4lMRD5qqIrK193gVfvpTni5yNUcnxVqqgWSskVXiJXAMwv6tVkAm
 seSaqeqLAZg+iY2kkaqCZKIAVSS+JR+Sk4jOwovwgfLUd4fNIatBd2dJH
 STIXbxcfkYA6jaNwUqPA+sHwy0zzswYFuKWpodELvh3fMtWTf/+bmgz8J
 Jb+eiIG/ivlVXPhhRVcA0uOJLhVmID2uTsU8BLzPsjgHUSy9QBtGgl2vo
 ldwXJqFNc1hICo8+X24BuP0MkVTUVwUKimN0Px+M39+a3tWUkI5d76tTe
 jg9DvaKOQp8s7NmCxcHFvOcw+gCHwcln2E7p6iO3aOv19nctqZRyIJy6M g==;
X-CSE-ConnectionGUID: 5c4qYCIUSHKmNeD2RmYUYA==
X-CSE-MsgGUID: M1/j0hbVRmivPxAXORi3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112050"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112050"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 22:43:55 -0700
X-CSE-ConnectionGUID: uVLU52bNQX+noE1BJyA8yw==
X-CSE-MsgGUID: /bmHWHGpQPGdSX2Zhu/uNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="272418233"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 22:43:50 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: dave@stgolabs.net, jic23@kernel.org, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com, djbw@kernel.org,
 iweiny@kernel.org, ming.li@zohomail.com, bhelgaas@google.com,
 rodrigo.vivi@intel.com
Cc: linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 lukas@wunner.de, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/2] drm/xe/ras: Enable SGUnit PCIe error reporting
Date: Tue, 25 Aug 2026 11:12:51 +0530
Message-ID: <20260825054312.1319951-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825054312.1319951-1-raag.jadav@intel.com>
References: <20260825054312.1319951-1-raag.jadav@intel.com>
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
programming of error reporting bits in DevCtl register of it's config
space for upstream error propagation. Hack it.

While at it, add native AER sanity check for upstream port before
programming SGUnit register.

This is as per pci_enable_pcie_error_reporting() logic implemented
in PCIe AER driver.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index de4cb9ef7355..c4b5c0b5eb0d 100644
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
+MODULE_IMPORT_NS("AER");
 
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
-- 
2.43.0

