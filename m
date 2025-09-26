Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33050CAC5BF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 06:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867E10E9E3;
	Fri, 26 Sep 2025 06:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J99XNXe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7954110E9DC;
 Fri, 26 Sep 2025 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758867202; x=1790403202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LmKIW6GnuxZU8j54hI0cuCBpq/VBX9LecI9q69Ur2pQ=;
 b=J99XNXe/K6LTwJxOYOlCBHpVxITojs/uE2PHNa0/Ei7FdsXC6E4796Wu
 MtS4AcseOokgNEn7oamCbF6hRQD+0O7rpeZw36U1fWR8ny2yyc+MQoK5I
 XaieM4H0dydRLyZRRCBibbInNGErAA0GH+qFJCIzNlyAGD0RkidjP3Lyx
 ffaLH6WqpVv/mkA9xGUKd5HGsV2vdL2KRnfsux4hxDDOSkuhE+VFEZLL7
 7+WzG3Lr2/qxOqbpEgXk2q67ThkzKXvm/7oKil4ucVTJYPg4USXTh8xQA
 BvFbMXpmiBXRsjWrUNxWNd/kasADujPZDElkBpeZxWejVwnEWtS6YyTgZ A==;
X-CSE-ConnectionGUID: 3qJeo8qJS7Oc0hvvKa66hw==
X-CSE-MsgGUID: /lYPSmWwQhaY28PqXg35jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65007611"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65007611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 23:13:22 -0700
X-CSE-ConnectionGUID: OP59eGvnQSuduKaiTVc4Ng==
X-CSE-MsgGUID: CwCaiC4WSnCSoV/OGlip5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177092942"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 23:13:21 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 13/14] drm/i915/display: Recompute crtc_vblank_start for
 optimized guardband
Date: Fri, 26 Sep 2025 11:29:34 +0530
Message-ID: <20250926055935.3532568-14-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926055935.3532568-1-ankit.k.nautiyal@intel.com>
References: <20250926055935.3532568-1-ankit.k.nautiyal@intel.com>
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

Currently crtc_vblank_start is read out either from VBLANK_START (pre
ADL) or from set context latency and vactive, in
intel_get_transcoder_timings().

As we move the delayed vblank to reduce the guardband, we need to use
the guardband to readout the new vblank start.

Recompute and overwrite the new vblank start when optimized guardband is
used in intel_vrr_get_config().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index efa8fb8f012c..fe7e9d769ab2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -832,6 +832,15 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	 */
 	if (crtc_state->vrr.enable)
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+
+	/*
+	 * If guardband is optimized then vblank start is vtotal - vblank_start
+	 */
+	if (intel_vrr_use_optimized_guardband(crtc_state))
+		crtc_state->hw.adjusted_mode.crtc_vblank_start =
+			crtc_state->hw.adjusted_mode.crtc_vtotal -
+			crtc_state->vrr.guardband;
+
 }
 
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
-- 
2.45.2

