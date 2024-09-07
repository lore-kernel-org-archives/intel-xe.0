Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161AEE6FE4C
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5327310EB37;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/ucEUUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5A10EB27
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=STXW5tpuUbbjKEzFcMXFZxlC43qzKsXatKakrRtP420=;
 b=m/ucEUUUahsU69GcRzYojFx1KOcrDSQ1nDkD3NH4XmkXGHC2d0KWqDau
 u08Rs/8dJ14V9Rrb4z+InKrfhR8mMc0uRrvThtY+MJiykUNk0A1+mByT4
 pd+Ku4BkEBWHv8vGeiq/nRyOM1+ioa4mkoBuEG8aG7wLC4FMtcAgx5Aj7
 LNbw8aIVsH5aUFgmX71ly2cvc+Mdqx0MlVSCCvRiZihJEbrFmVul6Z9Z1
 IcbvvezsrpsEihfLgWrOjx9y3sNp4ZcgdvAtboHzxO/RlBMnN3K5VIQH4
 9gRlavFX2oA1zK7ddK21uTROyUdp7d0gFzgr3xi32WqmxA7vQdCIJy5kP w==;
X-CSE-ConnectionGUID: Lpcno7lISj2WtjBugTqlJw==
X-CSE-MsgGUID: vrvtNppsT1CC3ViuXZIEhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855297"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: l2IKu4kGQw+UzmenSwmIOg==
X-CSE-MsgGUID: Hqf1eZfcSsmrC76q2kRqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792636"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 07/43] drm/xe: Add xe_tile backpointer to xe_mmio
Date: Fri,  6 Sep 2024 17:07:56 -0700
Message-ID: <20240907000748.2614020-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Once MMIO operations stop being (incorrectly) tied to a GT, we'll still
need a backpointer for feature checks, message logging, and tracepoints.
Use a tile backpointer since that may allow the most useful debugging
output, while also providing access to the xe_device.

v2:
 - Make backpointer an xe_tile instead of xe_device.  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>  # v1
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_mmio.c         | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e6675e9ba6e1..27fd16bedb4a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -115,6 +115,9 @@ struct xe_mem_region {
  * subregions of the overall IO space).
  */
 struct xe_mmio {
+	/** @tile: Backpointer to tile, used for tracing */
+	struct xe_tile *tile;
+
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 2f72516e0132..46924f404241 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -98,6 +98,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	for_each_tile(tile, xe, id) {
 		tile->mmio.regs_size = SZ_4M;
 		tile->mmio.regs = regs;
+		tile->mmio.tile = tile;
 		regs += tile_mmio_size;
 	}
 }
@@ -134,6 +135,7 @@ static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
 	for_each_tile(tile, xe, id) {
 		tile->mmio_ext.regs_size = tile_mmio_ext_size;
 		tile->mmio_ext.regs = regs;
+		tile->mmio_ext.tile = tile;
 		regs += tile_mmio_ext_size;
 	}
 }
@@ -180,6 +182,7 @@ int xe_mmio_init(struct xe_device *xe)
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	root_tile->mmio.regs_size = SZ_4M;
 	root_tile->mmio.regs = xe->mmio.regs;
+	root_tile->mmio.tile = root_tile;
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5a6833bf9f56..9914d7d4b9de 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -718,6 +718,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 		gt->mmio.regs = tile->mmio.regs;
 		gt->mmio.regs_size = tile->mmio.regs_size;
+		gt->mmio.tile = tile;
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
@@ -740,6 +741,7 @@ static int xe_info_init(struct xe_device *xe,
 		gt->mmio.regs_size = tile->mmio.regs_size;
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+		gt->mmio.tile = tile;
 
 		/*
 		 * FIXME: At the moment multi-tile and standalone media are
-- 
2.45.2

