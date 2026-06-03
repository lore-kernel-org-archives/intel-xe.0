Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A97CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E576F10FFB7;
	Wed,  3 Jun 2026 15:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIpcNubZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611A410FFC2;
 Wed,  3 Jun 2026 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499698; x=1812035698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TfgMoUxVCAGeBcQaYvzYCyz34zlmQpfAUpt94mR5Lhg=;
 b=eIpcNubZkN6PULmMTfEWFJeqJO8XovYqFEI9lFiCdn3g60Unbrylsoy6
 vseL55L5XGJnJRexhW6FlbPnC4QDJHUhyz+nO1L6TxtsLAbKFhXNpPM7G
 oBVam6af15U7SB97lxl4cGlwhzKZJVrCBk7X32388i9Be887tufsXX1jq
 QqqEdWVmYqIUIdFJYTRlLj2+TxlQIAUrd16zlTxeQiRMawHm/zrw2K+VS
 SG1yj8eDMVjurmHheoiefo9CtNlyYPv/xgFqvH40EwPRYhPKUg8UsbrKu
 HqwEB0EoP8qBADtzyCa+wM/VeHyNfpyojmb6ILM8EvCxoFFlD4dk37bz0 Q==;
X-CSE-ConnectionGUID: Mlq+aRPAS5GGnrKbZY+p9g==
X-CSE-MsgGUID: cJ3N3RFDSESgaSNseIXtOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="98886430"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="98886430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:58 -0700
X-CSE-ConnectionGUID: BEQ34UyGQ4ebpkurZmYvcg==
X-CSE-MsgGUID: IKf4rDJiTB6W5K6trAkONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243425754"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/8] drm/i915/color: reduce indent in
 xelpd_program_plane_post_csc_lut()
Date: Wed,  3 Jun 2026 18:14:31 +0300
Message-ID: <cb60ebb0c5fe67331425ba51280cea4ba111c577.1780499355.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780499355.git.jani.nikula@intel.com>
References: <cover.1780499355.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Return early for !icl_is_hdr_plane() to reduce indent.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

'git show -w' for easy review
---
 drivers/gpu/drm/i915/display/intel_color.c | 79 +++++++++++-----------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 429eb6daa7d2..5209a4cdd14d 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4024,48 +4024,49 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 	int i, lut_size = 32;
 	u32 lut_val;
 
-	if (icl_is_hdr_plane(display, plane)) {
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
-		/* TODO: Add macro */
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
-		if (post_csc_lut) {
-			for (i = 0; i < lut_size; i++) {
-				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
-
-			/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			} while (i++ < 34);
-		} else {
-			/*TODO: Add for segment 0 */
-			for (i = 0; i < lut_size; i++) {
-				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
-
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   1 << 24);
-			} while (i++ < 34);
+	if (!icl_is_hdr_plane(display, plane))
+		return;
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+	/* TODO: Add macro */
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+	if (post_csc_lut) {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		}
+
+		/* Segment 2 - clamp to the last LUT value to prevent step discontinuity */
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		} while (i++ < 34);
+	} else {
+		/*TODO: Add for segment 0 */
+		for (i = 0; i < lut_size; i++) {
+			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
 		}
 
-		intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-		intel_de_write_dsb(display, dsb,
-				   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   1 << 24);
+		} while (i++ < 34);
 	}
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	intel_de_write_dsb(display, dsb,
+			   PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0), 0);
 }
 
 static void
-- 
2.47.3

