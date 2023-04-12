Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24D7C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677EC10E823;
	Wed, 12 Apr 2023 14:22:25 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A4D10E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309344; x=1712845344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6W0fOm/JkdvqnA82VD5RUuAYUZaTwVFG0kOgFYbXOw=;
 b=EaNnGyjI4lmL6U0uPovmU22NkPBEvLWLhWUsVSmVbbDEI1CJbxHfoiOe
 P35/I2BSd/q6ZkvFKTCBq/L224lTXxvePH27wquJtQSPv1pihacGdIqtB
 4lCXv2idwdM3gafsY2sAfbt9REZlJaORoSWY2Fbu/YBDVa9VcWFLULmPu
 m2iGz1j0C1lrfAwxzoyjB0AU2JY6LwvWC1qSGV9KDYHS5ZfFHV8MuAmgI
 rWlDv5dx1sxQVG62Wgd6hI/DqNuNJ5lw7KH5j+b5X4qliXPpsz0saaGOa
 L6Fdc6HPZIUZe4Ba1FWiidnckjTNA1AnwGV1gFJrrkSBD/kV2DzUTSB40 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667165"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667165"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800356785"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800356785"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:22:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:41 +0300
Message-Id: <20230412142006.877109-17-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce display reset ifdefs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 25ead23cd150..c6605649a92f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -760,11 +760,9 @@ static bool gpu_reset_clobbers_display(struct drm_i915_private *dev_priv)
 	return (INTEL_INFO(dev_priv)->gpu_reset_clobbers_display &&
 		intel_has_gpu_reset(to_gt(dev_priv)));
 }
-#endif
 
 void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
 {
-#ifdef I915
 	struct drm_modeset_acquire_ctx *ctx = &dev_priv->display.restore.reset_ctx;
 	struct drm_atomic_state *state;
 	int ret;
@@ -823,12 +821,10 @@ void intel_display_prepare_reset(struct drm_i915_private *dev_priv)
 
 	dev_priv->display.restore.modeset_state = state;
 	state->acquire_ctx = ctx;
-#endif
 }
 
 void intel_display_finish_reset(struct drm_i915_private *i915)
 {
-#ifdef I915
 	struct drm_modeset_acquire_ctx *ctx = &i915->display.restore.reset_ctx;
 	struct drm_atomic_state *state;
 	int ret;
@@ -876,8 +872,8 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 	mutex_unlock(&i915->drm.mode_config.mutex);
 
 	clear_bit_unlock(I915_RESET_MODESET, &to_gt(i915)->reset.flags);
-#endif
 }
+#endif
 
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 {
-- 
2.39.2

