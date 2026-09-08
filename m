Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC505C79FAE
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F8610EAF0;
	Tue,  8 Sep 2026 10:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyiGgZMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36610E0E2
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864357; x=1820400357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=naAEqlAcKTnAFYTCfkhgJSBfz30dz2NDzvrnDTyDRcQ=;
 b=WyiGgZMkwO2X+ZELq6ZnT3javWZRLmozeFEqoAquimdLed6b9DSAf3+W
 EM2m55JXy8X7Ug3CAlpTkbRmYWJ4yvFOE97tI1/WGFb0JgHGXA3IOouuH
 NwGj24V7EADQ2n7sPF+blU3IbAGrLOeidsU+Y17iCrDY7myjKw8WxvVdq
 PqWKMet7S9OGhFS4fKhhrXy6OhOeEDl/9gfUFaKMiirFTvOdB6KstasQV
 kQegoPqskWQtL9bwrnbl4QLmTwYsQ9IcaLAW88bhVhtqP18aHxlCPuN4f
 qDnY4DuSEadRDYbXsDsgFfxPZhrOjUUpuUj/wp5/M2p/RoYUJhg2k50kC A==;
X-CSE-ConnectionGUID: Rbm4vNPZQ4OChD+QwJcHrg==
X-CSE-MsgGUID: mVHaVhlcQqOBhfC5h6jtrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773074"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773074"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:45:57 -0700
X-CSE-ConnectionGUID: ubXTKcOcQb6LYkVavDLTCg==
X-CSE-MsgGUID: 4czvIB8BRkeFdNie0rwz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759074"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:45:56 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 04/13] drm/xe/mmio: Report BAR mapping errors using
 structured xe_log API
Date: Tue,  8 Sep 2026 16:15:41 +0530
Message-ID: <20260908104550.1283933-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_err() calls with xe_log_err() and xe_log_err_fatal() using
the REGS component tag for MMIO BAR probe failures

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..890146b8836b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_tile_printk.h"
@@ -71,8 +72,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 		return 0;
 
 	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
-		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
-		       xe->info.tile_count, xe->mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
+				 xe->info.tile_count, xe->mmio.size);
 		return -EIO;
 	}
 
@@ -105,13 +106,16 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe->mmio.size < SZ_16M) {
-		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
+		xe_log_err_fatal(xe, REGS, -EIO,
+				 "GTTMMADR_BAR is too small: %zu\n",
+				 xe->mmio.size);
 		return -EIO;
 	}
 
-- 
2.54.0

