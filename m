Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5759FF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676D310E7C0;
	Thu, 30 Apr 2026 13:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzkNT28q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182310E75E;
 Thu, 30 Apr 2026 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777555631; x=1809091631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMI/ZnZct1xD8p4ADVFyeubhH48NtKmjHktiTKkjcFA=;
 b=JzkNT28qm4nf8/+k3sdlICWxNe8DOykAO+blIUwRPl5SWlBzjLFmG+N+
 y/u6z9yVuN9rN4SuCA4Umo//VcL5dU46rjtwc6SgAz1OUdwRtRY2JnQJH
 w52cgsjorQqlrfn4qO7JBd18TFKksVxK83IIwpKKZ11TasA4BPiarEa++
 C8a0clbQ3dY/u7XMyDleSIVtI1sjiSjRfjGF+TUYrlgzMlv6YQE/PgclY
 s3YaG+p4uB2V4qcZqWr5vHj6t0sORH8SE9Qvr+7unrmNPwCuMzgehZK1y
 3yfki8UoVjeAxe6coyzTg6qoKXwA73gaS0llGPRx7apRIggKfkrliA1r8 g==;
X-CSE-ConnectionGUID: cABFyiZcRbCHRj4DKhpwQA==
X-CSE-MsgGUID: /7y5kw/lRXuFZ/OQJRFWRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78398730"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78398730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:11 -0700
X-CSE-ConnectionGUID: MnFE2wf6SwiMmzA9u7NN9A==
X-CSE-MsgGUID: TogZC5FnTbOSH3uBBbo//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="257919889"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/5] drm/i915/dp: Drop call to intel_panel_fixed_mode() from
 compute_config
Date: Thu, 30 Apr 2026 18:42:20 +0530
Message-ID: <20260430131220.3891497-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
References: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
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

At the moment, in intel_dp_compute_config(), intel_panel_fixed_mode() is
called to check if the panel has any fixed mode or not. If it is an eDP
and has the fixed mode, then intel_panel_compute_config() is called.

However, the intel_panel_compute_config already checks if the panel
supports a fixed mode and returns early if it doesn't. This makes the
earlier check in the caller redundant.
Remove this extra check for intel_panel_fixed_mode().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index eef85598bcd9..c89c7b440188 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3569,12 +3569,10 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
-	const struct drm_display_mode *fixed_mode;
 	struct intel_connector *connector = intel_dp->attached_connector;
 	int ret = 0, link_bpp_x16;
 
-	fixed_mode = intel_panel_fixed_mode(connector, adjusted_mode);
-	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
+	if (intel_dp_is_edp(intel_dp)) {
 		ret = intel_panel_compute_config(connector, adjusted_mode);
 		if (ret)
 			return ret;
-- 
2.45.2

