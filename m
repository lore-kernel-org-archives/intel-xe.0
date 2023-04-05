Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C061C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AABF10E9FD;
	Wed,  5 Apr 2023 15:39:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB39C10E9FE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709183; x=1712245183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MGfx0GOMz6INcnx6B5Zl0QrJmI8j7xF3zwGm0Ai2CM=;
 b=YUO3Jm52umxJw2Yjv9Yq5BH+TznL0rP8UOuBBWEj/G1F33oIf/z1yBRj
 D9DNP2aITW8xpoDmqADmunjilDQHlV84GAFnkO2jyQdBrmiYhnEqiXn2Y
 vWs0ajZ2w7bAHlnvI6+oTCQ79bscCUBgxhF+/UwY9YI8Ti9GLYrBdjxxx
 IJBtcEyC3Zp5KV1QFuJyED7LSt5pdPwNP1DlFomrERmzho+XGHPEN4b28
 CAv5Yf1VpMsFpobOBw9T7o2A3Nlbmutrg8oExynejQTDQ0OQAWqt95kv4
 lBmiKrlKTbtXIHnibhqC6ENkrmLRQJT8OO5ZdfVfXvzit58XSg6Tos0p/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210830"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295700"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295700"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:02 +0300
Message-Id: <20230405153920.926583-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/21] drm/i915/display: add I915 conditional
 build to intel_lvds.h
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
 drivers/gpu/drm/i915/display/intel_lvds.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lvds.h b/drivers/gpu/drm/i915/display/intel_lvds.h
index 9d3372dc503f..7ad5fa9c0434 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.h
+++ b/drivers/gpu/drm/i915/display/intel_lvds.h
@@ -13,10 +13,29 @@
 enum pipe;
 struct drm_i915_private;
 
+#ifdef I915
 bool intel_lvds_port_enabled(struct drm_i915_private *dev_priv,
 			     i915_reg_t lvds_reg, enum pipe *pipe);
 void intel_lvds_init(struct drm_i915_private *dev_priv);
 struct intel_encoder *intel_get_lvds_encoder(struct drm_i915_private *dev_priv);
 bool intel_is_dual_link_lvds(struct drm_i915_private *dev_priv);
+#else
+static inline bool intel_lvds_port_enabled(struct drm_i915_private *dev_priv,
+					   i915_reg_t lvds_reg, enum pipe *pipe)
+{
+	return false;
+}
+static inline void intel_lvds_init(struct drm_i915_private *dev_priv)
+{
+}
+static inline struct intel_encoder *intel_get_lvds_encoder(struct drm_i915_private *dev_priv)
+{
+	return NULL;
+}
+static inline bool intel_is_dual_link_lvds(struct drm_i915_private *dev_priv)
+{
+	return false;
+}
+#endif
 
 #endif /* __INTEL_LVDS_H__ */
-- 
2.39.2

