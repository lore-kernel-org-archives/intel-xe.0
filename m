Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDE9CD80BE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 12:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA33A10E33E;
	Tue, 10 Oct 2023 12:23:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAC610E33E
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696940625; x=1728476625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ATnyiovI+NnGE7k0KIHzqVTsvUTAbrGlYl8KWB/tN30=;
 b=Pv91zo/SPsN0LkGP32iN3BsOcbRTjxjPCRne3Phjr5YV29OTopRdZ5sv
 hnQv91x/9BVkRsvmUYt4evIZiOWt6kA1p1Fg+P2q+eKnTo1ljntoySo/0
 yAZ1VfURtwoKgbDKCBW5kEcWwBZ18KEbL5qYlIhoR7UmaMEQpHHsoZ1E5
 +//WQ1ZajSrJemweikvrI9uyKhXNkkbs7T2AvIou60Nza1ddqe/pPmSRb
 AUn2WO+x3wcU4+JCTzd97912ZdCIypr0wzi94UKlL0XIEOqPFfaLJsSt1
 uYhcpsLjCTqmuNKLwkN4Vi9zdhJhS3wChO7p5smRqFjkOlFjrsGizLdjx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384235390"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="384235390"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:23:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730071967"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="730071967"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 10 Oct 2023 05:23:43 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 17:49:05 +0530
Message-Id: <20231010121905.1769182-1-chaitanya.kumar.borah@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit efdb834bbd7c6cd80e018dd0c0935070f2f27169.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b28b4b718a2b..4b73db93d23d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4199,8 +4199,8 @@ static u16 hsw_linetime_wm(const struct intel_crtc_state *crtc_state)
 	return min(linetime_wm, 0x1ff);
 }
 
-static inline u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
-				      const struct intel_cdclk_state *cdclk_state)
+static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
+			       const struct intel_cdclk_state *cdclk_state)
 {
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
@@ -4243,7 +4243,7 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	__maybe_unused const struct intel_cdclk_state *cdclk_state;
+	const struct intel_cdclk_state *cdclk_state;
 
 	if (DISPLAY_VER(dev_priv) >= 9)
 		crtc_state->linetime = skl_linetime_wm(crtc_state);
-- 
2.25.1

