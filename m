Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5ACDB474
	for <intel-xe@archiver.kernel.org>; Sun, 22 Oct 2023 15:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2CE10E03D;
	Sun, 22 Oct 2023 15:57:40 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627C610E115
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Oct 2023 15:57:37 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1697990253; bh=lWWGA1HFlKaT1PuHf66Uj+jclX7btEIl+cb4Ah2e+9Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AaYo2dBzZ83dCGWZ0J4ZkSvrTzvCHbgezM+ETKoZ//2L7tRqDLv95CaCsEyjyKTBM
 LwmpmS/lTQjG37mVIrpmDjUzVYHpuQe3NP2CDh8PA6jvT9vzH8GIsBBZlH8dY062NT
 Op2CpBSeqt5kSjB4UJIMCbkH9mgtzrsFax2YP4IAaqfrzbSF+9CZ+JDgBOuUYvTRHH
 RdAhaREMsEcc458igZI4FirsxFKv7nnid10nVeRdGMZ4H5YPy+u+QJjfTTztakh4N3
 eq0ZyvjpC9CBxtsDuXHFc5QZeXYTXhU/ShLhOIZeP4utTlyTWVHl/tzKBnoAaSiv0B
 V1ISmgFaTq1WA==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 39MFvRSK717264
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Oct 2023 18:57:27 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Sun, 22 Oct 2023 18:57:27 +0300
Message-Id: <20231022155727.717251-2-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231022155727.717251-1-kelbaz@habana.ai>
References: <20231022155727.717251-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: rename bypass_mtcfg to skip_mtcfg
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

Per device, set this flag to access the MTCFG register or to skip it.
This is done to standardise Xe driver naming if an access to any HW
should be avoided.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
Changes in v2:
- Updated the flag 'bypass_mtcfg' to 'skip_mtcfg'

 drivers/gpu/drm/xe/xe_device_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 29199671d9e8..834e4cffb27c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -255,8 +255,8 @@ struct xe_device {
 		u8 has_range_tlb_invalidation:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
-		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
-		u8 bypass_mtcfg:1;
+		/** @skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
+		u8 skip_mtcfg:1;
 		/** @skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
 		/** @supports_mmio_ext: supports MMIO extension/s */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0da4f75c07bf..d556a213a8a9 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -329,7 +329,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	if (tile_count == 1)
 		goto add_mmio_ext;
 
-	if (!xe->info.bypass_mtcfg) {
+	if (!xe->info.skip_mtcfg) {
 		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 		if (tile_count < xe->info.tile_count) {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 05b0aa9f2ab7..7d352b501d5c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,7 +60,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
-	u8 bypass_mtcfg:1;
+	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
 	u8 supports_mmio_ext:1;
 };
@@ -578,7 +578,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
-	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
-- 
2.34.1

