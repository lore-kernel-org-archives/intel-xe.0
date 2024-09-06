Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525BDE6FE4C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246610EB03;
	Fri,  6 Sep 2024 21:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpLzFGZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7010EB00
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659523; x=1757195523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+zH2P8ghaGULYv9JRjEPQ1LEQYooS1k1kbCaHBBIvU=;
 b=WpLzFGZ7LFrUAAI1UnKQfQDsUoQOrHOlHbT3qlKliObxb8pNS0YElBTk
 Jdhmc2dmV552B3u+Gfs/4PW0FfJvwmCAw2S2Vp2b8FbOkESqL4svaz5T6
 TfJXiRoaSiWVFV4qu87wjz7XK/7bCqL495hPHaYYocBnz9OT6fJ1p5QE7
 oFfMojmN+DkOQhAlpjY81nKKTXq7gzUvwtmm3AkQDEHxx8l95/TLyzkOQ
 aG4SEQNp8HeeYG+/g1R0byc8vzD1oNyj3HBQD4kcR3LYsd7ZQ5fWel22B
 rMrB0KWB69ICGXG2/OmuhcEyQQK4stCR8Q68xH0kb1wU7FUHu0khf/pBF Q==;
X-CSE-ConnectionGUID: jLOvLoB2RomShS0r5jjEpg==
X-CSE-MsgGUID: gMXmwmroTd6BFXKNDTOSrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580577"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580577"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:03 -0700
X-CSE-ConnectionGUID: 2VPvt1jMRUO4Bh15wZHu4g==
X-CSE-MsgGUID: U7MLEGu+SFm8WNHB8PrfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656326"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 3/9] drm/xe/xe3: Generate and store the L3 bank mask
Date: Fri,  6 Sep 2024 14:51:47 -0700
Message-ID: <20240906215153.31210-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

From: Francois Dugast <francois.dugast@intel.com>

On Xe3, the register used to indicate which L3 banks are enabled on
the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
represents one bank enabled in each node.
Extend the existing topology code for Xe3 to read this register and
generate the correct L3 bank mask, which can be read by user space
throug the topology query.

Bspec: 72573, 73439

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e11..8ed855b31e95 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -218,6 +218,9 @@
 
 #define MIRROR_FUSE1				XE_REG(0x911c)
 
+#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
+#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
+
 #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
 #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0662f71c6ede..56571380a2b5 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -129,7 +129,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
 
-	if (GRAPHICS_VER(xe) >= 20) {
+	if (GRAPHICS_VER(xe) >= 30) {
+		xe_l3_bank_mask_t per_node = {};
+		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
+		u32 mirror_l3bank_enable = xe_mmio_read32(gt, MIRROR_L3BANK_ENABLE);
+		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
+
+		bitmap_from_arr32(per_node, &bank_val, 32);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
+					 meml3_en);
+	} else if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
 		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
-- 
2.44.0

