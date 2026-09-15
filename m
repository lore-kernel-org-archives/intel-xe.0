Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8104C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 17:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A03210E60B;
	Tue, 15 Sep 2026 17:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYXmAf8O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E5210E4C3;
 Tue, 15 Sep 2026 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789491813; x=1821027813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sog9URae2iICLmihP+yAM7VRiydNnY07CHSAPduN3Z8=;
 b=bYXmAf8OZnQowa8yLI0g6YBdCCS2LZJimJbkD/ipWi1v1psBTbyzy5sA
 kGCKVw8OrQO9c79+ssWQUWqEGmNqLOw1jGFVsHMyXHbh1711PRfaaZUBP
 7KwG5hJapNHm8E6L+U2+7vDMqwJLnpsK96+axnTPEB240a6APzBHTuYIa
 77ywlujLlKxUoBuUg3dV4U0/KFe9kpqgI0g1Uvd2N73qm7yVdZeT7vfPM
 u7A7PzCmTERKBBMV5kjquHVF/6efcZTYZ+u/t7WuFmCPM6ygHQtsOmkF9
 XaJp6agR7bd+YsIkiP/l84jd5FsPWeDYNWOlMcy1GfmiC/19YO0ZgpDu1 Q==;
X-CSE-ConnectionGUID: dxipqv3TS96wYK9gDVf9RQ==
X-CSE-MsgGUID: MWmDQfDpQnWCDcHPFsHncA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="371869"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="371869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:33 -0700
X-CSE-ConnectionGUID: LWIQOaRvS7SwfgL+kyyayw==
X-CSE-MsgGUID: hhaSDcc6RXGIfTs791DfWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270443882"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 10:03:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v7 02/14] drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL
 register
Date: Tue, 15 Sep 2026 22:16:43 +0530
Message-ID: <20260915164657.3429075-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
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

