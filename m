Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AB2C3DA41
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 16:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A47910E163;
	Tue, 25 Jul 2023 16:43:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A4310E163
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690303417; x=1721839417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FWXhXH49eQPAiQWKzddI2ZFEbd/R8lw0tC3rqOfgV/c=;
 b=abGAMiUPsxI+jgeSkZWQqv/0CsLNHmv9HWVlLURdXtpYAQ4td66hgfrW
 6I4UG0vze8e8cLZ0upR/8vv/V5GKQmYycqnSBlwCjFxQgwY2AUOkQQdDU
 kmQ8KrzBj20ATmiZzJME9eCM9/U2VbDSlOTxcHeBx+Um+S5CmH1vNCKTI
 DVhbr0XpxVY+GYFjcsh54ujaqTEX6LB5C3NAXBYp5H2udiOh4UkvNu/NU
 9tw51lVYAlavQ3sv0rOPJHAm9tZwIJGeVV2mnuxvMthB+lJ6rpDCwDWO7
 kZ6i3/me0CSzmtIDo83KevswdEasasp1pLHObzz2BlJ18uDcnKsg6EUjT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454166433"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="454166433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 09:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720109880"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="720109880"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 09:43:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 09:43:44 -0700
Message-Id: <20230725164344.3797085-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix MTL+ stolen memory mapping
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Untested as stolen in MTL is supposedly to be disabled. Need to find a
proper way to test it.

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

