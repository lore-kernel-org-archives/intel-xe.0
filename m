Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51ABC001DF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF5B10E106;
	Tue,  8 Aug 2023 11:45:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8293710E106
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495149; x=1723031149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+WJEg9s/ERPz9aqCZSeJAqjV1Oo9uT8a6MSiIwmXkYE=;
 b=FVWWv6k+bd8wEOCQy0srqiDH0DljnYKdyzvFhYrhQDtsCy3GA2axEdG4
 Y6drphtxH1IdZdn3O6PVo5MkwAT92O9cQMsqR6uIKG75WwHeazM6iXSI3
 U66IDzAHdu/oDsj/jWxgovKmdtdzCHWQcjr27tIE5Oja021eYuGkZomaN
 XdHmDFQTwO/YPogU2W3ow4EOct7oRabpBFafitepmJ8YR9FxvyUJjHZAv
 ANP62okaUZcucMQMCwZWC+BmGEO/gOY4mv2oIGyrCWWAztlYMuwRZ593L
 hb2SjH1TTPP2pUKflWNjp2UKx77y0FWDPGk+jwzLSCBwQTlSlmroI/0jC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758663"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196533"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196533"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:45:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:27 +0300
Message-Id: <20230808114535.1600595-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/9] drm/i915/display: add I915 conditional build
 to g4x_hdmi.h
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

Add stubs for !I915.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_hdmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.h b/drivers/gpu/drm/i915/display/g4x_hdmi.h
index 1e3ea7f3c846..817f55c7a3a1 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.h
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.h
@@ -15,9 +15,21 @@ struct drm_atomic_state;
 struct drm_connector;
 struct drm_i915_private;
 
+#ifdef I915
 void g4x_hdmi_init(struct drm_i915_private *dev_priv,
 		   i915_reg_t hdmi_reg, enum port port);
 int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state);
+#else
+static inline void g4x_hdmi_init(struct drm_i915_private *dev_priv,
+				 i915_reg_t hdmi_reg, int port)
+{
+}
+static inline int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
+						  struct drm_atomic_state *state)
+{
+	return 0;
+}
+#endif
 
 #endif
-- 
2.39.2

