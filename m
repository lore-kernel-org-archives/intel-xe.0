Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D27C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 18:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA04710E6C8;
	Wed, 25 Oct 2023 18:00:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64D10E6C7
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256809; x=1729792809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dpa8PQvpAW+vbuZynsobcr54ZQSudg2gn39T3WjA974=;
 b=H9zDUAy0wk0a5o8x8sL9qcXCazhrE9DvgRnJ5DhFwZ1xM7VAgVOMHXMe
 6+K7DfAXMH5exliLPWAjVG8rP4tfUcrS1F+kAZrP8WzVP0p4RXjLSer54
 wmZqQi4S7EC3LQYCQHBPl7P5nkZluQs6Im1xkMBXUbZlcff8aRUnANvtp
 pHCDaoUQncwGyownmoZ/23wyEPL/6THLBQyMk9gCWMC6tO6yuOsYgJoTp
 zlMCETIiTDN1Uc6UJCdhKPLuHHZUNdgJlE0ALYndhxEVTH08guk63BIOd
 DfSPnegGM5GT5+hjOev4XYz8J4UrEF7sy2jPxWUSvEbrn5dreD39vIM2X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8922327"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8922327"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735470640"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735470640"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:08 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 11:00:06 -0700
Message-Id: <20231025180008.24167-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231025180008.24167-1-brian.welty@intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Replace xe_ttm_vram_mgr.tile with
 xe_mem_region
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace the xe_ttm_vram_mgr.tile pointer with a xe_mem_region pointer
instead. The former is currently unused.
TTM VRAM regions are exposing device vram and is better to store a pointer
directly to the xe_mem_region instead of the tile. This allows to cleanup
unneccesary usage of xe_tile from xe_bo.c in later patch.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 7 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 285791eb4a79..953e5dc0fd80 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -358,12 +358,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mem_region *vram = &tile->mem.vram;
 
-	mgr->tile = tile;
-
+	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
-				      tile->mem.vram.usable_size,
-				      tile->mem.vram.io_size,
+				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 48bb991c14a5..2d75cf126289 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,7 +9,7 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_tile;
+struct xe_mem_region;
 
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
@@ -17,12 +17,12 @@ struct xe_tile;
  * Manages placement of TTM resource in VRAM.
  */
 struct xe_ttm_vram_mgr {
-	/** @tile: Tile which the VRAM belongs to */
-	struct xe_tile *tile;
 	/** @manager: Base TTM resource manager */
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
+	/** @vram: ptr to details of associated VRAM region */
+	struct xe_mem_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.38.0

