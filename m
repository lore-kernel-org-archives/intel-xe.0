Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C93C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFDB10F134;
	Fri,  2 Feb 2024 22:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bgt/QMLT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E3A10F134
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914295; x=1738450295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgY4ry9kRTJaiJ7GZYAJ3kJYultqMQE50K6ZzOMgPlU=;
 b=Bgt/QMLTlCBsxVypjXqT3ZaUe076EyVBy0RHhXqfiEWOJa/LAbnEVhQs
 h0nfATvjTrAC8ENVz0S9UIi3mclV6f1r7aH1uDffMSxY9rPgaWJSRWbAy
 DUI3OHzZS8waneywf0CD0WCuAVb6ARUrixOFj65u7EHMwMLSiDno5ZoDk
 MLKDlAskN7PSm2iE4HMFHvA7R40ntqK+S9uf8WQkDmvoSnFUev72ZgAEz
 Uu20yfl9vpYTU0corrljii5/ddLKB6hYjrxUostkEVWJMzEeO5dc7NEeg
 vev6HOQaH15V3U50uYBeyFxUGoBDdigB9i18KPAjpDx4uvZfqK/0zrapq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153774"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153774"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332057"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332057"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:23 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:22 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 11/16] drm/i915: Split the smem and lmem plane readout apart
Date: Sat,  3 Feb 2024 00:43:35 +0200
Message-ID: <20240202224340.30647-12-ville.syrjala@linux.intel.com>
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

Declutter initial_plane_vma() a bit by pulling the lmem and smem
readout paths into their own functions.

TODO: the smem path should still be fixed to get and validate
      the dma address from the pte as well

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   2 +
 .../drm/i915/display/intel_plane_initial.c    | 145 +++++++++++-------
 2 files changed, 95 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index ae2e8cff9d69..319ba7aed4fa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -780,6 +780,8 @@ struct intel_plane_state {
 
 struct intel_initial_plane_config {
 	struct intel_framebuffer *fb;
+	struct intel_memory_region *mem;
+	resource_size_t phys_base;
 	struct i915_vma *vma;
 	unsigned int tiling;
 	int size;
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 48b74319f45c..78bff6181ceb 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -44,6 +44,93 @@ intel_reuse_initial_plane_obj(struct drm_i915_private *i915,
 	return false;
 }
 
+static bool
+initial_plane_phys_lmem(struct drm_i915_private *i915,
+			struct intel_initial_plane_config *plane_config)
+{
+	gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+	struct intel_memory_region *mem;
+	dma_addr_t dma_addr;
+	gen8_pte_t pte;
+	u32 base;
+
+	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
+
+	gte += base / I915_GTT_PAGE_SIZE;
+
+	pte = ioread64(gte);
+	if (!(pte & GEN12_GGTT_PTE_LM)) {
+		drm_err(&i915->drm,
+			"Initial plane programming missing PTE_LM bit\n");
+		return false;
+	}
+
+	dma_addr = pte & GEN12_GGTT_PTE_ADDR_MASK;
+
+	if (IS_DGFX(i915))
+		mem = i915->mm.regions[INTEL_REGION_LMEM_0];
+	else
+		mem = i915->mm.stolen_region;
+	if (!mem) {
+		drm_dbg_kms(&i915->drm,
+			    "Initial plane memory region not initialized\n");
+		return false;
+	}
+
+	/*
+	 * On lmem we don't currently expect this to
+	 * ever be placed in the stolen portion.
+	 */
+	if (dma_addr < mem->region.start || dma_addr > mem->region.end) {
+		drm_err(&i915->drm,
+			"Initial plane programming using invalid range, dma_addr=%pa (%s [%pa-%pa])\n",
+			&dma_addr, mem->region.name, &mem->region.start, &mem->region.end);
+		return false;
+	}
+
+	drm_dbg(&i915->drm,
+		"Using dma_addr=%pa, based on initial plane programming\n",
+		&dma_addr);
+
+	plane_config->phys_base = dma_addr - mem->region.start;
+	plane_config->mem = mem;
+
+	return true;
+}
+
+static bool
+initial_plane_phys_smem(struct drm_i915_private *i915,
+			struct intel_initial_plane_config *plane_config)
+{
+	struct intel_memory_region *mem;
+	u32 base;
+
+	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
+
+	mem = i915->mm.stolen_region;
+	if (!mem) {
+		drm_dbg_kms(&i915->drm,
+			    "Initial plane memory region not initialized\n");
+		return false;
+	}
+
+	/* FIXME get and validate the dma_addr from the PTE */
+	plane_config->phys_base = base;
+	plane_config->mem = mem;
+
+	return true;
+}
+
+static bool
+initial_plane_phys(struct drm_i915_private *i915,
+		   struct intel_initial_plane_config *plane_config)
+{
+	if (IS_DGFX(i915) || HAS_LMEMBAR_SMEM_STOLEN(i915))
+		return initial_plane_phys_lmem(i915, plane_config);
+	else
+		return initial_plane_phys_smem(i915, plane_config);
+}
+
 static struct i915_vma *
 initial_plane_vma(struct drm_i915_private *i915,
 		  struct intel_initial_plane_config *plane_config)
@@ -58,59 +145,13 @@ initial_plane_vma(struct drm_i915_private *i915,
 	if (plane_config->size == 0)
 		return NULL;
 
+	if (!initial_plane_phys(i915, plane_config))
+		return NULL;
+
+	phys_base = plane_config->phys_base;
+	mem = plane_config->mem;
+
 	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
-	if (IS_DGFX(i915) || HAS_LMEMBAR_SMEM_STOLEN(i915)) {
-		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
-		dma_addr_t dma_addr;
-		gen8_pte_t pte;
-
-		gte += base / I915_GTT_PAGE_SIZE;
-
-		pte = ioread64(gte);
-		if (!(pte & GEN12_GGTT_PTE_LM)) {
-			drm_err(&i915->drm,
-				"Initial plane programming missing PTE_LM bit\n");
-			return NULL;
-		}
-
-		dma_addr = pte & GEN12_GGTT_PTE_ADDR_MASK;
-
-		if (IS_DGFX(i915))
-			mem = i915->mm.regions[INTEL_REGION_LMEM_0];
-		else
-			mem = i915->mm.stolen_region;
-		if (!mem) {
-			drm_dbg_kms(&i915->drm,
-				    "Initial plane memory region not initialized\n");
-			return NULL;
-		}
-
-		/*
-		 * On lmem we don't currently expect this to
-		 * ever be placed in the stolen portion.
-		 */
-		if (dma_addr < mem->region.start || dma_addr > mem->region.end) {
-			drm_err(&i915->drm,
-				"Initial plane programming using invalid range, dma_addr=%pa (%s [%pa-%pa])\n",
-				&dma_addr, mem->region.name, &mem->region.start, &mem->region.end);
-			return NULL;
-		}
-
-		drm_dbg(&i915->drm,
-			"Using dma_addr=%pa, based on initial plane programming\n",
-			&dma_addr);
-
-		phys_base = dma_addr - mem->region.start;
-	} else {
-		phys_base = base;
-		mem = i915->mm.stolen_region;
-		if (!mem) {
-			drm_dbg_kms(&i915->drm,
-				    "Initial plane memory region not initialized\n");
-			return NULL;
-		}
-	}
-
 	size = round_up(plane_config->base + plane_config->size,
 			mem->min_page_size);
 	size -= base;
-- 
2.43.0

