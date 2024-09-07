Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1527AE6FE51
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A222910EB34;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay2o/uiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119810EB27
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667676; x=1757203676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPZ+mDcPZe7bXYB0Hphdb6Ii07q62FpN5r2l8q5UXKc=;
 b=ay2o/uiW1/gNkEtqHEkdYyrbfAQxiIYNygFmi79/QHPa8oz8H4OcEWFK
 UWWFBuMcGJf84p4Tv1tuF3Lic8zPybt7HD5VuC5fs+olnQbb9ZXRnWjEi
 Ftaa+SS6J4nMBXeYogyOPaAA1TPCW2m23ft2c1HNmDnM4PR2Mciwuqqlc
 R72D4gF6Thg3uNL9zpeJoRGbGhwE2hNpjJV6uNiQLNJ3P17nyIb/glIPL
 cBnHV+wo0l5+1VxdUazFYx/zNfEZlYwomUjGDnW29tx9gw1m/ocGbJ7+A
 TYchu8mE4SiBwxYeR0VUla8xm6cMXyBh4Wg2uIKSbHuD5QqbTNrM3AaIz g==;
X-CSE-ConnectionGUID: o7uN/OVGSk+yQ8MKio4GEg==
X-CSE-MsgGUID: K+Autl3wQ8mC33sPCrbJsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855293"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855293"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: 4/x954NWRcmHihLnIAhd+g==
X-CSE-MsgGUID: UyHhBjCSTsGHLIX/0N+Nag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792624"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 03/43] drm/xe: Clarify size of MMIO region
Date: Fri,  6 Sep 2024 17:07:52 -0700
Message-ID: <20240907000748.2614020-48-matthew.d.roper@intel.com>
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

xe_mmio currently has a size parameter that is assigned but never used
anywhere.  The current values assigned appear to be the size of the BAR
region assigned for the tile (both for registers and other purposes such
as the GGTT).  Since the current field isn't being used for anything,
change the assignments to 4MB (the size of the register region on all
current platform) and rename the field to 'regs_size' to more clearly
describe what it represents.  We can use this value in later patches to
help ensure no register accesses accidentally go past the end of the
desired register space (which might not be caught easily if they still
fall within the iomap).

v2:
 - s/regs_length/regs_size/  (Lucas)
 - Clarify kerneldoc description (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++--
 drivers/gpu/drm/xe/xe_mmio.c         | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5d5b7a9199d8..ecf95801743d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -119,8 +119,14 @@ struct xe_mmio {
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
-	/** @size: Size of the map. */
-	size_t size;
+	/**
+	 * @regs_size: Length of the register region within the map.
+	 *
+	 * The size of the iomap set in *regs is generally larger than the
+	 * register mmio space since it includes unused regions and/or
+	 * non-register regions such as the GGTT PTEs.
+	 */
+	size_t regs_size;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3fd462fda625..f210e7470eae 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -36,13 +36,19 @@ static void tiles_fini(void *arg)
 /*
  * On multi-tile devices, partition the BAR space for MMIO on each tile,
  * possibly accounting for register override on the number of tiles available.
+ * tile_mmio_size contains both the tile's 4MB register space, as well as
+ * additional space for the GTT and other (possibly unused) regions).
  * Resulting memory layout is like below:
  *
  * .----------------------. <- tile_count * tile_mmio_size
  * |         ....         |
  * |----------------------| <- 2 * tile_mmio_size
+ * |   tile1 GTT + other  |
+ * |----------------------| <- 1 * tile_mmio_size + 4MB
  * |   tile1->mmio.regs   |
  * |----------------------| <- 1 * tile_mmio_size
+ * |   tile0 GTT + other  |
+ * |----------------------| <- 4MB
  * |   tile0->mmio.regs   |
  * '----------------------' <- 0MB
  */
@@ -90,7 +96,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 
 	regs = xe->mmio.regs;
 	for_each_tile(tile, xe, id) {
-		tile->mmio.size = tile_mmio_size;
+		tile->mmio.regs_size = SZ_4M;
 		tile->mmio.regs = regs;
 		regs += tile_mmio_size;
 	}
@@ -172,7 +178,7 @@ int xe_mmio_init(struct xe_device *xe)
 	}
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = SZ_16M;
+	root_tile->mmio.regs_size = SZ_4M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
-- 
2.45.2

