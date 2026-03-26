Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA110AB82B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 22:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0D10EAE5;
	Thu, 26 Mar 2026 22:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3UyhunE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6F10EAFA;
 Thu, 26 Mar 2026 22:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774564332; x=1806100332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NiMOAlSm1bCavPugRE68VzolBqP7I9M5L2zhr3eWMNg=;
 b=Q3UyhunEh9pAt5bUQ8UVDQtyWEIGUO/sHwYh+wtBfaDRbLyFK8CxFWXm
 9f1urgcaMXpo+Shx8W/Q5daaVtWGa45uVMRbFm8oVHv086Z5Pb8I0gmp9
 /kvfAKGuI40e3qAuBkE/Et7dJ6X98JchDVgcV8TYX5P7ygPXE3CU/akof
 H7uaZ1WqZL6kkTS6tpzG409tmKUn6/T17qIt7KOGRAamvuCAyASloRZrK
 U/tmV3eqpSW+/yhEtKgt6nBOAtzmhi96SXg9puoHtIO25AhJ61qcEF/nM
 d852iajcrpdniKnCuF9utOJDSANd1Xe7+/fcx+JMWTHmcJpxoywvWgzP8 Q==;
X-CSE-ConnectionGUID: Oj+Lsd93QN+awLR+boJxLw==
X-CSE-MsgGUID: Bs/ZR28wR+m00GNCbt/MMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78233092"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78233092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:32:12 -0700
X-CSE-ConnectionGUID: Fe9lqWCQSG+uGLDLNFeDxQ==
X-CSE-MsgGUID: khLAU+dYSVaDl4m2NqNYWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="226769525"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 15:32:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 7/9] drn/i915/casf: Remove redundant argument from
 intel_casf_filter_lut_load()
Date: Fri, 27 Mar 2026 00:31:37 +0200
Message-ID: <20260326223139.19116-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
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

intel_casf_filter_lut_load() can find the crtc from the crtc_state.
No need to pass in both.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index f777aae3fc57..21e84a4f9ff5 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -61,10 +61,10 @@ const u16 filtercoeff_3[] = {
 	FILTER_COEFF_0_125,
 };
 
-static void intel_casf_filter_lut_load(struct intel_crtc *crtc,
-				       const struct intel_crtc_state *crtc_state)
+static void intel_casf_filter_lut_load(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int i;
 
 	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
@@ -270,7 +270,7 @@ void intel_casf_enable(const struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 sharpness_ctl;
 
-	intel_casf_filter_lut_load(crtc, crtc_state);
+	intel_casf_filter_lut_load(crtc_state);
 
 	intel_casf_write_coeff(crtc_state);
 
-- 
2.52.0

