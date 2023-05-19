Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A6C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1001910E631;
	Fri, 19 May 2023 23:18:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEA110E4A5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538325; x=1716074325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=os87xKkvARKzLVe+Idkv7XYQ1/jHm7saJX67AXVhZaA=;
 b=mfT7Ewibc8DSyrUGfS1lBqeBDc9Xs3AuUBlJcURjV/XMmenjuPHS4zPF
 uilzVR8DxOLDmJ/aPLdF8Q3OEQZm/QsvISxO9+DifO0JoR4qFy8auYNRm
 fSdgS+q6B/0N/P7NRwrNiXhW87wJh7oC9fT5fonaLOB37kJz9d8aJ2+Qc
 EFv8b+AT0EA4GVgU+IkU+J/kKqDjNxtc9QTUoyfdAuTIJHDQ1d9Q5cejh
 O6bIfZ5pS7UtT6dqa5w7sbh0F11ySw7lFbZiCgwxAZRHy8I5O3y1GFfj3
 QnOvEEk8vfey286pxXziLxraIAnr1AsErAT9IeS0W6eZaSs6WZOvtt65W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526337"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526337"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888682"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888682"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:17:58 -0700
Message-Id: <20230519231827.3572452-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/30] drm/xe/mtl: Disable media GT
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
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  2 --
 drivers/gpu/drm/xe/xe_pci.c  | 13 +------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..4804616a3c44 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -301,8 +301,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-	if (xe->info.media_verx100 >= 1300)
-		xe->info.tile_count *= 2;
 
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e789a50a1310..116569910e58 100644
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
@@ -552,8 +543,6 @@ static int xe_info_init(struct xe_device *xe,
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-	if (MEDIA_VER(xe) >= 13)
-		xe->info.tile_count++;
 
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-- 
2.40.0

