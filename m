Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EB8C43602
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 13:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7055E10F389;
	Thu,  2 Jul 2026 13:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TK3JKGKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BF910F388;
 Thu,  2 Jul 2026 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782997575; x=1814533575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4f7ymS0GmfolwfkJ/z2QDElHyuih8Xu5aQthr08X6I=;
 b=TK3JKGKWZ6FyR5CfHaOFkHT3jX1NTb09p/Jqi0/CX8cFh3fybm0jQ7ym
 erel4HskVXXXpjGHFIpWnDWIrHSkWkziLwVYGMfWL7x6h1J6GfZodyRfz
 9uy+jLDeWhJ746i69eYOTSlDcI1PlC1J+bpO6QvDxpE36PP+1bMoYdrUo
 UYcuOEW/FGd88EeSFixtpCz5EyNNRTq5jIzET2oMB449aNlRiX4Kr6VMB
 0mFC/UeQ6ngcxuMn/2k+ffBkQJLd95fX9ru8Y5yOtkhwRrVbXmLH37gIX
 ldYkZc+gusrvywuduhn7LnnK3GDP4RGJKD40RVDoHfNGI/wOapYzRLF3q Q==;
X-CSE-ConnectionGUID: 7QHYuW/cQe2DCvTq7uFHVA==
X-CSE-MsgGUID: MOjr11c8S7KQ7GCn50oWLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83621205"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="83621205"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:06:15 -0700
X-CSE-ConnectionGUID: mV7BvIU/TX2DAmAV4Mhy5g==
X-CSE-MsgGUID: IDxSFTuDRZ+JyuLdEdJZoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="257748948"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 06:06:14 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 1/2] drm/i915/hdmi: Move audio compute config after format
 selection
Date: Thu,  2 Jul 2026 18:12:07 +0530
Message-Id: <20260702124208.2401160-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260702124208.2401160-1-chaitanya.kumar.borah@intel.com>
References: <20260702124208.2401160-1-chaitanya.kumar.borah@intel.com>
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
index 8a019d3574df..6b0b7e6cda36 100644
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
2.25.1

