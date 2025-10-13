Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F108CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB610E515;
	Mon, 13 Oct 2025 20:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0zMJNJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2C10E507
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386204; x=1791922204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9e9ZkuHJoS3o7ay8PmmMgGSN4ihFhFqbz8CE+o8kNsE=;
 b=j0zMJNJwj1z0mPV8Du+FGjJpjdSlmKWedKc1NhR0WEOQVCVC1qygTd7k
 YLe6gFzNDc1+FkL0YyvU9tb01HJmmqL6ttXLy3STHRYeRBBvkcBxNREzN
 2d4MYsScZy2ElvqmUWfVHNcV2l+djm9XmbpMIT6kIjOZn+oB++pCfjXLF
 fUWsK2aApcPa3VNBhUoKz2vVOKE7vJZlBI7Fj2TxqFCXrH2GdS5ysow+/
 vbvKNukrv8Y1plHEmLJ4l9CsBRTASPXfdxItnUjBVoMbTS8gs3lgd2Zfd
 7TbPE5FgEnQuwmOhecuIUsz297fT/5m82QgnmYcuWRbL88etUaL7WgJ5m Q==;
X-CSE-ConnectionGUID: oHSZvrl6SmasHGjg69ctlg==
X-CSE-MsgGUID: ggmWHkF2SAO07Qxe2Bm5EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800560"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:04 -0700
X-CSE-ConnectionGUID: 24x8ZRXWR4+vsvji/6gXGw==
X-CSE-MsgGUID: nrIL6P+oR6WbAylzZUS46A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707629"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 21/23] drm/xe: Break GT setup out of xe_info_init()
Date: Mon, 13 Oct 2025 13:10:04 -0700
Message-ID: <20251013200944.2499947-46-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

xe_info_init() is getting a bit long and hard to follow.  Break the
allocation and basic initialization of the xe_gt structures out to their
own functions.

v2:
 - Rename new functions from init_* to alloc_*.  (Gustavo)
 - Move early NULL return of media GT before allocation.  (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 88 +++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 00f6757b6eec..26f90ea21921 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -691,6 +691,53 @@ static void xe_info_probe_tile_count(struct xe_device *xe)
 	}
 }
 
+static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
+				      const struct xe_graphics_desc *graphics_desc,
+				      const struct xe_media_desc *media_desc)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *gt;
+
+	gt = xe_gt_alloc(tile);
+	if (IS_ERR(gt))
+		return gt;
+
+	gt->info.type = XE_GT_TYPE_MAIN;
+	gt->info.id = tile->id * xe->info.max_gt_per_tile;
+	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
+	gt->info.engine_mask = graphics_desc->hw_engine_mask;
+
+	/*
+	 * Before media version 13, the media IP was part of the primary GT
+	 * so we need to add the media engines to the primary GT's engine list.
+	 */
+	if (MEDIA_VER(xe) < 13 && media_desc)
+		gt->info.engine_mask |= media_desc->hw_engine_mask;
+
+	return gt;
+}
+
+static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
+				    const struct xe_media_desc *media_desc)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *gt;
+
+	if (MEDIA_VER(xe) < 13 || !media_desc)
+		return NULL;
+
+	gt = xe_gt_alloc(tile);
+	if (IS_ERR(gt))
+		return gt;
+
+	gt->info.type = XE_GT_TYPE_MEDIA;
+	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
+	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
+	gt->info.engine_mask = media_desc->hw_engine_mask;
+
+	return gt;
+}
+
 /*
  * Initialize device info content that does require knowledge about
  * graphics / media IP version.
@@ -773,48 +820,21 @@ static int xe_info_init(struct xe_device *xe,
 			return err;
 	}
 
-	/*
-	 * All platforms have at least one primary GT.  Any platform with media
-	 * version 13 or higher has an additional dedicated media GT.  And
-	 * depending on the graphics IP there may be additional "remote tiles."
-	 * All of these together determine the overall GT count.
-	 */
+	/* Allocate any GT and VRAM structures necessary for the platform. */
 	for_each_tile(tile, xe, id) {
 		int err;
 
-		tile->primary_gt = xe_gt_alloc(tile);
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
+		tile->primary_gt = alloc_primary_gt(tile, graphics_desc, media_desc);
 		if (IS_ERR(tile->primary_gt))
 			return PTR_ERR(tile->primary_gt);
 
-		gt = tile->primary_gt;
-		gt->info.type = XE_GT_TYPE_MAIN;
-		gt->info.id = tile->id * xe->info.max_gt_per_tile;
-		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
-		gt->info.engine_mask = graphics_desc->hw_engine_mask;
-
-		err = xe_tile_alloc_vram(tile);
-		if (err)
-			return err;
-
-		if (MEDIA_VER(xe) < 13 && media_desc)
-			gt->info.engine_mask |= media_desc->hw_engine_mask;
-
-		if (MEDIA_VER(xe) < 13 || !media_desc)
-			continue;
-
-		/*
-		 * Allocate and setup media GT for platforms with standalone
-		 * media.
-		 */
-		tile->media_gt = xe_gt_alloc(tile);
+		tile->media_gt = alloc_media_gt(tile, media_desc);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
-
-		gt = tile->media_gt;
-		gt->info.type = XE_GT_TYPE_MEDIA;
-		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
-		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
-		gt->info.engine_mask = media_desc->hw_engine_mask;
 	}
 
 	/*
-- 
2.51.0

