Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E82FC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1E10E3FC;
	Tue, 25 Jul 2023 20:28:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8F510E3F3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316905; x=1721852905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lJ9GA0bHYgFt4z0yb78zrnt1kH0TFp9kfJqc40mxlw=;
 b=GCZwPX4Xn9lX8jkoVNbZizs4/3vTHGHceic5dC/S6WmL1BjcRbVeksiW
 cKckww0mzlCuat0Z4y64/B7fy0pQKL9qLA2LtfG6qX36BGE95YAVnkeDA
 tLMIQgnjOblaulTX7NBvLpJJj+r+lEXKa5mngTPZSraCdZy0A3VQHCn62
 w4MA8Qz0FekpaTECEGWSwYcnO2RIktDeovqvMO5v5iHnFguGLeQJBsvJt
 K9rKE99quGMviwrQKoEStT/egr9R6QDi4j1TzImwxbp9UwmDsyonNyZKW
 PBU+LwJCx9Kwly0c91RxhUBP7yny/sidD/wpwxy7gxIUkdrR+xsYIGLES w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366717419"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366717419"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726220307"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726220307"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 13:28:33 -0700
Message-Id: <20230725202836.3854908-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725202836.3854908-1-lucas.demarchi@intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
mapping"). For stolen on MTL and beyond, the address in the PTE is the
offset from DSM base. While at it, update the comments explaining each
part of the calculation.

v2: Also change resource_is_stolen_vram() so the right PTE bit is set

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             |  3 ++-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 10858fcf4f62..5379d8e5affb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -61,7 +61,8 @@ bool mem_type_is_vram(u32 mem_type)
 
 static bool resource_is_stolen_vram(struct xe_device *xe, struct ttm_resource *res)
 {
-	return res->mem_type == XE_PL_STOLEN && IS_DGFX(xe);
+	return res->mem_type == XE_PL_STOLEN &&
+		(IS_DGFX(xe) || GRAPHICS_VERx100(xe) >= 1270);
 }
 
 static bool resource_is_vram(struct ttm_resource *res)
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 21ecc734f10a..271b3fba4129 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -94,11 +94,22 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 
 	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
 
-	/* check GGMS, should be fixed 0x3 (8MB) */
+	/*
+	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
+	 * GTT size
+	 */
 	if (drm_WARN_ON(&xe->drm, (ggc & GGMS_MASK) != GGMS_MASK))
 		return 0;
 
-	mgr->stolen_base = mgr->io_base = pci_resource_start(pdev, 2) + SZ_8M;
+	/*
+	 * Graphics >= 1270 uses the offset to the GSMBASE as address in the
+	 * PTEs, together with the DM flag being set. Previously there was no
+	 * such flag so the address was the io_base.
+	 *
+	 * DSMBASE = GSMBASE + 8MB
+	 */
+	mgr->stolen_base = SZ_8M;
+	mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
 
 	/* return valid GMS value, -EIO if invalid */
 	gms = REG_FIELD_GET(GMS_MASK, ggc);
-- 
2.40.1

