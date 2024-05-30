Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C82C27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969BC11A232;
	Thu, 30 May 2024 13:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKQT7JFt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6C9113C14
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076142; x=1748612142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ALIZmYDm/BnrzfMhgLGUur+otHEBkMW3U7ckWa/aww=;
 b=UKQT7JFtdTx0ear2VfyWeimANHkTGk7HUtsgPztO9A6vKqx7tU0/jStF
 SBXfmxCghJ9VzVxAceiIxiGlCQ1inMYjILLKVbUAh6zLlDWizHbyd+yjn
 5ohClHhLLSsMUY9huoQZ07i6KTgdiFMGdlrKB6u20Ry7VgoGjSXlFe4CS
 Q7h/EZw4QGa/QCndBC1/JF7/1H6JZiZegDj/jzPig7J6L4rD3PtJrCFV6
 fDgAgsC7tR9T2G4Z7yTQ83HAdlQDS18vHbDC5ryS9qA3pJVQyms/oCSCT
 k0cO24OEWOcwMn4URg6eBOXE8owYobh1EIRxhIjOgk5S+Pv1wgd1+8O6f A==;
X-CSE-ConnectionGUID: IQi+579NTaCZ5jvoIUAghg==
X-CSE-MsgGUID: nCv6oDlYS0GQ/7Aq7ljq9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681355"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681355"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:42 -0700
X-CSE-ConnectionGUID: vlNwTHKURACs5SqgX0ixvg==
X-CSE-MsgGUID: JMbe8guLRN266z1O8muxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733754"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/5] drm/xe: Drop xe_ prefix from static functions in
 xe_mmio.c
Date: Thu, 30 May 2024 15:35:25 +0200
Message-Id: <20240530133527.1328-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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

Rename static functions to align with our typical coding style.
While at it, downgrade the existing kernel-doc for internal
function to normal comment.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 1272246dd8a3..6e57632b44a1 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -55,7 +55,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  * if force_vram_bar_size is set, attempt to set to the requested size
  * else set to maximum possible size
  */
-static void xe_resize_vram_bar(struct xe_device *xe)
+static void resize_vram_bar(struct xe_device *xe)
 {
 	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -127,7 +127,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
 }
 
-static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
+static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
 		return false;
@@ -141,16 +141,16 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int xe_determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
+	if (!resource_is_valid(pdev, LMEM_BAR)) {
 		drm_err(&xe->drm, "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
-	xe_resize_vram_bar(xe);
+	resize_vram_bar(xe);
 
 	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
 	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
@@ -202,8 +202,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
 	return offset;
 }
 
-/**
- * xe_mmio_tile_vram_size() - Collect vram size and offset information
+/*
+ * tile_vram_size() - Collect vram size and offset information
  * @tile: tile to get info for
  * @vram_size: available vram (size - device reserved portions)
  * @tile_size: actual vram size
@@ -221,8 +221,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
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
@@ -289,11 +289,11 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 	/* Get the size of the root tile's vram for later accessibility comparison */
 	tile = xe_device_get_root_tile(xe);
-	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
 	if (err)
 		return err;
 
-	err = xe_determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe);
 	if (err)
 		return err;
 
@@ -304,7 +304,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
 		if (err)
 			return err;
 
-- 
2.43.0

