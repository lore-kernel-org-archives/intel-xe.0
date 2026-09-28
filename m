Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5FBC9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03B10E6AC;
	Mon, 28 Sep 2026 09:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNwa+tgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513110E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587450; x=1822123450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXgaYkVfCIzGHhXUiHXDNg5INsyc9e63+IR5FoOg6kU=;
 b=VNwa+tgYq5S9/QMWYUNX83+XmAvd3n0sd+/51WoXq0mGYlZnracxLh0S
 tQ+8kMCGP0LyvFOXhMZ1+nuK/FqWFKuy2SvMhR2RyHgcyd1UztTBpFVvI
 5a8V7PpTRYTL0m/3hsHp7ubJ3pmcC4A38J7LeunR5HtBraR58cszaIeKa
 3fbzjQx8EgGGWsvDXazoXdAxlx0Hqf0/hH6Y19d4VNQJMYUs11DXdz6Tg
 Lwer8Z7Fxcr7FU5mkpa6S1uxdGZLqLcJWc7QFdrmaZzDMVCCDUl0mAw9K
 JULL4NSZScb1NaXwEzN4CYO6fQEWbIVFYLtYVXMrkAy1KrzI8RsuhYn8y g==;
X-CSE-ConnectionGUID: UIu0aUTLRx6h22JitRoFqg==
X-CSE-MsgGUID: T38ZEFUbTguY7Rp8rZ4Yqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845501"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:20 -0700
X-CSE-ConnectionGUID: lP3G5JHyS8K4zNz7/FVHtw==
X-CSE-MsgGUID: BFuVAfmHR2mtk9Eu6cPMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078070"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:35 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
Date: Mon, 28 Sep 2026 14:51:14 +0530
Message-ID: <20260928092114.1610203-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
using the VRAM component tag. The "no CPU visible VRAM" error uses
tile or device as the log location depending on the caller context.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index fa06c7ae56b1..6c8558042ad4 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
@@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!resource_is_valid(pdev, LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
+		xe_log_err_fatal(xe, VRAM, -ENXIO,
+				 "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
@@ -254,8 +256,13 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
-			tile ? "Tile" : "Device");
+		if (tile) {
+			xe_log_err_fatal(tile, VRAM, -ENODEV,
+					 "Tile without any CPU visible VRAM. Aborting.\n");
+		} else {
+			xe_log_err_fatal(xe, VRAM, -ENODEV,
+					 "Device without any CPU visible VRAM. Aborting.\n");
+		}
 		return -ENODEV;
 	}
 
@@ -320,7 +327,7 @@ int xe_vram_probe(struct xe_device *xe)
 	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
+	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
 	remain_io_size = lmem_bar.io_size;
 
@@ -342,8 +349,9 @@ int xe_vram_probe(struct xe_device *xe)
 			return err;
 
 		if (total_size > lmem_bar.io_size) {
-			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &lmem_bar.io_size);
+			xe_log_info(xe, VRAM,
+				    "Total size %pa is larger than resource %pa\n",
+				    &total_size, &lmem_bar.io_size);
 		}
 
 		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
-- 
2.54.0

