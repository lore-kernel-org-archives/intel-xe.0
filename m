Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886D7C79FAE
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93B10EB13;
	Tue,  8 Sep 2026 10:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjNCO/Yj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361810EB09
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862749; x=1820398749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXgaYkVfCIzGHhXUiHXDNg5INsyc9e63+IR5FoOg6kU=;
 b=GjNCO/YjqYtUFEng44+bV9xwwE70I4kT2RK3oyH5PfWimB/3jEdEjiHc
 5AQFSb2SQak5MPuGV+zCSIvsjMq4rd9iMva0vvMap91F7V2yMqecapzwc
 E/yDXb5hg3LD8zKVHe2bu7XfzPBeiIQeIm+Bn0T1+t927QspnCagmvAAm
 b3JpJB/3Sf4ljLStXiU8r5MTc2+bqSRXeA9I9UgrQSwWqpTHPqs92ZOVh
 WyATw7KedSfUizByR13RPvcZBB7jhtvayrK72f+rXhmJJnWP/Sv9BneOE
 nE6Tg2UMl6GQWSO5vgYNUWg18M6pncDdyYaahSW52FSkB6q7BszOJeaI6 g==;
X-CSE-ConnectionGUID: EVpN3ssmRz6v62GL/v1rJg==
X-CSE-MsgGUID: 7XVe0hQhQue5WUbTIJ0nAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278284"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:09 -0700
X-CSE-ConnectionGUID: yOCsoUgbR6C/e5LKSICGUA==
X-CSE-MsgGUID: dGKRAQURTsmUEKgvmtonWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628482"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:09 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 13/13] drm/xe/vram: Report VRAM errors using structured
 xe_log API
Date: Tue,  8 Sep 2026 15:48:49 +0530
Message-ID: <20260908101849.1219614-14-dnyaneshwar.bhadane@intel.com>
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

