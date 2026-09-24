Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF622C98304
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 02:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4904210F272;
	Thu, 24 Sep 2026 02:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPwQPNKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD310E148;
 Thu, 24 Sep 2026 02:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790217374; x=1821753374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mzWQulyXy2405pWE/CFcsVxhaBCDebDyPvseQEmbzuE=;
 b=NPwQPNKW8Po/NcZk2VGKUL0Uv9w4aXlkY8WL7pAjKO3XWj9wdxYBIFvj
 rUcRnOFL5Jo1ZW+z/hGDb7lPwZgpo1HK+0i3KwWFG0UIM/Q1os5/kENbb
 ea5n20eRpm0N9TALzoncUQLsD8MgXPAlN4H7AoyGq94Eai8feM5u+pziI
 HY4Ct/lB11Mi1nxS87u7FZTnt+xZrAgHJ9WddPTHLmJ8tyJh808CDqvmV
 sfyfNPvxxl/RP5eGc5G35YVzdOql3t56avZRwJKs5q7mMXYJOt3s8emQe
 YnXaawwSC6DSW5mt6/KP86yzEtMBw9LbaWiXmaNWzcYEnAz1P2QoR8ltJ A==;
X-CSE-ConnectionGUID: jvgAu/8mSGKA+c6RjzOBmg==
X-CSE-MsgGUID: rWnoyZrzQ/25wknpQ2alxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90993954"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="90993954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 19:36:13 -0700
X-CSE-ConnectionGUID: dLdTvtoUSk+EbIemaQGMiw==
X-CSE-MsgGUID: Zs00s/AURaeZp47PhyaFng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="301819912"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 19:36:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2] drm/i915/display: Update the CMN_SDP_TL in fastset path
Date: Thu, 24 Sep 2026 07:49:50 +0530
Message-ID: <20260924021950.350207-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
References: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
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

Commit bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
enabled the CMN_SDP_TL for the modeset path, but missed to add it to the
fastset path.

Since dip.cmn_sdp_tl is already skipped from the strict pipe-config
comparison during fastsets, it was always intended to get updated
without full modeset, but the update to the register was missed.

During a fastset, if CMN_SDP_TL changes, update the register
similar to the EMP_AS_SDP_TL, which gets updated in
intel_vrr_set_transcoder_timings().

v2: Update cmn_sdp_changed() to also compare gmp_sdp_tl, pps_sdp_tl and
    vsc_ext_sdp_tl, not just cmn_sdp_tl. (Sashiko)

Fixes: bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e3e0d2f8faef..d5d4453f283b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -69,6 +69,7 @@
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_display_driver.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
@@ -999,6 +1000,15 @@ static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
 		old_crtc_state->vrr.cmrr.cmrr_n != new_crtc_state->vrr.cmrr.cmrr_n;
 }
 
+static bool cmn_sdp_changed(const struct intel_crtc_state *old_crtc_state,
+			    const struct intel_crtc_state *new_crtc_state)
+{
+	return old_crtc_state->dip.cmn_sdp_tl != new_crtc_state->dip.cmn_sdp_tl ||
+		old_crtc_state->dip.gmp_sdp_tl != new_crtc_state->dip.gmp_sdp_tl ||
+		old_crtc_state->dip.pps_sdp_tl != new_crtc_state->dip.pps_sdp_tl ||
+		old_crtc_state->dip.vsc_ext_sdp_tl != new_crtc_state->dip.vsc_ext_sdp_tl;
+}
+
 static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
@@ -6924,6 +6934,9 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 		if (vrr_params_changed(old_crtc_state, new_crtc_state) ||
 		    cmrr_params_changed(old_crtc_state, new_crtc_state))
 			intel_vrr_set_transcoder_timings(new_crtc_state);
+
+		if (cmn_sdp_changed(old_crtc_state, new_crtc_state))
+			intel_dip_cmn_sdp_transmission_line_enable(new_crtc_state);
 	}
 
 	intel_fbc_update(state, crtc);
-- 
2.50.1

