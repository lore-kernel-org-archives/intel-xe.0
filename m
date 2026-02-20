Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED1AC53209
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60D10E781;
	Fri, 20 Feb 2026 05:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORajbvq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D246610E787;
 Fri, 20 Feb 2026 05:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563757; x=1803099757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6pwAUr4uV7+1w/dnCZNaLcfmSDB3gZ0KcMJY3/LYs8I=;
 b=ORajbvq9T7xiSCMn3NTi3DueYTFZMX2apjqtw/yJHwkJ9qkLDRWaVD/u
 3EWBFUR07VzMufHjDZfFW5H6sA35OSwpE/kOtitgMqDdZ1EUoFk2KX/IT
 WVzgCAwYDNBtpT8ym2zwWZTd8+z0WETBgrDF35D2fNtg5RMr4gd39jFVG
 Bj//VQACBHgjM1FhAyKcsiocnEuFmefIpw8VwItZNqT0AeQTS4GHSsARG
 Qdcza7U+Qf35omRIfAN17sPbhsl6Sx6Q23hovBfuHloyaakRXeKBr9UIp
 35GeMD5VmXcPiF9/2WFbxnT4tlSkN940Y37F8EvLsifrDH/iWXiWzibW3 Q==;
X-CSE-ConnectionGUID: haO9d1IkTjKv5hw5TwjAyg==
X-CSE-MsgGUID: HagJfxOWQ4ukSThKmCkLRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758237"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758237"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:37 -0800
X-CSE-ConnectionGUID: kimmfcZGTp6+6kQ/lQki3Q==
X-CSE-MsgGUID: yWC/b/vBTDyBKltv/ntw3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894654"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:35 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/8] drm/i915/backlight: Update debug log during backlight
 setup
Date: Fri, 20 Feb 2026 10:32:15 +0530
Message-Id: <20260220050217.2453681-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220050217.2453681-1-suraj.kandpal@intel.com>
References: <20260220050217.2453681-1-suraj.kandpal@intel.com>
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

With luminance_set which represents PANEL_LUMINANCE_OVERRIDE, we
have another variable other than aux_enable to decide if we use
PWM or DPCD. Make drm_dbg_kms log represent that.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c7143869bafd..043c9aef2ea6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -539,7 +539,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 	drm_dbg_kms(display->drm,
 		    "[CONNECTOR:%d:%s] AUX VESA backlight enable is controlled through %s\n",
 		    connector->base.base.id, connector->base.name,
-		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable));
+		    dpcd_vs_pwm_str(panel->backlight.edp.vesa.info.aux_enable ||
+				    panel->backlight.edp.vesa.info.luminance_set));
 	drm_dbg_kms(display->drm,
 		    "[CONNECTOR:%d:%s] AUX VESA backlight level is controlled through %s\n",
 		    connector->base.base.id, connector->base.name,
-- 
2.34.1

