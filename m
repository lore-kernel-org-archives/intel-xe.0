Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90AF1073CA8
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9953410E631;
	Wed,  8 Apr 2026 12:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKEVNFoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1810E631;
 Wed,  8 Apr 2026 12:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775651507; x=1807187507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fUGC9slu+fD42MMDgJOleAnviaWXYNhjC0XDSsey/M=;
 b=kKEVNFoQijXS3DOsisSVu3+LOfrYQwqnH2kFBuS0xqG4qdqnvZ2pX3kZ
 iET+8ugPuMoyNhzeZyMEkVMpMRAbJ/+NQy+WS5NhDgWUP5LfbXhGV5lK0
 9PGXFUUxx5aKwOTWaSgOdWHj5IcUxohbaUSVCcXG7YgGvmNXxjzDk1k0+
 2pNXJn5y6Km5iSSmYs2Uc36x8zwViIeltcW6tNZvobRFuAMo51wE89LZL
 Gh/HA95qktyFqXtXeByR4/CE/f4xj0Polu0sxSeptMMw1fucNXMA6/cUZ
 CXTMAxjIueT4eLRnskoCw2rERWGE8YWOG5k7ZRlWyAykbvvShT2s/ah4q A==;
X-CSE-ConnectionGUID: 3REmU0vTT1uBH0jf9PmNGg==
X-CSE-MsgGUID: fPRPXSCkS16hY3lA7IfyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80519089"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80519089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:47 -0700
X-CSE-ConnectionGUID: diKxOQZEQ5+A09lNu6ndQg==
X-CSE-MsgGUID: /3pIv7rCTJCGxcsaMQtJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="251782069"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:31:44 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH v3 6/9] drm/i915/scaler: Assign scalers earlier
Date: Wed,  8 Apr 2026 15:31:11 +0300
Message-ID: <20260408123115.15716-7-ville.syrjala@linux.intel.com>
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

Move the scaler assignment into intel_atomic_check_crtcs(). The
scaler assignment and scale factors are needed for the prefill
vs. vblank length checks performed during
intel_compute_global_watermarks().

I think originally the scaler code itself did some current cdclk
vs. scaling factor checks, which explains why it's being called
so late during intel_atomic_check(). But we've long ago switched
the logic on its head so that scaling dictates the minimum cdclk,
not the other way around.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 58f33ee72272..37df9676a207 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4293,12 +4293,6 @@ static int intel_crtc_atomic_check_late(struct intel_atomic_state *state,
 		return ret;
 	}
 
-	if (DISPLAY_VER(display) >= 9) {
-		ret = intel_atomic_setup_scalers(state, crtc);
-		if (ret)
-			return ret;
-	}
-
 	if (HAS_IPS(display)) {
 		ret = hsw_ips_compute_config(state, crtc);
 		if (ret)
@@ -5816,13 +5810,23 @@ static void intel_crtc_check_fastset(const struct intel_crtc_state *old_crtc_sta
 
 static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *new_crtc_state;
 	struct intel_crtc *crtc;
 	int i;
 
-	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		int ret;
+
 		new_crtc_state->min_cdclk = intel_crtc_min_cdclk(new_crtc_state);
 
+		if (DISPLAY_VER(display) >= 9) {
+			ret = intel_atomic_setup_scalers(state, crtc);
+			if (ret)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.52.0

