Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C066C7EE2D
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F68D10E0D4;
	Fri,  2 Jun 2023 17:55:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCC110E0D4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685728499; x=1717264499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHJAB9XGfW6LonnaNdqH1fx2LuALm646E3lKNkfTy70=;
 b=O64zJQ0sQRhjjpIAVNz1iCOCWExMyA6uk5HKDsV0jW+hqbNsaj3Jb5Xr
 SQWlR+e6kZdHDWFKbzp/0FVpXtwzwhXSfpx9xbc4MZ0feIunKyosb10Q2
 MkiXA/M9Oh5rhoaILpwoFWxTbFwBagHpLrMU8NvK1jjti4k5kNtYuBE7x
 LQbM/BSWDvlqpCmJeRv/Umu2WeSEWseK4GhObTvGcf9AxwnCSGX1dVBk4
 Y1Wob/YBWy/fLcJA2N4hGstYP5JooOMCUzmqR0a4IXhOzwB3tS9J1y66f
 pt7dvF4YZ70CJB4xQeIp292rW31rkLf1OgvTjEQWk4UfZt9ZZvQBlgqXK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353421316"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="353421316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="711039453"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="711039453"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:54:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:54:41 +0300
Message-Id: <20230602175444.3511273-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
References: <20230602175444.3511273-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] Revert "drm/i915/display: Fix a
 use-after-free when intel_edp_init_connector fails"
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit b0e69bfaee88d13127511ecbaac2001a2e111159.

To be replaced with backport of upstream commit f917130f19fe ("drm/i915:
Flush power delayed put when connector init failed").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_power.h | 1 -
 drivers/gpu/drm/i915/display/intel_dp_aux.c        | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 177c85c598a4..c6ae4c88dae4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -790,7 +790,7 @@ void intel_display_power_flush_work(struct drm_i915_private *i915)
  * Like intel_display_power_flush_work(), but also ensure that the work
  * handler function is not running any more when this function returns.
  */
-void
+static void
 intel_display_power_flush_work_sync(struct drm_i915_private *i915)
 {
 	struct i915_power_domains *power_domains = &i915->display.power.domains;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 6f0200f77d67..7f2ded540d6e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -203,7 +203,6 @@ void __intel_display_power_put_async(struct drm_i915_private *i915,
 				     enum intel_display_power_domain domain,
 				     intel_wakeref_t wakeref);
 void intel_display_power_flush_work(struct drm_i915_private *i915);
-void intel_display_power_flush_work_sync(struct drm_i915_private *i915);
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
 void intel_display_power_put(struct drm_i915_private *dev_priv,
 			     enum intel_display_power_domain domain,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 1ef5b66c29fe..20226764757b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -720,8 +720,6 @@ void intel_dp_aux_fini(struct intel_dp *intel_dp)
 	if (cpu_latency_qos_request_active(&intel_dp->pm_qos))
 		cpu_latency_qos_remove_request(&intel_dp->pm_qos);
 
-	/* Ensure async work from intel_dp_aux_xfer() is flushed before we clean up */
-	intel_display_power_flush_work_sync(dp_to_i915(intel_dp));
 	kfree(intel_dp->aux.name);
 }
 
-- 
2.39.2

