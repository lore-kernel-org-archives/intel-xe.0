Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E833CD4840
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D62110E649;
	Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJrdma7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E1210E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409275; x=1756945275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gLjLzSDbLkMgfowDoxFVfO8HRkdxT3mXSN3yum1rnX4=;
 b=HJrdma7UORdSbuksp+D0ZNhnWSNSSsn2vW9YpVF+Tx6bhC5WdTGuRIQ4
 4yxJtH8BNhTLwiXPsN9HX0N3H1F2JAFWvd9vfyAsTIlkE37EPDj1u9QVG
 zOaDaQqWaWrVveXg8ixgW3Fva58xKqsSwLlFa9CKGqC9Z59r2RlFrLBnx
 FKCtVI1al/DfaSrVw5fYPkLR5s3YSYPs/SsE7z/cbMKsiFWwCViARjxHa
 laovgX0QxZ0ui9VTVasWAL/sa3Enfyo3CY4GZAaeonLvDf+sijs+nPaT5
 jHM/PCTM4LaQDJWzLpeqfVKroCyBCA9FHQ3MJRayoVtymZ75e13OT/gux A==;
X-CSE-ConnectionGUID: PY/7rungTgOuhdf2tvFXzw==
X-CSE-MsgGUID: +32IZVvnQGqClmik6nQhQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904790"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
X-CSE-ConnectionGUID: U2lVtR20Qemm7qB+/MfwKw==
X-CSE-MsgGUID: o1cLAusPQsK2UZu0IGnhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944196"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 03/43] drm/xe: Clarify size of MMIO region
Date: Tue,  3 Sep 2024 17:21:04 -0700
Message-ID: <20240904002100.2023834-48-matthew.d.roper@intel.com>
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

xe_mmio currently has a size parameter that is assigned but never used
anywhere.  The current values assigned appear to be the size of the BAR
region assigned for the tile (both for registers and other purposes such
as the GGTT).  Since the current field isn't being used for anything,
change the assignments to 4MB (the size of the register region on all
current platform) and rename the field to 'regs_length' to more clearly
describe what it represents.  We can use this value in later patches to
help ensure no register accesses accidentally go past the end of the
desired register space (which might not be caught easily if they still
fall within the iomap).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++--
 drivers/gpu/drm/xe/xe_mmio.c         | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a02e5dfcc6a7..7427f40086e8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -119,8 +119,14 @@ struct xe_mmio {
 	/** @regs: Map used to access registers. */
 	void __iomem *regs;
 
-	/** @map_size: Size of the map. */
-	size_t size;
+	/**
+	 * @map_size: Length of the register region within the map.
+	 *
+	 * The size of the map itself it generally larger than the iomap; the
+	 * map itself is generally shared with other regions, and also includes
+	 * non-register regions such as the GGTT PTEs.
+	 */
+	size_t regs_length;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3fd462fda625..ad6a7992b00e 100644
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
+		tile->mmio.regs_length = SZ_4M;
 		tile->mmio.regs = regs;
 		regs += tile_mmio_size;
 	}
@@ -172,7 +178,7 @@ int xe_mmio_init(struct xe_device *xe)
 	}
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.size = SZ_16M;
+	root_tile->mmio.regs_length = SZ_4M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
-- 
2.45.2

