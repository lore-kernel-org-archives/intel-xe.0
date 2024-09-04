Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C54CD4847
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF48110E657;
	Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJu4bMWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82DD10E641
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409277; x=1756945277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3RdUvBctd1jC/ElRPonMBHhh3q8Ziea+0w08It6Hyw=;
 b=MJu4bMWJQeGxy+25U6jjyQ/3mZv5FkKnUgxb7Y1RAGAjYc44DdmzphSs
 evX+oA4yn8UlI1NxxQ1k0OATd57vBk+2zHWgRulSiMGZaz6fexr7wAdEa
 Zyxy/UlhQ9UFNEBOMFSzNGMgIR3o8kKbTaJm/txtS7YR+8g43E7tDzGhs
 ZCqfGDOX0sHCGeTG/lKAzemWYsEv8u4HUx+Pcvp+Lfq1GuZeSXp9mdm+b
 BUBUHEmWJjkfumqbaXQuaykJ2waSgY3OyTzv3d/50OI37jRMActd95W1E
 NtfmZBvYrA8h+rgXIViGd73Zo3H8XRZ4d2WJE3g8yWPxBrMH3HdxK0sb8 g==;
X-CSE-ConnectionGUID: lDGAhnozQ+6IteWImN/Vzw==
X-CSE-MsgGUID: iuyi+oTFQ6yVamPS0B+MIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904821"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: I8QOIsqkQTO/Cm2fupXKTQ==
X-CSE-MsgGUID: 3i4kw3UTTNqTjSaeGeMZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944308"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 32/43] drm/xe/topology: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:33 -0700
Message-ID: <20240904002100.2023834-77-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede..651ba53623e5 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -25,7 +25,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 
 	va_start(argp, numregs);
 	for (i = 0; i < numregs; i++)
-		fuse_val[i] = xe_mmio_read32(gt, va_arg(argp, struct xe_reg));
+		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
 	va_end(argp);
 
 	bitmap_from_arr32(mask, fuse_val, numregs * 32);
@@ -35,7 +35,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg_val = xe_mmio_read32(&gt->mmio, XELP_EU_ENABLE);
 	u32 val = 0;
 	int i;
 
@@ -127,7 +127,7 @@ static void
 load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
+	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
 
 	if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
@@ -141,7 +141,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		xe_l3_bank_mask_t per_node = {};
 		xe_l3_bank_mask_t per_mask_bit = {};
 		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
-		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
+		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
-- 
2.45.2

