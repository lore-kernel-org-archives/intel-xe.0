Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ADEC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 14:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9933410E165;
	Mon, 10 Feb 2025 14:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYOuiSvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2923C10E165
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739197038; x=1770733038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ogpju4rn4y72Vl+20jG04/9k/K+VkPiUIef+zwBQpHY=;
 b=WYOuiSvs0PRw3Dvf6PPRIHa4Ol+kicIzNlOqxoR/5vumwD8+P15/g87T
 9mWQB2nrTD/c30bmKtxwxkb3TOG6NtsJjwQARHeJiEiqn+5tX5vuKO3ff
 LqywNQrrvVbZ5BAtnjTXGsSzQM30QfPIonpRZZmosndZbrpPgxpa/u0tj
 cm9n+Lgk3IHeXfCy8Bg0hndjaREj+dn46bJKLiwDkgmcp1RSBkHqpOuu/
 9nyva6bWcMqjvUgQoT8J02mTRUXfJV57lT9u79ZxY5+HxjLRkGMW9mX5F
 m/oIFXBXyhccfh/x7mnMM4Kj+jKAw7UsI5OCFIrbsplDFi9ciaDm0GeB2 Q==;
X-CSE-ConnectionGUID: bYkZUJ4/SZ6yybPLeGzPLQ==
X-CSE-MsgGUID: Y4US0Z4wSiWnEPgoMrdaXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50762755"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50762755"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 06:17:17 -0800
X-CSE-ConnectionGUID: 7FEESJtaQ1KOnnsHQCMOOA==
X-CSE-MsgGUID: U1U93UBfRYeuodHGsjgpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="112837887"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 06:17:15 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/xe: Carve out wopcm portion from the stolen memory
Date: Mon, 10 Feb 2025 15:36:54 +0100
Message-ID: <20250210143654.2076747-1-nirmoy.das@intel.com>
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

The top of stolen memory is WOPCM, which shouldn't be accessed. Remove
this portion from the stolen memory region for discrete platforms.
This was already done for integrated, but was missing for discrete
platforms.

This also moves get_wopcm_size() so detect_bar2_dgfx() and
detect_bar2_integrated can use the same function.

v2: Improve commit message and suitable stable version tag(Lucas)

Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

