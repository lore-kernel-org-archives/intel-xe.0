Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EECCD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFC310FD2F;
	Fri, 29 May 2026 11:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sq1tQ7d0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B910FD28;
 Fri, 29 May 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052686; x=1811588686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/IJgpCT/JYrvlXWWwInOV+G68Og+HAi2ROCuew2WUg=;
 b=Sq1tQ7d0Fk5CtV0xJmmHTtIi1B2HFfe/inf30FXQjsBnJivcA2Qf7rJ8
 x0Vzgn/J6efOpzszvqOkvmG1yFW3/SNRHXg4s7CJ8bQD06HT10C74xMiW
 3e0/0El7TSzfVLM6t/Og4UhjzA3pcK2wa3CTrpYqBajvyntklzq1YUIG4
 Yn/VSgY3hWJD7To0szih3ZeFdrgZmS3sO8jxlq2gMvtr8IpAz8ufP0O8q
 Yh0IFFEK8jkIK+a+GRmclkBQk/vQZkWg6Vj0peP7oFKSCmhFhBrQS+l5/
 jnNKof7bQSDsTJ6aUeBYD9+FEwuHRbb9kZxKluKdruFg+wKf8p9UkPoJp A==;
X-CSE-ConnectionGUID: NcPkmJqAQYOes2RdEeGZpg==
X-CSE-MsgGUID: 8azOyxaFQDeK0AYEhntzAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92377781"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92377781"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:45 -0700
X-CSE-ConnectionGUID: rkItP7B7SSaG9qYNSU8bDg==
X-CSE-MsgGUID: zfW2GsoVS1uWdG1yIZkhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246840872"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 01/24] drm/i915: Keep display IRQs enabled for encoder
 suspend/shutdown
Date: Fri, 29 May 2026 14:03:45 +0300
Message-ID: <2c53ae9c997aa6d67b5867949bcd9782094f3559.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Imre Deak <imre.deak@intel.com>

A pending hotplug work or the encoder suspend/shutdown hooks may still
require display IRQs at least for AUX accesses, so keep all display IRQs
except for hotplug IRQs enabled until after intel_hpd_cancel_work() and
the encoder suspend/shutdown hooks are called during system suspend and
shutdown.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 58081b52461a..93940cfe91a0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1055,7 +1055,8 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 
 	intel_dp_mst_suspend(display);
 
-	intel_irq_suspend(i915);
+	intel_encoder_block_all_hpds(display);
+
 	intel_hpd_cancel_work(display);
 
 	if (intel_display_device_present(display))
@@ -1064,6 +1065,8 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 	intel_encoder_suspend_all(display);
 	intel_encoder_shutdown_all(display);
 
+	intel_irq_suspend(i915);
+
 	intel_dmc_suspend(display);
 
 	i915_gem_suspend(i915);
@@ -1135,7 +1138,8 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_display_driver_suspend(display);
 
-	intel_irq_suspend(dev_priv);
+	intel_encoder_block_all_hpds(display);
+
 	intel_hpd_cancel_work(display);
 
 	if (intel_display_device_present(display))
@@ -1143,6 +1147,8 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	intel_encoder_suspend_all(display);
 
+	intel_irq_suspend(dev_priv);
+
 	/* Must be called before GGTT is suspended. */
 	intel_dpt_suspend(display);
 	i915_ggtt_suspend(to_gt(dev_priv)->ggtt);
@@ -1314,6 +1320,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_hpd_init(display);
 
+	intel_encoder_unblock_all_hpds(display);
+
 	intel_display_driver_resume(display);
 
 	if (intel_display_device_present(display)) {
-- 
2.47.3

