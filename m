Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764E8E7D27A
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 10:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358C10E3A4;
	Tue, 26 Sep 2023 10:39:26 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AD710E3A0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 10:39:10 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695724709; bh=+WAoT/F9GT8leF2ORjoWNz0lfLaMyYMUE0fkT4gVmxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b8j1whYWJftdpYasADxgV6ysTHEluxn3UQTi1CIdjTE3fjj6Q/rGtgK6VnV1UAv7U
 zesz/iE5G7FgQqVUGt46uPjEsZjn4mR48QFa4zXZkL3fZXCHvFXnFvgqa64sH2A4R4
 eYamKCTn23jueZRkGnxyI+ADXhdAVqp0Jea8VMw0lQ5LCKgvkQPSpyUpagANHDawvE
 o67BYy/zBXPkArzsnZ41et2HcEVgWbEuOM4Bh2xwNtu7+P1z2Wb2D5lahVo3Xrbtt6
 d5kaMdrIDhPnYU4iUCZ3IuyVQSl5X+5c77MYF6xpxnn4OpiKCZqFj9A11AlRxf4cFf
 9L9+TjhLPSRJg==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38QAcmdH1200229; Tue, 26 Sep 2023 13:38:59 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:38:46 +0300
Message-Id: <20230926103848.1200206-5-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926103848.1200206-1-kelbaz@habana.ai>
References: <20230926103848.1200206-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/6] drm/xe: add MMIO extension support flags
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

Besides the regular MMIO space that exists by default, MMIO
extension support & MMIO extension tile size should both be
defined per device, and updated from the device's descriptor.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3e2c68248334..7d459346b8a1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -204,6 +204,8 @@ struct xe_device {
 		const char *graphics_name;
 		/** @media_name: media IP name */
 		const char *media_name;
+		/** @tile_mmio_ext_size: size of MMIO extension space, per-tile */
+		u32 tile_mmio_ext_size;
 		/** @graphics_verx100: graphics IP version */
 		u32 graphics_verx100;
 		/** @media_verx100: media IP version */
@@ -253,6 +255,8 @@ struct xe_device {
 		u8 enable_display:1;
 		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
 		u8 bypass_mtcfg:1;
+		/** @supports_mmio_ext: supports MMIO extension/s */
+		u8 supports_mmio_ext:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5ae7e3b75697..accce1e9785d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 
 	u8 has_llc:1;
 	u8 bypass_mtcfg:1;
+	u8 supports_mmio_ext:1;
 };
 
 __diag_push();
@@ -567,6 +568,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
+	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index df6ddbc52d7f..d784e6057249 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -20,6 +20,8 @@ struct xe_graphics_desc {
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
+	u32 tile_mmio_ext_size; /* size of MMIO extension space, per-tile */
+
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
-- 
2.34.1

