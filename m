Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC4CC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D096410FAB7;
	Fri,  4 Sep 2026 17:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmGkHehw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB5E10FAB0
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541552; x=1820077552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3pbp22SZDoq9aPe0T927GILHZ1z0ESGYfUAbdA5pcQ=;
 b=CmGkHehwf1cK0OGxVeuiwnwv4R9JitahwB2CdgAVqZrr5JRGa9VmBiH2
 MbjhcKcY5nc0pKTSJe4ZLXHl/L8J2upfYDtE/6qQSajjkt8jgdOLCsgJt
 RdhXgg/g9dIF1C8TE5D9KA0CmnhoeEPjOUaHlLigZ9AF2N4x/DVFQu4z8
 G9fMsByxg2sTKuHPQDst4rb3PQ2YJxemKWZ7Mpg8rlmCxiVG/0gT3xPeq
 ewr4OYLQGatMTeyIVpbbf3WTNeX8sp0RiizGhorREr8p39o9Kdus12YUQ
 KvYGYLvrVnvQy0g4WzTj7maDiUCtTtJgHgb20BmM7KGtqi0z8sXSiH4pJ Q==;
X-CSE-ConnectionGUID: hYYWtQERRAOi2PFlGp8WRQ==
X-CSE-MsgGUID: wwfbsLoHStCGflqAvR+7lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082223"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:52 -0700
X-CSE-ConnectionGUID: 3bdyE0zNSduO7zUMZhnrug==
X-CSE-MsgGUID: URwk5BoqRdmk56N7EWR+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882704"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 6/6] drm/xe/log: Relax location ID recognition
Date: Fri,  4 Sep 2026 19:05:30 +0200
Message-ID: <20260904170531.516-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904170531.516-1-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
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

It turned out that during early probe phase, VFs use detached from
the xe_device, temporary xe_gt objects, which when used as location
in xe_log() macros, will be treated by the dmesg decoration code as
bogus, possibly triggering a WARN, and the output will look like:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...

instead of expected:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...

Relax the tile/GT id validation and instead of looking for the real
objects, only check if encoded id is within the range of possible
tiles or GTs on the current xe device, using data from the device
descriptor rather then the object list.

Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 5549ef6966fd..29eb16db3320 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -10,6 +10,7 @@
 
 #include "xe_device.h"
 #include "xe_log.h"
+#include "xe_pci_types.h"
 #include "xe_printk.h"
 
 static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
@@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
 	return component ? log_unknown_component_prefix(component) : "";
 }
 
-static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
+static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return tile_id < 1 + xe->desc->max_remote_tiles;
+}
 
-	return xe ? xe_device_get_gt(xe, id) : NULL;
+static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
+{
+	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
 }
 
-static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
+static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return gt_id / xe->desc->max_gt_per_tile;
+}
 
-	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
+static const char *location_suffix(bool valid)
+{
+	return valid ? ":" : "?";
 }
 
 static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
@@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
 			goto unrecognized;
 		strscpy(buf, "", size);
 	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
-		struct xe_tile *tile = get_tile_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_tile_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
 
-		if (!tile)
-			goto unrecognized;
-		snprintf(buf, size, "Tile%u: ", id);
+		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 "LOG: invalid tile identifier: %u\n", id);
+		snprintf(buf, size, "Tile%u%s ", id, pad);
 	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
-		struct xe_gt *gt = get_gt_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_gt_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
+		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
 
-		if (!gt)
-			goto unrecognized;
-		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
+		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 "LOG: invalid GT identifier: %u\n", id);
+		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
 	} else {
 		goto unrecognized;
 	}
-- 
2.47.1

