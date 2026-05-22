Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A15ACD5BB7
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F84210E59A;
	Fri, 22 May 2026 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kio8FypJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD2110E2A6;
 Fri, 22 May 2026 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480252; x=1811016252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s108ls3Kfd0ZZN5WwZkcMpbd3HpoR53LanD72TLqj6U=;
 b=kio8FypJzktiukU+5nYW2qtm/zohi2MUvG0YSr8TixLBHWsJsxTupZS7
 4j/QyIf0FGaMMtP5LDrAKNljP3e18M0Z0lBfFgJ/khvbauze2eIf3rJnF
 nsgeday6u6CAx76irOcemThQU+5eOPOs/yBAaVjvbzIbSJE1gFwXpqTfh
 HBAXXvlmAKLIg1SNp7lFT6dqQXcbBkIkaLXxVhR0Nzy10j2ZHfRCKZCaJ
 xBLDZvMP+ystH5f2giahSXDCXzxFYEg3t5i1Sz2TimdeONLYvD8H4rNEM
 UWMF/QXKYJuQzgxECjoy/l9R6A4+befWoriC3pW9hRlbE5C61XBIWO54s A==;
X-CSE-ConnectionGUID: iv+mQDbGSf+0kn3AHZfZLg==
X-CSE-MsgGUID: g24oSchiRGC8IzDn/TOw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84299663"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="84299663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:02 -0700
X-CSE-ConnectionGUID: bqrMD/Y/Qxa5xigiiG2GEw==
X-CSE-MsgGUID: n7lLRt8tQUamPtYRs6ktrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="245042177"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:03:59 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/10] drm/i915/bw: Fix DCLK rounding mess
Date: Fri, 22 May 2026 23:03:38 +0300
Message-ID: <20260522200346.17377-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
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

Fix up the total mess when calculating the DCLK
frequency. Some codepaths are trying to do both DIV_ROUND_UP()
and an open coded "round to nearest" at the same time. The
MTL+ codepath was the only one that was correct (using
DIV_ROUND_CLOSEST()).

Let's unify all of them, and borrow the actual '100/6'
approach from adl_calc_psf_bw() so that we get even less
rounding errors.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index d10eebec196e..442e6b657ca5 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -67,25 +67,31 @@ struct intel_qgv_info {
 	u8 deinterleave;
 };
 
+static int dclk_freq_mhz(int ratio)
+{
+	/* multiple of 16.666 MHz (100/6) */
+	return DIV_ROUND_CLOSEST(ratio * 100, 6);
+}
+
 static int dg1_mchbar_read_qgv_point_info(struct intel_display *display,
 					  struct intel_qgv_point *sp,
 					  int point)
 {
-	u32 dclk_ratio, dclk_reference;
+	u32 dclk_ratio;
 	u32 val;
 
 	val = intel_mchbar_read(display, SA_PERF_STATUS_0_0_0_MCHBAR_PC);
 	dclk_ratio = REG_FIELD_GET(DG1_QCLK_RATIO_MASK, val);
 	if (val & DG1_QCLK_REFERENCE)
-		dclk_reference = 6; /* 6 * 16.666 MHz = 100 MHz */
+		dclk_ratio *= 6; /* 6 * 16.666 MHz = 100 MHz */
 	else
-		dclk_reference = 8; /* 8 * 16.666 MHz = 133 MHz */
-	sp->dclk = DIV_ROUND_UP((16667 * dclk_ratio * dclk_reference) + 500, 1000);
+		dclk_ratio *= 8; /* 8 * 16.666 MHz = 133 MHz */
 
 	val = intel_mchbar_read(display, SKL_MC_BIOS_DATA_0_0_0_MCHBAR_PCU);
 	if (val & DG1_GEAR_TYPE)
-		sp->dclk *= 2;
+		dclk_ratio *= 2;
 
+	sp->dclk = dclk_freq_mhz(dclk_ratio);
 	if (sp->dclk == 0)
 		return -EINVAL;
 
@@ -107,7 +113,6 @@ static int icl_pcode_read_qgv_point_info(struct intel_display *display,
 					 int point)
 {
 	u32 val = 0, val2 = 0;
-	u16 dclk;
 	int ret;
 
 	ret = intel_parent_pcode_read(display, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
@@ -116,9 +121,7 @@ static int icl_pcode_read_qgv_point_info(struct intel_display *display,
 	if (ret)
 		return ret;
 
-	dclk = val & 0xffff;
-	sp->dclk = DIV_ROUND_UP((16667 * dclk) + (DISPLAY_VER(display) >= 12 ? 500 : 0),
-				1000);
+	sp->dclk = dclk_freq_mhz(val & 0xffff);
 	sp->t_rp = (val & 0xff0000) >> 16;
 	sp->t_rcd = (val & 0xff000000) >> 24;
 
@@ -208,12 +211,11 @@ static int mtl_read_qgv_point_info(struct intel_display *display,
 				   struct intel_qgv_point *sp, int point)
 {
 	u32 val, val2;
-	u16 dclk;
 
 	val = intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
 	val2 = intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
-	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
-	sp->dclk = DIV_ROUND_CLOSEST(16667 * dclk, 1000);
+
+	sp->dclk = dclk_freq_mhz(REG_FIELD_GET(MTL_DCLK_MASK, val));
 	sp->t_rp = REG_FIELD_GET(MTL_TRP_MASK, val);
 	sp->t_rcd = REG_FIELD_GET(MTL_TRCD_MASK, val);
 
-- 
2.52.0

