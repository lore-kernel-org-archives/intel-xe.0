Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6AEC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF010E9FD;
	Wed,  5 Apr 2023 15:41:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABD810E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709265; x=1712245265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uOO2PgFugq5SunLhIgn8wopturCtoXlIy0pYUjPimvs=;
 b=M/Tvflrmfv2P/YG+NgJ/P0Js6HERO5DKqqNkzTnyzVL5m5BSfbmYBONg
 KH/szenKwZbyfetj3LYjGv8uxxPD4jMYgTtBzq5Q7stYJgUHpBQP4NCQ5
 ViZL72i/c0obDxhx1eE4yxQUfBoRL6Frb+yQ5YiehxA2lYbTIaffavSX2
 t51WgHVHJJJB2REGb4CP1Pu47dseR8EBo7f3miO4TE+vhd64MrJLiypTS
 wUPlb4haCzpnQpl9+9MxEZBkNP+iRw+ARFa6KOJGy/Z+vD8/6YFY/m9YW
 mAsuYmw3rCzV0t/UZcwA4Uj6IbhD8ISHw7HUIrsXpvDWoPGtUXt0AjSmm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341211175"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341211175"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717090910"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="717090910"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:18 +0300
Message-Id: <20230405153920.926583-20-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/21] drm/i915/display: add I915 conditional
 build to intel_overlay.h
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
 drivers/gpu/drm/i915/display/intel_overlay.h | 35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.h b/drivers/gpu/drm/i915/display/intel_overlay.h
index a167c28acd27..c3f68fce6f08 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.h
+++ b/drivers/gpu/drm/i915/display/intel_overlay.h
@@ -13,6 +13,7 @@ struct drm_i915_private;
 struct intel_overlay;
 struct intel_overlay_error_state;
 
+#ifdef I915
 void intel_overlay_setup(struct drm_i915_private *dev_priv);
 void intel_overlay_cleanup(struct drm_i915_private *dev_priv);
 int intel_overlay_switch_off(struct intel_overlay *overlay);
@@ -25,5 +26,39 @@ struct intel_overlay_error_state *
 intel_overlay_capture_error_state(struct drm_i915_private *dev_priv);
 void intel_overlay_print_error_state(struct drm_i915_error_state_buf *e,
 				     struct intel_overlay_error_state *error);
+#else
+static inline void intel_overlay_setup(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_overlay_cleanup(struct drm_i915_private *dev_priv)
+{
+}
+static inline int intel_overlay_switch_off(struct intel_overlay *overlay)
+{
+	return 0;
+}
+static inline int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file_priv)
+{
+	return 0;
+}
+static inline int intel_overlay_attrs_ioctl(struct drm_device *dev, void *data,
+					    struct drm_file *file_priv)
+{
+	return 0;
+}
+static inline void intel_overlay_reset(struct drm_i915_private *dev_priv)
+{
+}
+static inline struct intel_overlay_error_state *
+intel_overlay_capture_error_state(struct drm_i915_private *dev_priv)
+{
+	return NULL;
+}
+static inline void intel_overlay_print_error_state(struct drm_i915_error_state_buf *e,
+						   struct intel_overlay_error_state *error)
+{
+}
+#endif
 
 #endif /* __INTEL_OVERLAY_H__ */
-- 
2.39.2

