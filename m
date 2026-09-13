Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3ABC88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A330710E93D;
	Sun, 13 Sep 2026 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvjz3a98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC110E937;
 Sun, 13 Sep 2026 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312403; x=1820848403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sog9URae2iICLmihP+yAM7VRiydNnY07CHSAPduN3Z8=;
 b=bvjz3a98TZfry7gtavejizKYKq7mYvRb9Sy6G0EQ7ijsAF6kWiV/HVxZ
 KG925QS1IIGPO/HSbMcWhGV9AS5N53gbnwrwLa2sVm3QcWsxAyB5L+1G4
 9Vsda5ikR98lYMGtjj5MNsdvHmG7hzCo6TvRan/3AlPNoT43bCIGrWzY6
 wbvUzlXyfQZTlcMGn73PslNDWtrChMeYjbgeBNmQCOZD9jigSS2hLR3HN
 Z7GzxhXtuYUM7vnEs1kxe0fjXnDlS24QGtz5dgZsYFEuyxcQ38cOhVQhc
 Q4oloyJOhglE8RZFPfDUH478jX4UFc6jJBtCjjqOpuPixBJF8EQ+5jCU8 w==;
X-CSE-ConnectionGUID: YRQkjuZiQzuyNhYUA5tI6A==
X-CSE-MsgGUID: yIfQcYDNTxuQqvRehdFOQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388740"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:22 -0700
X-CSE-ConnectionGUID: vqSEaGxhQlmreK3KhGSkaw==
X-CSE-MsgGUID: dHlOIbrNQQOwlLuFUEfP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310693971"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:21 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 02/13] drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL
 register
Date: Sun, 13 Sep 2026 20:26:37 +0530
Message-ID: <20260913145649.3240904-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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

