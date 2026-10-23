Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19559606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1SfyOli
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC68112C5F;
	Fri, 23 Oct 2026 16:59:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427AD112C50;
 Fri, 23 Oct 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774725; x=1824310725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5jHuyQzCQpdF4ztlgEaIXDR2UIOaru900rx08TWiw5M=;
 b=g1SfyOliPEdWdfmMr4TR3OYQ3H3vLLDi2AdBJKWa5xKYWwI3uukdhm0O
 wxsC0E9oNhaHOq1ccTCLsUkrGiAzjlivfsBuAxJs8QQP7/FBSFvvbDprH
 KC6AdDzR/bbV4DP5OG2v5DzpoHKy1W1kfq/pW4+6+ggKJoN9h3fSa80Bz
 ynQsMXxFr3rDEfwWm7zwcvNAa915H2VA2K0jOLwdgC49fEvW/aaQLzgJc
 tQ0obAjz87+4hhFpspQoK9ixxz8uYwaj6NuOICAFyo1XZ6y2vUzEblMyN
 8pOI0Jwy1Cri9LpVJ0nCO9IKPuYxt6k1+6lSHLVkto1FiRC/ZvLSKdm8b A==;
X-CSE-ConnectionGUID: UvltXU7FT96rKZIm7z9BYA==
X-CSE-MsgGUID: CdSdLcEtSfyWoSFvJJR9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428594"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:45 -0700
X-CSE-ConnectionGUID: OVfThk+BS2ihz56NQSwqiQ==
X-CSE-MsgGUID: mUpVb82YTdCnp9xgUEgVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4033963"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:42 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/13] drm/i915/vrr: Extract intel_vrr_vmin_vblank_start_live()
Date: Fri, 23 Oct 2026 19:58:00 +0300
Message-ID: <20261023165803.31016-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the messy ternary from intel_vrr_vmin_safe_window_end_live()
into intel_vrr_vmin_vblank_start_live(). We'll also be able to reuse
this new function in the MMIO vblank evasion code soon.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e0b0b9ceb335..a549807586f8 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1250,6 +1250,14 @@ intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
 	return vblank_start;
 }
 
+static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
+{
+	if (crtc_state->vrr.dc_balance.enable)
+		return intel_vrr_dcb_vmin_vblank_start_live(crtc_state);
+	else
+		return intel_vrr_vmin_vblank_start(crtc_state);
+}
+
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -1269,11 +1277,8 @@ static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
 
 int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
 {
-	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
-			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
-			intel_vrr_vmin_vblank_start(crtc_state);
-
-	return vrr_safe_window_end(crtc_state, vmin_vblank_start);
+	return vrr_safe_window_end(crtc_state,
+				   intel_vrr_vmin_vblank_start_live(crtc_state));
 }
 
 static
-- 
2.55.0

