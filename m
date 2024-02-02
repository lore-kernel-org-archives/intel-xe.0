Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0BC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5810F13B;
	Fri,  2 Feb 2024 22:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9+fNQB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8610F13B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914291; x=1738450291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mhf0HBYM3U4O1b92wLfUrNwgneLedbF22sCN3wrca+U=;
 b=b9+fNQB8R/Iddbxe/BOSd3g1FO0BTNo2/ulnII54GYZJCZWDBicyJMfg
 pxCRs1bf1GmOdfVfUvWuskEq4V0szqzXbQzsafacxolCGqYQ+cIEcnQjm
 e//ajlAxHpmlv/vFtj9vGA2XykgTnRLHVCwEPOUVKkXCTc3TgChF6wtHC
 tRlg6s+B0V1G519rtpj356+clqXI48yauSmZ5Qj/6y0SKAQkU8mnXoyfq
 rzdRk0HidNCGy0AHXJ7C/AZTf3aJ8s7BPOOZSgRMfmTFQiMqvXLQAU1f0
 jezoAVHGh56ytU7x0PqT1skdnuyDsWhMpN5vTASQXxQ1ZFXMbUE+mLJjz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153772"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153772"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332050"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332050"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:18 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 10/16] drm/i915: s/phys_base/dma_addr/
Date: Sat,  3 Feb 2024 00:43:34 +0200
Message-ID: <20240202224340.30647-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The address we read from the PTE is a dma address, not a physical
address. Rename the variable to say so.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_plane_initial.c    | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index c72d4cacf631..48b74319f45c 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -61,6 +61,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
 	if (IS_DGFX(i915) || HAS_LMEMBAR_SMEM_STOLEN(i915)) {
 		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+		dma_addr_t dma_addr;
 		gen8_pte_t pte;
 
 		gte += base / I915_GTT_PAGE_SIZE;
@@ -72,7 +73,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 			return NULL;
 		}
 
-		phys_base = pte & GEN12_GGTT_PTE_ADDR_MASK;
+		dma_addr = pte & GEN12_GGTT_PTE_ADDR_MASK;
 
 		if (IS_DGFX(i915))
 			mem = i915->mm.regions[INTEL_REGION_LMEM_0];
@@ -88,18 +89,18 @@ initial_plane_vma(struct drm_i915_private *i915,
 		 * On lmem we don't currently expect this to
 		 * ever be placed in the stolen portion.
 		 */
-		if (phys_base < mem->region.start || phys_base > mem->region.end) {
+		if (dma_addr < mem->region.start || dma_addr > mem->region.end) {
 			drm_err(&i915->drm,
-				"Initial plane programming using invalid range, phys_base=%pa (%s [%pa-%pa])\n",
-				&phys_base, mem->region.name, &mem->region.start, &mem->region.end);
+				"Initial plane programming using invalid range, dma_addr=%pa (%s [%pa-%pa])\n",
+				&dma_addr, mem->region.name, &mem->region.start, &mem->region.end);
 			return NULL;
 		}
 
 		drm_dbg(&i915->drm,
-			"Using phys_base=%pa, based on initial plane programming\n",
-			&phys_base);
+			"Using dma_addr=%pa, based on initial plane programming\n",
+			&dma_addr);
 
-		phys_base -= mem->region.start;
+		phys_base = dma_addr - mem->region.start;
 	} else {
 		phys_base = base;
 		mem = i915->mm.stolen_region;
-- 
2.43.0

