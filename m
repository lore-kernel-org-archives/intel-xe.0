Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB364CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085410E1D2;
	Fri,  7 Nov 2025 18:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezdfIOnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CAE10EB62
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539860; x=1794075860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/XJuXuPIfUODX/4sezFRjLCs9iQ4hXuor3u6y7mqSE=;
 b=ezdfIOnAWxutHZE9M1zx72q4JE/8Xks5lTUkzOmcN9GCmLvVUP6TmEke
 nujEmixFayP1wYd7x5Aok57c/4YKs+UGit5hzFJz8tEhAKxsyBguoXy13
 k0rBRGfPw7Dnh9xvNrWFPc0W8S1svcA1Thwin49G+kwIbzN5sBGRsYuhb
 YUEKn1FstMDSvPOgm5jwFP804xLDYpnkL9ispzWBpu3SqxGheCbHRb8Gg
 MKWcw2GwpnyLHsyTZ7Z0Snin7crB0dJu782UUSe1Hp8uOgtTOtgLEGOrH
 r+bmQfKNOA78kC3e28J6QD5GCrCCwY/3xIKLv8OIvxqBf+ZnKcYkNCrZZ Q==;
X-CSE-ConnectionGUID: nH6PmbM1SFy+icZWo2idow==
X-CSE-MsgGUID: uu+87sF+RA+7dLf0pRUY7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64601683"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64601683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
X-CSE-ConnectionGUID: FIfyTG6UTgW4pp3itwRppg==
X-CSE-MsgGUID: M/KTG6GGQQWfb2CPkQsllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218756755"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, fei.yang@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/vram: Move forcewake down to get_flat_ccs_offset()
Date: Fri,  7 Nov 2025 10:23:45 -0800
Message-ID: <20251107-tile-addr-v1-2-a3014aadc2e7@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
References: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

With SG_TILE_ADDR_RANGE use, the only thing requiring GT forcewake while
probing for vram size is the get_flat_ccs_offset(). Move the forcewake
down where it's needed.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 56924f6a44ff2..0e10da790cc5d 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -183,12 +183,17 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	return 0;
 }
 
-static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
+static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
+
 	if (GRAPHICS_VER(xe) >= 20) {
 		u64 ccs_size = tile_size / 512;
 		u64 offset_hi, offset_lo;
@@ -218,7 +223,10 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
 	}
 
-	return offset;
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	*poffset = offset;
+
+	return 0;
 }
 
 /*
@@ -245,7 +253,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
-	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
@@ -265,10 +272,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
 	/* actual size */
 	if (unlikely(xe->info.platform == XE_DG1)) {
 		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
@@ -281,7 +284,10 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 
 	/* minus device usage */
 	if (xe->info.has_flat_ccs) {
-		offset = get_flat_ccs_offset(gt, *tile_size);
+		int ret = get_flat_ccs_offset(gt, *tile_size, &offset);
+
+		if (ret)
+			return ret;
 	} else {
 		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
 	}
@@ -289,8 +295,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
 }
 

-- 
2.51.2

