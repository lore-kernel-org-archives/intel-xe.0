Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF7C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 16:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC7D10EB73;
	Fri,  7 Feb 2025 16:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPcJROjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8979010EB70
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738945441; x=1770481441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VpKkhKPCwP/eWjXtyw93qnuZirQn/Fe0LjWFYpfLIZQ=;
 b=EPcJROjtZ+mdkquQTg+xo3hd1IC86uWRlmgyZNQKa4OuAb8tPSlcTyon
 GBVpVV8zsIwwhvSenOuuO0IHdBAFDM27jllQH8f4j7aVXFmpjDWQPGcyE
 VeUkB4CTC6SO5IeA+IGuogcKADdniy1VxjYS071pCYzeTLp3pm7tX9FC0
 6t9bFPlpM/RH/GhicpKhPSmhxKwwPad52A0+8FbGwx3lbdOEVGMVL+iMw
 hnxtKN+yhbs0j0NoTd66IRhvqPot6RaFKxzVGXxVLm4fk7Rgm1DoHsscw
 iF2WjNn11B0KxC+BGParnKSyQrIR5oWOZTHQbFfBMBHXCBh4if1dIJl2J Q==;
X-CSE-ConnectionGUID: K6VrdoZEQD+45QPzoE6sAA==
X-CSE-MsgGUID: BnMX5kqeToa/sCYVEjqvcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39500228"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39500228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:24:01 -0800
X-CSE-ConnectionGUID: oM55lDiSRhy1fQr81Ew6/A==
X-CSE-MsgGUID: ulxWW6C3S7CUFqVmkLG45g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116768616"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:24:00 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Carve out wopcm portion from the stolen memory
Date: Fri,  7 Feb 2025 17:43:34 +0100
Message-ID: <20250207164334.1393054-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Top of stolen memory is wopcm which shouldn't be accessed so remove
that portion of memory from the stolen memory.

Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 54 ++++++++++++++------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 423856cc18d4..d414421f8c13 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -57,12 +57,35 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
 }
 
+static u32 get_wopcm_size(struct xe_device *xe)
+{
+	u32 wopcm_size;
+	u64 val;
+
+	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
+	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
+
+	switch (val) {
+	case 0x5 ... 0x6:
+		val--;
+		fallthrough;
+	case 0x0 ... 0x3:
+		wopcm_size = (1U << val) * SZ_1M;
+		break;
+	default:
+		WARN(1, "Missing case wopcm_size=%llx\n", val);
+		wopcm_size = 0;
+	}
+
+	return wopcm_size;
+}
+
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	u64 stolen_size;
+	u64 stolen_size, wopcm_size;
 	u64 tile_offset;
 	u64 tile_size;
 
@@ -74,7 +97,13 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
+	/* Carve out the top of DSM as it contains the reserved WOPCM region */
+	wopcm_size = get_wopcm_size(xe);
+	if (drm_WARN_ON(&xe->drm, !wopcm_size))
+		return 0;
+
 	stolen_size = tile_size - mgr->stolen_base;
+	stolen_size -= wopcm_size;
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
@@ -89,29 +118,6 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	return ALIGN_DOWN(stolen_size, SZ_1M);
 }
 
-static u32 get_wopcm_size(struct xe_device *xe)
-{
-	u32 wopcm_size;
-	u64 val;
-
-	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
-	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
-
-	switch (val) {
-	case 0x5 ... 0x6:
-		val--;
-		fallthrough;
-	case 0x0 ... 0x3:
-		wopcm_size = (1U << val) * SZ_1M;
-		break;
-	default:
-		WARN(1, "Missing case wopcm_size=%llx\n", val);
-		wopcm_size = 0;
-	}
-
-	return wopcm_size;
-}
-
 static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-- 
2.46.0

