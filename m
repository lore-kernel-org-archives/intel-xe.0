Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF88CD98C6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E434010E66E;
	Tue,  9 Jun 2026 23:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icOEUXwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D361D10E664;
 Tue,  9 Jun 2026 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046769; x=1812582769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cAnzMau+sFBzj8Z2xM7QwE6Cq0Roxg7LKYUw7tMKfl8=;
 b=icOEUXwDXLpJHmxt9xmuQXZ/vmg0rgeTiKrdyFWz+9Nr+SSoRzUPNaR7
 /clNPWjmDuBMwKdAE1RHsE9+Rrd16GIx8fXGB48B+vc5gXC7S0FSYRPuh
 xNbnv/TUBx6M8vbVm8eOAGkoiiLJQohH1O7j3B2tTg/Vtq50wkKhXFgiC
 XvEcDj42DMGIXw5wzC3JSLRS4gILmK3xV5hS/eeO8miD4/kNarKiUQ5Nu
 7Zd6LsqNrOMaNJ/F7ekhq2zZF2N2vgI6t7jTooBqqUy0ds8sIICKvnZF0
 ka+Z/8JXDxA/nb4mwDR2QxyHGsOKPfe+isoo7PO5uGd0VvDTfvjd6l4ed A==;
X-CSE-ConnectionGUID: TXw794GpTF6Vw5wk922TmA==
X-CSE-MsgGUID: 31gaCAHTSRmo7wqVCivB7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492299"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:48 -0700
X-CSE-ConnectionGUID: h+vXPxFSTwKfLtCHwMsphw==
X-CSE-MsgGUID: JzEYzdT7TWugILLgsVdndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187979"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 4/9] drm/i915/scaler: move independent CASF check
Date: Wed, 10 Jun 2026 01:12:12 +0200
Message-ID: <20260609231217.208357-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
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

First clause of CASF check is independent of any loop iteration and
causes intel_allocate_scaler() to fail when satisfied. Check it before
entering the loop.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index f2216a9ea3f8..59a5a3cd3e6a 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -339,12 +339,14 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 	struct intel_display *display = to_intel_display(crtc);
 	int scaler_id;
 
+	if (casf_scaler && !HAS_CASF(display))
+		return -1;
+
 	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
 		if (scaler_state->scalers[scaler_id].in_use)
 			continue;
 
-		if ((casf_scaler && !HAS_CASF(display)) ||
-		    (casf_scaler && scaler_id != 1))
+		if (casf_scaler && scaler_id != 1)
 			continue;
 
 		scaler_state->scalers[scaler_id].in_use = true;
-- 
2.45.2

