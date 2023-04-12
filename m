Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CBCC7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391110E84B;
	Wed, 12 Apr 2023 14:20:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931AC10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309246; x=1712845246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4XAQW1BHI2dlnaaUbv9hWIVV7GbB7gnTaTbdd1yN9G0=;
 b=F6IZKcwnUh0xjwmW86os8BTn8M1SfuhD37oMGf7mQXoNt6YfiPDsHU13
 Z4/Ggxxi6WxlTkmqCpWztIQNSpoo3VhbweG5Z8mfc1GhQbdbCveemY/J7
 9dNmeKjkpnpsy3r9XK/GkkqGp+VP376e7yGmo7cThikUbyWy5LqlJLeGx
 xu90Bshkx/DkUDc6AAKRaMTX85eDmciZ704ClquiXwoteZ98jqpmOCFal
 E3JHzMdx4pHfm5vgyITvaJ6XdyfngaV7IaXLQazaIhI3FrSnxphlgDQFi
 C1ABXnLGi/Cn+5+M6zobW907h4PiYPkpLhtEVksdy4zQPHCoskvqF/UPE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328020058"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328020058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753544144"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="753544144"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:26 +0300
Message-Id: <20230412142006.877109-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/41] drm/i915/display: add I915 conditional
 build to g4x_dp.h
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
 drivers/gpu/drm/i915/display/g4x_dp.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.h b/drivers/gpu/drm/i915/display/g4x_dp.h
index a38b3e1e01d3..a10638ab749c 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.h
+++ b/drivers/gpu/drm/i915/display/g4x_dp.h
@@ -17,6 +17,7 @@ struct intel_crtc_state;
 struct intel_dp;
 struct intel_encoder;
 
+#ifdef I915
 const struct dpll *vlv_get_dpll(struct drm_i915_private *i915);
 enum pipe vlv_active_pipe(struct intel_dp *intel_dp);
 void g4x_dp_set_clock(struct intel_encoder *encoder,
@@ -26,5 +27,30 @@ bool g4x_dp_port_enabled(struct drm_i915_private *dev_priv,
 			 enum pipe *pipe);
 bool g4x_dp_init(struct drm_i915_private *dev_priv,
 		 i915_reg_t output_reg, enum port port);
+#else
+static inline const struct dpll *vlv_get_dpll(struct drm_i915_private *i915)
+{
+	return NULL;
+}
+static inline int vlv_active_pipe(struct intel_dp *intel_dp)
+{
+	return 0;
+}
+static inline void g4x_dp_set_clock(struct intel_encoder *encoder,
+				    struct intel_crtc_state *pipe_config)
+{
+}
+static inline bool g4x_dp_port_enabled(struct drm_i915_private *dev_priv,
+				       i915_reg_t dp_reg, int port,
+				       enum pipe *pipe)
+{
+	return false;
+}
+static inline bool g4x_dp_init(struct drm_i915_private *dev_priv,
+			       i915_reg_t output_reg, int port)
+{
+	return false;
+}
+#endif
 
 #endif
-- 
2.39.2

