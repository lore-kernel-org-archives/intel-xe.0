Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6EAC87FCB
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 18:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F3810E56A;
	Mon, 28 Jul 2025 18:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPtmf63h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66210E0CE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753727380; x=1785263380;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=42F2kXUuUkwwnGNsA9jB8mjVVBDIiplWtQJKJipCqCQ=;
 b=dPtmf63h+Fj3jnY8L3YDUQqTc2Ee0EX8suwvczEnzwFv6WJgxVJrQvWu
 7846GTHudek6T7yxM+iljSyV2DXILYbfljY7WnPt9DPKqPrmxlXm10fm5
 M8K4dDJqnhzappmwinYSD2PkWKzIGFZo8UkTbUEGdD0gDnXT1L0uhRPrD
 ObEXtPNp5dbJEoc0G7HwJdnomgi2pumq+5r49EGgbCNk8kli+Cswva4bn
 8RX3c7Dnk4lSE3iStCFoE7eJkqbTD5xxbD7q/l/QR9T+rfGFeomVcxOHd
 AKn0WWEqphA/57D4rlyeEWuqqjUvgz5IrH8VlCNI6P3vyTZp4SFQuKZNQ Q==;
X-CSE-ConnectionGUID: Gj7nPZ6VSjKeK19kTE9s3A==
X-CSE-MsgGUID: j/qZgHSMRoGxm4p507d6PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67067691"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67067691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:29:39 -0700
X-CSE-ConnectionGUID: qTcmdoLxT+i6RLoK1t7V6w==
X-CSE-MsgGUID: HbAvejDoQ9K8Eh9Wsptr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166969356"
Received: from inaky-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.109.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:29:38 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 28 Jul 2025 15:29:05 -0300
Subject: [PATCH v2 1/2] drm/xe: Probe for tile count during device info
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-gt_count-improvements-v2-1-78841ce8a81c@intel.com>
References: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
In-Reply-To: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The function mmio_multi_tile_setup() does not look like the proper
location for probing for the number of existing tiles in the hardware.
It should not be that function's responsibility and such information
should instead be already available when it gets called.

The fact that we need to adjust gt_count is a symptom of that.

Move probing of available tile count to a dedicated function named
xe_info_probe_tile_count() and call it from xe_info_init(), which seems
like a more appropriate place for that.

With that move, we no longer need to (and shouldn't) adjust gt_count as
a part of xe_info_probe_tile_count(), as that field will be initialized
later in xe_info_init().

v2:
  - Use KUnit static stub so that we do not try to query hardware when
    running KUnit tests. (CI)
  - Tweak last paragraph of commit message to make it clearer.
    (Jonathan)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>  #v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  7 +++++++
 drivers/gpu/drm/xe/xe_mmio.c      | 33 ---------------------------------
 drivers/gpu/drm/xe/xe_pci.c       | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 9c715e59f030..db30c5156d0c 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -101,6 +101,11 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 	}
 }
 
+static void fake_xe_info_probe_tile_count(struct xe_device *xe)
+{
+	/* Nothing to do, just use the statically defined value. */
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -138,6 +143,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
+	kunit_activate_static_stub(test, xe_info_probe_tile_count,
+				   fake_xe_info_probe_tile_count);
 
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e4db8d58ea2d..ef6f3ea573a2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -58,7 +58,6 @@ static void tiles_fini(void *arg)
 static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 {
 	struct xe_tile *tile;
-	struct xe_gt *gt;
 	u8 id;
 
 	/*
@@ -68,38 +67,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	if (xe->info.tile_count == 1)
 		return;
 
-	/* Possibly override number of tile based on configuration register */
-	if (!xe->info.skip_mtcfg) {
-		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
-		u8 tile_count, gt_count;
-		u32 mtcfg;
-
-		/*
-		 * Although the per-tile mmio regs are not yet initialized, this
-		 * is fine as it's going to the root tile's mmio, that's
-		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
-		 */
-		mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
-		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-
-		if (tile_count < xe->info.tile_count) {
-			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
-				 xe->info.tile_count, tile_count);
-			xe->info.tile_count = tile_count;
-
-			/*
-			 * We've already setup gt_count according to the full
-			 * tile count.  Re-calculate it to only include the GTs
-			 * that belong to the remaining tile(s).
-			 */
-			gt_count = 0;
-			for_each_gt(gt, xe, id)
-				if (gt->info.id < tile_count * xe->info.max_gt_per_tile)
-					gt_count++;
-			xe->info.gt_count = gt_count;
-		}
-	}
-
 	for_each_remote_tile(tile, xe, id)
 		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 52d46c66ae1e..0d7073a04bb2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -604,6 +605,37 @@ static int xe_info_init_early(struct xe_device *xe,
 	return 0;
 }
 
+/*
+ * Possibly override number of tile based on configuration register.
+ */
+static void xe_info_probe_tile_count(struct xe_device *xe)
+{
+	struct xe_mmio *mmio;
+	u8 tile_count;
+	u32 mtcfg;
+
+	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe);
+
+	if (xe->info.skip_mtcfg)
+		return;
+
+	mmio = xe_root_tile_mmio(xe);
+
+	/*
+	 * Although the per-tile mmio regs are not yet initialized, this
+	 * is fine as it's going to the root tile's mmio, that's
+	 * guaranteed to be initialized earlier in xe_mmio_probe_early()
+	 */
+	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
+	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+
+	if (tile_count < xe->info.tile_count) {
+		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+			 xe->info.tile_count, tile_count);
+		xe->info.tile_count = tile_count;
+	}
+}
+
 /*
  * Initialize device info content that does require knowledge about
  * graphics / media IP version.
@@ -678,6 +710,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
+	xe_info_probe_tile_count(xe);
+
 	for_each_remote_tile(tile, xe, id) {
 		int err;
 

-- 
2.50.1

