Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D8DC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 00:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0E310E382;
	Fri, 13 Jun 2025 00:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAYYEMJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DE210E058
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773693; x=1781309693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20oHU8nltrBAhfJFg5zfgRkud1DGxwvcC13RroPh4IE=;
 b=oAYYEMJSeBewpqvenpOOm+VEwVO9j3G6HjCu/qbNcOTspRNNpqdklii3
 9Mhz7B22bf/OsfDDPn+w6K4Kik+weNg7MTbonWpa08nwZZN91yJppCHrU
 urdH0jcJOLH1v2Js6qkjrFU2K9gF0uYqn8wAlTFVj2CqcIWItQBdPJaku
 MQNAgknZbHiUm2IafCgurAT2t1sYXpp0Hw4RZf/48YNjfjhaaOJprBa+A
 fyt0gbIwkCxoGW4e7+m3ZoS7QcqYQfIvNWpQo/grg6LS5g4vjYZfsvNj1
 QSnHkZV5lhf3fLCFAHM01fZi4jNDXNXPhV1XqGfIczSo1jw/LdnBUBunn w==;
X-CSE-ConnectionGUID: ojHnCwsxSZiZt/5ZvDkyLw==
X-CSE-MsgGUID: 7BjxMOCwSyS4sxy+Vi2Akg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51204675"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51204675"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
X-CSE-ConnectionGUID: wU/steatRL+DCguO6Kcd2w==
X-CSE-MsgGUID: D2o1QlqiTMO2uMo0suNmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="151491074"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 4/5] drm/xe: Assign GT IDs properly on multi-tile + multi-GT
 platforms
Date: Thu, 12 Jun 2025 17:14:43 -0700
Message-ID: <20250613001438.678728-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613001438.678728-7-matthew.d.roper@intel.com>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
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
index a4885f64c2c4..b29252abbf3e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -687,10 +687,11 @@ static int xe_info_init(struct xe_device *xe,
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
@@ -708,17 +709,10 @@ static int xe_info_init(struct xe_device *xe,
 
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

