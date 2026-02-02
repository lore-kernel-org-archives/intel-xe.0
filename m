Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E2E7FDEF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B18410E409;
	Mon,  2 Feb 2026 21:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIE3EMzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74610E406;
 Mon,  2 Feb 2026 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068650; x=1801604650;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qwEGRBHUsuvtZsEDOMB1v1XNLRyAphGdi5aPf9Y02pw=;
 b=kIE3EMzdmw8cod/WCFXsm9ECtTQ93VjASTNrP22+J8zKt3J20HpozaUX
 N5+P1TnTNP1Lxj8ihPANIlwvA7UR+wfRkGcrJ+nDFFNL9yrAGdMZ/I2Nt
 cpU0hGIWT+rhAA+O160UBMWL1ssBYL3v2k9meQWsP6OK/LcD+s4p5/p6J
 fdjtbgicZ+NfAZvPmGM1mjMEriZZiWzKS/aK5CJKfKEqk4tLNDypxPYjo
 A+0s3tenvUEwO6/Js+c+bwTe9kinS6eO0Woc/d5o3ruiStc/ebADJVghv
 rLafojVNkKvzqjCA1LqJ34Gb/ujh5A8FnUXo6oNXY314k6qBWYK9+bl1w w==;
X-CSE-ConnectionGUID: dYKYEJMrTNqInVj6zCQCrw==
X-CSE-MsgGUID: hO5C4yhWRYm44L+xdSX9Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814330"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:10 -0800
X-CSE-ConnectionGUID: MERr8XqJRIS9fxBTYvrPwA==
X-CSE-MsgGUID: MVAxfLFiSpy+ygn0k+gCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646820"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:08 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:09 -0300
Subject: [PATCH 03/16] drm/xe/pat: Differentiate between primary and media
 for PTA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-3-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
X-Mailer: b4 0.15-dev
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

Differently from currently supported platforms, in upcoming changes we
will need to have different PAT entries for PTA based on the GT type. As
such, let's prepare the code to support that by having two separate
PTA-specific members in the pat struct, one for each type of GT.

While at it, also fix the kerneldoc for pat_ats.

Co-developed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++++---
 drivers/gpu/drm/xe/xe_pat.c          | 27 ++++++++++++++++++---------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 34feef79fa4e..4508ed54d1d5 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -568,10 +568,12 @@ struct xe_device {
 		const struct xe_pat_table_entry *table;
 		/** @pat.n_entries: Number of PAT entries */
 		int n_entries;
-		/** @pat.ats_entry: PAT entry for PCIe ATS responses */
+		/** @pat.pat_ats: PAT entry for PCIe ATS responses */
 		const struct xe_pat_table_entry *pat_ats;
-		/** @pat.pta_entry: PAT entry for page table accesses */
-		const struct xe_pat_table_entry *pat_pta;
+		/** @pat.pat_primary_pta: primary GT PAT entry for page table accesses */
+		const struct xe_pat_table_entry *pat_primary_pta;
+		/** @pat.pat_media_pta: media GT PAT entry for page table accesses */
+		const struct xe_pat_table_entry *pat_media_pta;
 		u32 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 14d0dce5190a..5776ea67fe02 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -284,8 +284,10 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 
 	if (xe->pat.pat_ats)
 		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_pta)
-		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_pta->value);
+	if (xe->pat.pat_primary_pta && xe_gt_is_main_type(gt))
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_primary_pta->value);
+	if (xe->pat.pat_media_pta && xe_gt_is_media_type(gt))
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), xe->pat.pat_media_pta->value);
 }
 
 static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
@@ -301,8 +303,10 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	if (xe->pat.pat_ats)
 		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->value);
-	if (xe->pat.pat_pta)
-		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_pta->value);
+	if (xe->pat.pat_primary_pta && xe_gt_is_main_type(gt))
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_primary_pta->value);
+	if (xe->pat.pat_media_pta && xe_gt_is_media_type(gt))
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), xe->pat.pat_media_pta->value);
 }
 
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -527,7 +531,8 @@ void xe_pat_init_early(struct xe_device *xe)
 		xe->pat.ops = &xe3p_xpc_pat_ops;
 		xe->pat.table = xe3p_xpc_pat_table;
 		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
-		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
+		xe->pat.pat_primary_pta = &xe3p_xpc_pat_pta;
+		xe->pat.pat_media_pta = &xe3p_xpc_pat_pta;
 		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
 		xe->pat.idx[XE_CACHE_NONE] = 3;
 		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
@@ -541,8 +546,10 @@ void xe_pat_init_early(struct xe_device *xe)
 			xe->pat.table = xe2_pat_table;
 		}
 		xe->pat.pat_ats = &xe2_pat_ats;
-		if (IS_DGFX(xe))
-			xe->pat.pat_pta = &xe2_pat_pta;
+		if (IS_DGFX(xe)) {
+			xe->pat.pat_primary_pta = &xe2_pat_pta;
+			xe->pat.pat_media_pta = &xe2_pat_pta;
+		}
 
 		/* Wa_16023588340. XXX: Should use XE_WA */
 		if (GRAPHICS_VERx100(xe) == 2001)
@@ -649,6 +656,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	const struct xe_pat_table_entry *pta_entry = xe_gt_is_main_type(gt) ?
+		xe->pat.pat_primary_pta : xe->pat.pat_media_pta;
 	char label[PAT_LABEL_LEN];
 
 	if (!xe->pat.table || !xe->pat.n_entries)
@@ -675,8 +684,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 		}
 	}
 
-	if (xe->pat.pat_pta) {
-		u32 pat = xe->pat.pat_pta->value;
+	if (pta_entry) {
+		u32 pat = pta_entry->value;
 
 		drm_printf(p, "Page Table Access:\n");
 		xe2_pat_entry_dump(p, "PTA_MODE", pat, false);

-- 
2.52.0

