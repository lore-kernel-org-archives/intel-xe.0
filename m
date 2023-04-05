Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76DC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0B210E9FF;
	Wed,  5 Apr 2023 15:40:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E83610E9FF
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709233; x=1712245233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bXW3Pf9dMTKSyf9wP2AX7Pjn2joY7wHuYq8Ul5r7mwU=;
 b=lZuML1mgNpHddOPPFJ2AenIQ0ScqCCoi+BbFMAN1jEGGvNcRkgfwqglg
 sfY7X4vqPgxOS4S62Z7yLnFdcSW4Gd/xSVdKxnXbfTNTIyRA8Ul3kQ0uF
 P6l8ro8gfqKID49zuEEkQPhggNp0G4hsYLl09QlAI9CZImjii7keCYUmA
 177X3LqrOkzitp5rgPuGh4rlyWy4pXo3PJiegTryWVHKGE6yF3bjGNmXm
 LmKX9u81Ul86T68gLSLr52aeo0f+9S8nmer3dM3QzXTIkpNN20V0G8tB9
 0J128DmNpytazibCDukLSXeM4JQpSbI+RUYwRPPbRVgK7BxSn/pmN9FmA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865196"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865196"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689327678"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="689327678"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:12 +0300
Message-Id: <20230405153920.926583-14-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/21] drm/i915/display: add I915 conditional
 build to intel_pch_refclk.h
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_pch_refclk.h   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.h b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
index 9bcf56629f24..ae3403c0ced8 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.h
@@ -11,6 +11,7 @@
 struct drm_i915_private;
 struct intel_crtc_state;
 
+#ifdef I915
 void lpt_program_iclkip(const struct intel_crtc_state *crtc_state);
 void lpt_disable_iclkip(struct drm_i915_private *dev_priv);
 int lpt_get_iclkip(struct drm_i915_private *dev_priv);
@@ -18,5 +19,27 @@ int lpt_iclkip(const struct intel_crtc_state *crtc_state);
 
 void intel_init_pch_refclk(struct drm_i915_private *dev_priv);
 void lpt_disable_clkout_dp(struct drm_i915_private *dev_priv);
+#else
+static inline void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
+{
+}
+static inline void lpt_disable_iclkip(struct drm_i915_private *dev_priv)
+{
+}
+static inline int lpt_get_iclkip(struct drm_i915_private *dev_priv)
+{
+	return 0;
+}
+static inline int lpt_iclkip(const struct intel_crtc_state *crtc_state)
+{
+	return 0;
+}
+static inline void intel_init_pch_refclk(struct drm_i915_private *dev_priv)
+{
+}
+static inline void lpt_disable_clkout_dp(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif
-- 
2.39.2

