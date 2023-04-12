Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE0C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A15410E82A;
	Wed, 12 Apr 2023 14:23:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9129910E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309398; x=1712845398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hgH4HmBrzhZxftvDyoZMWyr6vDFZfkvHpAo3//ygOgQ=;
 b=fn97h60fvNYdkBbbTlKIDU8rBjIJMroOSHJIyE2ZFyoXpe0NQnZ6Nm/W
 JBD7NO7tWFVtzNgfLOGzCKPtwf4bCQkiXHUE5sfei62q7p/CO3Ox58xHT
 xw5ddCLOMB0RpRiNHjw9T7pvbbj/YOpcInrWAbB9E0J142sKvHyuX8Ove
 Y68Bgvklzcc25jt87AWyMlM5xoZEl7z8M6j1/XV3HkrtpP2a2e1XVhaok
 CwcZLmHt0HE4WHSX23gg8HLu/29kkZk6tN10UaPuxYWsark7DjllUStzf
 tE+aUmRYbmbvsIpKy84A5a7hmJ0XdaVsVoK8iUTIhQlLpNRlgAhxZDLbQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667333"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719390761"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="719390761"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:23:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:43 +0300
Message-Id: <20230412142006.877109-19-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 18/41] fixup! drm/i915/display: Remaining changes
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_power_well.c  | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index ddea30240a5b..bd86f570f462 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -1053,7 +1053,6 @@ static void i830_pipes_power_well_sync_hw(struct drm_i915_private *dev_priv,
 		i830_pipes_power_well_disable(dev_priv, power_well);
 }
 
-#ifdef I915
 static void vlv_set_power_well(struct drm_i915_private *dev_priv,
 			       struct i915_power_well *power_well, bool enable)
 {
@@ -1706,7 +1705,6 @@ static void chv_pipe_power_well_disable(struct drm_i915_private *dev_priv,
 
 	chv_set_pipe_power_well(dev_priv, power_well, false);
 }
-#endif
 
 static void
 tgl_tc_cold_request(struct drm_i915_private *i915, bool block)
@@ -1831,21 +1829,17 @@ const struct i915_power_well_ops i9xx_always_on_power_well_ops = {
 };
 
 const struct i915_power_well_ops chv_pipe_power_well_ops = {
-#ifdef I915
 	.sync_hw = chv_pipe_power_well_sync_hw,
 	.enable = chv_pipe_power_well_enable,
 	.disable = chv_pipe_power_well_disable,
 	.is_enabled = chv_pipe_power_well_enabled,
-#endif
 };
 
 const struct i915_power_well_ops chv_dpio_cmn_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
-#ifdef I915
 	.enable = chv_dpio_cmn_power_well_enable,
 	.disable = chv_dpio_cmn_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
-#endif
 };
 
 const struct i915_power_well_ops i830_pipes_power_well_ops = {
@@ -1886,29 +1880,23 @@ const struct i915_power_well_ops bxt_dpio_cmn_power_well_ops = {
 
 const struct i915_power_well_ops vlv_display_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
-#ifdef I915
 	.enable = vlv_display_power_well_enable,
 	.disable = vlv_display_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
-#endif
 };
 
 const struct i915_power_well_ops vlv_dpio_cmn_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
-#ifdef I915
 	.enable = vlv_dpio_cmn_power_well_enable,
 	.disable = vlv_dpio_cmn_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
-#endif
 };
 
 const struct i915_power_well_ops vlv_dpio_power_well_ops = {
 	.sync_hw = i9xx_power_well_sync_hw_noop,
-#ifdef I915
 	.enable = vlv_power_well_enable,
 	.disable = vlv_power_well_disable,
 	.is_enabled = vlv_power_well_enabled,
-#endif
 };
 
 static const struct i915_power_well_regs icl_aux_power_well_regs = {
-- 
2.39.2

