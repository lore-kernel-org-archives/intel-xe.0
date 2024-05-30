Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1223C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537E011B39D;
	Thu, 30 May 2024 13:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvY5iQRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78D8113C14
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076140; x=1748612140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7yNPXTrfLSEKuKI365NDSbaxnHJ/XlMcph2+dX/vYZo=;
 b=dvY5iQRFyRAMlTfmdlEXVJ134mLIrNzqlqy4tLZHFv0lPRcK0DRMOPiT
 RRU14ayjtRS8C68Rhfg7gZDNnYpQ2AFbxqyKzNI9+e5H50l9qjSVHHR1v
 4ag8nlEeilWD9ww/FgaYIchQ64WP6lTXdtNfaM4sr0pFFk0QANFm7HSGX
 reEj9sRQc65IEX4w8NKBAvxvrEi388ScEeAH5eqbqDfCU2n6O1/6RfDaO
 DIqdR5vRtQoAxZysovSueLvFuNTN+T0WDcB0cHFRZoXumZ/f5fOORLmpb
 8QZ1oProu9YlaI3Tw0nGsnDTR2NRRBLiLeoPshipeTbun97Miejmd/cLb g==;
X-CSE-ConnectionGUID: bTQa7+pXTXGbgqAab+yIPw==
X-CSE-MsgGUID: dwnTS8ZDRI+VoqQ1nDRy/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681350"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:40 -0700
X-CSE-ConnectionGUID: vjBIkA1sTOClUZEzxtEEjQ==
X-CSE-MsgGUID: Q+eSRs2ES9K1E2Nn5qpH+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733747"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/5] drm/xe: Move BAR definitions to dedicated file
Date: Thu, 30 May 2024 15:35:24 +0200
Message-Id: <20240530133527.1328-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We should keep all hardware definitions separated from the driver
code. Move LMEM_BAR definition to new regs/xe_bars.h file and also
add there GTTMMADR_BAR definition to avoid using magic 0 resource.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_bars.h      | 11 +++++++++++
 drivers/gpu/drm/xe/xe_mmio.c           |  3 ++-
 drivers/gpu/drm/xe/xe_mmio.h           |  2 --
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  1 +
 4 files changed, 14 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_bars.h

diff --git a/drivers/gpu/drm/xe/regs/xe_bars.h b/drivers/gpu/drm/xe/regs/xe_bars.h
new file mode 100644
index 000000000000..ce05b6ae832f
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_bars.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#ifndef _XE_BARS_H_
+#define _XE_BARS_H_
+
+#define GTTMMADR_BAR			0 /* MMIO + GTT */
+#define LMEM_BAR			2 /* VRAM */
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 44bff104c011..1272246dd8a3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_bars.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
@@ -435,7 +436,7 @@ int xe_mmio_init(struct xe_device *xe)
 	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
 	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
-	xe->mmio.regs = pci_iomap(pdev, mmio_bar, 0);
+	xe->mmio.regs = pci_iomap(pdev, mmio_bar, GTTMMADR_BAR);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1d578fd6ffc2..6ae0cc32c651 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -11,8 +11,6 @@
 struct xe_device;
 struct xe_reg;
 
-#define LMEM_BAR		2
-
 int xe_mmio_init(struct xe_device *xe);
 int xe_mmio_probe_tiles(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 64592a8e527b..f46fd2df84de 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -13,6 +13,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "regs/xe_bars.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
-- 
2.43.0

