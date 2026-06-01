Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BBACD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA451130D5;
	Mon,  1 Jun 2026 10:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnXxZPse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5B71130C5;
 Mon,  1 Jun 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310117; x=1811846117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/IJgpCT/JYrvlXWWwInOV+G68Og+HAi2ROCuew2WUg=;
 b=OnXxZPse4OzjkFrmXhRz80q1VIVu0VEhiDdIf3imuaaTNpftMKpkO3ZK
 qp2v4VZs7N0pEfp/k/3ntofwVxxw62p8CU88ORkRLycJ+C8f8A2zyZNaa
 61K+A+xhTFI0f4m574XCzbYrk0gznPTbKGLU9RuCoVSsoLmAzh68TzBCP
 NMrZhg6NcOvQjsF1rokKMvA0PNSk8NYTraVceTzTesZm+m2i2KXzCn8VK
 reOI8RUon3Jwn476C94/G/ER0wD8yOELItXnDzg9wlgni7to0EuE1zWlJ
 Ydm3HaOlBy+HNHHNxJRKn60oHBgmo36kyjIoQZ/WpWJU8mhbgU6WnHexf w==;
X-CSE-ConnectionGUID: /sAreTiiSte6bPcC3+wA4A==
X-CSE-MsgGUID: 5rb1c0eLQ3KJWTSv2gNAyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797235"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797235"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:17 -0700
X-CSE-ConnectionGUID: HFrrGrO5SMqLJQAyvTQgIg==
X-CSE-MsgGUID: oj/3jYrmQ5GdURKxtNB5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728404"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 1/5] drm/i915: Keep display IRQs enabled for encoder
 suspend/shutdown
Date: Mon,  1 Jun 2026 13:34:56 +0300
Message-ID: <0b4b4d489f91be9334554e5438d3f2aa79421d42.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
References: <cover.1780310011.git.jani.nikula@intel.com>
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

