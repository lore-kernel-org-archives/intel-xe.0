Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ACCCD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7733D10ED52;
	Thu, 11 Jun 2026 07:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6rJvQ72";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4015D10ED56;
 Thu, 11 Jun 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164263; x=1812700263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ny7q6Mnf/F18Ltrnt/pAfqCt1MgfLmaYWuxpgphtWms=;
 b=B6rJvQ72e5tDNJcefMVaqUJfh9iZfrlAyEFcZsWrARoYwl7XLdq/1COm
 W7kcV+CVOvKD7yIXB/QUEe88fU9yJkDrTQFsN4Ae+hQSQpJXgzFfbYC/P
 ZGR9+mY6gt9aUpyrCpy9pxz5zBZBQ83DZY7qIzRaHP/HGyf+UgE5SXGOT
 upbdnEK3lMXKnUD443buvhRYiudLwSPpdV1klZwQGbjlt0rfLJZ0K/Vbt
 gUBmJqr137mJdJSkLC2oMvqVZmKZHJ0QslEiK4n38RJm7nZdppibr6T1p
 uJXojnrQW//ccOPd0fuz3KER5Wmim9QG5zWBSI27jXbh/n5lftHgWVknp A==;
X-CSE-ConnectionGUID: rTvHyLS7SnyTdszcBvGXLw==
X-CSE-MsgGUID: frhdIN63RTS4gpeNoSZGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078746"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:02 -0700
X-CSE-ConnectionGUID: C8jTWywURTWsh0D/pbybKw==
X-CSE-MsgGUID: s3NNj58mSgOTt6asHoPHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503334"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:51:00 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 04/12] drm/i915/dp: Add helper to get AS SDP Transmission
 Line
Date: Thu, 11 Jun 2026 13:03:06 +0530
Message-ID: <20260611073316.1439306-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
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

Introduce a DP helper to compute the Adaptive Sync SDP transmission line
and use it when programming the EMP_AS_SDP_TL register.

Currently the AS SDP transmission line is programmed to the T1 position.
This can be extended in the future to support programming the T2 position
as well.

While at it, improve the documentation: the AS SDP transmission line
corresponds to the T1 position, which maps to the start of the VSYNC
pulse.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip.c |  7 ++++---
 drivers/gpu/drm/i915/display/intel_dp.c  | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h  |  1 +
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 450a599b5053..504a2edadd0e 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -8,6 +8,7 @@
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
 
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 {
@@ -32,11 +33,11 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 		return;
 	/*
 	 * Since currently we support VRR only for DP/eDP, program the register
-	 * for Adaptive Sync SDP using vsync start. For non-DP encoders,
-	 * the register is reset to 0.
+	 * for Adaptive Sync SDP. For non-DP encoders, the register is reset
+	 * to 0.
 	 */
 	if (intel_crtc_has_dp_encoder(crtc_state))
-		transmission_line = crtc_state->vrr.vsync_start;
+		transmission_line = intel_dp_get_as_sdp_transmission_line(crtc_state);
 
 	intel_de_write(display,
 		       EMP_AS_SDP_TL(display, cpu_transcoder),
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3569e61e7fee..f54f7faf878f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7465,3 +7465,15 @@ void intel_dp_link_cleanup(struct intel_dp *intel_dp)
 {
 	intel_dp_link_training_cleanup(intel_dp->link.training);
 }
+
+int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state *crtc_state)
+{
+	/*
+	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
+	 * Transmission Line, which corresponds to the start of the
+	 * VSYNC pulse.
+	 *
+	 * Use the T1 position for now.
+	 */
+	return crtc_state->vrr.vsync_start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 92ce04852326..fc80b5b64785 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -238,6 +238,7 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 		for_each_if(intel_dp_joiner_candidate_valid(__connector, (__mode)->hdisplay, __num_joined_pipes))
 
 u8 intel_dp_as_sdp_transmission_time(void);
+int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state *crtc_state);
 
 int intel_dp_link_init(struct intel_dp *intel_dp);
 void intel_dp_link_cleanup(struct intel_dp *intel_dp);
-- 
2.45.2

