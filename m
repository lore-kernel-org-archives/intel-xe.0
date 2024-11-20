Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471BBD63936
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 12:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1366E10E743;
	Wed, 20 Nov 2024 12:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djzdHZd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843410E743;
 Wed, 20 Nov 2024 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732106652; x=1763642652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNRPv2F2DhEH3w/vyOMz4tex2XXuSpY1v48uG9CSZ6A=;
 b=djzdHZd/1mspTYU6EgJGAf7vI1FtIUtqthFxwq4R2Az4oNzdmhtaJXlA
 fkVaj4cszMcp0kIaOCYdKQZrPm8NGMujWKuV0TpxtgHpv6jpiW11j1s++
 K42RJpM1Jcpj4m2OV9jep2ezOF+m/FH7OmZD59dWYvyTHJvmZuGwq833w
 cIBOuKkXQIz00cOGucybIQ0QDfUkPtoUDCrgW4Ub3y7uFYjGIYdovGWin
 v8zhUPARtb0Bk1lsqHwF7beStyDyoMsZWoAwOMQLdG9JgmMj0b43q8FlC
 tVCM9ElWX73yt6cxgn2zAXvWR3or1rLj4/GPWt/ACZOo/ab4pY7+FAFWh Q==;
X-CSE-ConnectionGUID: 6KQkLKVpRPimJqK/luR3Lg==
X-CSE-MsgGUID: WBFsp3/5QtehnpAC+KJ2iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35018068"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="35018068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 04:44:12 -0800
X-CSE-ConnectionGUID: NGNnnHVITGCkWu8/s/oWBA==
X-CSE-MsgGUID: /7qbJa1xRGKds+Yv8WhrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90295556"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 04:44:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Imre Deak <imre.deak@intel.com>
Subject: [CI 10/11] drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
Date: Wed, 20 Nov 2024 14:43:18 +0200
Message-Id: <191f0210d720f3113a092e1ef0c7996a7dee85a0.1732106557.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1732106557.git.jani.nikula@intel.com>
References: <cover.1732106557.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Refactor the switch-case into an if-ladder similar to
intel_ddi_read_func_ctl() for clarity.

This highlights how TRANS_DDI_MODE_SELECT_FDI_OR_128B132B works on
different platforms.

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 44 +++++++++---------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 607c983f07ef..33628cbc0f72 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -723,7 +723,7 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 	enum transcoder cpu_transcoder;
 	intel_wakeref_t wakeref;
 	enum pipe pipe = 0;
-	u32 tmp;
+	u32 ddi_mode;
 	bool ret;
 
 	wakeref = intel_display_power_get_if_enabled(dev_priv,
@@ -741,38 +741,26 @@ bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
 	else
 		cpu_transcoder = (enum transcoder) pipe;
 
-	tmp = intel_de_read(dev_priv,
-			    TRANS_DDI_FUNC_CTL(dev_priv, cpu_transcoder));
+	ddi_mode = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(dev_priv, cpu_transcoder)) &
+		TRANS_DDI_MODE_SELECT_MASK;
 
-	switch (tmp & TRANS_DDI_MODE_SELECT_MASK) {
-	case TRANS_DDI_MODE_SELECT_HDMI:
-	case TRANS_DDI_MODE_SELECT_DVI:
+	if (ddi_mode == TRANS_DDI_MODE_SELECT_HDMI ||
+	    ddi_mode == TRANS_DDI_MODE_SELECT_DVI) {
 		ret = type == DRM_MODE_CONNECTOR_HDMIA;
-		break;
-
-	case TRANS_DDI_MODE_SELECT_DP_SST:
+	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && !HAS_DP20(display)) {
+		ret = type == DRM_MODE_CONNECTOR_VGA;
+	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_SST) {
 		ret = type == DRM_MODE_CONNECTOR_eDP ||
-		      type == DRM_MODE_CONNECTOR_DisplayPort;
-		break;
-
-	case TRANS_DDI_MODE_SELECT_DP_MST:
-		/* if the transcoder is in MST state then
-		 * connector isn't connected */
+			type == DRM_MODE_CONNECTOR_DisplayPort;
+	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
+		   (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))) {
+		/*
+		 * If the transcoder is in MST state then connector isn't
+		 * connected.
+		 */
 		ret = false;
-		break;
-
-	case TRANS_DDI_MODE_SELECT_FDI_OR_128B132B:
-		if (HAS_DP20(display))
-			/* 128b/132b */
-			ret = false;
-		else
-			/* FDI */
-			ret = type == DRM_MODE_CONNECTOR_VGA;
-		break;
-
-	default:
+	} else {
 		ret = false;
-		break;
 	}
 
 out:
-- 
2.39.5

