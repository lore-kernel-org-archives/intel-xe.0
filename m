Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201E8CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 21:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A6410E160;
	Fri, 26 Sep 2025 21:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuxO+xLA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98410E160
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 21:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758920723; x=1790456723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NWAYQEtb7efuPZjQKtRYL5KqvwhRCHbx3HNwDTgxpE0=;
 b=BuxO+xLA8IwX93/qIEWaKs/YeMPWMBL9rGhweR7jGP5lgL2wM3xGflg2
 9ikaD2rA1AWcXWiUhGFyNCdnxVqZq4nsOId9BOXKY8Kjclvedb5PnOmLa
 i0DIh+7X3bDqF2/+Gmo+/JXDIROyab96aF02lhEL03j3gfH8WweiVc8NU
 61j+sU+bmoafzqIDKCcHD3+PdXhKYsEsautgBKmBm7KDwJzQdtcCqqyHa
 OV6ybkfebhOXvJB4Khup8u0Z8dj2N0eoJ9wqYc2BbcdqF/abGk4viZNgl
 Ifrhu4btrpRuN9L5kU6Tg2NS1ZO6lVnPDDRgan6itm9UFsDxcpwKNzySR g==;
X-CSE-ConnectionGUID: aA5No/MjQn+UkLdprLrXyQ==
X-CSE-MsgGUID: ijstPgW+T/ONcQ7sU1BWbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78689490"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="78689490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:05:23 -0700
X-CSE-ConnectionGUID: 63g0BPMYRfeO1n4UgGd1FA==
X-CSE-MsgGUID: i16U1OFWSCueSYvl407Arg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="182010513"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:05:15 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe: TileAddrRange registers are deprecated.
Date: Fri, 26 Sep 2025 14:09:59 -0700
Message-ID: <20250926211000.318643-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926211000.318643-1-fei.yang@intel.com>
References: <20250926211000.318643-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

Replace it with Register_SGAddrRangeforTile which points to MMIO(0x1083a0).

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_vram.c         | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06cb6b02ec64..89a44198ca9d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -99,6 +99,8 @@
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
 
+#define XEHP_SG_TILE_ADDR_RANGE(_idx)		XE_REG(0x1083a0 + (_idx) * 4)
+
 #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
 #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..74cc04412abc 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -255,7 +255,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
 		*tile_offset = 0;
 	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+		reg = xe_mmio_read32(&tile->mmio, XEHP_SG_TILE_ADDR_RANGE(tile->id));
 		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
 		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
 	}
-- 
2.43.0

