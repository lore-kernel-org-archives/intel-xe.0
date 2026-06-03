Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0A3CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 15:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5810FFBF;
	Wed,  3 Jun 2026 15:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E03howxR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C920810FFBA;
 Wed,  3 Jun 2026 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780499716; x=1812035716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zqflqdAEhDDIvifo+VuYs9r+VY8+2Oy8fDFW9Tbb3GI=;
 b=E03howxRt7MRg2i5qh+7PzdPBAkjV4OSQOPVL+QRnUeaVulvFaTc6sLu
 tSXqOXxvPEdW2v3vDlyf8lr+qbdvG6NKbrsl2Yz69Vqqb5BX4AFctQAj5
 zGbZnY4J/UVGcppAyxaJnROS0uNqREXOP9QSctS5FrtcApk7Ozt8UHQ0u
 lV+jklx+oRoEIKKV2i291LaqSDQLm+5L4WfBOh9m5TpABycrfhKNnef84
 MwqIVOBFnvMaqCKYIR0OYlmmsAMumw+HmqeuaKMWYt3OKYuDAhelQsB5E
 jOn4o0Sw6/Xlraeg8h0QmmKB5D1DVMt2tB+O4Uj3OSqzGQCMk1D/fSgHb Q==;
X-CSE-ConnectionGUID: 9Cm8j1O9RguzSe7exRgviA==
X-CSE-MsgGUID: PvP2kLVyRTOPTJMZtpIxAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91886818"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91886818"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:15 -0700
X-CSE-ConnectionGUID: peU2y1G4RWuhysSWh6w1OQ==
X-CSE-MsgGUID: OXEiS8NfQDOf1db/76PCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="240089393"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.189])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:15:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 8/8] drm/i915/color: deduplicate loops in
 xelpd_program_plane_post_csc_lut()
Date: Wed,  3 Jun 2026 18:14:35 +0300
Message-ID: <4b3f55002a1c5b7067ccd6688d802fc284410e03.1780499355.git.jani.nikula@intel.com>
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

Now that the pre_csc_lut and non-pre_csc_lut paths look similar,
deduplicate the loops and just determine the value based on pre_csc_lut
vs. not.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

'git show -w' for easy review
---
 drivers/gpu/drm/i915/display/intel_color.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 9f9ba0cf58a1..3eb42c2ae635 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4018,28 +4018,22 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 	/* TODO: Add macro */
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, 0),
 			   PLANE_PAL_PREC_AUTO_INCREMENT);
-	if (post_csc_lut) {
-		for (i = 0; i < lut_size + 3; i++) {
+
+	for (i = 0; i < lut_size + 3; i++) {
+		if (post_csc_lut) {
 			if (i < lut_size)
 				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 24);
 			/* else clamp to the last LUT value to prevent step discontinuity */
-
-			intel_de_write_dsb(display, dsb,
-					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   lut_val);
-		}
-	} else {
-		/*TODO: Add for segment 0 */
-		for (i = 0; i < lut_size + 3; i++) {
+		} else {
 			if (i < lut_size)
 				lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
 			else
 				lut_val = 1 << 24;
-
-			intel_de_write_dsb(display, dsb,
-					   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-					   lut_val);
 		}
+
+		intel_de_write_dsb(display, dsb,
+				   PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+				   lut_val);
 	}
 
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-- 
2.47.3

