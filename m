Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E351E7D27A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA910E3A1;
	Tue, 26 Sep 2023 10:39:20 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE5610E3A1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:39:17 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695724709; bh=4sAY1ZfDH293eLWyWALZ9oQ4gmmz3YVf3zFcHUE5vvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VXsHCJKtyj8FD2h7eQ7F6a8RV5Vn90P2Uxe8gLb5R0MjwSK88fjpHhvO8AGW0QEvF
 pEVi2tek0F+CFHrUk2uRPrdKI4L1XSwfQYm88EK1nGKj62AFdEQ5os6H5KQvAS2iDK
 tNrsRw7ir/GmNEr6z7Df5ClCRr/zT3dK3I2jeo7pjqpY+Ia9lp5sZyuBBYII1rJkxO
 zdmhXUtKttnNg4l28BBnGCb2yMG6FNy/C9SS3y/BYiFEbhfjbaYMNBJxssPao+JaH1
 Bh5Un3HTq+nsTcLm9vyCdDSQ20Ln2K2r0+RmYJ1J8zD8AutXxlpSZT1lH/rMJRmfN/
 52f8VPnB8Hypg==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38QAcmdJ1200229; Tue, 26 Sep 2023 13:38:59 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:38:48 +0300
Message-Id: <20230926103848.1200206-7-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926103848.1200206-1-kelbaz@habana.ai>
References: <20230926103848.1200206-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/6] drm/xe: refactor xe_mmio_probe_tiles to
 support MMIO extension
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In future ASICs, there will be an additional MMIO extension space
for all tiles altogether, residing on top of MMIO address space.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
Changes in v2:
 - Align gt_count to the newly reduced tile_count

 drivers/gpu/drm/xe/xe_mmio.c | 70 +++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 52e4572e3c4a..e4cf9bfec422 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -318,50 +318,56 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
-	u8 adj_tile_count = xe->info.tile_count;
+	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
+	u8 id, tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	const int mmio_bar = 0;
+	struct xe_tile *tile;
+	void *regs;
 	u32 mtcfg;
-	u8 id;
 
-	if (xe->info.tile_count == 1)
-		return;
+	if (tile_count == 1)
+		goto add_mmio_ext;
 
 	if (!xe->info.bypass_mtcfg) {
 		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
-		adj_tile_count = xe->info.tile_count =
-			REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-
-		/*
-		 * FIXME: Needs some work for standalone media, but should be impossible
-		 * with multi-tile for now.
-		 */
-		xe->info.gt_count = xe->info.tile_count;
-
-		drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-			 xe->info.tile_count, adj_tile_count);
-	}
-
-	if (xe->info.tile_count > 1) {
-		const int mmio_bar = 0;
-		struct xe_tile *tile;
-		size_t size;
-		void *regs;
-
-		if (adj_tile_count > 1) {
+		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+		if (tile_count < xe->info.tile_count) {
+			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+					xe->info.tile_count, tile_count);
 			pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-			xe->mmio.size = SZ_16M * adj_tile_count;
-			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev),
-						  mmio_bar, xe->mmio.size);
+			xe->mmio.size = (tile_mmio_size + tile_mmio_ext_size) * tile_count;
+			xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
+			xe->info.tile_count = tile_count;
+
+			/*
+			 * FIXME: Needs some work for standalone media, but should be impossible
+			 * with multi-tile for now.
+			 */
+			xe->info.gt_count = xe->info.tile_count;
 		}
+	}
 
-		size = xe->mmio.size / adj_tile_count;
-		regs = xe->mmio.regs;
+	regs = xe->mmio.regs;
+	for_each_tile(tile, xe, id) {
+		tile->mmio.size = tile_mmio_size;
+		tile->mmio.regs = regs;
+		regs += tile_mmio_size;
+	}
+
+add_mmio_ext:
+	/* By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
+	 * When supported, there could be an additional contiguous multi-tile MMIO extension
+	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
+	 */
+	if (xe->info.supports_mmio_ext) {
+		regs = xe->mmio.regs + tile_mmio_size * tile_count;
 
 		for_each_tile(tile, xe, id) {
-			tile->mmio.size = size;
-			tile->mmio.regs = regs;
+			tile->mmio_ext.size = tile_mmio_ext_size;
+			tile->mmio_ext.regs = regs;
 
-			regs += size;
+			regs += tile_mmio_ext_size;
 		}
 	}
 }
-- 
2.34.1

