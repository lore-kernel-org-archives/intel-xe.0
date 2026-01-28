Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F8D3F06B
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2A10E6E1;
	Wed, 28 Jan 2026 14:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7eekaxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E909710E6E8;
 Wed, 28 Jan 2026 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769610169; x=1801146169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w71j3shsBrShUxcdndUYXEp44VEbv0/kgPYrb9VJI5k=;
 b=i7eekaxhz5eOhuokPWoi670yk+iKiJf3a5U/+eYaBYWW1RdqQOZvjYSB
 gNUWYD5VZsf2WbF3EgE+Dk5ZtxeB+nDBFfU8LZY+S2MzdNGWPekphSZgf
 X5phLYYmYCurvxW1cw3UUwj31D1pjGrg9Edo54znvBTjg2YMUx9Iv6NRv
 XHWlz7gu5CKhN/qK+4KxOAE4XwTzw58RV5u70HTX42EiQTiCWXvR32/D0
 QcdrIxAdMi0VmNGkchQ4wBC6L/NqUx6DakKPRyACHMzEQnhwU5hrkJU8j
 C7BqjE3pBb/E43dj/T+lgoA9viru111flY5aoY9mBy/+3UgxUd4pddRPk w==;
X-CSE-ConnectionGUID: pxqTnj37TsyEqXb9VeNeHA==
X-CSE-MsgGUID: YnYy8AapTWuS/wu/fD3cUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="58400935"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="58400935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:22:48 -0800
X-CSE-ConnectionGUID: sYd3NlXeQ9WB1HLy89HqKw==
X-CSE-MsgGUID: oFhUqlVSQLOaYjYT5PH/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245881376"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 06:22:47 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/16] drm/i915/dp_mst: Rework pipe joiner logic in
 compute_config
Date: Wed, 28 Jan 2026 19:36:30 +0530
Message-ID: <20260128140636.3527799-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
References: <20260128140636.3527799-1-ankit.k.nautiyal@intel.com>
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

Similar to the DP SST, refactor `mst_stream_compute_config()` to iterate
over joiner candidates and select the minimal joiner configuration that
satisfies the mode requirements. This prepares the logic for future changes
that will consider DSC slice overhead.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 47 +++++++++++++++++----
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 29ac7b2e1e9c..7a83af89ef03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -687,6 +687,7 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
 	int num_joined_pipes;
+	int num_pipes;
 	int ret = 0;
 
 	if (pipe_config->fec_enable &&
@@ -700,17 +701,45 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 	pipe_config->has_pch_encoder = false;
 
-	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
-						     adjusted_mode->crtc_hdisplay,
-						     adjusted_mode->crtc_clock);
+	for (num_pipes = 0; num_pipes < I915_MAX_PIPES; num_pipes++) {
+		int max_dotclk = display->cdclk.max_dotclk_freq;
 
-	if (num_joined_pipes > 1)
-		pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1, crtc->pipe);
+		ret = -EINVAL;
+
+		if (num_pipes == 0) {
+			if (!connector->force_joined_pipes)
+				continue;
+			num_joined_pipes = connector->force_joined_pipes;
+		} else {
+			num_joined_pipes = num_pipes;
+		}
+
+		if (!intel_dp_can_join(display, num_joined_pipes))
+			continue;
+
+		if (adjusted_mode->hdisplay >
+		    num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display))
+			continue;
+
+		if (num_joined_pipes > 1)
+			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
+							    crtc->pipe);
+
+		ret = mst_stream_compute_link_for_joined_pipes(encoder,
+							       pipe_config,
+							       conn_state,
+							       num_joined_pipes);
+		if (ret)
+			continue;
+
+		max_dotclk *= num_joined_pipes;
+
+		if (adjusted_mode->clock <= max_dotclk) {
+			ret = 0;
+			break;
+		}
+	}
 
-	ret = mst_stream_compute_link_for_joined_pipes(encoder,
-						       pipe_config,
-						       conn_state,
-						       num_joined_pipes);
 	if (ret)
 		return ret;
 
-- 
2.45.2

