Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C6C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08EF10E9FD;
	Wed,  5 Apr 2023 15:40:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3227010E9FE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709209; x=1712245209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSPau8KXE2SvS+qLaNoHrUtaFUwitagBuoFXZxj0dxg=;
 b=bxDEu45lsSWfkU5v6dkKIm6ru2F5ybKtnKOcdcauiDbJqn7xLgi5t8ns
 9bK8kMbmQ6UHz6581WP2i1WF57GO9IuP781Tf5hqq/L+zKofrWdA6P98b
 LKZj3tHMenF6Asjq9zc6GO2EO+xNQ/Kmi5GsHa5P1ooWzbwuLMHn8zbgL
 uzNbtuYv7sk9COjnZiR16hcTGmiGz1inc42Kr1wfHkSdTI7C1XPJ8ndOy
 cf6MkzRIjWuIg+UqZenc9nZmfvEJQsSePPmsyNhTMJsHQf1TuXnxkMfyc
 cVJMMz0tHOfOF6pqspDIRVzNUJEw5zdW9GtaBZj0Nab/8HDniBeJgnV0n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865106"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865106"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689327461"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="689327461"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:07 +0300
Message-Id: <20230405153920.926583-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/21] drm/i915/display: add I915 conditional
 build to i9xx_plane.h
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
 drivers/gpu/drm/i915/display/i9xx_plane.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.h b/drivers/gpu/drm/i915/display/i9xx_plane.h
index 027b66053984..b3d724a144cb 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.h
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.h
@@ -15,6 +15,7 @@ struct intel_initial_plane_config;
 struct intel_plane;
 struct intel_plane_state;
 
+#ifdef I915
 unsigned int i965_plane_max_stride(struct intel_plane *plane,
 				   u32 pixel_format, u64 modifier,
 				   unsigned int rotation);
@@ -25,4 +26,26 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe);
 
 void i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 				   struct intel_initial_plane_config *plane_config);
+#else
+static inline unsigned int i965_plane_max_stride(struct intel_plane *plane,
+						 u32 pixel_format, u64 modifier,
+						 unsigned int rotation)
+{
+	return 0;
+}
+static inline int i9xx_check_plane_surface(struct intel_plane_state *plane_state)
+{
+	return 0;
+}
+static inline struct intel_plane *
+intel_primary_plane_create(struct drm_i915_private *dev_priv, int pipe)
+{
+	return NULL;
+}
+static inline void i9xx_get_initial_plane_config(struct intel_crtc *crtc,
+						 struct intel_initial_plane_config *plane_config)
+{
+}
+#endif
+
 #endif
-- 
2.39.2

