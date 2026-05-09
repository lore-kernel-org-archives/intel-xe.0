Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A4CD3445
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B910E3DA;
	Sat,  9 May 2026 16:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INw8skmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA09210E3DB;
 Sat,  9 May 2026 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344913; x=1809880913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pi8fE21YKYe8OFjNKnKvKZpWmOFOeU9vnFwExHvN+2g=;
 b=INw8skmMxO0uPxHNj3r0i4Gj36LaMGvTz6V1kobCGRWIkExjl/Yn9w7Y
 70Ss51GeFEfRU7n2H54srEVIu7NniupW7NCsRZAo1g6lU5HyN6pTB/xYK
 LjlRXpogmblQvplGfV8tCbZa883EGp3sAHsXkfSSlT7Ojg3EnBomVKvB3
 SO3rMY2+Hr2uZKScH4sirnXHxFOG1c6zM4nfBsuTZEL3ZW6JU04SPCzl6
 Kn/tw5A9TxQQq17dmlcgZY8vdwHZnzZbtVQpU2Iq3+7zqZgqAmB0qPcO/
 MH7QB3Cx4V2oaydR6i9IfoA92hNpXQo1lU7QeQdh/TQcZEHEK5tBOxf8V w==;
X-CSE-ConnectionGUID: xr9FGGOaSWSmu43ojSxYyQ==
X-CSE-MsgGUID: EJ8O/F5vQeeKWAuZkD9GZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763611"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:53 -0700
X-CSE-ConnectionGUID: aJIskvqhQx6sItusAaAEJg==
X-CSE-MsgGUID: Tx0dRIWRT6+9fAs6ivWwNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212246"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 4/9] drm/i915/casf: rename sumcoeff into sum_coeff
Date: Sat,  9 May 2026 18:40:43 +0200
Message-ID: <20260509164048.627399-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
References: <20260509164048.627399-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Stick to using snake_case in intel_casf_scaler_compute_coeff() where
it is possible.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index b9643548d182..cafd21a03632 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -218,7 +218,7 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 {
 	const u16 *filtercoeff;
 	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
-	u16 sumcoeff = 0;
+	u16 sum_coeff = 0;
 	int i;
 
 	if (crtc_state->pch_pfit.casf.win_size == 0)
@@ -229,10 +229,10 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 		filtercoeff = filtercoeff_3;
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
-		sumcoeff += *(filtercoeff + i);
+		sum_coeff += *(filtercoeff + i);
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
-		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
+		filter_coeff[i] = (*(filtercoeff + i) * 100 / sum_coeff);
 		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
 					      filter_coeff[i]);
 	}
-- 
2.45.2

