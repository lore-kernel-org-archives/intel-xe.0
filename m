Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96FAEA3C21
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF2D10E74A;
	Thu,  9 Apr 2026 10:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNSChxvj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87810E74A;
 Thu,  9 Apr 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729327; x=1807265327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YmmlHsIQ5dlm4zBDa0gXzklEGkEJM5Y6AGyyrcfEAwk=;
 b=RNSChxvjMscztIWExmmLvYy2MeJuwaxpP+ZvCQq10PCOV1+3/epgdNdF
 mYyA5UzfPIOAc5EsZVEOJ1cNYPFVNpsppnRZk6JLvhyvcUnuXJYhO0fR3
 Hj7Gfz62m+VOo46oOmQggASjQ0oL5mLRoctI2MjeYZmIWyGQIs94DG/V6
 GFGm4E4pq+dtN6tUg5OPJK3TJLCobrk6sb3eHUdYsY6zkO5Fj5Pm/3r0T
 nOfSCRlG3sOqnWKYYiT+oY/k+H/RSzLInA1EylfHPgwVtNxZUO6fpRQTK
 alZh6uqi+tPeqkOCqgV30sufUwbeWenc9/i0QubIMWrsluB3f7NkGSler A==;
X-CSE-ConnectionGUID: 0FtaWxDrR0SO6+TIaSTR2g==
X-CSE-MsgGUID: A70O4qyISMy8xtntkyrIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87806171"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87806171"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:08:46 -0700
X-CSE-ConnectionGUID: 6a2TmPHcRdqrHMzK3ORJ3g==
X-CSE-MsgGUID: E92ZBzyKTEiBpuEvggRJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224426802"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:08:44 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/2] drm/i915/mst: Call intel_pfit_compute_config() for
 sharpness filter
Date: Thu,  9 Apr 2026 13:08:40 +0300
Message-ID: <20260409100841.1907-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

The sharpness filter property is on the CRTC (as opposed to the
connector) so the expectation is that it's usable on all output
types. Since the sharpness filter is now fully integrateds into
the normal pfit code intel_pfit_compute_config() must be called
from the encoder .compute_config() on all relevant output types.

Sharpness filter is supported on LNL+ so only HDMI and DP SST/MST
outputs are actually relevant. I already took care of HDMI and
DP SST, but (as usual) forgot about DP MST. Add the missing
intel_pfit_compute_config() call to make the sharpness filter
operational on DP MST as well.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Fixes: d4686f34bbeb ("drm/i915/pfit: Call intel_pfit_compute_config() unconditionally on (e)DP/HDMI")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 94f2c3a7ec59..9150763ca143 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -723,6 +723,10 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 	pipe_config->has_pch_encoder = false;
 
+	ret = intel_pfit_compute_config(pipe_config, conn_state);
+	if (ret)
+		return ret;
+
 	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
 		if (num_joined_pipes > 1)
 			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
-- 
2.52.0

