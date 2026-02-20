Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EE9C53216
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C9410E781;
	Fri, 20 Feb 2026 05:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHB4reQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C5C10E781;
 Fri, 20 Feb 2026 05:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563748; x=1803099748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QEblPT0lYh/Tk5v+AfGoDGdb2vQvMQ/JuhjpD86kfqs=;
 b=aHB4reQuFUn0W+v4o9twyqZnt3qz8Tgiln3xuBlzRqsXoDMpD6KJaP5U
 K4x6m2C0itCrBxuDoLY7RQroadbPpofSIjSRKRzBVTy22Aldjio8AtL21
 s7gVZD7DO8/YkOz6vuqinpW9Ry+3EXodJBDeurrEPk/gsG8g2cubYBHre
 7AtTBWyp0VvCXCmun7ZYaWO7L7GdYyf7FtvE0EcYEKqrJ78iMlsQYY5wV
 BOXEOeeFE4ezO590dlzvuA8ox2yYiAWGCdHnbvF0bSQobfu4AOSfDrpRN
 BG6YD3e7awrRUPvkQfppA+8Qyxcfj5Psn7OMMnQp0/R06rVeQWzpcZqBx g==;
X-CSE-ConnectionGUID: uPfkj3i4Q9mNp8jn6VTXmA==
X-CSE-MsgGUID: Hv3fXlhXQ0CleTZi1NDzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758223"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:28 -0800
X-CSE-ConnectionGUID: /qV0xsGMSaqTlrXj1WhaKg==
X-CSE-MsgGUID: biVBjmygRmGbJ8Ln4/C0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894629"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:26 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/8] drm/i915/backlight: Avoid 0 brightness for VESA AUX
 backlight by default
Date: Fri, 20 Feb 2026 10:32:10 +0530
Message-Id: <20260220050217.2453681-2-suraj.kandpal@intel.com>
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

Whenever the minimum brightness is reported as 0 there are chances
we maybe sometimes end up with blank screen. This confuses the user
into thinking the display is acting weird. This occurs in eDP 1.5 when
we are using PANEL_LUMINANCE_OVERRIDE mode to mainpulate brightness
via luminance values. Make sure if minimum luminance range is 0 we
program default value to max in case 0 is returned from luminance
registers.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Let users set brightness to 0, make it so that it's just not
done by default (Arun)

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

