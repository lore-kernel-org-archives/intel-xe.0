Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDD8CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5810ED47;
	Thu, 11 Jun 2026 07:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSayGSZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED3A10ED40;
 Thu, 11 Jun 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781164258; x=1812700258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+SlAKNGEyK+aAFBHX0bjq7XItEGLYR/+NhijItB5kv4=;
 b=SSayGSZyFYebOBRnBBL3oIU+miX3ZSUi2XMkGToD6IGcLr3iM/eM5hn9
 PCVcoB+ioCuNFX411BQEinLp71J70dNY+i3NBdh1iJYfcH9V3GRrald7V
 BgCp4IQbezZc1OB5ksORxDjHWrO1y9BASKjX3Qsxwetf6oFIQpuuA/+fg
 RUR7wtUBXeR7gv0wLSFAv76yf9oamNOHWHenGzj8Bbz6qeiXLoYWG7TaZ
 CKRtVghvNRULAI3Fk7R9r7NXruaVFXkRwU+ML1LZzzmbUyc4NmoKOsRcH
 GoO1HgP1O7hyCkdY+aSEESBa+tooZQdcBXYvBrf373m5TTiGe8I/CwEMc A==;
X-CSE-ConnectionGUID: RwBnemf7RvyWy3PWC2bZDw==
X-CSE-MsgGUID: R9JldI7/RBmJV9Lq4sUQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93078743"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="93078743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:50:58 -0700
X-CSE-ConnectionGUID: 7T8ty+8lRsywRKcY+AAb/A==
X-CSE-MsgGUID: IXdTjVvpRE2P6YudDIXC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251503321"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:50:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 02/12] drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL
 register
Date: Thu, 11 Jun 2026 13:03:04 +0530
Message-ID: <20260611073316.1439306-3-ankit.k.nautiyal@intel.com>
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

Now that intel_dip_write_emp_as_sdp_tl() exists, use it instead of
the open-coded EMP_AS_SDP_TL programming sequence in
intel_vrr_set_transcoder_timings().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6130854a706c..a3dfeaa12e8b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -9,7 +9,7 @@
 #include "intel_alpm.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
-#include "intel_dip_regs.h"
+#include "intel_dip.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
@@ -658,17 +658,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
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
2.45.2

