Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB557C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8704110E300;
	Mon, 26 May 2025 12:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ir2Xlitk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D2510E356
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261142; x=1779797142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r7OC49p3dtDWWDLgsPHkvDsHMTTVpbWyvWudLlKi/RU=;
 b=ir2XlitkTGK9GeJXEY/aLIYN9kvEU4M60HVx9eBj9F3hJLGsJfjPcGcv
 ZdmpAtDmettqqtGGj9LS1jThxrUzYcBFjB/E8yWyuuqwLjpovbESZqBAp
 /M+dMoUbHpuXQpDihuSoo/is2aldZr++bjNL1zM49gybUS1L82KF9fCZy
 fPbwiEOuJTKYwAISN39QDDHEpjgmglrQCIwuNPCvmYOzy04O4Bkcp/Y6t
 t0XAvFvZVCsmZOZhPe5ftUFBHq5CJ9wPbiQqzBa7d4q85EkA6VDDgMO7k
 qE1QoLEndKn9rQk2sjRE2XvSisJri3nZO7h8mEcXlop+L74OS0W16b1rE w==;
X-CSE-ConnectionGUID: bef4owPPSL2V+6xBKxIu2Q==
X-CSE-MsgGUID: xY+SMSmCS2aBVGC0GauMEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492298"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:42 -0700
X-CSE-ConnectionGUID: kIjoZlcnR8mTocYfvOxkpA==
X-CSE-MsgGUID: i4wI2fH3SymVmlgGlybhXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576064"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 07/12] drm/i915/alpm: Add new interface to check if AUXLess
 ALPM is used
Date: Mon, 26 May 2025 15:05:07 +0300
Message-ID: <20250526120512.1702815-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

we need to know if AUXLess ALPM is used when preparing for link
training. Add new interface for this and use it in existing code where
possible.

v2: remove kerneldoc comment

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 10 ++++++++--
 drivers/gpu/drm/i915/display/intel_alpm.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 0890247085a7..bbcf510b0c25 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -26,6 +26,13 @@ bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp)
 	return intel_dp->alpm_dpcd & DP_ALPM_AUX_LESS_CAP;
 }
 
+bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state)
+{
+	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) ||
+		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
+}
+
 void intel_alpm_init(struct intel_dp *intel_dp)
 {
 	u8 dpcd;
@@ -341,8 +348,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if ((crtc_state->has_panel_replay && intel_dp_is_edp(intel_dp)) ||
-	    (crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp))) {
+	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index c9fe21e3e72c..86f4d5ab1981 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -32,6 +32,8 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
+bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 #endif
-- 
2.43.0

