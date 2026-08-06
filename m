Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766B4C55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 08:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD410F112;
	Thu,  6 Aug 2026 08:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTvkH4jI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196F210F112;
 Thu,  6 Aug 2026 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786003933; x=1817539933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhdXKgKEl6nB7uZM+WEh7t6XCZVl7srCJhqVK7JPpOs=;
 b=GTvkH4jInFcVYEYOXRGwRy7cYwzCJHbConwDhJsP6URPRgJjUWRFwU8t
 1XeJKdAbJ3Bd5UdKwkLPK56UJyQLD7Z4KccHetXiZGWJEQbhoC0IFcd8b
 mmD89QnFEmBgpx2pHhzCmlEKXzpIqkwaLd+UizifBzC3CduWZ/qqguKKq
 I5rg87o5xQx94PZi/cP2kTOVAx1VvMU7eJop1Wyu+rSaIF/WQiil3a6Dy
 IQd1oXhUOzz13ZNNrqK0Q7jXVd2XaEoWRTU6+FYUom4G6yqNGcXZ+7PPt
 st72iEPxYN/jWT51hYhL3tbWVPC0BolSOGJbdjfpKJLpNWY8SLs/DKDu+ w==;
X-CSE-ConnectionGUID: fE5Ww0okQjWG8iJ7FoIzZw==
X-CSE-MsgGUID: YfLx6v6oRSuZ6zC9oBdvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86443554"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86443554"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:12:13 -0700
X-CSE-ConnectionGUID: TICYCfaqQpq9Xn87VoelZg==
X-CSE-MsgGUID: WxbX5PXEQraJpUfyeI/oWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="262652736"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa009.jf.intel.com with ESMTP; 06 Aug 2026 01:12:11 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config()
 call
Date: Thu,  6 Aug 2026 13:18:19 +0530
Message-ID: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

mst_stream_compute_config() called intel_pfit_compute_config() twice
in a row. Probably because of a bad merge. Drop the redundant duplicate
call.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Fixes: 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3be1643f8d03..57daed0b0b36 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -761,10 +761,6 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
 	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
 	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
 
-	ret = intel_pfit_compute_config(pipe_config, conn_state);
-	if (ret)
-		return ret;
-
 	ret = intel_pfit_compute_config(pipe_config, conn_state);
 	if (ret)
 		return ret;
-- 
2.50.1

