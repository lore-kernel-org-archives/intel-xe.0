Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F40BE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 20:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD810E482;
	Tue, 14 Jan 2025 20:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4M3mgLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CD310E482
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736887139; x=1768423139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/rEUXLKhi/Uvhpcmmdfv1mi/R+2WCbuqD9auRYVRZLU=;
 b=Y4M3mgLPWrh7J1McKNv6aQoww7kV/KhBJSGoteIyLM1n72mqzSrtN/jw
 hUHAuSIEU7NOBBiECDuYRv1TtBNwBwxsldJLL904FWm2RDTfGpv/U40k1
 pDgUVNPPPjoxQ8LNDFO7Ucr43qnxQCOheVRw7l7Jy+jazXEit167SvNYn
 VyvDbRzCMvIEq97NKdp/vmWSJJBroH0wmAcvAigzZ5j5WLX3qeubVcgDO
 4Ig2z/G+/CK/KiLbTCoah5Xhvv6CNREeeTr/E+hUw9xoAtYlw6m54gpT/
 xQK/nHIcA++P+rRgRmLRTOjcalnhg3C198VmfjdE4ddxJUYkStutb5lc6 g==;
X-CSE-ConnectionGUID: 5s0bqmdSSfmGA3vrSBLJ5A==
X-CSE-MsgGUID: qk+OHs5tSoqvb2c8OvIqfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37364125"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="37364125"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:38:59 -0800
X-CSE-ConnectionGUID: A3zzyAH4QFqBrmLzbw7OiA==
X-CSE-MsgGUID: ujjE/dlfRkO/Oc9HyX6dyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110059419"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.180])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:38:55 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Francois Dugast <francois.dugast@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/xe3: Generate and store the L3 bank mask
Date: Tue, 14 Jan 2025 12:38:53 -0800
Message-ID: <20250114203853.35055-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index b4283ac030f4..096859072396 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -221,6 +221,9 @@
 
 #define MIRROR_FUSE1				XE_REG(0x911c)
 
+#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
+#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
+
 #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
 #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index df2042db7ee6..516c81e3b8dd 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -129,7 +129,8 @@ static void
 load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
+	struct xe_mmio *mmio = &gt->mmio;
+	u32 fuse3 = xe_mmio_read32(mmio, MIRROR_FUSE3);
 
 	/*
 	 * PTL platforms with media version 30.00 do not provide proper values
@@ -143,7 +144,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	if (XE_WA(gt, no_media_l3))
 		return;
 
-	if (GRAPHICS_VER(xe) >= 20) {
+	if (GRAPHICS_VER(xe) >= 30) {
+		xe_l3_bank_mask_t per_node = {};
+		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
+		u32 mirror_l3bank_enable = xe_mmio_read32(mmio, MIRROR_L3BANK_ENABLE);
+		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
+
+		bitmap_from_arr32(per_node, &bank_val, 32);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
+					 meml3_en);
+	} else if (GRAPHICS_VER(xe) >= 20) {
 		xe_l3_bank_mask_t per_node = {};
 		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
 		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
@@ -155,7 +165,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 		xe_l3_bank_mask_t per_node = {};
 		xe_l3_bank_mask_t per_mask_bit = {};
 		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
-		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
+		u32 fuse4 = xe_mmio_read32(mmio, XEHP_FUSE4);
 		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
 
 		bitmap_set_value8(per_mask_bit, 0x3, 0);
-- 
2.45.0

