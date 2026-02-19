Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538B8E9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 02:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129C910E654;
	Thu, 19 Feb 2026 02:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTWbVd4+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DA810E243;
 Thu, 19 Feb 2026 02:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771467899; x=1803003899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8XuCipRKQzJSjewOCgxvj5S9BRtRkJn4dLH/aX+/6zg=;
 b=bTWbVd4+HfM5+WJaVWSDMs99pemYfR4zloLU+2z0ZOH3fYHCKFlXdP09
 0tZOtYEUfahSEb5p1wG+0anXz50s37tVwPhYAvivjdsi3b9idBkBGnYVR
 vWLQvG11Rv83tconNCFQ7GbH7J65SVt3zNOI7J6FFDMuZ4W80mZTxabo3
 4CK/m6Q7OaZakE3JH0X5r7L+WStQSZDTvFnVy7Mfk3OH7yeccWPyuUTb3
 X5JsFz5y+dxE2Is4MRfA+eamRq93MJIlqJ37IUf91h41nfe4uV/lk+fKp
 unjuZ1Dsa7i8sJJgTOBDRaRFEuBxpHdAkae5VaH9mrkeAWVL2U9LpGeBN A==;
X-CSE-ConnectionGUID: MB1Q0sjNTnasIitn/pHZMg==
X-CSE-MsgGUID: xEyLgmOnTbeki3dknYWqIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="89962307"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="89962307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 18:24:59 -0800
X-CSE-ConnectionGUID: crGrniGNSZeL6C7wLuM3Zg==
X-CSE-MsgGUID: iUN5XdmvROeTn6mgrZ8TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="244979199"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 18 Feb 2026 18:24:57 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/2] drm/i915/backlight: Make try_vesa_interface as true
Date: Thu, 19 Feb 2026 07:54:53 +0530
Message-Id: <20260219022454.2417063-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Make try_vesa_interface as true by default. This is so that there
is a fallback mechanism for Panels which needs VESA DPCD AUX backlight
mechanism to work but has a broken VBT indicating otherwise.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15679
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index eb05ef4bd9f6..f14abc48a2a7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -644,7 +644,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct drm_device *dev = connector->base.dev;
 	struct intel_panel *panel = &connector->panel;
-	bool try_intel_interface = false, try_vesa_interface = false;
+	bool try_intel_interface = false, try_vesa_interface = true;
 
 	/* Check the VBT and user's module parameters to figure out which
 	 * interfaces to probe
-- 
2.34.1

