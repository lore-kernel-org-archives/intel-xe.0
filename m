Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF1C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1AB10E9FD;
	Wed,  5 Apr 2023 15:40:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEBC10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709248; x=1712245248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pfxOlaqlntf6LjS7K385MD82RpQlzFWpXlzMpGi9zY8=;
 b=jStu81k0LNJzH9txGN59vzDYQhqiXNJf/tDI/+ZgWybhPBrOFxPtOORY
 3OXLcm4PkpF3ePfe9l3oN4zBbg6r9fljeurIWc8t9YYmoaybHdvoASDzx
 mEd8cdhIeesuUyqWLaTcXX+2eaO9aj6mtOWxRjHIwQppjM9OWA4e+GKZx
 1qYNUwiE3QQZBjkY+tSqxCN01x+YmUEq/ckrVZeY3RBv8V+MgNjA5NhBU
 /IJxc1EXAUf63/2IqrrFdciokPQkke5LMs088hMoArqZ/XF6gr7FaMCKY
 Ubz5dayBGMC+fNNGcLnDCSOJyr/k4gWTRPqpLX2EMNlAoL8IGz1dxTPT9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342501112"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342501112"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756033475"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756033475"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:15 +0300
Message-Id: <20230405153920.926583-17-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/21] drm/i915/display: add I915 conditional
 build to intel_sprite.h
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
 drivers/gpu/drm/i915/display/intel_sprite.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_sprite.h b/drivers/gpu/drm/i915/display/intel_sprite.h
index 4635c7ad23f9..7365192c5b8a 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.h
+++ b/drivers/gpu/drm/i915/display/intel_sprite.h
@@ -26,6 +26,7 @@ enum pipe;
 #define VBLANK_EVASION_TIME_US 100
 #endif
 
+#ifdef I915
 struct intel_plane *intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 					      enum pipe pipe, int plane);
 int intel_sprite_set_colorkey_ioctl(struct drm_device *dev, void *data,
@@ -39,5 +40,12 @@ int hsw_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state);
 int vlv_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
 			const struct intel_plane_state *plane_state);
+#else
+static inline struct intel_plane *intel_sprite_plane_create(struct drm_i915_private *dev_priv,
+							    int pipe, int plane)
+{
+	return NULL;
+}
+#endif
 
 #endif /* __INTEL_SPRITE_H__ */
-- 
2.39.2

