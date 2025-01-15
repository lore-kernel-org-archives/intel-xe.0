Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04951C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28C210E77E;
	Wed, 15 Jan 2025 15:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0dJMTQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A83310E73C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736954569; x=1768490569;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8Lic0QJVhHyJKD1W5or3cF05YsF+fYpnZxAXGMtg46c=;
 b=G0dJMTQw4qhDFXb9YjTWQVJd3Bod7T4gDElisSUczYd3CmghDIgKhpA+
 a3rq3mmMO7MvAi1PyBxaNXpAyrqP98MeHSHTe7+frfhQMeFdkqKk8loge
 WpU2YlZJwdJ89btNjGJYrmDsmiQfeELjC+78ao4N8y2+AmZZBK7iBfCD3
 PQLMaZWr2ZxsRBzPHJIw/ix40erOm4Hh4LT0lC0y9xKkUxp3sm+Duv18d
 LvzEQKyoJdG30t6n4zWbRG135WPYvJGf+qmNllhtrQBnUw1TxWMEz3Kgd
 nLX2/fWaxpYUmnkECXIdqHCsxFeGrl0nQF1BGBGrUnWxKHdWQ+AiIiVCZ Q==;
X-CSE-ConnectionGUID: zITtlF+kTligRpesd9+F1A==
X-CSE-MsgGUID: sdd5zBrLQMC3DRQfad6CaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40106961"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="40106961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:22:49 -0800
X-CSE-ConnectionGUID: 5Df0+norRMGWau9PFVPq/A==
X-CSE-MsgGUID: Ze0ruzosQLOtQ7RTwD4r9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="110147942"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa004.jf.intel.com with ESMTP; 15 Jan 2025 07:22:49 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 5/7] drm/i915/scaler: Limit pipe scaler downscaling factors
 for YUV420
Date: Wed, 15 Jan 2025 20:49:28 +0530
Message-ID: <20250115151930.3665295-6-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250115151930.3665295-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250115151930.3665295-1-mitulkumar.ajitkumar.golani@intel.com>
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

Limit downscaling to less than 1.5 (source/destination) in
the horizontal direction and 1.0 in the vertical direction,
When configured for Pipe YUV 420 encoding for port output.

Bspec: 50441

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 72344044d9d3..c9d7966b37ff 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -456,6 +456,16 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 		calculate_max_scale(crtc, 0, *scaler_id,
 				    &max_hscale, &max_vscale);
 
+		/*
+		 * When configured for Pipe YUV 420 encoding for port output,
+		 * limit downscaling to less than 1.5 (source/destination) in
+		 * the horizontal direction and 1.0 in the vertical direction.
+		 */
+		if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+			max_hscale = 0x18000 - 1;
+			max_vscale = 0x10000;
+		}
+
 		hscale = drm_rect_calc_hscale(&src, &crtc_state->pch_pfit.dst,
 					      0, max_hscale);
 		vscale = drm_rect_calc_vscale(&src, &crtc_state->pch_pfit.dst,
-- 
2.48.0

