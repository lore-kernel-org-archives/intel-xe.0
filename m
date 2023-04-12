Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9582C77B72
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86910E835;
	Wed, 12 Apr 2023 14:21:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F3B10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309276; x=1712845276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVAh4On5XdvV9iSCLEiakjacIZp6jEqoSMEB6aLwj64=;
 b=c+agTQMy9c0iajqwzBmcnExJKoes4oslnl9AF01ZmLzUB4DO6C7IyVv+
 ecdUdTJ2PD4X43CtUZ99gyU+8IyfBaLvQxAez8ReoHxhBxZ+3iuSaAvrM
 ymm0AXBqvMPLvIyoLfLuv8Ce3bc2AZKqedGwMnOmbXe7PTMeDcI0SiFz9
 T0dmylVG8yc4juq6YSomUfxQCXZQd6gSvw0DnLNqXl9UQEYLkkuQZz3j1
 Fk3oGvCVeuLxJsLBosl89/HMxzdY0GusOnks76IgcZJWVG7roLfdtUPWV
 s6eORvFC3fmtauJNODLyiVSxK3ghkbIdhVJ1GysBfKF/7w6rk/FsV2S3E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915317"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915317"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955683"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955683"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:35 +0300
Message-Id: <20230412142006.877109-11-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/41] drm/i915/display: add I915 conditional
 build to intel_crt.h
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.h b/drivers/gpu/drm/i915/display/intel_crt.h
index c6071efd93ce..fe7690c2b948 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.h
+++ b/drivers/gpu/drm/i915/display/intel_crt.h
@@ -12,9 +12,23 @@ enum pipe;
 struct drm_encoder;
 struct drm_i915_private;
 
+#ifdef I915
 bool intel_crt_port_enabled(struct drm_i915_private *dev_priv,
 			    i915_reg_t adpa_reg, enum pipe *pipe);
 void intel_crt_init(struct drm_i915_private *dev_priv);
 void intel_crt_reset(struct drm_encoder *encoder);
+#else
+static inline bool intel_crt_port_enabled(struct drm_i915_private *dev_priv,
+					  i915_reg_t adpa_reg, enum pipe *pipe)
+{
+	return false;
+}
+static inline void intel_crt_init(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_crt_reset(struct drm_encoder *encoder)
+{
+}
+#endif
 
 #endif /* __INTEL_CRT_H__ */
-- 
2.39.2

