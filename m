Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD3C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 04:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DA410E4D8;
	Tue, 13 May 2025 04:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJwlQLcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10410E4D8
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747108828; x=1778644828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=193v3+IEG04WNq796lYFuQIqFylCZkNd8hwKbVhcJB4=;
 b=QJwlQLcl/Q4C6aYOcUXsO4X/pqviogTwvsZ8E69UAg0K4L83MSUi5G2e
 S7P//7QIDdwO5PJxmy3UONKlHDxalyoR/buQ3wNwQ1x/hjSptc+SGjIak
 uaaLap3CxtDypj6sJ0zAOweOKb1goiWdotLF0gi2m9273oy18Jcf8qCbj
 tSGGLPRYjWMNOJcEIA1pF1Xf1YHGidFov/odCcrfs3bPRtvSk5xRWtg3B
 remSxLPQ4/ApSwEauozt3JhOU5JUZhCx7YKDD0Jm53Uzggh7GsxzLK9Sl
 kxcQcplKJNsHQlnNxiJVEcyCEEbXPqqEiwyvCCO6PygXH4iODl8eqXwZG w==;
X-CSE-ConnectionGUID: uPzRGT8ZTcOHerCdwgAf/A==
X-CSE-MsgGUID: 4pTeSpXvTU2NEIF9Kw5t0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52740070"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="52740070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 21:00:28 -0700
X-CSE-ConnectionGUID: /XaQpXdrRp6gOxhkdkwSQA==
X-CSE-MsgGUID: Kz7Ejc7LQue1vanTDo4WoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137983751"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 21:00:26 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: use xe_mmio_read32() to read mtcfg register
Date: Tue, 13 May 2025 03:55:15 +0000
Message-Id: <20250513035515.3458300-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

