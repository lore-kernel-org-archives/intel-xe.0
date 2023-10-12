Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A1ACDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 08:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6510E46A;
	Thu, 12 Oct 2023 08:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DC810E46A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697100961; x=1728636961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15GP/LHnPhO3hTTR7DmmCIXJC5r4C607uvCFQhJPv44=;
 b=Eps5jhwuOTenRY23Dtgro6dwjIs7uYT0JkMOPnXFru01+TmjILCt/Fhi
 U5gKMS+520ByAqaBzNMM4GXZuHgObc/B6FD5nc3DpxPaQpgpgMmVUHQKL
 LVm6ASxnuL5B2tdOQ8Z/dsHMWI9hdBwqXxy/r1pl30/MhdBSaBpLTmMme
 kgJOBzZl/3VFi/+owDrrfdTj33zapxoaXkNhB3CQj+fpiNrQZiSrgiXWM
 fnVkQh0UeebxaUNG77NjDdqLohGT2Tfp5WxlLGhrULMmgfsFVQFvTjyFH
 3+SeuLLeO/bz1RBQGFz5oCOJbsxdolz/Lp7NvxX9I/FeeCNTzZ14+KB7F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388733063"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388733063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820059834"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="820059834"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 01:55:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 uma.shankar@intel.com
Date: Thu, 12 Oct 2023 14:17:06 +0530
Message-Id: <20231012084707.1254386-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924144751.446446-1-arun.r.murthy@intel.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/i915: Remove the module parameter
 'fastboot'
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

By default fastboot is enabled on all Display 9+ platforms and disabled
on older platforms. Its not necessary to retain this as a module
parameter.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230926091157.635438-1-arun.r.murthy@intel.com
(cherry picked from commit 58883680a8416661b48a800e5530e2efcea64a4a
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ---
 drivers/gpu/drm/i915/i915_params.c           | 5 -----
 drivers/gpu/drm/i915/i915_params.h           | 1 -
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4b73db93d23d..748e9a42e94f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4989,9 +4989,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
 #ifdef I915
-	if (dev_priv->params.fastboot != -1)
-		return dev_priv->params.fastboot;
-
 	/* Enable fastboot by default on Skylake and newer */
 	if (DISPLAY_VER(dev_priv) >= 9)
 		return true;
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 0a171b57fd8f..036c4c3ed6ed 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -137,11 +137,6 @@ i915_param_named_unsafe(enable_ips, int, 0400, "Enable IPS (default: true)");
 i915_param_named_unsafe(enable_dpt, bool, 0400,
 	"Enable display page table (DPT) (default: true)");
 
-i915_param_named(fastboot, int, 0400,
-	"Try to skip unnecessary mode sets at boot time "
-	"(0=disabled, 1=enabled) "
-	"Default: -1 (use per-chip default)");
-
 i915_param_named_unsafe(load_detect_test, bool, 0400,
 	"Force-enable the VGA load detect code for testing (default:false). "
 	"For developers only.");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 68abf0ad6c00..d5194b039aab 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -72,7 +72,6 @@ struct drm_printer;
 	param(int, edp_vswing, 0, 0400) \
 	param(unsigned int, reset, 3, 0600) \
 	param(unsigned int, inject_probe_failure, 0, 0) \
-	param(int, fastboot, -1, 0600) \
 	param(int, enable_dpcd_backlight, -1, 0600) \
 	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
 	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
-- 
2.25.1

