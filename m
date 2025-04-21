Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D3FC369D2
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 15:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05B910E485;
	Mon, 21 Apr 2025 15:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jt4LGvsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5110E484;
 Mon, 21 Apr 2025 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745250678; x=1776786678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3NMqGu5F4K9ASbw/2kVR/szgt6OpzT3U0Gn8H9S3Dc=;
 b=jt4LGvslTDUXVjy0w30m1P0yBqkqBzQEzyZeXnyCGLFl3r6Uwhe5mr9S
 hxWX7tQoR4yf9UVMdpIzZf3UHhK5Uj+2fjdwLMBfUMb+mq1l17veuSRXq
 6Qxl4lFR56/fKsmyxJKAgkie/nhXRaCCmKc2ycNsuNScJ/+VpWho5GUgv
 3C2+0yxZAhAuaktH68bcBgU7uWjsHkn+TFahJE+P4NIn+YYOQcpdvTArB
 F794cl569IZ7oLeTmO0j27IyVGweg6xNxQj3gvAjnGPTV0+cM5R4Nv/UR
 G4mtRfBbMyk6SGudpgntQM6WU6nkFr4BnsjGToOz/EIcE+3z+kreYQ6Rw A==;
X-CSE-ConnectionGUID: oN1taxDBSCG4DjLnY+QLlg==
X-CSE-MsgGUID: Tx7dnyDOQb2fHDdgh+Fl6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57434074"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="57434074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 08:51:18 -0700
X-CSE-ConnectionGUID: QqTT/2oUTV+fRg/1bAIp1w==
X-CSE-MsgGUID: q4B6tZYVTbKNddeR89P9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="162725616"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 21 Apr 2025 08:51:17 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	ankit.k.nautiyal@intel.com
Subject: [PATCH v2 07/13] drm/i915: Extract vrr_vblank_start()
Date: Mon, 21 Apr 2025 21:18:54 +0530
Message-ID: <20250421154900.2095202-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250421154900.2095202-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250421154900.2095202-1-mitulkumar.ajitkumar.golani@intel.com>
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

