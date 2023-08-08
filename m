Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A21C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283D310E118;
	Tue,  8 Aug 2023 11:46:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA6010E118
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495167; x=1723031167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGI29kFQLIixA6D54K8GfYlfAR+DsowSKo9LIhcYqFE=;
 b=Kjc2ljL98dO7zwjGOORE1o+MDDdQzwcce4LOJR6loWs8EIFw0/sherFH
 1cPGPNeic9pHaM1a8kbb09lch922QuMPvDEiQ/wdNf8DBCWsuiWE/CtyN
 LCuOEcDrEnWLh4T9mWbi9SGvQi9YVRkqVsxszVgHEUNKwy7jUs06pMV0B
 6vO4Tr+LooD8HNURomvtESPuMbdPVVPhuluIBCWmv5FbIbzS85xYGVv3W
 41MxigUrbFsqHok3clrNSCe+U6tQvu9Pct6DaiZZNmfGWX8aCC7JYnr9C
 e673mV9elIdRn1jna8CStbBzzqYKXFwsZX9GhQCAf552NFsy/R9/ROp+c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758738"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758738"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196682"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196682"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:32 +0300
Message-Id: <20230808114535.1600595-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/9] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

None of these are required with the proper stubs in place.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/display/ext/intel_device_info.c    | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 614cc2900104..5adda84dab31 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -37,25 +37,3 @@ bool i915_vtd_active(struct drm_i915_private *i915)
 	/* Running as a guest, we assume the host is enforcing VT'd */
 	return i915_run_as_guest();
 }
-
-/* i915 specific, just put here for shutting it up */
-int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
-							  const char *func, int line)
-{
-	return 0;
-}
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

