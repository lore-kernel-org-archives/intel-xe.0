Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C38DC4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E08A113210;
	Wed,  7 Feb 2024 10:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnAYERCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC079113215
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3W2jS6eIeprbKNPh4Aap5Ee94kHq9moYlsXtJgIq0Lw=;
 b=gnAYERCwiyif6HhwMm9CqiBYJDfMTHRXTZxA43GEBpiz9pwWMGgiVb0D
 c3rvLodfN69I/NXT/7Nqrc0OexmesFnpqsAyLq/05t5HnkkInahgx+aqZ
 LxOBPCeuhvO7gpm03ukir0An+R3xZNCcLpliSUmpIuXGaZIMhe1RaKr73
 909e0j+c50ggi0xzgJPNaowx3/4/5b625waGYPysQPZat3YbueHQNQRxb
 /3huueVXhbICt1g8iuKg2uoRHFG/wuveQS+WC8siLEZqJNz6UT3MTKvml
 vKSyMUtu2TbtoBPsr9ZlzHJmAKTKSkn5p18CrxImVPJe8pp3eEjvWm23f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317368"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328873"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:23 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 6/6] drm/i915/display: call DMC wakelock enable when DMC is
 loaded
Date: Wed,  7 Feb 2024 12:30:07 +0200
Message-Id: <20240207103007.665367-7-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although the documentation says that this should be done in the first
modeset, it makes more sense to enable and disable it when DMC is
enabled and disabled, including during suspend and resume operations.

Add the calls to enable and disable DMC wakelock accordingly.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 85009c5ba488..d5d275849f4d 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -536,6 +536,8 @@ void intel_dmc_load_program(struct drm_i915_private *i915)
 	gen9_set_dc_state_debugmask(i915);
 
 	pipedmc_clock_gating_wa(i915, false);
+
+	intel_dmc_wl_enable(i915);
 }
 
 /**
@@ -553,6 +555,8 @@ void intel_dmc_disable_program(struct drm_i915_private *i915)
 	pipedmc_clock_gating_wa(i915, true);
 	disable_all_event_handlers(i915);
 	pipedmc_clock_gating_wa(i915, false);
+
+	intel_dmc_wl_disable(i915);
 }
 
 void assert_dmc_loaded(struct drm_i915_private *i915)
@@ -1085,6 +1089,8 @@ void intel_dmc_suspend(struct drm_i915_private *i915)
 	if (dmc)
 		flush_work(&dmc->work);
 
+	intel_dmc_wl_disable(i915);
+
 	/* Drop the reference held in case DMC isn't loaded. */
 	if (!intel_dmc_has_payload(i915))
 		intel_dmc_runtime_pm_put(i915);
@@ -1108,6 +1114,8 @@ void intel_dmc_resume(struct drm_i915_private *i915)
 	 */
 	if (!intel_dmc_has_payload(i915))
 		intel_dmc_runtime_pm_get(i915);
+
+	intel_dmc_wl_enable(i915);
 }
 
 /**
-- 
2.39.2

