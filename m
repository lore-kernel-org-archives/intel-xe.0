Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922D6CD6E44
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 10:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984310EFCB;
	Thu, 28 May 2026 10:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngY9yexu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4626710EFBA;
 Thu, 28 May 2026 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779964534; x=1811500534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nB7vr3R83XT6uBNz/Qnn47KU5mA2/whWir8d5fNNtTw=;
 b=ngY9yexueCjPIIuh2SNqtwu7HP8/myZO04juFIIhAGqXNBapFM8nWjE7
 FMH0D3MTMJs6Tgz32O9Gy7ErM0Fkn3ifb3LHRuXlUv5VTnNr7g6ohT+JN
 x6JdhiYze2oXs4szvREMqw8zp0SgfUBoH8GgkcGw870ccKiDWGWWPCbNq
 ZRMCqxzAHw9y1ovyCW92d70dJLFp6LMfzJOEBB+NfjlFZ8oHezi56TIm7
 Rw5UYT1Kp2Z1nbHVgZCwh5e52ZMYO8+DR9JFvpPAPdJb2t5Yop1xuo9Cs
 88lW2CcbSuhxd1wE10+mCnidspDPz9wZpMdfNTNEc5maKEdSUuGTibmuq w==;
X-CSE-ConnectionGUID: v2uf7IRBQeyy0WsJHqIBjg==
X-CSE-MsgGUID: jJHMw1DATHGas1b5DzFzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79837669"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="79837669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:34 -0700
X-CSE-ConnectionGUID: PijNq6KbSt6MtZPOP387zg==
X-CSE-MsgGUID: NFHmaau0QwuC1L42q/ll7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247458897"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:35:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/11] drm/i915/bw: Move psf_bw[] out from the plane group
Date: Thu, 28 May 2026 13:34:54 +0300
Message-ID: <20260528103458.18069-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
References: <20260528103458.18069-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The PSF bandwidth doesn't depend on the number of planes, so there
is no need to repeat the same information for each plane group.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c         | 17 ++++++-----------
 .../gpu/drm/i915/display/intel_display_core.h   |  4 ++--
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 6495924d0be8..ef86fac8e664 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -673,16 +673,14 @@ static int tgl_get_bw_info(struct intel_display *display,
 				    i, j, bi->num_planes, bi->deratedbw[j],
 				    bi->peakbw[j]);
 		}
+	}
 
-		for (j = 0; j < qi.num_psf_points; j++) {
-			const struct intel_psf_gv_point *sp = &qi.psf_points[j];
+	for (i = 0; i < qi.num_psf_points; i++) {
+		const struct intel_psf_gv_point *sp = &qi.psf_points[i];
 
-			bi->psf_bw[j] = adl_calc_psf_bw(sp->clk);
+		display->bw.psf_bw[i] = adl_calc_psf_bw(sp->clk);
 
-			drm_dbg_kms(display->drm,
-				    "BW%d / PSF GV %d: num_planes=%d bw=%u\n",
-				    i, j, bi->num_planes, bi->psf_bw[j]);
-		}
+		drm_dbg_kms(display->drm, "PSF GV %d: bw=%u\n", i, display->bw.psf_bw[i]);
 	}
 
 	/*
@@ -810,10 +808,7 @@ static unsigned int tgl_max_bw_index(struct intel_display *display,
 static unsigned int adl_psf_bw(struct intel_display *display,
 			       int psf_gv_point)
 {
-	const struct intel_bw_info *bi =
-			&display->bw.max[0];
-
-	return bi->psf_bw[psf_gv_point];
+	return display->bw.psf_bw[psf_gv_point];
 }
 
 static unsigned int icl_qgv_bw(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index f13fa810ccca..58cd0961031b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -325,12 +325,12 @@ struct intel_display {
 		struct intel_bw_info {
 			/* for each QGV point */
 			unsigned int deratedbw[I915_NUM_QGV_POINTS];
-			/* for each PSF GV point */
-			unsigned int psf_bw[I915_NUM_PSF_GV_POINTS];
 			/* Peak BW for each QGV point */
 			unsigned int peakbw[I915_NUM_QGV_POINTS];
 			u8 num_planes;
 		} max[6];
+		/* for each PSF GV point */
+		unsigned int psf_bw[I915_NUM_PSF_GV_POINTS];
 		u8 num_qgv_points;
 		u8 num_psf_gv_points;
 	} bw;
-- 
2.53.0

