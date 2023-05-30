Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309EBC7EE24
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6ADD10E433;
	Tue, 30 May 2023 21:16:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7935C10E430
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481365; x=1717017365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15lUsVCDHmRvX9NnJADnOI1Vpq8wLkwZDlUbtygP7hM=;
 b=EVc9U3C6hOD76ehAtkVmx4iGtgavk5RJCoTGcIGF9ktb2xJkNE4QI3Cd
 Nj5Ke+Mvh8AbOU1IV/6xUyRajJ7SJyHOs9aFtiQn9zhA9kPG0HoVPqhoq
 pohP7Qinyh5d819bv7Rd6roo6Hx1I3e4jDFK4qC8s8pdihZdvQIypKFBq
 feOz/jgr18j434RzIOWK4PgsL9KArrXBMMCDH2WiE+c8/EF+XEfG7RB6J
 I+MIaEpDi+mk1BjZVfE5R3tL1THuF6OfqNSu4dlZMIY/0YBZ8mmuVHX2K
 SBs2Lsl2vj29YhXquiHHDAqhm/Q4gQOFsJN0O4TZD9s38hSgGG6sFRhyU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311915"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311915"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139363"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139363"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:19 -0700
Message-Id: <20230530211549.2632538-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/31] drm/xe/mtl: Disable media GT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
media support is not yet functioning properly, let's just disable it
completely for now while we fix the fundamental driver design.  Support
for media GTs on platforms like MTL will be re-added later.

v2:
 - Drop some unrelated code cleanup that didn't belong in this patch.
   (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  2 --
 drivers/gpu/drm/xe/xe_pci.c  | 13 +------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d3b57669c9a7..ef2353eef6fe 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -340,8 +340,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-	if (xe->info.media_verx100 >= 1300)
-		xe->info.tile_count *= 2;
 
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d8f1213ae1d6..be860f6d0a4f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
+#include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
@@ -290,21 +291,11 @@ static const struct xe_device_desc pvc_desc = {
 	.extra_gts = pvc_gts,
 };
 
-static const struct xe_gt_desc xelpmp_gts[] = {
-	{
-		.type = XE_GT_TYPE_MEDIA,
-		.vram_id = 0,
-		.mmio_adj_limit = 0x40000,
-		.mmio_adj_offset = 0x380000,
-	},
-};
-
 static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.has_display = true,
-	.extra_gts = xelpmp_gts,
 };
 
 #undef PLATFORM
@@ -566,8 +557,6 @@ static int xe_info_init(struct xe_device *xe,
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-	if (MEDIA_VER(xe) >= 13)
-		xe->info.tile_count++;
 
 	for (id = 0; id < xe->info.tile_count; ++id) {
 		gt = xe->gt + id;
-- 
2.40.1

