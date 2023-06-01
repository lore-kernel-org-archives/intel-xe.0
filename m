Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6811CC77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456BF10E0DB;
	Thu,  1 Jun 2023 00:04:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DFA10E0DB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577850; x=1717113850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rtc2MWPk3H7LelaNYy05LeDoTxy3waaBCoit7V/pajg=;
 b=eLlpuqxCaqtV7wTfezwITwNOQfzTEhJ188hsMbq3d8AHtqL/yMjGhMij
 VC1l6d9HRQBDigASMIXw8vZm85YV/G3wKilZ/tufo3iRwQqGkQrUEq/xl
 o6+hD18wghGefSDZaBPaqmLFSzetxAk3EiRzv30Q0+NhWI6YRS3LBsfWE
 e3ZRR9iw8NYz788BbPzqODVc1Q1yN8sf8e+qQDjdWh5e/f8Q/md4DyBYS
 ZNO1bhY7ZHILWK14HZx08f1N53ZXCPTuc/Gd8FC+qOPZPZQWZokpFN+mR
 TElnOPhd0FXUJhIuPe9LPPmcm6zRuBmB7zwwTS31MUy1FuwkmlgtNN/GD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996812"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996812"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556147"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556147"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:33 -0700
Message-Id: <20230601000403.432517-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 01/31] drm/xe/mtl: Disable media GT
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
v3:
 - Drop unnecessary xe_gt.h include.  (Gustavo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  2 --
 drivers/gpu/drm/xe/xe_pci.c  | 12 ------------
 2 files changed, 14 deletions(-)

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
index d8f1213ae1d6..6f0c4203fca3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -290,21 +290,11 @@ static const struct xe_device_desc pvc_desc = {
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
@@ -566,8 +556,6 @@ static int xe_info_init(struct xe_device *xe,
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-	if (MEDIA_VER(xe) >= 13)
-		xe->info.tile_count++;
 
 	for (id = 0; id < xe->info.tile_count; ++id) {
 		gt = xe->gt + id;
-- 
2.40.1

