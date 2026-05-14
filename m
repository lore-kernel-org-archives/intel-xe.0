Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D49CD4F3C
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 05:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7841D10F123;
	Thu, 14 May 2026 05:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuAPRcb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ED810E138;
 Thu, 14 May 2026 05:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778738337; x=1810274337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mxgo8HzYwK5X31hRmpPFEuCUq4y8Sw7AzlsjJQcXwBc=;
 b=MuAPRcb794ieKoESD/OLmQdl8wgV7eWm/UGHgqTkH/HYuhEGZ5j48Zoc
 8P7hepjqC4l0vbE+km120h7PIbNsfzJq9Yo4hk8XCIzcIJExAmlNFdcXD
 ig8eEGMEQRNvvG6z2AV9EDdCzLj7wrItwAkA9gpCbkUPrKt6ULqzOJsdG
 TUxL1gYL2gzeIUe9XENF0bXIqrXivmVB15v7xiMElWWYVZAL/hz/SWjvb
 zwdWXeLvlz7AnSm6d4riTR0VmcLkocX4cB88/YfsRmTdDI9zk81d7or33
 ohNu4UjSBUY4y5f57Os7vTCcBhNoG6vVL9QZhTY3CoA6vRtthWY2dU//o g==;
X-CSE-ConnectionGUID: dZrmT8ofSEWcErHq0kFDZg==
X-CSE-MsgGUID: h+XLWcv/RXOW9Ucl8YBFww==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67203217"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="67203217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 22:58:56 -0700
X-CSE-ConnectionGUID: EhddDKLyQjSMBae4N/ugHA==
X-CSE-MsgGUID: U8jihHFTQZyqopslLGNZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237434215"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 13 May 2026 22:58:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/i915/backlight: Rename debug message in the setup()
 callback
Date: Thu, 14 May 2026 11:28:47 +0530
Message-Id: <20260514055848.871938-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514055848.871938-1-suraj.kandpal@intel.com>
References: <20260514055848.871938-1-suraj.kandpal@intel.com>
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

Update the drm_dbg_kms to "Setting up ..." instead of "Using .."
since a call to pwm_funcs->setup() does not necessarily mean we
will be using PCH PWM to control backlight. We could still end up
using AUX Backlight.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index b128896cb1c2..ab70c79c40b4 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -1280,7 +1280,7 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
 	}
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PCH PWM for backlight control\n",
+		    "[CONNECTOR:%d:%s] Setting up native PCH PWM for backlight control\n",
 		    connector->base.base.id, connector->base.name);
 
 	return 0;
@@ -1311,7 +1311,7 @@ static int pch_setup_backlight(struct intel_connector *connector, enum pipe unus
 		(pch_ctl1 & BLM_PCH_PWM_ENABLE);
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PCH PWM for backlight control\n",
+		    "[CONNECTOR:%d:%s] Setting up native PCH PWM for backlight control\n",
 		    connector->base.base.id, connector->base.name);
 
 	return 0;
@@ -1353,7 +1353,7 @@ static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unu
 	panel->backlight.pwm_enabled = val != 0;
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PWM for backlight control\n",
+		    "[CONNECTOR:%d:%s] Setting up native PWM for backlight control\n",
 		    connector->base.base.id, connector->base.name);
 
 	return 0;
@@ -1386,7 +1386,7 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
 	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PWM for backlight control\n",
+		    "[CONNECTOR:%d:%s] Setting up native PWM for backlight control\n",
 		    connector->base.base.id, connector->base.name);
 
 	return 0;
@@ -1418,7 +1418,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
 	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PWM for backlight control (on pipe %c)\n",
+		    "[CONNECTOR:%d:%s] Setting up native PWM for backlight control (on pipe %c)\n",
 		    connector->base.base.id, connector->base.name, pipe_name(pipe));
 
 	return 0;
@@ -1458,7 +1458,7 @@ bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)
 	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PWM for backlight control (controller=%d)\n",
+		    "[CONNECTOR:%d:%s] Setting up native PWM for backlight control (controller=%d)\n",
 		    connector->base.base.id, connector->base.name,
 		    panel->backlight.controller);
 
@@ -1530,7 +1530,7 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
 	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
 
 	drm_dbg_kms(display->drm,
-		    "[CONNECTOR:%d:%s] Using native PCH PWM for backlight control (controller=%d)\n",
+		    "[CONNECTOR:%d:%s] Setting up native PCH PWM for backlight control (controller=%d)\n",
 		    connector->base.base.id, connector->base.name,
 		    panel->backlight.controller);
 
-- 
2.34.1

