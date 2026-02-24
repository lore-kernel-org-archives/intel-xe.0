Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176D6EFB7F1
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352110E49F;
	Tue, 24 Feb 2026 03:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVxpGxQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2450B10E49D;
 Tue, 24 Feb 2026 03:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904732; x=1803440732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVKC+xxO4w9yOL5BVtt+kbq5OC0LdCYLK/L7UNr/134=;
 b=CVxpGxQXgIfG24wMK/6z4JfgIyvg6LdDqRzA6QZdn/sRZZuyS8wkgtGd
 eWe4if2Wy3GHYnjzkAYLa5vKw8tEhlgI1lY/gK+yI/fFpcwmjxfBbQhcJ
 tEuDQHEityZGGxYjIyEnWwWHRcSkOvr60Wy9vIGAlhDkfUqD3zqlMl4Db
 ADdIsglG+QRqiIHztkK2rJwAxDN/IwtPhcx9IxZzNXGzCimCisqQGsPSu
 wvnoMY4PontYKRWBpMf/utXPFWnOzBKbAAWNY7ic601Zdbk/Sf1+nGAXu
 7tY/g/k4cLixTfuL0wiS7JiQXfTzkAd5mziwyAzhA+iq8eDqCMh50MGZS g==;
X-CSE-ConnectionGUID: VK4/6/29RFqY5wCuFnAI+A==
X-CSE-MsgGUID: cMoQ24p8TJiLtZs3feeEbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817852"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:32 -0800
X-CSE-ConnectionGUID: mBjjz5UVTpeyeV9to1pT4w==
X-CSE-MsgGUID: daF/1jUnTaWrjCiSHw6/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010618"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:30 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 1/8] drm/i915/backlight: Use default/max brightness for
 VESA AUX backlight init
Date: Tue, 24 Feb 2026 09:15:19 +0530
Message-Id: <20260224034526.2730130-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224034526.2730130-1-suraj.kandpal@intel.com>
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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

If the brightness fetched from VBT/previous state is 0 on backlight
initialization, then set the brightness to a default/max value.
Whenever the minimum brightness is reported as 0 there are chances
we end up with blank screen. This confuses the user into thinking
the display is acting weird. This occurs in eDP 1.5 when
we are using PANEL_LUMINANCE_OVERRIDE mode to mainpulate brightness
via luminance values.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
v1 -> v2:
- Let users set brightness to 0, make it so that it's just not
done by default (Arun)

v2 -> v3:
-Update commit header and message (Arun)

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index eb05ef4bd9f6..c40ce310ad97 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -564,6 +564,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		}
 		panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector, 0);
 		panel->backlight.enabled = panel->backlight.level != 0;
+		if (!panel->backlight.level)
+			panel->backlight.level = panel->backlight.max;
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] AUX VESA Nits backlight level is controlled through DPCD\n",
 			    connector->base.base.id, connector->base.name);
@@ -573,6 +575,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 		if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
 			panel->backlight.level = current_level;
 			panel->backlight.enabled = panel->backlight.level != 0;
+			if (!panel->backlight.level)
+				panel->backlight.level = panel->backlight.max;
 		} else {
 			panel->backlight.level = panel->backlight.max;
 			panel->backlight.enabled = false;
-- 
2.34.1

