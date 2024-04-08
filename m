Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B2CCD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6DA11276E;
	Mon,  8 Apr 2024 16:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSEkWmWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0D112775
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593763; x=1744129763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gH5rwxhvfSf04yeL00Kr/bTcufwAEPg+3vbJzh18nL0=;
 b=SSEkWmWgleWJHbUDjQPtbSBBkOJ/AdmcXfIkgg5j2QpaoJETRJC5XEBq
 SNRPcJNGRBSg+6jDADGM5hnL7DgxxxQ3P6oxkMflSNqHyk/Ya3KP21laW
 Woyb+9pwd2NT8rt+Z2qgEzUlcvKm44jZ5NcFdJZvS1R44A7n475TbkAhZ
 QY9atPgx3zMeFAyjrW9qYK8ozi4ICMQFl44DhhTHqux3t/Vy0B+zgwT0V
 zQ2PzkvARPKGODgXy96gM3G/DWKaoMZU10eq9xfGXGqVWnFVp9RyGOkbu
 vWls8dPZVjGZIra61Y6pS3Nl/bgw9KTJKbsa6icqeepVzW4LConLvQDEb w==;
X-CSE-ConnectionGUID: pd9RvNKGTwGEWH9qOzWL2A==
X-CSE-MsgGUID: 4l1CfleESUSrBXdReo/v6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024981"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:23 -0700
X-CSE-ConnectionGUID: N20NtZzxR/O7wK2IW255VQ==
X-CSE-MsgGUID: 2/3GI4/MTAiaAWRoZqTcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683521"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:20 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 07/11] drm/xe/xe2hpg: Determine flat ccs offset for vram
Date: Mon,  8 Apr 2024 21:59:10 +0530
Message-Id: <20240408162916.3767771-14-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

on Xe2 dgfx platform determine the offset using Flat CCS size
bitfield of XE2_FLAT_CCS_BASE_RANGE_[UPPER/LOWER] mcr registers.

Bspec: 68023

v2: function argument tile_size changed from pass by reference to pass
by value

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 ++++
 drivers/gpu/drm/xe/xe_mmio.c         | 39 ++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6617c86a096b..d404f211bc36 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -69,6 +69,7 @@
 
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
+#define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
 
 #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
 #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
@@ -142,6 +143,10 @@
 
 #define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
 #define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
+#define XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK	REG_GENMASK(31, 6)
+
+#define XE2_FLAT_CCS_BASE_RANGE_UPPER		XE_REG_MCR(0x8804)
+#define XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK	REG_GENMASK(7, 0)
 
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5d13fc7cb9d2..d66da1a9f165 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -163,6 +163,42 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	return 0;
 }
 
+static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 offset;
+	u32 reg;
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		u64 ccs_size = tile_size / 512;
+		u64 offset_hi, offset_lo;
+		u32 nodes, num_enabled;
+
+		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
+		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
+		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
+
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
+		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
+
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
+		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
+
+		offset = offset_hi << 32; /* HW view bits 39:32 */
+		offset |= offset_lo << 6; /* HW view bits 31:6 */
+		offset *= num_enabled; /* convert to SW view */
+
+		/* We don't expect any holes */
+		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
+			      "Hole between CCS and GSM.\n");
+	} else {
+		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
+		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
+	}
+
+	return offset;
+}
+
 /**
  * xe_mmio_tile_vram_size() - Collect vram size and offset information
  * @tile: tile to get info for
@@ -207,8 +243,7 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 
 	/* minus device usage */
 	if (xe->info.has_flat_ccs) {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
-		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
+		offset = get_flat_ccs_offset(gt, *tile_size);
 	} else {
 		offset = xe_mmio_read64_2x32(gt, GSMBASE);
 	}
-- 
2.25.1

