Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283A4CD4842
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AD510E733;
	Mon, 11 May 2026 12:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ws8FMUgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD3E10E738;
 Mon, 11 May 2026 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502539; x=1810038539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P5Xa6gr2F62WMauL56MZSupIoaFF8ap3EfxqLaGBOus=;
 b=Ws8FMUgWHmZ7LCo2FyT3UTvNAbqqyv7G8EMEe5sd7TuJKfKGLqmYYlRS
 gRpfjUfkqNHajF81M+pGBIIt67MVl4Ia3DpJgdQC6MUDn/jpJAlXEM1SX
 G/ZGVM1Xi7k0Jc0aROfPCIZPmFO7UheycoKrDg7J5PJK2htnP8B0fu4lw
 RQXfSgZI8UezgBYhGIqxELLuXExbcSoeUDiJvMpD6hB5WcRjqFGVksOMR
 MClYyH+C9yH+YeY/PH5yidlRbByfxwmIYWHB+W5YSbUA1wUPvfrdGXbNQ
 zGpAwzVYBJ5golx9iNGNq7t4ycEYOODw0IWT81O4nHSa8AD8+8SoexY/V g==;
X-CSE-ConnectionGUID: 9PvUbpSfQ1+1zisTrV/xcA==
X-CSE-MsgGUID: YYddd14RQx2Mp0/6iRaVGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90762809"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90762809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:59 -0700
X-CSE-ConnectionGUID: sO6N/IN2Q+yBHiz0wpZ5pg==
X-CSE-MsgGUID: OXVwoo2TTRe2QNRIh7SNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267801455"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:28:57 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 09/11] drm/i915/bw: consolidate the debug info of
 bw/dgv/psf data
Date: Mon, 11 May 2026 15:28:14 +0300
Message-ID: <20260511122816.1235478-10-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
References: <20260511122816.1235478-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Consolidate all the detaills about the bw, gqv and psf gv into
a common function and present it in an organised format

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 40 +++++++++++++++++--------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 858da1710a61..0bda13a3e31b 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -483,6 +483,28 @@ static const struct intel_sa_info xe3lpd_3002_sa_info = {
 	.derating = 10,
 };
 
+static void debug_print_bw_info(struct intel_display *display)
+{
+	int num_groups = ARRAY_SIZE(display->bw.max);
+	int i;
+
+	for (i = 0; i < num_groups; i++) {
+		struct intel_bw_info *bi = &display->bw.max[i];
+		int j;
+
+		drm_dbg_kms(display->drm, "BW%d: num_planes=%d num_qgv_points:%d\n",
+			    i, bi->num_planes, bi->num_qgv_points);
+
+		for (j = 0; j < bi->num_qgv_points; j++)
+			drm_dbg_kms(display->drm, "\tQGV %d: deratedbw=%u peakbw=%u\n",
+				    j,  bi->deratedbw[j], bi->peakbw[j]);
+
+		for (j = 0; j < bi->num_psf_gv_points; j++)
+			drm_dbg_kms(display->drm, "\tPSF GV %d bw=%u\n",
+				    j, bi->psf_bw[j]);
+	}
+}
+
 static bool is_tile_y_factored(struct intel_display *display)
 {
 	/* TGL supports Y-tile for LPDDR4/5, but not for DDR4 */
@@ -544,12 +566,11 @@ static int icl_get_bw_info(struct intel_display *display,
 
 			bi->deratedbw[j] = min(maxdebw,
 					       bw * (100 - sa->derating) / 100);
-
-			drm_dbg_kms(display->drm,
-				    "BW%d / QGV %d: num_planes=%d deratedbw=%u\n",
-				    i, j, bi->num_planes, bi->deratedbw[j]);
 		}
 	}
+
+	debug_print_bw_info(display);
+
 	/*
 	 * In case if SAGV is disabled in BIOS, we always get 1
 	 * SAGV point, but we can't send PCode commands to restrict it
@@ -650,24 +671,17 @@ static int tgl_get_bw_info(struct intel_display *display,
 			bi->peakbw[j] = DIV_ROUND_CLOSEST(sp->dclk *
 							  num_channels *
 							  qi.channel_width, 8);
-
-			drm_dbg_kms(display->drm,
-				    "BW%d / QGV %d: num_planes=%d deratedbw=%u peakbw: %u\n",
-				    i, j, bi->num_planes, bi->deratedbw[j],
-				    bi->peakbw[j]);
 		}
 
 		for (j = 0; j < qi.num_psf_points; j++) {
 			const struct intel_psf_gv_point *sp = &qi.psf_points[j];
 
 			bi->psf_bw[j] = adl_calc_psf_bw(sp->clk);
-
-			drm_dbg_kms(display->drm,
-				    "BW%d / PSF GV %d: num_planes=%d bw=%u\n",
-				    i, j, bi->num_planes, bi->psf_bw[j]);
 		}
 	}
 
+	debug_print_bw_info(display);
+
 	/*
 	 * In case if SAGV is disabled in BIOS, we always get 1
 	 * SAGV point, but we can't send PCode commands to restrict it
-- 
2.43.0

