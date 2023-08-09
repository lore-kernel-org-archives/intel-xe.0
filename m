Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648FDC001DE
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9C10E053;
	Wed,  9 Aug 2023 19:05:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C72510E053
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607915; x=1723143915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bN1al0KZP1DLyLVBw/moQ+E/Ht8b9HMJRTlb3pp/Nis=;
 b=VHebiZh+d65AtDfh4vvPPe6S43q6yuiOQD9mLUPp8Ho/HK35XP5nlQw4
 eNfCMPLEDqJ1L9IZA4cF5PPFAEQirUyiUl9hb61GNu4+ud/egpzc3YJwz
 IQjUeeZHGoYZjirJCCNM0+MzQ+tlEUjfrNHu01Ua8FeOtYVwebA74pt2c
 qQ0H3KsiBEjdDOcYZjMd8HPKtfnqT1aGzrhBP6U5BgovOOYLW4W6PgvBI
 KI4RE0v5NWlkd0b2FVaJ6L1LRugLw1OzH5OnbU0NoTcRQk1GV3PRsKM0r
 QRnf4JXubxXbZK9hnSfT9yVOxLW0bbowwT+bhkoko6uemi/VX8MQQEDiy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370108198"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370108198"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905768004"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="905768004"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:45 +0300
Message-Id: <20230809190453.1927134-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/9] drm/i915/display: add I915 conditional
 build to g4x_hdmi.h
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add stubs for !I915.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

