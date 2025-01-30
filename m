Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F7C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 10:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9506810E92D;
	Thu, 30 Jan 2025 10:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKy9T9Av";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF0B10E92D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738234267; x=1769770267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F0QSrcnKjko4InF5+82Z1ywr2QUmwmr5NwWT22JhD1Y=;
 b=YKy9T9Av9mRBG18WWaAItaCaoUvMppRg4ry90ubeksiBaSAPuB1tsYje
 dbMisGaaWs32wnkg1tI3rN/0Ou4EKIeTnX1zyuQjfMsgSiempT59vViWA
 MOZOpbDfhZVKyZMUHx9ZeZeV96GgDTRJ17+qpGqUZ6a9UK28WkIQV1ZT5
 kmoXeqEOEhkZtvAxfqI2ZFA8qB7QOTbIkCvEG09oQzeIoaiq1hPLEp/Rn
 8Nr58jjKfppGK4l7KB/F3M2yPP46ItVFMOZiwMFLlFzIGH75K6TmtQu0C
 p/aoaeB7RuPEnXjZLGbG+JKYjt4/iS6ckjMpxDhZnZIJ1Ly5FMQJv7fLF w==;
X-CSE-ConnectionGUID: UpuC72FhQ0ir6jwvodvH3A==
X-CSE-MsgGUID: zDh5DDRVQ2y0EqBz15+A1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42525834"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="42525834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:51:07 -0800
X-CSE-ConnectionGUID: VsYZygjpSnW8HfZF3Z0BRg==
X-CSE-MsgGUID: yYuhCUFLSJSxHE054vKKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109887840"
Received: from unknown (HELO ilevi-mobl.intel.com) ([10.13.220.96])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:51:04 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH 1/2] drm/xe: s/xe_mmio_init/xe_mmio_probe_early
Date: Thu, 30 Jan 2025 12:50:56 +0200
Message-Id: <20250130105057.136586-1-ilia.levi@intel.com>
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

Rename so that xe_mmio_init() can be used in subsequent patches to
initialize an instance of struct xe_mmio.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 drivers/gpu/drm/xe/xe_mmio.c   | 6 +++---
 drivers/gpu/drm/xe/xe_mmio.h   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8fedc72e9db4..f6c01028c527 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -685,7 +685,7 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
-	err = xe_mmio_init(xe);
+	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d321a21aacf0..3aed849a128b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -60,7 +60,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 
 	/*
 	 * Nothing to be done as tile 0 has already been setup earlier with the
-	 * entire BAR mapped - see xe_mmio_init()
+	 * entire BAR mapped - see xe_mmio_probe_early()
 	 */
 	if (xe->info.tile_count == 1)
 		return;
@@ -74,7 +74,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 		/*
 		 * Although the per-tile mmio regs are not yet initialized, this
 		 * is fine as it's going to the root tile's mmio, that's
-		 * guaranteed to be initialized earlier in xe_mmio_init()
+		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
 		 */
 		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
@@ -122,7 +122,7 @@ static void mmio_fini(void *arg)
 	root_tile->mmio.regs = NULL;
 }
 
-int xe_mmio_init(struct xe_device *xe)
+int xe_mmio_probe_early(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 8a46f4006a84..b32e7ee4b23e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -11,7 +11,7 @@
 struct xe_device;
 struct xe_reg;
 
-int xe_mmio_init(struct xe_device *xe);
+int xe_mmio_probe_early(struct xe_device *xe);
 int xe_mmio_probe_tiles(struct xe_device *xe);
 
 u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
-- 
2.43.2

