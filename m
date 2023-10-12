Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9DBCDB484
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 08:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E111C10E46D;
	Thu, 12 Oct 2023 08:56:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F22710E46A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697100962; x=1728636962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EbeRjjbio1h+oS60pyngRIyhBu78A9rvpzMcEN2/Ab8=;
 b=GF12DJ68/d+7a6tqJwCnBXbVuRNalmaj0gIMbBh7l1/4qAN2gPMih8k9
 oz4lzIBRxAjFPsTZhoD+jAeZefLGAkIeGkBqMEDFBOpOk9aPePi1tl4P1
 D3yPkCduAqcVyKI8ZUV6tTa58q/nCs84I8Je5ytX4OaqJiGLvSbo4lECc
 W29Jd7JM5UgjQ+vsPxuDVYitA76hv2QifG4LG0QyOPJNfw8peLuSZdgtE
 E6Gp0XS8vlcAnLTxQ1aGEifr1GqkzVMrbWmMnD51EAiQo3/uyWVfMRM9/
 IM+czC/MxQihoCxd8QqbHkmjxzCuuWB4YS6wmHTWPKcCPMnov6W42S4+L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388733068"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388733068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="820059838"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="820059838"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 01:56:00 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 uma.shankar@intel.com
Date: Thu, 12 Oct 2023 14:17:07 +0530
Message-Id: <20231012084707.1254386-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012084707.1254386-1-arun.r.murthy@intel.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
 <20231012084707.1254386-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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

Fastboot module parameter has been removed from i915 driver.

This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 748e9a42e94f..478b8764101a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4988,7 +4988,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
-#ifdef I915
 	/* Enable fastboot by default on Skylake and newer */
 	if (DISPLAY_VER(dev_priv) >= 9)
 		return true;
@@ -4999,9 +4998,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 
 	/* Disabled by default on all others */
 	return false;
-#else
-	return true;
-#endif
 }
 
 bool
-- 
2.25.1

