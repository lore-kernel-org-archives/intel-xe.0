Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD9CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5635B10E4A4;
	Mon, 29 Sep 2025 20:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjIyXwhY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEDA10E4A4
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759176463; x=1790712463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kBhgAQ4F3J+y9gHiTZ93brHhjhAuXD0Gz3kKZ7injVo=;
 b=GjIyXwhYVdtqGWQ466C1sgqyXsIiPdJBYEPBn2AlKRTXwp53Xa21IvdS
 gQ4RxrDwud9SWl6A1o6Cz9RVcWqHYNMjN/72zl4aYDk5h3IzhWvLv5qXj
 HrEhystEfL5rjJWhFYxdcid/oBP4qgC0knGfkLCiwAwEPW53wqPlAMdHq
 12cYQIn1xrBduh+bBbHb50/zoPltVl4JXLr4u5TIQkqZZ/hxjARE95VXd
 cSUEtGmMvL3SdkFOyFNvDUbI0WaxLL9Q7RzixO2u6+7ssCm3G0Mam8KXa
 2zmT+WdGdEdspokOOIm444rCDcXtgcgVxEzp3GF+5ZrWjEWVo3ueLP8E5 A==;
X-CSE-ConnectionGUID: 0pjlWzvSS3SWh0aUfVmoug==
X-CSE-MsgGUID: TMszwVRJSV+aqUFeYm/hAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60638881"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="60638881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 13:07:43 -0700
X-CSE-ConnectionGUID: LO+wTOQ7QPyyGnJwH5OMLQ==
X-CSE-MsgGUID: MQ1QsSyVQAmLS4w9RUkKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178364472"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 13:07:43 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/1] drm/xe: TileAddrRange registers are being deprecated.
Date: Mon, 29 Sep 2025 13:12:21 -0700
Message-ID: <20250929201222.337295-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929201222.337295-1-fei.yang@intel.com>
References: <20250929201222.337295-1-fei.yang@intel.com>
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

Quoting BSpec: 59353, "The TILEx_ADDR_RANGE registers no longer have any
impact on HW behavior. They now function only as scratch registers for
communication between SoC FW and the GPU driver, and will eventually be
replaced by equivalent registers within SoC MMIO space. At that point,
these registers can be deprecated from XeTLB.".
While the transition is ongoing, the SGAddrRangeforTile continues to be
valid, reading that instead to avoid potential breakage.

BSpec: 59353, 54991
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

