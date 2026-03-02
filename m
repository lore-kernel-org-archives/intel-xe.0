Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1D0D58E54
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E39810E42B;
	Mon,  2 Mar 2026 04:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXGUvNrC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181510E428;
 Mon,  2 Mar 2026 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424388; x=1803960388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ky6Eh57VmT9JuJyhmh3RLC3H+RO2/nB3WtiI3899s48=;
 b=SXGUvNrCbW43K8LYok06+TSb9/oiHGLgUUPuJo2FOhGRSQRJnxSS4Nv0
 XP5zvqawCYvWAGsCl5L8DjVIZygi0+2EugWwFIBPx4ETvWnCo2jXKLwJm
 0dlFXUaFQZO11YMOnjaBlnX3tD5WiLC7dfzqufU3/RlPsiR3V2tHkC/i4
 an3/Mwni84yVq+85NlPqWCHSe4Z8BcPRctRHNY4IUGeQZ/PyJjLAL11NJ
 rZypcUiUI8x7gZPAtvWMLHsTRvexn6MO9O75atl9+X6ERCaELRO+2BmKy
 QbEcZvhn514AV7hUJ6pibL+xB6Khz89jF7KmPgdrKJ2YMCKT97oH3/74L w==;
X-CSE-ConnectionGUID: RrrHLngqR2+zVBXZF8eu1w==
X-CSE-MsgGUID: U8scwePYT4yl6vj73H/vPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294444"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294444"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:28 -0800
X-CSE-ConnectionGUID: Bfe+LiVMQY2T34/ntg5uOQ==
X-CSE-MsgGUID: CYASz1krSYOsS2wFZKEkig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217541020"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:27 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 6/8] drm/i915/backlight: Update debug log during backlight
 setup
Date: Mon,  2 Mar 2026 09:36:11 +0530
Message-Id: <20260302040613.3324049-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
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
have another variable to decide if we use PWM or DPCD.
Make drm_dbg_kms log represent that.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 6b321c384588..af05b30a0a7a 100644
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

