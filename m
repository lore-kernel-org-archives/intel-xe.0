Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74434C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 17:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11410F94C;
	Mon, 27 May 2024 17:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLG3/GvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B2D10E346
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716831398; x=1748367398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eKjdlLu0hFIqnfvuFgjFyf/C8IXQKlSFlRAGuwdyzXQ=;
 b=jLG3/GvS4GCN5bYVwqHW/4WrIo3zDH7tT9bulOo4IcWkXhS2hFuzMvMR
 K0vv5qJKa9Dx5l2fsuqX7oizw3owSd8KSexLZsQj6jYkbW1lfD/TNe+Ay
 yzzVnlpeyUyEcD76L0lmBK16aNS58cdpQCQZEXPVT79nvYeF7JGDgHnev
 qo2ElrfW05oTKfG6bOiycVfl9XIKFLob6Ps5aQ8jdaLKLDg93yGDiPdJI
 zYYlwj0Pt/p1m7QSDlU451kqPu4RFV2nnMfoUPZG0f9A8hwNOVhwqacck
 AyH36alGyJ7IV5tf88AU9QihgcHvGq7tPYl5XmFXcnOszbdgeTcqrIe0C A==;
X-CSE-ConnectionGUID: 9YiLIhXOTLmhzarXQqbxfQ==
X-CSE-MsgGUID: /a99XA6sSZarTNa2FKqrUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23722643"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="23722643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:38 -0700
X-CSE-ConnectionGUID: pTyxrCJWTZWJekEISRUzaA==
X-CSE-MsgGUID: 8Xd24FtCQq2VIazEt2d+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="34901674"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.33.240])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 10:36:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/5] drm/xe: Rename internal vram helper function
Date: Mon, 27 May 2024 19:35:53 +0200
Message-Id: <20240527173554.1108-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240527173554.1108-1-michal.wajdeczko@intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
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

Drop no longer applicable "xe_mmio_" prefix and downgrade the
existing kernel-doc for internal function to normal comment.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index d8b81e4e050c..411e8d23fd4d 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -192,8 +192,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 	return offset;
 }
 
-/**
- * xe_mmio_tile_vram_size() - Collect vram size and offset information
+/*
+ * tile_vram_size() - Collect vram size and offset information
  * @tile: tile to get info for
  * @vram_size: available vram (size - device reserved portions)
  * @tile_size: actual vram size
@@ -211,8 +211,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
  * NOTE: multi-tile bases will include the tile offset.
  *
  */
-static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
-				  u64 *tile_size, u64 *tile_offset)
+static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
+			  u64 *tile_size, u64 *tile_offset)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
@@ -287,7 +287,7 @@ int xe_vram_probe(struct xe_device *xe)
 
 	/* Get the size of the root tile's vram for later accessibility comparison */
 	tile = xe_device_get_root_tile(xe);
-	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
 	if (err)
 		return err;
 
@@ -302,7 +302,7 @@ int xe_vram_probe(struct xe_device *xe)
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
 		if (err)
 			return err;
 
-- 
2.43.0

