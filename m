Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DADC53214
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24CC10E789;
	Fri, 20 Feb 2026 05:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EokXdhCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D8810E786;
 Fri, 20 Feb 2026 05:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563753; x=1803099753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbDVUCDeFeyZjTkrmRc//AKzCN1EhWo6gdre8okuTRs=;
 b=EokXdhCDhYWKaR/vzkCoAptsMMDHbmRNgVM8i3baslPshRngsCr2JbxP
 vxKz83aAJUmnlJEStPX2KtLed9Uqcp3AqflLZGPySQbkqqhOtr0T2ZN6h
 22kI172mUpIDVmNwUBNjdVcfl5I/gdvLH9G0ryvRoUTv41y8V0tWNCKlB
 gfmL0ousZJYghAo4XJQ5r20EGEFYyvXNTICZSHnZLvaEUTQESPteiP0e1
 4Zvgx9YppMqrBIOH8vIFdE5mzqZOlXEFNTPR6PvH1APUNdbrWMtGYAG+f
 QqVk+aRXWyUmLJ2csYYo0xCEoLN2vFVJWPwRASzc0Qba0HX/YyPRW49N5 g==;
X-CSE-ConnectionGUID: UPYwZ1+CQG+jd0W2zqvyrQ==
X-CSE-MsgGUID: h8nYnUlFTeSca4+PkLqrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758235"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:33 -0800
X-CSE-ConnectionGUID: PJFBb6rETxapDtcqcs3uMQ==
X-CSE-MsgGUID: nJ5dql9YRxOgirhUhKCUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894644"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:31 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/8] drm/i915/backlight: Check luminance_set when disabling
 PWM via AUX VESA backlight
Date: Fri, 20 Feb 2026 10:32:13 +0530
Message-Id: <20260220050217.2453681-5-suraj.kandpal@intel.com>
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

When deciding what if PWM funcs need to be disabled take into account
luminance_set too. We do this since it is also used to decide if
we are enabling PWM backlight funcs or not.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index cb39696491a1..a921bb4ccacf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -511,7 +511,8 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable)
+	if (!(panel->backlight.edp.vesa.info.aux_enable ||
+	      panel->backlight.edp.vesa.info.luminance_set))
 		panel->backlight.pwm_funcs->disable(old_conn_state,
 						    intel_backlight_invert_pwm_level(connector, 0));
 }
-- 
2.34.1

