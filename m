Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A16FC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D787010EF1D;
	Wed, 12 Aug 2026 09:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ju6ys+/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9F510EF11;
 Wed, 12 Aug 2026 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526579; x=1818062579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WneP4+mK3b/MgcVxOiyZn6szJwlgEY+Hy/jTG9oTiUk=;
 b=Ju6ys+/JGmh+U9jEpLhWEuRAGW4BMhsYjt8UDAi7zcIEXck8sacLQuyE
 Uyjdb0yLhC0cncktjtMEYbBCxWYaiTpeDVvmi+VWsZ89zFks7p8SNXq3J
 RUMrk9EN7lZ0s5qkya63YeKB1GF267JEsMAGvZ9Br1UtuJ1nCv/Z4Xi3J
 EKJStv5rPDedHgRYMwmPMhBujBla6LAOj45Pyhfdm51s3nH1w52t7d3tu
 ibUwYcuezInQIyKnl2K8J1BWAi0QVL+ZuvxXMmJpWXfDA1F/c68MpY8gr
 keFN57GIICLnXBYnI62kausMLWXn/bmZV678LHutfZhv6SpzcaKQsncb8 w==;
X-CSE-ConnectionGUID: aKVcoRFaTGip+rzxT6p0rA==
X-CSE-MsgGUID: 0MPWuGB9T/SUMFsn3CpMkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86928544"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86928544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:22:59 -0700
X-CSE-ConnectionGUID: vcF11Z+fSg6iUnbErJHSZA==
X-CSE-MsgGUID: D5bYPTRSQCiSJVjqDEbAww==
X-ExtLoop1: 1
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2026 02:22:58 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 2/2] drm/i915/color: Add YUV buffer support on HDR planes
Date: Wed, 12 Aug 2026 14:29:08 +0530
Message-ID: <20260812085908.3159828-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812085908.3159828-1-chaitanya.kumar.borah@intel.com>
References: <20260812085908.3159828-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
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

Add the INTEL_PLANE_CB_CSC_FF (fixed function CSC) color block as the
first stage for the HDR planes. This enables YUV-to-RGB color space
conversion on HDR planes via the color pipeline.

Also in icl_program_input_csc(), account for the color pipeline
programming, in addition to FB format.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 2 ++
 drivers/gpu/drm/i915/display/skl_universal_plane.c  | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 38cfd6ed585d..3f76b8d80430 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -31,6 +31,7 @@ static const struct drm_colorop_funcs intel_colorop_funcs = {
  * the pipeline totally unusable.
  */
 static const enum intel_color_block xe3plpd_primary_plane_pipeline[] = {
+	INTEL_PLANE_CB_CSC_FF,
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
 	INTEL_PLANE_CB_3DLUT,
@@ -38,6 +39,7 @@ static const enum intel_color_block xe3plpd_primary_plane_pipeline[] = {
 };
 
 static const enum intel_color_block hdr_plane_pipeline[] = {
+	INTEL_PLANE_CB_CSC_FF,
 	INTEL_PLANE_CB_PRE_CSC_LUT,
 	INTEL_PLANE_CB_CSC,
 	INTEL_PLANE_CB_POST_CSC_LUT,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 222c3b6bbe46..9da91d0a00f0 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1621,7 +1621,8 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
 	intel_de_write_dsb(display, dsb, PLANE_COLOR_CTL(pipe, plane_id),
 			   plane_color_ctl);
 
-	if (fb->format->is_yuv && icl_is_hdr_plane(display, plane_id))
+	if (icl_is_hdr_plane(display, plane_id) &&
+	    (fb->format->is_yuv || plane_state->hw.csc_ff_enable))
 		icl_program_input_csc(dsb, plane, plane_state);
 
 	skl_write_plane_wm(dsb, plane, crtc_state);
-- 
2.50.1

