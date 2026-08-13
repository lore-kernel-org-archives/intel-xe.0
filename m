Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF493C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6028E10F2F1;
	Thu, 13 Aug 2026 12:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3bP3Wjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5664010F2E8;
 Thu, 13 Aug 2026 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786623851; x=1818159851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7EqUDnvaroEUuuD3tdTPgSSRCAoNIWa+gTsMpb4rKFI=;
 b=W3bP3WjpzYEJowDQdYEaGRDw2IgDijQRV6EThrHpuw+SjVa8h0BPP40m
 Q6B7i+zgpjSr2TfapF1RYxgqZR2uXzE8ChsgxDaV84z6E4pyaxKTqVabt
 kyuKKepn6UVSJQsvJBEFw5bKcdqvliGaitcXiU5f9HU1EfhIZpm6X4T/k
 nnx75OnIyosihpeZD65oYPeernf/DQwTezQst5mslWGNy9go4ADhTfHwu
 pHCCdIIMpH0pyFJXuUdjukmwdVLNrnm0HGlaCduf5FNaGTHK1jEC8syr/
 TzmjzMt3gx2rAeKmqbg/ipfaGSmm1fMLRo1cNvvWi1Dx1U92jMZCkjQTY Q==;
X-CSE-ConnectionGUID: sym2BjjeS8yN4eBz7VczJw==
X-CSE-MsgGUID: 5PefAWbWTAylKGK02P9c7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86314060"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="86314060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:24:11 -0700
X-CSE-ConnectionGUID: tz5Nv7L6RNi6Aw5gA3h7Ow==
X-CSE-MsgGUID: 7K+OzZccTcOmmQjahF75pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="260652274"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2026 05:24:10 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [v4 1/2] drm/i915/hdmi: Move audio compute config after format
 selection
Date: Thu, 13 Aug 2026 17:30:15 +0530
Message-ID: <20260813120016.3444891-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
References: <20260813120016.3444891-1-chaitanya.kumar.borah@intel.com>
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

As we plan to add audio BW calculation in i915,
intel_audio_compute_config() would need the final output_format
and pipe_bpp to correctly determine audio bandwidth constraints.

Move the intel_audio_compute_config() call to after
intel_hdmi_compute_formats() returns, ensuring the audio
configuration is computed with the final parameters.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9b637e38a1a5..b6fa1a1558b8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2399,10 +2399,6 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 	if (!intel_link_bw_compute_pipe_bpp(pipe_config))
 		return -EINVAL;
 
-	pipe_config->has_audio =
-		intel_hdmi_has_audio(encoder, pipe_config, conn_state) &&
-		intel_audio_compute_config(encoder, pipe_config, conn_state);
-
 	/*
 	 * Try to respect downstream TMDS clock limits first, if
 	 * that fails assume the user might know something we don't.
@@ -2417,6 +2413,10 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 		return ret;
 	}
 
+	pipe_config->has_audio =
+		intel_hdmi_has_audio(encoder, pipe_config, conn_state) &&
+		intel_audio_compute_config(encoder, pipe_config, conn_state);
+
 	ret = intel_pfit_compute_config(pipe_config, conn_state);
 	if (ret)
 		return ret;
-- 
2.50.1

