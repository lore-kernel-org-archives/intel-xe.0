Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA28CD6E60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C21110FFB9;
	Wed,  3 Jun 2026 15:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4G59aZp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC31E10FF82;
 Wed,  3 Jun 2026 15:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499693; x=1812035693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QyKYhemHxDBUR3FO9a/ScH/xl+MHrN/aPyPLkBzaSw4=;
 b=W4G59aZpT6volgQRzHy2e1fWE9bFAnzmIPAHR7OYoPSBO9LjHXEwq/Ih
 7t48UHf8saqG08p+00q0gwu++CuANAu8qkvxd/mZrk//jL7PsX7sz81QJ
 XmgO3/2Mt/u1wVBZg39R+TB0s6QR4qovSfxR/fX8c2hK8YURGJluf7hnQ
 CLRBfCELTQQ2lQ8eGOJnoiG29vJoGA52+8mfzEhKcG4K+jhQx3IIHL5xk
 nAt/cUhMNo/979q94FQIJaFfsrOhG8Fz+M6cwVv2Fbwu2F+MKSOe9plV4
 KZm5Yp0PYm5VEGzcDvzxE9829EoAhCdXCqNcKzhaxrmL/oGn5t4W11seR A==;
X-CSE-ConnectionGUID: LXaxmTBrTvGlPO4ekSGxMA==
X-CSE-MsgGUID: tQvdgNU/Q0KRdD0lbS/j/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92421179"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="92421179"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:53 -0700
X-CSE-ConnectionGUID: cPuaZEztTbq3VjMnTrpUtQ==
X-CSE-MsgGUID: xHffgHkmTMun9pzO33q5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244380806"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:14:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/8] drm/i915/color: reduce indent in
 xelpd_program_plane_pre_csc_lut()
Date: Wed,  3 Jun 2026 18:14:30 +0300
Message-ID: <ba09d28e1dfb74ecd7c06c3554df485dbcca9a8a.1780499355.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/i915/display/intel_color.c | 63 +++++++++++-----------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index cf910baa69f3..429eb6daa7d2 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3970,45 +3970,46 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	int i, lut_size = 128;
 	u32 lut_val;
 
-	if (icl_is_hdr_plane(display, plane)) {
-		intel_de_write_dsb(display, dsb,
-				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
+	if (!icl_is_hdr_plane(display, plane))
+		return;
 
-		if (pre_csc_lut) {
-			for (i = 0; i < lut_size; i++) {
-				lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+	intel_de_write_dsb(display, dsb,
+			   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
 
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
+	if (pre_csc_lut) {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
 
-			/* Program the max register to clamp values > 1.0. */
-			/* TODO: Restrict to 0x7ffffff */
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			} while (i++ < 130);
-		} else {
-			for (i = 0; i < lut_size; i++) {
-				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		}
 
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
+		/* Program the max register to clamp values > 1.0. */
+		/* TODO: Restrict to 0x7ffffff */
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		} while (i++ < 130);
+	} else {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
 
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   1 << 24);
-			} while (i++ < 130);
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
 		}
 
-		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   1 << 24);
+		} while (i++ < 130);
 	}
+
+	intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
 }
 
 static void
-- 
2.47.3

