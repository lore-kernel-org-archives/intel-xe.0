Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A4CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED7710E261;
	Fri, 22 May 2026 14:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxSR9faq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038E510E22B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460286; x=1810996286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXMqQU2KdMl6Pc8qSFE4iB2358rCZJYnu92q+dRZcOw=;
 b=SxSR9faqc6s5hy29PNglUNkAClukJdlhNt+23jMYrNVPAn9VzXfJkOIz
 7Lz8tekZAg6jdAnk+UFh0cJYOIopJsXpMzehKxINt40ISqFJYN7I6JXJ9
 JIL9C/cwnNW/y1Kg+egrlaekFsgpMNd50+huXynubRGoTGZHjxQ7Hzr+x
 IcJHCo0pXurexVZj/LpTW4sYGhksoxe5ld7RRIdoeFsYTADyti7iUjUyw
 AUL0JIh82SgeSEC4cLS7/gxwKGTUSNZWbC9R1kiIIQz0yRVIWN8GpZ5wX
 DKOup1PQJSc7V/sYLEd1WuWqHToOe0kFCDWz32+GtouLVsJfBVVxZhezt Q==;
X-CSE-ConnectionGUID: 9qoEQNhuTvKoY2/Av88JEg==
X-CSE-MsgGUID: DdVLEPbSQImiL4eKBCv7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861627"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:25 -0700
X-CSE-ConnectionGUID: ly09O0R+Tke4da8+agi+LA==
X-CSE-MsgGUID: 8Ovka02JR5eXOPwXBBupfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795095"
Received: from dmitriyo-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/4] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
Date: Fri, 22 May 2026 16:31:09 +0200
Message-ID: <20260522143112.10643-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522143112.10643-1-michal.wajdeczko@intel.com>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
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

This will allow us to drop our custom release action. Note that
pointer zeroing is not required, as there should be no active
code running during a driver unwind. While around, add missing
kernel-doc for the function and update error message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..f4086b9ae38f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -16,6 +16,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
@@ -76,37 +77,33 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
 }
 
-static void mmio_fini(void *arg)
-{
-	struct xe_device *xe = arg;
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-
-	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-	xe->mmio.regs = NULL;
-	root_tile->mmio.regs = NULL;
-}
-
+/**
+ * xe_mmio_probe_early() - Probe and initialize device's MMIO
+ * @xe: the &xe_device
+ *
+ * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
+ *
+ * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
+ * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_mmio_probe_early(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	/*
-	 * Map the entire BAR.
-	 * The first 16MB of the BAR, belong to the root tile, and include:
-	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
-	 */
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
-	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
+	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		drm_err(&xe->drm, "failed to map registers\n");
+		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
-	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
+	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
 
-- 
2.47.1

