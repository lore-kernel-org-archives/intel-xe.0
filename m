Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2643AC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CA910E823;
	Wed, 12 Apr 2023 14:21:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A544610E838
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309286; x=1712845286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rPCdIxqGsqJNXINHrxSR54PoT6U/948h0IaXHU3bho=;
 b=P80YKJCQejkTdohYczzRqpW2AMpfh/vyo0b+ElZy89OKsHq1z5WJRYcy
 bD3EThD/vleD5uJaIYd26nzGccmD11whbybBmduXWStxvv8RPYSYNBPrX
 geT/ME+F2bifOC8Kx5GH11tS/hSgeCvCAQ+yBiDXbrcrW21s4ciqhUArc
 OZJKCVZI8Rkqaq4TS1Rec6FCloyDiJxK1ZciC5EGF9v1y0h1hNTC00ShX
 NdbTVFA1NM1uxBOmTFJInYzYY6Nu7WLS7EjF1zV4HXayc8+UOJLR6VyTd
 i8gHOjz6lOdv12xcQhKXnRHZvECb4KhgPvo41LfkG8mqaX3fvCw97dLvV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915377"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915377"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955700"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955700"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:21:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:37 +0300
Message-Id: <20230412142006.877109-13-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/41] drm/i915/display: add I915 conditional
 build to vlv_dsi.h
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
 drivers/gpu/drm/i915/display/vlv_dsi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.h b/drivers/gpu/drm/i915/display/vlv_dsi.h
index 0c2b279df9d4..cf9d7b82f288 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.h
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.h
@@ -12,8 +12,21 @@ enum port;
 struct drm_i915_private;
 struct intel_dsi;
 
+#ifdef I915
 void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port);
 enum mipi_dsi_pixel_format pixel_format_from_register_bits(u32 fmt);
 void vlv_dsi_init(struct drm_i915_private *dev_priv);
+#else
+static inline void vlv_dsi_wait_for_fifo_empty(struct intel_dsi *intel_dsi, enum port port)
+{
+}
+static inline enum mipi_dsi_pixel_format pixel_format_from_register_bits(u32 fmt)
+{
+	return 0;
+}
+static inline void vlv_dsi_init(struct drm_i915_private *dev_priv)
+{
+}
+#endif
 
 #endif /* __VLV_DSI_H__ */
-- 
2.39.2

