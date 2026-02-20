Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB81C5AD2B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC07D10E81C;
	Fri, 20 Feb 2026 17:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Obv7jHta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA61A10E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=125BmZcoiRd1sP7P1+YOTuEBkPIc+AofKwsg+AKMlOI=;
 b=Obv7jHtaM0PKFzTkvxv3WX1QdYo/7mCi9Fk9XRkBgO7qyh9jbByEDYR3
 BbA9rWsH5kMvjHuaq3I2NkZCvY5Bwhoydy90Fy0LWQLQKEvz+C2nkHFHg
 P0Tw3GEYVx6RgVORw4VuNkgVTrJE4pi8vxBN0EYjAC1cz/FjiZquuLAeq
 MAclHHF3vanZjXLwDLIo2IQjvI6iCB6MqY4TKx5vN/VwhleL2LRu82gA0
 Uu2yZstLBj8O4YQvHJ7W9GVKsEKe2LkKITgNkmkaaG4SoRa2VDeu5LsCD
 gZjM5v7FSg1zXIRHFxuWeWjYEtM15sTpuJbM8m++CUoyMtdzkvGe/bs0H A==;
X-CSE-ConnectionGUID: sSaYBkKSTkSXeYG9S3HdeA==
X-CSE-MsgGUID: Ei1Sg3KXTOGveb+I6q9pUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606740"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: W/qeQiqSSbywI6HValN3zA==
X-CSE-MsgGUID: P6IDetDtRkyI+m7nN2RB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138702"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:33 -0800
Subject: [PATCH v2 11/23] drm/xe: Consolidate workaround entries for
 Wa_14018471104
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-11-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=125BmZcoiRd1sP7P1+YOTuEBkPIc+AofKwsg+AKMlOI=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtP9ZAwUgXGAXSRqHFrNsz9muqWjqa9K863
 L2wz/A5baCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BKKFD/0TFUUAJAkH91w3rZQZQlfrISaZpaS1uVOb2VISmXg7LfH/laYJQ0oRxfNz0v8xs0yn263
 U9k5btAX9En6cHNcYOu+IXW167xPatgobzBUQ0JfaPXAqhziI1p5EXMLrFwfVMGkU09lazxGOzY
 EYcDqJDv5XSNHUpCmrVe7Cvj7p/caCwXgA9dvZoIwxuC4qdkxooMah7X1Sf+ginD8wh2puByDT5
 zc+A2Hzi3oRMXgkwew4FxmKD+7nZE1HyXPrdGKsdCy+o6vxwy26XntNGxU4+sRrCecKyP0kEVw9
 SXVaJbXiqxfgIAOuFnRpR4v2Jn/RMACL4xXOY5F41fYTP4KjiTC8Tp/Q9JyFc3ZE6iVOm0SHqVB
 feGwQ04EUCrTMe6tb/bgvt8yv84Ei4QYVvh0n3yxP9NfbzmvVt0GCPCn7DyU2DhLSD5j+02LM/3
 YDtPMsjViF8BR3FMNcLXA74v8kZFCZneplSuZr4Tvacl/tjJpq+faVBMA++D9nzZeiEAgJ70rHD
 ysGNrAsPSS415P5Q6CspxJNCa9ZwK+eAF99Mdy+OC9J0Q27NgrIopsROKLu2OvJLkI9PP+hEiKU
 OdSM3blPJsyniFAwyOz8AYI6qxE5anX7PuGnP47vfyPCTZfdWeDU5Hy9T7gi0SPHgh6ZqkO8I47
 raDbw6bopINsmNA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_14018471104 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 4809166ba8ec69fc913fe2ca0103fe54e345dd14..9119ca9ba1031d9180b44c13a702e1bb04fd0ca6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -358,6 +358,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
+	{ XE_RTP_NAME("14018471104"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
+	},
 
 	/* TGL */
 
@@ -500,10 +505,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-	{ XE_RTP_NAME("14018471104"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
-	},
 	/*
 	 * These two workarounds are the same, just applying to different
 	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
@@ -545,11 +546,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-	{ XE_RTP_NAME("14018471104"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
-	},
 	/*
 	 * Although this workaround isn't required for the RCS, disabling these
 	 * reports has no impact for our driver or the GuC, so we go ahead and

-- 
2.53.0

