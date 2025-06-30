Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB8C83033
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 17:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8D10E4B4;
	Mon, 30 Jun 2025 17:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9eKUNDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0DB10E4A8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751304886; x=1782840886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c7sKoLo9vx+4cuW2ZZT4my7IGpPwTuLhYsAzocIk15I=;
 b=A9eKUNDqCvDl/tupzY18+2h5f7nEVj8jlMkyg6WJ91Hp37Qn4r2BIKG2
 F/JCV1CUmwfFQAPaOYtqq9AwgwpIEawzBc0P0woJauGQTgzp/FsiVl35K
 c1VXTbc6RCH/KT94k8aP7ybyuerET9BOjD6AMPcw/uXDM/ydEjbURAjOn
 BIls/pho98I4QeU0wHhdTSaO7eBP3r08kmeYdCvk+qErS5eEuzr1Qqop7
 VIXnbQYfjEgu05uFSwEBClkpKLVBSpEczzvadiT2+MfUtLIHRXs6nL0Zo
 3EDXHUJlxo6t3ezOM+bsLlVMx7YUdFs8aWJygSzxF163s35IZ+hdHSwAi A==;
X-CSE-ConnectionGUID: F9CbsbCJT+SPFuj/9oYHPQ==
X-CSE-MsgGUID: VeseSx9SSKmjDrJGmAHv8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57223399"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="57223399"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:46 -0700
X-CSE-ConnectionGUID: N1WnLZdDQrmjB4WR5wzgBg==
X-CSE-MsgGUID: ZdPhce0jREykLRcrkiB3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184543716"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 4/6] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
Date: Mon, 30 Jun 2025 10:34:43 -0700
Message-ID: <20250630173438.2342706-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630173438.2342706-8-matthew.d.roper@intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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

Although "multi-tile" and "multiple GTs per tile" are mutually-exclusive
characteristics on all of our platforms today, this may not always be
true.  Assign GT IDs according to xe->info.max_gt_per_tile in a way that
should work even if future platforms have different configurations.

This patch should not change the behavior of current platforms; it only
future-proofs for potential future designs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  8 --------
 drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..b65d888ee8e4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -82,14 +82,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 				 xe->info.tile_count, tile_count);
 			xe->info.tile_count = tile_count;
-
-			/*
-			 * FIXME: Needs some work for standalone media, but
-			 * should be impossible with multi-tile for now:
-			 * multi-tile platform with standalone media doesn't
-			 * exist
-			 */
-			xe->info.gt_count = xe->info.tile_count;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 658bfbddf9a8..bccd81e19bb0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -694,10 +694,11 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
-		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
+		gt->info.id = tile->id * xe->info.max_gt_per_tile;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
+		xe->info.gt_count++;
 
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
@@ -715,17 +716,10 @@ static int xe_info_init(struct xe_device *xe,
 
 		gt = tile->media_gt;
 		gt->info.type = XE_GT_TYPE_MEDIA;
+		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
-
-		/*
-		 * FIXME: At the moment multi-tile and standalone media are
-		 * mutually exclusive on current platforms.  We'll need to
-		 * come up with a better way to number GTs if we ever wind
-		 * up with platforms that support both together.
-		 */
-		drm_WARN_ON(&xe->drm, id != 0);
-		gt->info.id = xe->info.gt_count++;
+		xe->info.gt_count++;
 	}
 
 	return 0;
-- 
2.49.0

