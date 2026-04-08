Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC21073CA7
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEDD10E633;
	Wed,  8 Apr 2026 12:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HR8APohz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96C510E633;
 Wed,  8 Apr 2026 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775651502; x=1807187502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsKktwUSGuoAWIPz79uzF6w5qzQ0JKfxb4QVV/k7wTA=;
 b=HR8APohzwnXVMmGE62v2A1yMoI7h14JB0pYYgWUlfwbjsNU4+zgMlCdU
 ZxcLw/7D9jMPFIj/LepMjkCMEVrxM+wXDfWmrEZs2WoAhYDD3PwGFEEBD
 nhkqZxWu4dxJN0/gjiyD/VZv0F1SE/vL9fYeyWtZs0tcHiohgFruPqYal
 fd3/fCL8cvR6fUQ/bq6VWotDs92Wu8yKVYLgzwZIXupnLm/jrjxp8IHxF
 Zbp7ak3lZCNPfaiNhmIGYnOgIpWhoRvpr1y123WsEcZslowaOfax7drBF
 1wQYJ/SKl5BZxuA0Jr6OL/y/F7EDnyTRFjexoV2G8tlwvUkEsiA5ZRgkI g==;
X-CSE-ConnectionGUID: +yqwEHx0T8u3jG4bxlqKZQ==
X-CSE-MsgGUID: p0xdiCA5QK6L5gTS1ya6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80519082"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80519082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:42 -0700
X-CSE-ConnectionGUID: dHsJbSSWQuWtT8terqnlnQ==
X-CSE-MsgGUID: DUkhfabyRUy6/5liAng4sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251782054"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:40 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH v3 5/9] drm/i915/scaler: Call skl_update_scaler_crtc() earlier
Date: Wed,  8 Apr 2026 15:31:10 +0300
Message-ID: <20260408123115.15716-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
References: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
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

Move the skl_update_scaler_crtc() call into intel_crtc_compute_config().
It no longer has any dependency on CDLCK/etc. so it doesn't need to be
done so late.

The fastset/modeset checks are redundant now as that's exactly
when intel_crtc_compute_config() is called.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 11952136c686..58f33ee72272 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2467,6 +2467,7 @@ static int intel_crtc_compute_set_context_latency(struct intel_atomic_state *sta
 static int intel_crtc_compute_config(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
@@ -2494,6 +2495,12 @@ static int intel_crtc_compute_config(struct intel_atomic_state *state,
 
 	intel_vrr_compute_guardband(crtc_state);
 
+	if (DISPLAY_VER(display) >= 9) {
+		ret = skl_update_scaler_crtc(crtc_state);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -4287,13 +4294,6 @@ static int intel_crtc_atomic_check_late(struct intel_atomic_state *state,
 	}
 
 	if (DISPLAY_VER(display) >= 9) {
-		if (intel_crtc_needs_modeset(crtc_state) ||
-		    intel_crtc_needs_fastset(crtc_state)) {
-			ret = skl_update_scaler_crtc(crtc_state);
-			if (ret)
-				return ret;
-		}
-
 		ret = intel_atomic_setup_scalers(state, crtc);
 		if (ret)
 			return ret;
-- 
2.52.0

