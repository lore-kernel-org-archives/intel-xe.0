Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1BED358DB
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788810E261;
	Thu, 29 Jan 2026 08:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJl5OBdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594210E283
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769675278; x=1801211278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ajqO6UgT5GhMHAbbTdos4TFru51zDJfynBiT1WkHN3g=;
 b=VJl5OBdunb9AjulP7ilxNAifDPK2wi8GAM6j131ccTa+MCXJV3H+vlxa
 +6xJcxo1oYa1OBD2L5susbznrqgip30NGs97q6pUT61e9o+skiE48ohU+
 iLU6jxaAKH3BjM63KHdaY/cZzJEbtik2BtL2nwGi1nMaIW9XIclcYN8sl
 /MBVWdBnt68xmlak2u3wN32jChL+YhqyMDwSe73PzxQn92zo9NlyIbARW
 sEAdzK30sjidMjK6Ehr3fkg8rO5O4h41Fh5681AZcqWPxJIaczLmuCy9F
 Xy6L/RZ5oVBIvD3RdVhtm5GJBkNWIcduikvMaSE/MsX3hecRGSfuo24mA A==;
X-CSE-ConnectionGUID: 3CPdz4yrT/G58GM/0Jv9Ng==
X-CSE-MsgGUID: K9rnIQWgQb23mi15nkgfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70942710"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70942710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:27:58 -0800
X-CSE-ConnectionGUID: 2+dIY4kYRlahV5zP8B+QBg==
X-CSE-MsgGUID: EDUyeRKvQ4q1hwsxhm2QTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="207756737"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 00:27:58 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Date: Thu, 29 Jan 2026 08:27:57 +0000
Message-ID: <20260129082756.1096935-3-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
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

The check using xe_child->base.children was insufficient in determining
if a pte was a leaf node. So explicitly check for if a pte is a leaf
through the bit checks.

Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")

v2:
 - Remove old assert. (Matt R)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6703a7049227..b73a356d0fa1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1655,7 +1655,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 	XE_WARN_ON(!*child);
 	XE_WARN_ON(!level);
-	/* Check for leaf node */
+	/* Optimistically check for leaf node, may not be guaranteed from children alone */
 	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
 	    (!xe_child->base.children || !xe_child->base.children[first])) {
 		struct iosys_map *leaf_map = &xe_child->bo->vmap;
@@ -1675,10 +1675,13 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				break;
 			}
 
-			/* Ensure it is a defined page */
-			xe_tile_assert(xe_walk->tile,
-				       xe_child->level == 0 ||
-				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
+			/*
+			 * The check for xe_pt's children is insufficient to determine leaf.
+			 * If not leaf, break out and continue in next page walk level.
+			 */
+			if (xe_child->level > 0 &&
+			    !(pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)))
+				break;
 
 			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
 			if (pte & XE_PTE_PS64)
-- 
2.43.0

