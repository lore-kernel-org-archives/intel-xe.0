Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463CEC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7C10E94F;
	Fri, 27 Oct 2023 07:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAF210E94F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393576; x=1729929576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPirBacEvk5n+XWiS2kGBNN+UklYBAT6gOl0ft2wOQM=;
 b=kaa8z0wAYHsfS31bea+Dcnr3JQgK4jBaPej5IG4LPO6qbeAOoudq6RGT
 B/QClmgg3CdZEX2H9ntL4LW6piBKtfuctHRGFBcZRyvutTPIWVigobORk
 lHdVNsufT7ybNFZC2+Fwl8BdUe5czVjd5Ehum/aZ4TzW9ZReMJJCnI4DP
 LvG7oFE2JeE1wac1tjsHzz8u2GmhWLUvvzerdlsMMkG1/gVoY6LAyJhdB
 aOIbI912duc3lYDdjxvQKYw0tYi/orj4/Cop65+Cf4rCHXcKXHpjpSE9N
 VsYa8kxbaKRknd2PVJeiCLiLno0p3uLn8gC3u9aL3FPvdiBuVZrjyhT2L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603711"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603711"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510063"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510063"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:48 +0300
Message-Id: <20231027075918.2206862-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/31] Revert "FIXME: drm/i915: xe doesn't have
 i915_modparams.verbose_state_checks"
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit e1253319ab3fb9a6d229e01fc36386d5a464c5ca.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 7a01f61cdcdf..0e5dffe8f018 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -548,17 +548,11 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port);
  * verbose_state_checks module param, to enable distros and users to tailor
  * their preferred amount of i915 abrt spam.
  */
-#ifdef I915
-#define i915_display_verbose_check (i915_modparams.verbose_state_checks)
-#else
-#define i915_display_verbose_check 1
-#endif
-
 #define I915_STATE_WARN(__i915, condition, format...) ({		\
 	struct drm_device *drm = &(__i915)->drm;			\
 	int __ret_warn_on = !!(condition);				\
 	if (unlikely(__ret_warn_on))					\
-		if (!drm_WARN(drm, i915_display_verbose_check, format)) \
+		if (!drm_WARN(drm, i915_modparams.verbose_state_checks, format)) \
 			drm_err(drm, format);				\
 	unlikely(__ret_warn_on);					\
 })
-- 
2.34.1

