Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35C710A1E7D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC3410E2C7;
	Thu, 26 Mar 2026 11:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPjXRump";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3E310E2B9;
 Thu, 26 Mar 2026 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774523905; x=1806059905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ApCVMVjwnS7a/xHuzJFTiqSOxaahZ6dDvpv4mYLb4Hs=;
 b=PPjXRumpAtrvscMvsT22Nl2GOHqt+Uju+nCGKV+WbJuesy/bjUKAJ9Y2
 Zlyeenb6nxZTb8iItdop/PayODwBakCcJaWqe/EmaI0KR59YImnlqX7hv
 P8kv/asSziSRx8Zl94CO/vNf6W7pqRUpR0OWHux6CqDcU8UaXJpRfSzN5
 wOperDkBvqi2k1qx/Tx8mBOBjvoOe49iFfHaRK+fKRLfHifbk5fw5s1xS
 rdYZH2PJdDN6fUv4ccMukCBkvlAl8ehb7Dbl2n/utF1IXfPM3GzeasSCQ
 Ap9eSVbI13EKZGU+ok5QfMEyWoHf+5vrxIv/hjzSpra1iyJjvOk20dOYp w==;
X-CSE-ConnectionGUID: J5mSLKbzQ5SYkcGi3y02gQ==
X-CSE-MsgGUID: pRU0K2XSSdiGYEHQ6I1uuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75692308"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75692308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:18:22 -0700
X-CSE-ConnectionGUID: qWSf1oJbRbWwWSMTN9IllA==
X-CSE-MsgGUID: uJD/pltARlmeK2g7HvPv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="220127404"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.14])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:18:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] drm/i915/dsi: Don't do DSC horizontal timing adjustments
 in command mode
Date: Thu, 26 Mar 2026 13:18:10 +0200
Message-ID: <20260326111814.9800-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
References: <20260326111814.9800-1-ville.syrjala@linux.intel.com>
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

Stop adjusting the horizontal timing values based on the
compression ratio in command mode. Bspec seems to be telling
us to do this only in video mode, and this is also how the
Windows driver does things.

This should also fix a div-by-zero on some machines because due to
the adjusted htotal ends up being so small that we end up with
line_time_us==0 when trying to determine the vtotal value in
command mode.

Note that this doesn't actually make the display on the
Huawei Matebook E work, but at least the kernel no longer
explodes when the driver loads.

Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12045
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index c04327979678..a763f2b13ff2 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -888,7 +888,7 @@ gen11_dsi_set_transcoder_timings(struct intel_encoder *encoder,
 	 * non-compressed link speeds, and simplifies down to the ratio between
 	 * compressed and non-compressed bpp.
 	 */
-	if (crtc_state->dsc.compression_enable) {
+	if (is_vid_mode(intel_dsi) && crtc_state->dsc.compression_enable) {
 		mul = fxp_q4_to_int(crtc_state->dsc.compressed_bpp_x16);
 		div = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 	}
@@ -1502,7 +1502,7 @@ static void gen11_dsi_get_timings(struct intel_encoder *encoder,
 	struct drm_display_mode *adjusted_mode =
 					&pipe_config->hw.adjusted_mode;
 
-	if (pipe_config->dsc.compressed_bpp_x16) {
+	if (is_vid_mode(intel_dsi) && pipe_config->dsc.compressed_bpp_x16) {
 		int div = fxp_q4_to_int(pipe_config->dsc.compressed_bpp_x16);
 		int mul = mipi_dsi_pixel_format_to_bpp(intel_dsi->pixel_format);
 
-- 
2.52.0

