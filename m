Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83B3CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 08:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A9810E47A;
	Wed,  3 Sep 2025 08:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI5/+Gap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056310E47C;
 Wed,  3 Sep 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756887083; x=1788423083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFk3FGtC0jVpCmnZuF8Yg6hyTSRYBi1b7lZWoiHuUWg=;
 b=jI5/+GapZPLn4oh0PBu1I5GYJztfJqYAFqN9+EBEZvPyyAYSLCOchxaW
 457om9z0K38WmiSlw/t2ZSKvxqLLcsrJfZz8kW5ot6JIqs13QaclODWrZ
 E1W+l46GV12XdMa0NPSEXWOSw1x/dzzYDuZ2+SZKJpgcWkN6no3D/7Ad6
 3+lmWTvsamh+RlB2l91ArrEYQ1oQHbnAzckxfpGK8xJfwZTnRlzezPw5x
 SbyqhiSj+8Nfly8ToVcOZux0KzEzMv+eCfGLTAQSxIbWDtEknH/M47q7X
 lrVrsfmLLHLuQYNZtH4jkN1bdbXtOWXG+QImYehZuSvuUFYeTotRsvDq7 w==;
X-CSE-ConnectionGUID: Ty7edocuTZ+n3zK1gsz0AQ==
X-CSE-MsgGUID: QL1bkr41ToiaokiJ01oMvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62834555"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="62834555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 01:11:23 -0700
X-CSE-ConnectionGUID: oKhVvbktSBKjXUo1zEhACw==
X-CSE-MsgGUID: KRyRuk5/Q8yn2iRbuMbkkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="208731850"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa001.jf.intel.com with ESMTP; 03 Sep 2025 01:11:21 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, vinod.govindapillai@intel.com,
 jonathan.cavitt@intel.com, Uma Shankar <uma.shankar@intel.com>,
 Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [v3 1/1] drm/i915/display: Remove FBC modulo 4 restriction for ADL-P+
Date: Wed,  3 Sep 2025 13:53:23 +0530
Message-ID: <20250903082323.283632-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250903082323.283632-1-uma.shankar@intel.com>
References: <20250903082323.283632-1-uma.shankar@intel.com>
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

FBC restriction where FBC is disabled for non-modulo 4 plane size
(including plane size + yoffset) is fixed from ADL-P onwards in h/w.

WA:22010751166 does not apply past display version 12.  Or, in
other words, the FBC restriction where FBC is disabled for
non-modulo 4 plane sizes (including plane size + yoffset) is fixed
from display version 13 and onwards. Relax the restriction for the same.

v3: Update comments for clarity (Jonathan Cavitt)

v2: Update the macro for display version check (Vinod)

Suggested-by: Vidya Srinivas <vidya.srinivas@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d4c5deff9cbe..9e097ed80bd1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1550,14 +1550,14 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	 * having a Y offset that isn't divisible by 4 causes FIFO underrun
 	 * and screen flicker.
 	 */
-	if (DISPLAY_VER(display) >= 9 &&
+	if (IS_DISPLAY_VER(display, 9, 12) &&
 	    plane_state->view.color_plane[0].y & 3) {
 		plane_state->no_fbc_reason = "plane start Y offset misaligned";
 		return 0;
 	}
 
 	/* Wa_22010751166: icl, ehl, tgl, dg1, rkl */
-	if (DISPLAY_VER(display) >= 11 &&
+	if (IS_DISPLAY_VER(display, 9, 12) &&
 	    (plane_state->view.color_plane[0].y +
 	     (drm_rect_height(&plane_state->uapi.src) >> 16)) & 3) {
 		plane_state->no_fbc_reason = "plane end Y offset misaligned";
-- 
2.42.0

