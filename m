Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D65C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2910E086;
	Tue,  8 Sep 2026 06:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD73AEN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029C10E4F1;
 Tue,  8 Sep 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849550; x=1820385550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sog9URae2iICLmihP+yAM7VRiydNnY07CHSAPduN3Z8=;
 b=WD73AEN9m97rPwW+9tvAo5FwNKmWPMQW/i9pH9hM+km7D5OV/6aMsYGr
 e/SbKp0L2MO7zCN2VdqlPeo/P1kjqbKSdv8Y6bbQuvmGMSNfYKLfHrIUa
 bs4xCXQ28TCMfUaZIbXfJQLTlsMBSjjxIsgZYJ9ezYdVB3ddcvFle9o5v
 rAFIwhNsZsyZ3oTI31V44Reqc5iSXEmZKZYgqX+nQZGZwOhEuK6FdkJ9i
 CGtKX41yFc6AxqatyejM1XbPI2pHxoJ1eenveJ6dsaDFiLW0q61LWrMwV
 CsP70WMuXo/uCXTt3FFRShqMX02DcMubCKLQnIT1xHs/Zil//laWx+ocV g==;
X-CSE-ConnectionGUID: /U8IEpZ/Q8mlHXUdKl19bA==
X-CSE-MsgGUID: WTGJJ/UiSCWdw3qSc04ibA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061779"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:04 -0700
X-CSE-ConnectionGUID: 1+rmSCyNQpmSPi6U+q4jMA==
X-CSE-MsgGUID: C4oewrHiR5y7cg0BMShHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702415"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:38:59 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 02/12] drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL
 register
Date: Tue,  8 Sep 2026 11:52:13 +0530
Message-ID: <20260908062224.2897987-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

Now that intel_dip_write_emp_as_sdp_tl() exists, use it instead of
the open-coded EMP_AS_SDP_TL programming sequence in
intel_vrr_set_transcoder_timings().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index fd8b6f829cfe..a516ba34e0d0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -17,6 +17,7 @@
 #include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_dip_regs.h"
 #include "intel_display_limits.h"
 #include "intel_display_regs.h"
@@ -711,17 +712,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 			       VRR_VSYNC_END(crtc_state->vrr.vsync_end) |
 			       VRR_VSYNC_START(crtc_state->vrr.vsync_start));
 
-	/*
-	 * For BMG and LNL+ onwards the EMP_AS_SDP_TL is used for programming
-	 * double buffering point and transmission line for VRR packets for
-	 * HDMI2.1/DP/eDP/DP->HDMI2.1 PCON.
-	 * Since currently we support VRR only for DP/eDP, so this is programmed
-	 * to for Adaptive Sync SDP to Vsync start.
-	 */
-	if (DISPLAY_VERx100(display) == 1401 || DISPLAY_VER(display) >= 20)
-		intel_de_write(display,
-			       EMP_AS_SDP_TL(display, cpu_transcoder),
-			       EMP_AS_SDP_DB_TL(crtc_state->vrr.vsync_start));
+	intel_dip_write_emp_as_sdp_tl(crtc_state);
 }
 
 void
-- 
2.50.1

