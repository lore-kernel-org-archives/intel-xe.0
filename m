Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2616ECD13DF
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E3910E4C1;
	Mon, 10 Nov 2025 23:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fInJ7rNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F1110E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rou4WBzSRSWKYeC417pCe2Ep385TrA7W+o5MsuJxuGs=;
 b=fInJ7rNQlXIYDfaC5CtM2QpbwxvdWHU658m52elUM6wkaHePxC1xf0xT
 1HG4uFeOxxtVsCUBo7B1XfiAPrJ+rsnseqGG0QYnGv/HGQorUbtOKzbJj
 p6oARC4EDOKGywRRNBkYh784UT46mPmknbRKv8aUada7UV2f30idBngva
 09N3z/JNnZdqYsKUTigXPOXOaOZTVt2MgDBs75hiKgfDKIDJciP5Ul7SD
 DyJomZkmKtIr91QZTic5CfvI9txKtWyq2fMzWAY7sZAdGGoWOtQw1kN4g
 qbiWEvgBlSgw9ht0k1KGJyaOTKrxj8Z0NSyaMBoBeEQAEbMZ/jQpQ8z0i A==;
X-CSE-ConnectionGUID: UngMsU5+SHyAX9dh9ZxKzg==
X-CSE-MsgGUID: 2GM+bQ0RRyeUCBUWagNSLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486460"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486460"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: uSql1vjhR7ilbpUnu8tlsw==
X-CSE-MsgGUID: 1qEsuGm/S8KUmGqVqyNrwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244016"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 23/30] drm/xe/vram: Use scope-based forcewake
Date: Mon, 10 Nov 2025 15:20:41 -0800
Message-ID: <20251110232017.1475869-55-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Switch VRAM code to use scope-based forcewake for consistency with other
parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b62a96f8ef9e..11d18741313b 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -245,7 +245,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
-	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
@@ -265,8 +264,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	/* actual size */
@@ -289,8 +288,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	return 0;
 }
 
-- 
2.51.1

