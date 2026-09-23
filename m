Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012F1C9830E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9B710ED47;
	Wed, 23 Sep 2026 16:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAbo0DNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4F10ED61;
 Wed, 23 Sep 2026 16:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790181810; x=1821717810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cHLqRU5l/tvBwBIvSviv4D9miHM0APFt0+8AKmuuU+E=;
 b=SAbo0DNnlmE1R6tIxSquc+jxGIFVHkuU2lbZaXet/6SPBLdzTWPtjQkr
 +KIMhoFOItwpseP0x8Hu+JdgkwkEVPyxfVknHdxj/IQxKU74T+8l/QfbN
 cshqTLI3zdPOekApvbVglyf7oCikc1Y09YuQfxScKABhX7x0VZ0BMxIDp
 rZ3xvqNuhXgkCym8ZCPQPfJw2JPCWlmBqaFUq4zQNyQLIVN/304G2Jlo7
 qWheFGAfFJLAwRcRwztLK1Pg+k/Ihd1DJjnCiAF49ZF4dKwn4ahlBpkld
 +dflk6TfY2R8elbzhVZQvY7Xrc2eFlAU89huWOTiUOIkrrxC5NLaaqAtk g==;
X-CSE-ConnectionGUID: 39oWezHSTAq6wkInJHCQLg==
X-CSE-MsgGUID: 4lOmxRwuSSWnjQtEAL4ZIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90922965"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90922965"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:30 -0700
X-CSE-ConnectionGUID: RjmDSHhAT8et9VqQ4zvDAg==
X-CSE-MsgGUID: kX6khYXaT0W9HwCWPwhohQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4776677"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.46])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Xizhe Tang <xizheTang2005@163.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/3] drm/i915/vrr: Introduce intel_vrr_can_use_vrr_tg()
Date: Wed, 23 Sep 2026 19:43:20 +0300
Message-ID: <20260923164321.9230-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
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

Supposedly Wa_14015401596 is only relevant when using the VRR
timing generator. intel_vrr_possible() can return true even if
we can never use the VRR TG (eg. when always_use_vrr_tg()==false,
and we're outside the VRR range). So we're currently enabling
the workaround even when not strictly needed.

Introduce a new helper intel_vrr_can_use_vrr_tg() which will
actually tell us whether the VRR TG might get used (now or later).

Cc: Xizhe Tang <xizheTang2005@163.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f1d48b69a18f..08abaa2277b0 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1373,7 +1373,7 @@ int _intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state
 		return 0;
 
 	/* Wa_14015401596 */
-	if (intel_vrr_possible(crtc_state) && IS_DISPLAY_VER(display, 13, 14))
+	if (intel_vrr_can_use_vrr_tg(crtc_state) && IS_DISPLAY_VER(display, 13, 14))
 		return 1;
 
 	/* Rest is for SRD_STATUS needed on LunarLake and onwards */
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index d43a06907d18..bb2bfa8e76e2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -839,6 +839,14 @@ bool intel_vrr_always_use_vrr_tg(struct intel_display *display)
 	return false;
 }
 
+bool intel_vrr_can_use_vrr_tg(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return intel_vrr_always_use_vrr_tg(display) ||
+		crtc_state->vrr.in_range;
+}
+
 static int intel_vrr_hw_vmin(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 19c7990be1b2..f04e81593d99 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -48,6 +48,7 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
 void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
 			 struct intel_crtc *crtc);
 bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
+bool intel_vrr_can_use_vrr_tg(const struct intel_crtc_state *crtc_state);
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state);
 
-- 
2.54.0

