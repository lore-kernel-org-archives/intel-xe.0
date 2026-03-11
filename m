Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF0D112583C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ADE10E90B;
	Wed, 11 Mar 2026 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyyvglrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25910E902;
 Wed, 11 Mar 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238770; x=1804774770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLXiGI7L5+l+5ubMGsZ3bc7wqF77PUBgBEAli0J+lIY=;
 b=YyyvglrE7dzFw6LppJHiCDujhXBps+pTU0EbcSPSFE//hOkDgiEgo7AG
 KQrde6g+ad19tlr8rka2XWTLmP9s+C4llBpTPdhN7jKC75A5aZo/o49c4
 STJfLhh/N7RmCbyB/K+FhptiOJOr4eBp1DangCEQ8CAXD/AY7JWrjIqdU
 wDajXIOgcJdE73Wk1almiPWM/4BXNk3p57xwpl4uFnTfrK5bMsE9LUOuO
 w269ip6HvWJC2QLuEryk6P64fPtf3GsVYKcvsg6wtSeB7K/TGE7IA0yBE
 HXu6Io2K0C294cYDzzt9U7Q7qqo3Ef565s+R5RL/U/fuhsjB5EgMBXKbc Q==;
X-CSE-ConnectionGUID: x1o215eVQGO2iQeORrGZpQ==
X-CSE-MsgGUID: i/s9H5srTgyNXYHEhFS1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775259"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:30 -0700
X-CSE-ConnectionGUID: gIyOfFhqT3i9un2dnizTow==
X-CSE-MsgGUID: yZPHBn4kT82Dh2Mh1wmPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730524"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:28 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 17/24] drm/i915/lt_phy: Add .disable_clock hook on DDI
Date: Wed, 11 Mar 2026 14:18:58 +0000
Message-ID: <20260311141905.2526418-18-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
References: <20260311141905.2526418-1-mika.kahola@intel.com>
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

Add new pll_disable_clock functions so that they can be
hooked up to dpll->disable. This is just a wrapper over
the exitisting intel_xe3plpd_pll_disable to make it
compatible With dpll->disable function

v2: Revise commit message (Suraj)
    Drop wrapper for TBT clock disabling and reuse
    intel_mtl_pll_disable_clock() for DDI clock
    disabling hook (Suraj)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 93f62d995e96..3cc8c681c352 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -5299,7 +5299,7 @@ void intel_ddi_init(struct intel_display *display,
 
 	if (HAS_LT_PHY(display)) {
 		encoder->enable_clock = intel_mtl_pll_enable_clock;
-		encoder->disable_clock = intel_xe3plpd_pll_disable;
+		encoder->disable_clock = intel_mtl_pll_disable_clock;
 		encoder->port_pll_type = intel_mtl_port_pll_type;
 		encoder->get_config = xe3plpd_ddi_get_config;
 	} else if (DISPLAY_VER(display) >= 14) {
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 54c7a255b3a5..28c560417409 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4607,8 +4607,20 @@ static void xe3plpd_pll_enable(struct intel_display *display,
 	intel_xe3plpd_pll_enable(encoder, pll, dpll_hw_state);
 }
 
+static void xe3plpd_pll_disable(struct intel_display *display,
+				struct intel_dpll *pll)
+{
+	struct intel_encoder *encoder = get_intel_encoder(display, pll);
+
+	if (drm_WARN_ON(display->drm, !encoder))
+		return;
+
+	intel_xe3plpd_pll_disable(encoder);
+}
+
 static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
 	.enable = xe3plpd_pll_enable,
+	.disable = xe3plpd_pll_disable,
 	.get_hw_state = xe3plpd_pll_get_hw_state,
 	.get_freq = xe3plpd_pll_get_freq,
 };
-- 
2.43.0

