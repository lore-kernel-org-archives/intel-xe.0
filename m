Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E4CC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945AB10EAF8;
	Tue,  8 Sep 2026 10:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MelQaeTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDD010EB05
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862738; x=1820398738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=naAEqlAcKTnAFYTCfkhgJSBfz30dz2NDzvrnDTyDRcQ=;
 b=MelQaeTbNLgnfYADshejsFYcqMTdREz+liAHT1AjyTvWxB4ARVecSq7M
 CWfvvB5BpWfMIEPAVn6+ZWTdBSEHWA4SezuYoNKcn2u27qoVbhfj2/WMM
 EHB3CSoQCdpTJ3VzXipX2qcNdvZf4u9xUzBDtAqBj3YN6qQlIgRcBUxHe
 omgV7/6+LpsuJfvj/DQ1AOFZy3jKlHU/GaZtEiqQ8bn7nYFf1jVCnUE4A
 bIcmtUuJUCNghGahK4+niijO9sUEFPc7EfvsFDYdcD2yAKAwPukylx2I7
 J2l/Ze2OQcSb6JXV2rI9z9VtXRXp2fA0H72CGvVZAbj5Qkm65MrWXG3Vr A==;
X-CSE-ConnectionGUID: cD1w5cpVTKeF+/yrRJJMOw==
X-CSE-MsgGUID: aSDBcbApQUi9oLi3KhruSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278270"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:18:58 -0700
X-CSE-ConnectionGUID: Eh1+XawoRc+0lGgok00SVQ==
X-CSE-MsgGUID: N3UqiwWTS72XwaB8FF8brw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628436"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:18:58 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 04/13] drm/xe/mmio: Report BAR mapping errors using
 structured xe_log API
Date: Tue,  8 Sep 2026 15:48:40 +0530
Message-ID: <20260908101849.1219614-5-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

