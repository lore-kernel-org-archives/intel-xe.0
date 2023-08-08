Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC94C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5A010E3DD;
	Tue,  8 Aug 2023 11:46:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6C410E3D9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495163; x=1723031163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oz1RcKvblXXPHelKKKqJMVLdd9DLgmSG1JGiEpa7cYU=;
 b=FGry5NNTOZcBzntjd9j9/UryxYQ6DtemHR0R3tLnzy43U+dD3HY/3+ee
 +tECzRUQf3UT6bSE1U58OnZO9hsCrWP9QwtLlEcsowKzsj5qjjm62C9it
 joXUgtxJWqLHZm4AE4M8mJiixbzLEHRqIKHcym2IQFIjHUySvOy93TnAe
 BJGinyyi7NZxPB3zpC17DhWJ0rYzL4WiNCBi4yDoey3USH6XNLNsKwVYu
 NFn3ejbWsAPKcAu8PSE24SNo3XPgwKf5gEESy9AGT8P9xtKyfVz4RhQ/l
 mGF8cNJIm1y6IxWvSkat9FfLDZkIX5kJVvzL8Wgi91bEE4RV+D6n44RpN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758722"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758722"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196635"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196635"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:31 +0300
Message-Id: <20230808114535.1600595-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/9] drm/i915/display: add I915 conditional build
 to vlv_dsi_pll.h
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915. Not all the functions need to be stubbed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi_pll.h b/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
index ab9291ad1e79..fbe5113dbeb9 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
+++ b/drivers/gpu/drm/i915/display/vlv_dsi_pll.h
@@ -32,7 +32,16 @@ u32 bxt_dsi_get_pclk(struct intel_encoder *encoder,
 		     struct intel_crtc_state *config);
 void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
 
+#ifdef I915
 void assert_dsi_pll_enabled(struct drm_i915_private *i915);
 void assert_dsi_pll_disabled(struct drm_i915_private *i915);
+#else
+static inline void assert_dsi_pll_enabled(struct drm_i915_private *i915)
+{
+}
+static inline void assert_dsi_pll_disabled(struct drm_i915_private *i915)
+{
+}
+#endif
 
 #endif /* __VLV_DSI_PLL_H__ */
-- 
2.39.2

