Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B615DC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 22:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727FA10F30C;
	Wed,  8 Jul 2026 22:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxlOuahg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6843B10F30C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783548768; x=1815084768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KF0pJs1+/tw9wre2K5oGi2RZP/YByvClnXjoxynVcLU=;
 b=MxlOuahgzy5gIfOIuecT5pBDvYuG8vrXmD3Ny+9+Jb9Vr0ms7b3u2u1K
 S7PUe00aNUFNY8T6BTO+jL+8ze5+18cMnATVxp6VKx0ry1/MwDEQHgrFt
 wQp3dsfr8Ou7RvAlIpjTJh27QVaPEH5HZBzbtKHyCpxMUnUV2ewrwZ7mv
 knnvflZiXYzG4JobSDMRW19PZw3jyWbbSXg0Z5yXrJ5qTsbIFRDB/RFBO
 g075uBTV9jlJFph0kTfbB+R0jwoJP685TLbsEQvy3w9WHhm5dFrDrHy3k
 doncn/xD734UiwGgReGHoeJ/Glg5KW0f8mLA17UzPEmd3+00XShI1L4kl w==;
X-CSE-ConnectionGUID: mzTK7+6cQMWt2ksxUXlcNA==
X-CSE-MsgGUID: zQlNBizaT5aXoJGxF4VKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87909635"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="87909635"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 15:12:48 -0700
X-CSE-ConnectionGUID: Kf0WpGtFRQi2KrSSgKOdhQ==
X-CSE-MsgGUID: +LVDPEo+SpSCreJsj5xNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="292598279"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa001.jf.intel.com with ESMTP; 08 Jul 2026 15:12:46 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Use xe_tile_info() in alloc_primary_gt() and
 alloc_media_gt()
Date: Wed,  8 Jul 2026 22:12:33 +0000
Message-Id: <20260708221233.3251663-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

alloc_primary_gt() and alloc_media_gt() both operate in the context of a
specific tile, and the configfs-disabled messages describe a per-tile
primary/media GT. Switch from xe_info(xe, ...) to xe_tile_info(tile, ...)
so the log lines are prefixed with "Tile%u:", which disambiguates the
message on multi-tile devices.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d6ec3b242c02..1d7d8f3ce71f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -37,6 +37,7 @@
 #include "xe_step.h"
 #include "xe_survivability_mode.h"
 #include "xe_tile.h"
+#include "xe_tile_printk.h"
 
 enum toggle_d3cold {
 	D3COLD_DISABLE,
@@ -865,7 +866,7 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	struct xe_gt *gt;
 
 	if (!xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev))) {
-		xe_info(xe, "Primary GT disabled via configfs\n");
+		xe_tile_info(tile, "Primary GT disabled via configfs\n");
 		return NULL;
 	}
 
@@ -911,7 +912,7 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	struct xe_gt *gt;
 
 	if (!xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev))) {
-		xe_info(xe, "Media GT disabled via configfs\n");
+		xe_tile_info(tile, "Media GT disabled via configfs\n");
 		return NULL;
 	}
 
-- 
2.43.0

