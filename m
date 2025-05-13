Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD19DC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 15:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7680C10E293;
	Tue, 13 May 2025 15:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNdxarKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89E910E293
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747150345; x=1778686345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8cqmXRFKwfbdIi0jgeAl6BEJFwx2FyJ7XA5qkmSGbY=;
 b=aNdxarKCu1naQO3foq8JGcg2cddfMhpEPgVLAlwvSnRR05tEP5dsoVbq
 MX/lkV3lCcqxcDnCatDTkEoUhwH9DFl0eM1ku1tOQGpsbAHsolh0v27vS
 C5nSiQJeuhsyT6SUkJ11DRQmnpeYaHT+UJgn8llcHXN05kL8I0FS+mt+C
 KjJhqaYoYarsfGzo7YOAOm5rewlIOwwYwJgRup1cV9at8HYbzcTp2I09h
 IGaK1EIhZ7RDWMGpPKfj9SG5MQ50ob2R3441PaHQrtFjFOwRCKg9Fr48k
 alSKy8lfDkmXj1srU3OxWXVNsVxipLa1oD5lZa3s+e0TQ/pP9TwP/CVAk A==;
X-CSE-ConnectionGUID: jHbo4RssQimFje2EVB7wFQ==
X-CSE-MsgGUID: 5FRHN6wGQhyYJR93eGa1uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48935155"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48935155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 08:32:21 -0700
X-CSE-ConnectionGUID: 5YeFzt4PR5maLZq7LISKXQ==
X-CSE-MsgGUID: JysWrwoDRECi51p18+Schw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="142685737"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 08:32:20 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: Use xe_mmio_read32() to read mtcfg register
Date: Tue, 13 May 2025 15:30:10 +0000
Message-Id: <20250513153010.3464767-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513035515.3458300-1-shuicheng.lin@intel.com>
References: <20250513035515.3458300-1-shuicheng.lin@intel.com>
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

The mtcfg register is a 32-bit register and should therefore be
accessed using xe_mmio_read32().

Other 3 changes per codestyle suggestion:
"
xe_mmio.c:83: CHECK: Alignment should match open parenthesis
xe_mmio.c:131: CHECK: Comparison to NULL could be written "!xe->mmio.regs"
xe_mmio.c:315: CHECK: line length of 103 exceeds 100 columns
"

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 096c38cc51c8..7357458bc0d2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -75,12 +75,12 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 		 * is fine as it's going to the root tile's mmio, that's
 		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
 		 */
-		mtcfg = xe_mmio_read64_2x32(mmio, XEHP_MTCFG_ADDR);
+		mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
-					xe->info.tile_count, tile_count);
+				 xe->info.tile_count, tile_count);
 			xe->info.tile_count = tile_count;
 
 			/*
@@ -128,7 +128,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	 */
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
-	if (xe->mmio.regs == NULL) {
+	if (!xe->mmio.regs) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
 	}
@@ -312,8 +312,8 @@ u64 xe_mmio_read64_2x32(struct xe_mmio *mmio, struct xe_reg reg)
 	return (u64)udw << 32 | ldw;
 }
 
-static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
-			    u32 *out_val, bool atomic, bool expect_match)
+static int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
+			    u32 timeout_us, u32 *out_val, bool atomic, bool expect_match)
 {
 	ktime_t cur = ktime_get_raw();
 	const ktime_t end = ktime_add_us(cur, timeout_us);
-- 
2.25.1

