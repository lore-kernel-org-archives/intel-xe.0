Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DD5C761A6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9612310E9FD;
	Wed,  5 Apr 2023 15:40:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940410E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709223; x=1712245223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPPrA1DX+ybTJvpF7T3jUhdM5bUC5xH0nSGJzaqscIQ=;
 b=BSIqr5L4udxFXQs56rtARP/pL+TQssJv2HaN5axBJMl6SuTebcT2ZMJX
 3tOwS+CnmdFBDKBD3sGj7FY3GUD3RYNEaoy3TWxEd+DKJTrFqjjMJF9Yi
 dRgI7bXf97kCKL84eaOc+SJ5ruXTJvI4wkoaBwhiy5LiW+MINUWSIBKxG
 TnOx5jbbg1fdQmHPFAOEXKZETI2Az50cyD1LUqy+2FrUNqvok+2+6O65h
 eSX0ZxdALszmIZ9EnLZnncGjZCc2U1X1g31SKtd0+OnTT0ZVjqyNBvRXU
 TmhZr3raLhh03pY03/eUYr4ne0WuvUSSbbAtvJ3cuepqELBb4ZWRnWZfQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341210969"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="341210969"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751295958"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="751295958"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:10 +0300
Message-Id: <20230405153920.926583-12-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/21] drm/i915/display: add I915 conditional
 build to intel_lpe_audio.h
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
 drivers/gpu/drm/i915/display/intel_lpe_audio.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.h b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
index 0beecac267ae..2c5fcb6e1fd0 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.h
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.h
@@ -12,11 +12,29 @@ enum port;
 enum transcoder;
 struct drm_i915_private;
 
+#ifdef I915
 int  intel_lpe_audio_init(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv);
 void intel_lpe_audio_notify(struct drm_i915_private *dev_priv,
 			    enum transcoder cpu_transcoder, enum port port,
 			    const void *eld, int ls_clock, bool dp_output);
+#else
+static inline int intel_lpe_audio_init(struct drm_i915_private *dev_priv)
+{
+	return -ENODEV;
+}
+static inline void intel_lpe_audio_teardown(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_lpe_audio_irq_handler(struct drm_i915_private *dev_priv)
+{
+}
+static inline void intel_lpe_audio_notify(struct drm_i915_private *dev_priv,
+					  enum transcoder cpu_transcoder, enum port port,
+					  const void *eld, int ls_clock, bool dp_output)
+{
+}
+#endif
 
 #endif /* __INTEL_LPE_AUDIO_H__ */
-- 
2.39.2

