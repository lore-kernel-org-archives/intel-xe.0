Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57C6C05052
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38B010E499;
	Wed,  9 Aug 2023 19:05:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FED10E499
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607933; x=1723143933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=buHCl44YgqnYv+EyoASeIjWS1Adq0cbMxMwcUtQZfLU=;
 b=klwca5jAgmTuMRf+OZUL8X1FxZo24XNurLKM9VFLPXdwj0XKydUdNdT2
 PgNzNgA39TjM5sHrUzyZOxaNpLl1968GKdhoFEN2T49qt6gvFZG3aM2wP
 7RRfQbanINnEF60BLuQdhC2PU7lwJn5G3H8n4mn35pvc4C2rDZ+GmTfWG
 q1VF+Nt18j777ajSAhzwNXNdHI+R2aiYa3wdY3G16LRz1R6DLdl2k2dQv
 t5cadL3POf3HqMeebNGEnj4eAFrpgzGZINhGblfVqGULeNSIRojiZEW56
 qsWMyAD2MfvW34JarF+BR1uZ9Zd3iYTrFkVBvzAouPjGXw6oTNBbPLiie A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370108227"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="370108227"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905768041"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="905768041"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:50 +0300
Message-Id: <20230809190453.1927134-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809190453.1927134-1-jani.nikula@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/9] fixup! drm/xe/display: Implement display
 support
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

None of these are required with the proper stubs in place.

v2: Retain __i915_inject_probe_error()

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/xe/display/ext/intel_device_info.c    | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 614cc2900104..fcea9cd93aba 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -44,18 +44,3 @@ int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
 {
 	return 0;
 }
-void intel_dvo_init(struct drm_i915_private *i915) {}
-int intel_tv_init(struct drm_i915_private *i915) { return 0; }
-int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
-bool intel_sdvo_init(struct drm_i915_private *dev_priv,
-		     i915_reg_t sdvo_reg, enum port port)
-
-{
-	return false;
-}
-void g4x_hdmi_init(struct drm_i915_private *dev_priv,
-		   i915_reg_t hdmi_reg, enum port port)
-{}
-int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
-				    struct drm_atomic_state *state)
-{ return -ENODEV; }
-- 
2.39.2

