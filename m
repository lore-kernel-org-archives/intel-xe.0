Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2FCD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A6410F765;
	Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDBSyxt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D810F766
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937687; x=1812473687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D4I2ISeIS9wzhBpLT3XZVnamPnb8Pz0HWRT4a76gemQ=;
 b=dDBSyxt1MciKdGPtjYCp+EH1ALARpojsDjY7L50/yyKtoBICJkSx9SI4
 kQhZQY5MIiZkOLfKlBVDWiPJbiAW2fuWQGpliT4fskJWD/S+jJieoIw/r
 ALsxIn4+TIc1uAZtJch/itkXpxK2s5nTXBFWItZXXbPypP4vsnUloX5zh
 BoH8oYdRRgRV4+h3wU87I5/vatZe6FguyRKGqxdcuQLB7Wl++LbVa30NS
 YPHkp9wAyakwNjZ/7HRG1jKZzbUmTgB07nIgWzfLf6/cMmwB+Sa29u036
 HS2+D+E3SzAJAErBl/a9+tPqR3KtyzApES7mAGD4pZXA8qpaIQPypldIr Q==;
X-CSE-ConnectionGUID: MBdvllg1Td+ELs/uIei+ew==
X-CSE-MsgGUID: usQdXw1WTHmgM3j4e13zaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744544"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:47 -0700
X-CSE-ConnectionGUID: UgyxKBbLTE+DDgKaFcne2Q==
X-CSE-MsgGUID: EGMdBvwkRVeWYMoFVGA1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467551"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 05/16] drm/xe/mmio: Check MMIO BAR size when initializing tiles
Date: Mon,  8 Jun 2026 18:54:18 +0200
Message-ID: <20260608165429.587-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We initialized all remote tiles' xe_mmio structures with a new size
of 4MiB and offsets of 16MiB without sanity checks to see if mapped
GTTMMADR_BAR was actually at least that size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 389685aa41db..d53d727492c6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -47,21 +47,35 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	struct xe_tile *tile;
 	u8 id;
 
-	/*
-	 * Nothing to be done as tile 0 has already been setup earlier with the
-	 * entire BAR mapped - see xe_mmio_probe_early()
-	 */
-	if (xe->info.tile_count == 1)
-		return;
-
 	for_each_remote_tile(tile, xe, id)
 		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
 }
 
+/**
+ * xe_mmio_probe_tiles() - Initialize all tiles' MMIO
+ * @xe: the &xe_device
+ *
+ * Initialize the remaining tiles' MMIO instances.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M;
 
+	/*
+	 * Nothing to be done as tile 0 has already been setup earlier with the
+	 * entire BAR mapped - see xe_mmio_probe_early()
+	 */
+	if (xe->info.tile_count == 1)
+		return 0;
+
+	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
+		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zd\n",
+		       xe->info.tile_count, xe->mmio.size);
+		return -EIO;
+	}
+
 	mmio_multi_tile_setup(xe, tile_mmio_size);
 	return 0;
 }
-- 
2.47.1

