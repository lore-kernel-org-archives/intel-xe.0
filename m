Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB215F33806
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 06:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB3210E336;
	Tue, 17 Mar 2026 06:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncLrQEng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF80010E2DE;
 Tue, 17 Mar 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773729348; x=1805265348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CUvM03sKJnPCVd7X0MDDUY/5T3Tm3+e6cS3PUwoIDQc=;
 b=ncLrQEngxuOWrlo7xOVUgXZx/4Dizo67jsNx0n+4scn0qpfOotsDUbef
 l9w27ip6AKAWeS7btFgUiUaAdOD/R86tvvSgSV1H5V7/AsgPeiNbf/9KP
 Lh8zX72gmfrlXzAlG73GrxEmJtZr1xdb9KuTn5u9XoIK4Bo6JQ0dqCnJm
 cd4kCXKPjMZ6/mlM88rdNm4YScqy1ry78hgMVaoGDM7+pLsdMPyejDCp/
 TVrpMTykHO4blnvEUfiFO9Bh3ke20ZqJQ6VI/dVIxBp3BbJcZzAdEzQw1
 oVgC57+DUUpARzB+3Jyk7b6h0k2I7xeZ+W7p61zdc45W7h62q45wSLqP7 g==;
X-CSE-ConnectionGUID: 8jnY+DSZQ76cEN5ga8Zgxg==
X-CSE-MsgGUID: BpupGE7LSqK5XpvCrBLsRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85834461"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85834461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 23:35:48 -0700
X-CSE-ConnectionGUID: 1+nUWRKpTfmNNyMRfdGR/Q==
X-CSE-MsgGUID: 0kOR0r/RQW6NDcStVdtEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222105318"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 23:35:46 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v4 2/2] drm/i915/dmc: Enable PIPEDMC_ERROR interrupt
Date: Tue, 17 Mar 2026 12:07:13 +0530
Message-ID: <20260317063713.3288576-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317063713.3288576-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260317063713.3288576-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable PIPEDMC_ERROR interrupt bit for display version 35+.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)
Changes in v4:
- Add TODO to check the enablement of PIPEDMC_ERROR for PTL (Suraj Kandpal)

Bspec: 70296
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 38b284a0db82..6c803b2dcbcd 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -510,7 +510,13 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
 	if (DISPLAY_VER(display) >= 35)
-		return PIPEDMC_FLIPQ_PROG_DONE;
+		return PIPEDMC_FLIPQ_PROG_DONE |
+			PIPEDMC_ERROR;
+
+	/*
+	 * TODO: Check if PIPEDMC_ERROR bit enabling causes errors
+	 * on PTL, enable it if validation passes
+	 */
 
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
-- 
2.43.0

