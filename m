Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7FDCD4840
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CCF10E655;
	Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5B4TIcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8629510E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4TV2CG2VkNr/OzFNwblgAGxxZpxBJ7n1xe0oDhdShaw=;
 b=B5B4TIcHpvEUYE2Lfqxz4c0BemRsWrN8FSELkMLrUyf9QEriDPGGvfq4
 GGOgmjrgx7c6domQqu3VQvyfl4gyWRiBWDlk4uAw+tJ83TnpFrCKAxn/Q
 6hnSguGYPSYGWdYhlyUuD8o389wAkiaXGKiUkmFqXwqih6II6dXsLt648
 ejmTellfCaWa3con1bJXql3htBdxgR2F/7brzf3RzRtQ1LDyA5VVIiVWw
 mlvDzQ5XYC7dSEqkAotNz27Vb7888stpqwNe7yRE36vAlXGBpiOlVA8/3
 PN8+yHrk+8j90K1zlGx2qK7TVpi5sPjDxtRGu+u498/1X96r1PhUmoXMp A==;
X-CSE-ConnectionGUID: lEfxJ/SWRrGA1wK1vcsLxQ==
X-CSE-MsgGUID: Vrn91ywhR8WfFCMlOC5uOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904793"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904793"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
X-CSE-ConnectionGUID: VjDzYfXITPWP4I352ThGig==
X-CSE-MsgGUID: vbEFvODhSY+RhJIU6IfVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944209"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 06/43] drm/xe: Switch mmio_ext to use 'struct xe_mmio'
Date: Tue,  3 Sep 2024 17:21:07 -0700
Message-ID: <20240904002100.2023834-51-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

The mmio_ext stuff is completely unused right now, but it isn't
providing any functionality that couldn't be treated as a regular mmio
space.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 8 +-------
 drivers/gpu/drm/xe/xe_mmio.c         | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e080be9bba52..75490753feda 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -182,13 +182,7 @@ struct xe_tile {
 	 *
 	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
 	 */
-	struct {
-		/** @mmio_ext.size: size of tile's additional MMIO-extension space */
-		size_t size;
-
-		/** @mmio_ext.regs: pointer to tile's additional MMIO-extension space */
-		void __iomem *regs;
-	} mmio_ext;
+	struct xe_mmio mmio_ext;
 
 	/** @mem: memory management info for tile */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ad6a7992b00e..4c7215ed3954 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -132,7 +132,7 @@ static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
 
 	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
 	for_each_tile(tile, xe, id) {
-		tile->mmio_ext.size = tile_mmio_ext_size;
+		tile->mmio_ext.regs_length = tile_mmio_ext_size;
 		tile->mmio_ext.regs = regs;
 		regs += tile_mmio_ext_size;
 	}
-- 
2.45.2

