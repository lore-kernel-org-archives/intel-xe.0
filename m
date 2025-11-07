Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED5ECCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F87410EB65;
	Fri,  7 Nov 2025 18:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iE83o+ew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA1D10E1D2
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539860; x=1794075860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4KyA6vZEW5avUHNCb9jskIckd4Ala+N7urBFwvHa6M=;
 b=iE83o+ewWeVJwcegkHl9b4323gXVvb5IBroNoAqQQC0CkNK9eoy02Z17
 0IAr2pNprw2EOHBGlfXIwchbP/edmj1p2PUeSbA0ETIGqqrm7H84URLIn
 rv3MyPFvXg4oOqrifysq5gP09id1SMMtQ61PTFZOgx0Kd/P33U6BEKMRA
 2v2nUDevrAa98bLX6Hy3VCImTDsKT22vzrmgs23ULWMD1bbABoDpqr6zJ
 ThAauKrgcAEEmNSynjT0UC/Yr04oLjSPUtFHYA8ShFcL2HtP3m02AjIxy
 bX5TFaBzUt0WET0T8/JbaZensjNjrKZ6CXVayGpmpwVdP39uF4V/kOEaJ w==;
X-CSE-ConnectionGUID: dELVKaFATomReeB1oXni4A==
X-CSE-MsgGUID: mMN6YFt4RimRppDiUqgEWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64601684"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64601684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
X-CSE-ConnectionGUID: ftnG9IK/RMmWh049HQk43w==
X-CSE-MsgGUID: VKRdCTlwRfCFtzAXsjsxPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218756752"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:24:20 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, fei.yang@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Use SG_TILE_ADDR_RANGE instead of TILE_ADDR_RANGE
Date: Fri,  7 Nov 2025 10:23:44 -0800
Message-ID: <20251107-tile-addr-v1-1-a3014aadc2e7@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
References: <20251107-tile-addr-v1-0-a3014aadc2e7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

From: Fei Yang <fei.yang@intel.com>

The TILE_ADDR_RANGE register is not available on all platforms going
forward as it was deprecated and is being replaced by equivalent
registers within SoC MMIO space. While that doesn't happen, the
SG_TILE_ADDR_RANGE (base 0x1083a0) is still valid for all platforms
supported by xe. Use that instead.

BSpec: 59353, 54991
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
 drivers/gpu/drm/xe/regs/xe_regs.h    | 2 ++
 drivers/gpu/drm/xe/xe_vram.c         | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2088256ad3819..917a088c28f24 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -101,7 +101,6 @@
 
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
-#define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 1926b4044314e..ad93c57edd17c 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -40,6 +40,8 @@
 #define STOLEN_RESERVED				XE_REG(0x1082c0)
 #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
 
+#define SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
+
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
 #define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b62a96f8ef9eb..56924f6a44ff2 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -274,7 +274,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
 		*tile_offset = 0;
 	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
 		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
 	}

-- 
2.51.2

