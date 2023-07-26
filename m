Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25446C04A6A
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39CB10E4A2;
	Wed, 26 Jul 2023 16:10:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6799A10E49F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLoYNl9s9BAjs1cdBlfWH2enaktoznQeJFjaAFxiLMw=;
 b=eCAcMVavxDasQg23vwIG4hgqsdMdV3kRcbzm7vx17z+PQmNEwPKvXba+
 VFt73ipBgUX8vt6X5B4EUx4FyApZLqb3t7wIZ9+hiSa1g2Y+CbaKeBERe
 sVHnkrRNnQim4G+cekpreTd3j9lJSiYiXQeqHAAwMhdVN8MtCjwHSrQH0
 cF2zWdwteLqVi5WzU7PWHIkDTgWlJXqTyIfxPVC8xL+jl+j6gR+dnYIHc
 dVD4FQp1OJDl2B7qNNbuElU0d/qi3xvOVKvhta4F7xvf+B8ojKzq0lQ9u
 e3pNMpYff5Kf+iA+EGI7pCzHHGZY72wY/zg06Tum2YXQ8BjK5rPCX8gkN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994905"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994905"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279375"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279375"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:06 -0700
Message-Id: <20230726160708.3967790-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/10] drm/xe: Fix MTL+ stolen memory mapping
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT
mapping"). For stolen on MTL and beyond, the address in the PTE is the
offset from DSM base. While at it, update the comments explaining each
part of the calculation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

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

