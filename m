Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED3CA0EE9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 07:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E82910E3E3;
	Mon, 18 Aug 2025 07:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbimCVwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931F210E3E3;
 Mon, 18 Aug 2025 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755503134; x=1787039134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6hVRo0XPmNSD5JApdb6bvhHjeCdXRYLwN0OiJDSNuuo=;
 b=fbimCVwNW4mRYAe307LaPPuonrFJ4yo0lV/pPnc2V2cAfROZ6/3w+qzs
 OXJOmve7vulzZq4Ys4cyDD6m54IMj+3P7Q7EkPirorexpXn7BFoKmXSs3
 T2IwiJCJvtsflzmDpyX49noYB4jXzoPx8NuWCUpU2pjezhStQrwaIHFwc
 zGB8uL4GhlsOvv3DZsMXc3LIaF+PDhOYcUMiCoaQJUnZAKe+7rwJ4LRsY
 M0QMY5hrg3G/MtgxrxoYcd+Wn4HawqXVXHoWBHd2bexM2zaJ8/U9WqfBa
 Gm8i46cOEPqOuW288yZcCon6gp+Kv6wGAodEd4Cq/W1Wd2c2mH6yvf6rF g==;
X-CSE-ConnectionGUID: WdhXWfZ8QSCr6Ofdb9LYTw==
X-CSE-MsgGUID: woYNQe0ATP2brs5RtauaJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61347889"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61347889"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:45:34 -0700
X-CSE-ConnectionGUID: cRhQmp0AS+SfB5eTqqYbzg==
X-CSE-MsgGUID: LAqxCrxWTIum8St/wI/zSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167121927"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:45:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 01/12] drm/i915/skl_watermark: Fix the scaling factor for
 chroma subsampling
Date: Mon, 18 Aug 2025 13:01:17 +0530
Message-ID: <20250818073128.2319762-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250818073128.2319762-1-ankit.k.nautiyal@intel.com>
References: <20250818073128.2319762-1-ankit.k.nautiyal@intel.com>
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

The Bspec:70151, mentions Chroma subsampling is a 2x downscale
operation. This means that the downscale factor is 2 in each direction.
So correct the downscaling factor to 4.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index def5150231a4..df586509a742 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2185,7 +2185,7 @@ dsc_prefill_latency(const struct intel_crtc_state *crtc_state)
 				    crtc_state->hw.adjusted_mode.clock);
 	int num_scaler_users = hweight32(scaler_state->scaler_users);
 	int chroma_downscaling_factor =
-		crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 2 : 1;
+		crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 4 : 1;
 	u32 dsc_prefill_latency = 0;
 
 	if (!crtc_state->dsc.compression_enable ||
@@ -2228,7 +2228,7 @@ scaler_prefill_latency(const struct intel_crtc_state *crtc_state)
 		u64 hscale_k = max(1000, mul_u32_u32(scaler_state->scalers[0].hscale, 1000) >> 16);
 		u64 vscale_k = max(1000, mul_u32_u32(scaler_state->scalers[0].vscale, 1000) >> 16);
 		int chroma_downscaling_factor =
-			crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 2 : 1;
+			crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ? 4 : 1;
 		int latency;
 
 		latency = DIV_ROUND_UP_ULL((4 * linetime * hscale_k * vscale_k *
-- 
2.45.2

