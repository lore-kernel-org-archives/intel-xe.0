Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B60EF48F3
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56410E7CC;
	Fri, 13 Feb 2026 09:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1Ukm5M6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B8C10E7CB;
 Fri, 13 Feb 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974237; x=1802510237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IK9EqmW+/DDVbJjSsUF4tzlMkmHf3KXfPCPrFRZnNHs=;
 b=A1Ukm5M6ZyIp/d5wLyKWqOfXLfj8fRt6VcPDiNcdPItKVT7mDTSEeQ5b
 Is2Kdd9vgRc02DFfN0X5XoIkwnYBvqVjXt54h0jh7yQUqbg7fK9sFHJAd
 rGMUhEX+FyccP2IBvCrX7of00/QNNrL1zkUVFf1ve/v/tGVkIgKxwRp/V
 AySKQxg1PWGYN0Rk6Q72Qi9nJ5t4MjLQ0Jqv9B+mM97p3zdDjyxSziiYH
 AMS3vt2dOAnkhDWAHY6yKNte9lWLP3dffTl4WYcTR1x3vEvuf+nCWIh60
 TGE4BsA6aoDmcbG+IQnYJJgDcMMim+sjSU9O55NYs+LADZR9ZBajS15dR A==;
X-CSE-ConnectionGUID: hxhrSgvsTiCfGJPq//TfDQ==
X-CSE-MsgGUID: kMjXdYbNQQ6uL9zuYpnnmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72146712"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72146712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:17:16 -0800
X-CSE-ConnectionGUID: cRO4tDGNQs2fr0fwDnkWNw==
X-CSE-MsgGUID: 00XKjBCUTXO3UNBhNULIsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211778845"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 01:17:13 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 6/8] drm/i915/backlight: Update debug log during backlight
 setup
Date: Fri, 13 Feb 2026 14:46:51 +0530
Message-Id: <20260213091653.2250887-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213091653.2250887-1-suraj.kandpal@intel.com>
References: <20260213091653.2250887-1-suraj.kandpal@intel.com>
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
index d44a94f05600..217747aedd16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -542,7 +542,8 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
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

