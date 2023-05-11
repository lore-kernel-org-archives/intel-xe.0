Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A525C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 09:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A6010E218;
	Thu, 11 May 2023 09:28:35 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A8210E218
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683797314; x=1715333314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+iJp+MCfuPSBavVpJCLvjwloLOx/QQq4o+IagADI4Ds=;
 b=FKsdHXP/QPsRN5NcqRwHahvzUJ83ZVSoOaanMVv3qNpA5Pc7AY8L99+H
 NVp/oflmpR8w+MJ+Y2cfeUT4RI5Y6X0YBZEt/raHIZYkTxnOiY0Swp6U1
 8isl1l8rdYD1wcY48+NjmrrEvh5DlaB7o2yW+HzqPSaksQbkdisImL+9Z
 bX68DsnQfuNYrONQy+qVjrLqLvQZMOhtRvDe8jc1J40UJZM4rGEs2VgUT
 N+8cCAMZt4BsfpfbEBVTRikUtMU5/R6SzXxaU6AImRVuI+/FT/GpRPUys
 DjJlJ7hDBhMNhiIX7QKEsdDprlz2zhRV4OGmx/3x2mw9B4QAFrW+p34DL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334931107"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334931107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="946065115"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="946065115"
Received: from nbathi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.185])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:28:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 12:28:28 +0300
Message-Id: <20230511092828.833211-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes to
 make xe compile
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The dsparb_lock may be coming back with [1] later, but adding it here is
probably just a rebase leftover. Drop it.

[1] https://patchwork.freedesktop.org/patch/msgid/20230327161223.406573-1-rodrigo.vivi@intel.com

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_core.h | 3 ---
 drivers/gpu/drm/i915/i915_driver.c                | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 437f623337e3..e36f88a39b86 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -264,9 +264,6 @@ struct intel_wm {
 	 */
 	struct mutex wm_mutex;
 
-	/* protects DSPARB registers on pre-g4x/vlv/chv */
-	spinlock_t dsparb_lock;
-
 	bool ipc_enabled;
 };
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 5d302602793c..12ba7cf78b1e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -215,7 +215,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	spin_lock_init(&dev_priv->irq_lock);
 	spin_lock_init(&dev_priv->gpu_error.lock);
 	spin_lock_init(&dev_priv->display.fb_tracking.lock);
-	spin_lock_init(&dev_priv->display.wm.dsparb_lock);
 	mutex_init(&dev_priv->display.backlight.lock);
 
 	mutex_init(&dev_priv->sb_lock);
-- 
2.39.2

