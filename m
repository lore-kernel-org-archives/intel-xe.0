Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF441112583C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587E210E912;
	Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g89vNLmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F6210E205;
 Wed, 11 Mar 2026 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238766; x=1804774766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfRLjqDQ2zsg8o5qrMuqblpr/QYVtt5LQ15ZKJn20lI=;
 b=g89vNLmj1TN43KJClO4pPREvr4bLGlaENbQK0l7lSVQJlo4s5Mj7grRA
 fSbwgMHghGiqNYjymQfa66+Fl9udIqyI91GdjZDkY0rYkWcSecm4AUp3y
 JDxQTzGn+27vww/iZC1n430FVjrw1JxPCYKKxkZ1z6aHmWaOcQVOCS0E2
 4fTS1zQy+rlMjrpUiy6IB7qhQ2WEVLdLLxIDibhpBZXKXHqunJBccE8ud
 OjUEKRLhSMBQu61Im1ar3V7dhVy8RtX+lawXrECYc5Q7M1wPsy6Vr9Oen
 oVv8yBN5DwsWh+Ltod7kMen1fb8XH2ARxkszGkYnidH0jWmU1A1ibU8Zd g==;
X-CSE-ConnectionGUID: TRXnYlVbSjCW1Ux2JZVm2A==
X-CSE-MsgGUID: HKXcQG7MTHuU872Zyo6T3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775239"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:26 -0700
X-CSE-ConnectionGUID: LyWf0OxkSI6ZMsl8VDXkNA==
X-CSE-MsgGUID: /0XhxtsCTyGQ9EDJs43t0w==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730510"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:24 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 14/24] drm/i915/lt_phy: Add xe3plpd .get_freq hook
Date: Wed, 11 Mar 2026 14:18:55 +0000
Message-ID: <20260311141905.2526418-15-mika.kahola@intel.com>
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

Add .get_freq function hook to support dpll framework for xe3plpd platform.

v2: Restore port clock calculation (Suraj)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6502916793f5..412582e29ca6 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4583,8 +4583,21 @@ static bool xe3plpd_pll_get_hw_state(struct intel_display *display,
 	return intel_lt_phy_pll_readout_hw_state(encoder, &dpll_hw_state->ltpll);
 }
 
+static int xe3plpd_pll_get_freq(struct intel_display *display,
+				const struct intel_dpll *pll,
+				const struct intel_dpll_hw_state *dpll_hw_state)
+{
+	struct intel_encoder *encoder = get_intel_encoder(display, pll);
+
+	if (drm_WARN_ON(display->drm, !encoder))
+		return -EINVAL;
+
+	return intel_lt_phy_calc_port_clock(display, &dpll_hw_state->ltpll);
+}
+
 static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
 	.get_hw_state = xe3plpd_pll_get_hw_state,
+	.get_freq = xe3plpd_pll_get_freq,
 };
 
 static const struct dpll_info xe3plpd_plls[] = {
-- 
2.43.0

