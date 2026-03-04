Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C249EF8FE1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1477B10EA10;
	Wed,  4 Mar 2026 13:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Usaer1Ah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3F10EA02;
 Wed,  4 Mar 2026 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630088; x=1804166088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b7Px1LAbB0mWpQFkr6OVdWdoLhAaDzPwzzVd4HObZFA=;
 b=Usaer1AhvKDSUv3VCN9btqpwcT/6RJ/sxawwSpVWZ8jgRNhzWPauP79a
 AGFfVaMRj6pzYx9hr62FMYpEmGJsWeDf29y9qEvqaJfyM+mcaAq7U1C6Z
 qPGyimOwd/qJwXRSwL4BUViQZbGgV6ctEczrgr8ToooIMvn7svS9SNa5x
 QxpTRGcTZKb1F50otO0Kebk04VXeUjsdKhLipj09ONDh/4IZYOCTkUfKG
 XS/k90zs9gye/Z42hT2lFqn/PAbv3Qg+q0v1l1HDK+bHmPbqVcOAIkBeb
 7XzDLZFlikfQ0jpxx11jxzx7Yx3doUJMNRPLr3oEJWGLLvPX45OjEPjMK Q==;
X-CSE-ConnectionGUID: KjJfhDZkSySgk8uixjWlYw==
X-CSE-MsgGUID: MVHitYtbR8+G8xPaEONIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293482"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293482"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:48 -0800
X-CSE-ConnectionGUID: mlGggoyiRbOLYaGieEaTLg==
X-CSE-MsgGUID: CcjjDdkITWmXgr4vqx5PmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350850"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:48 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 19/24] drm/i915/lt_phy: Dump lane count for HW state
Date: Wed,  4 Mar 2026 13:14:18 +0000
Message-ID: <20260304131423.1017821-20-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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

Add lane count as part of HW state dump.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 3230d2e28d9c..066e2f16791c 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2152,8 +2152,8 @@ void intel_lt_phy_dump_hw_state(struct drm_printer *p,
 {
 	int i, j;
 
-	drm_printf(p, "lt_phy_pll_hw_state: ssc enabled: %d, tbt mode: %d\n",
-		   hw_state->ssc_enabled, hw_state->tbt_mode);
+	drm_printf(p, "lt_phy_pll_hw_state: lane count: %d, ssc enabled: %d, tbt mode: %d\n",
+		   hw_state->lane_count, hw_state->ssc_enabled, hw_state->tbt_mode);
 
 	for (i = 0; i < 3; i++) {
 		drm_printf(p, "config[%d] = 0x%.4x,\n",
-- 
2.43.0

