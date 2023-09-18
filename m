Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6455ACD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDED10E1F2;
	Mon, 18 Sep 2023 07:17:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A3610E1F2
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695021470; x=1726557470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W2dV3fGPJdbWYmiuY+5+Qnvp1QQRyRetUyUGtmur3+c=;
 b=LFQy65l6du0UqWbczeuTXjU6jEdKypQ6411wRgYshMPQX8FWV1B0qH79
 tq/wPKh1tBcpQj9psZvMjUUE92I+gcYG7EcpFIM4aUH+YfMRzdw5/MawJ
 bAoBjPRcJuRPAlprv7ZkGNEdXIGppPlRaiZJyDvGtEzL0UPaQ4wmnO9lJ
 qoQD90hx/IUBX2fMxGUhnroJxmt5NjyptJItXLWt/EX2Du1RmfcPiku7e
 01ymSIsh4Ki7Krkgvtyv6fzd1YxplylNWtvi633ocZ8YNDyaIoveEpTiD
 kzWaMoSSjPKlKOyZyJ7ZT8m7pEaAowCJEI24DSqgdYTiDPfb8HNYFJJUx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="443661729"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="443661729"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="775025997"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="775025997"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga008.jf.intel.com with ESMTP; 18 Sep 2023 00:17:48 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 12:42:31 +0530
Message-Id: <20230918071231.288885-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Revert "FIXME: drm/i915/ips: apparently silence
 warnings"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 004360063d3b8a29cdf599ed18dc6a23c6e61513.

There seems to be no effect of this patch i.e. removing this
patch yields no compiler warnings. Hence, revert.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9df8081f78d9..d0ec09621fe4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4195,8 +4195,8 @@ static u16 hsw_linetime_wm(const struct intel_crtc_state *crtc_state)
 	return min(linetime_wm, 0x1ff);
 }
 
-static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
-				      const struct intel_cdclk_state *cdclk_state)
+static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
+			       const struct intel_cdclk_state *cdclk_state)
 {
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
@@ -4239,7 +4239,7 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	__maybe_unused const struct intel_cdclk_state *cdclk_state;
+	const struct intel_cdclk_state *cdclk_state;
 
 	if (DISPLAY_VER(dev_priv) >= 9)
 		crtc_state->linetime = skl_linetime_wm(crtc_state);
-- 
2.25.1

