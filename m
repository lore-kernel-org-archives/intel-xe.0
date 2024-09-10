Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF15EE0201
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447C10E954;
	Tue, 10 Sep 2024 23:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1Bb4CNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C6110E93A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HmA39AauFxGK5q699+v9z0yaCNrAZK1L1g3K0KViw+8=;
 b=V1Bb4CNK1Vdj+orIZfHb4j/HrDOShLMCVjU7aRhA0ubH4xcsyBAcJBtm
 uzsgfoNV43hDrjEkxXnr9Mqj+/0tcF1ZohtVx2WDP15DfdoLGEmC1Ilur
 0jYbVWZCyhMORRMwKEgaeyxRjaKsoK9Q8MABnW9B+VVjNlibNS0EgP0hi
 e7rSc6TlVjAK7bp3G1h4pTL8il5SV4QE9pn2bztmktZjZuxt0zLxmxe0N
 EKnZZJbPjZXjAzuVJ1gYKxddN35MxAIii0Tx3voJi93z/BwizS9Sxjvn7
 5UdGN2lS8LkK86Z3fZLMPxofHqJjYeBw2K6679q4byqicvJROO06+usXa A==;
X-CSE-ConnectionGUID: kiqe5mbvTiGV6g3ivtFVpw==
X-CSE-MsgGUID: olAbNqXCS7iD3rZEGCdJ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144298"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:26 -0700
X-CSE-ConnectionGUID: +Eg7os4ORxuWbRUwWaZQYQ==
X-CSE-MsgGUID: P/OqLxWMSf+ybERYhPwV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989552"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 07/43] drm/xe: Add xe_tile backpointer to xe_mmio
Date: Tue, 10 Sep 2024 16:47:27 -0700
Message-ID: <20240910234719.3335472-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>  # v1
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_mmio.c         | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e5af3f5fe78c..3a23083ec3cf 100644
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
index d271ff45e90c..47b505aa8282 100644
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
@@ -179,6 +181,7 @@ int xe_mmio_init(struct xe_device *xe)
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

