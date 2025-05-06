Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F9C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 14:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9658710E6D0;
	Tue,  6 May 2025 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDQJGUeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85910E6D4;
 Tue,  6 May 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746543455; x=1778079455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yn8aJ3c49M3T99RTr/UhLaU5zICz1nrLMRjpfaSDTEE=;
 b=XDQJGUeqoa3nqLVcrKtxZwrDF7/+CjO0xmZn7pBR5RwPbb+9uJmW7NcF
 olEqbpHeiB4/NxfZ8DgI5gKPLO0caerN5VHQ/H5Z2hHKmTwvYwZcydaSq
 Fw5FXfIBK+2WMsQp0/VEXbWbHOSuk7Y71ve+78V/dmsXZTKuDOmo0AzxK
 2g2BjCyhIpeT10c92hOyT80g13EKj0pa/MfHBf0Vk4R0lfylwIxDmOhot
 DMdtvIR5qWK5Edlv8AbPwwu6wYQn8ZXCEa/JCacXj5z/NUAdM9Rq0iPXi
 hM6t+Ic/c3U92U6pxxLdb+8onV9MunyBPUxjkLHYBAYtYd7pXRAhLUP5J A==;
X-CSE-ConnectionGUID: iKRGsDJwTTeziJzE3hxQlw==
X-CSE-MsgGUID: 0He4jXgHTMKep88z0r+Qdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59206096"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59206096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:57:35 -0700
X-CSE-ConnectionGUID: zmmlvih6RLyOx6YZBDnxiQ==
X-CSE-MsgGUID: m1c96QkXSt2DPUzawLVQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="166572222"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2025 07:57:33 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ville.syrjala@intel.com
Subject: [PATCH v4 11/17] drm/i915: Extract vrr_vblank_start()
Date: Tue,  6 May 2025 20:25:11 +0530
Message-ID: <20250506145517.4129419-12-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Initialise delayed vblank position for evasion logic.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vblank.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 139fa5deba80..680013f00fc0 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -642,6 +642,14 @@ intel_pre_commit_crtc_state(struct intel_atomic_state *state,
 	return pre_commit_crtc_state(old_crtc_state, new_crtc_state);
 }
 
+static int vrr_vblank_start(const struct intel_crtc_state *crtc_state)
+{
+	if (intel_vrr_is_push_sent(crtc_state))
+		return intel_vrr_vmin_vblank_start(crtc_state);
+	else
+		return intel_vrr_vmax_vblank_start(crtc_state);
+}
+
 void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 			     const struct intel_crtc_state *new_crtc_state,
 			     struct intel_vblank_evade_ctx *evade)
@@ -668,10 +676,7 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		drm_WARN_ON(crtc->base.dev, intel_crtc_needs_modeset(new_crtc_state) ||
 			    new_crtc_state->update_m_n || new_crtc_state->update_lrr);
 
-		if (intel_vrr_is_push_sent(crtc_state))
-			evade->vblank_start = intel_vrr_vmin_vblank_start(crtc_state);
-		else
-			evade->vblank_start = intel_vrr_vmax_vblank_start(crtc_state);
+		evade->vblank_start = vrr_vblank_start(crtc_state);
 
 		vblank_delay = intel_vrr_vblank_delay(crtc_state);
 	} else {
-- 
2.48.1

