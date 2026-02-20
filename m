Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49476C53214
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0931B10E786;
	Fri, 20 Feb 2026 05:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuoJFl1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B0010E783;
 Fri, 20 Feb 2026 05:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563751; x=1803099751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8RZ96fL0F6NTlriwPhUCyBXq5ZSRIYw/RzPsEmHQkQQ=;
 b=HuoJFl1w523l4QyXarqtXUNHYPU5GZjPNxjbGD8BRWPjDEVMq2m1HrUb
 eijzXBJs0Pf6C85v4/bL4AqMob6q7J2gJoFJt1g7ZJn4nYuZPOYjQTZ4r
 rQHpCs5Z5Oplp33IkeTzQQuTARJ53faVnvrgse58xx5SBrFeBGyLltEZH
 pAhIueDgd6drkIvsGLQoFucjgJ0QC3DKIiG3QWJOaCdDCbwoHZpg/ZHBA
 BQjZRgtTQPcXhJvMBoo8n1f3HmjKBlx9d3RCyl8705zr+xO2TA+Y6UPnh
 j+kdtTaipmXhtPzzOp3xpMcokf08pJ8fRENFMe+KFy6Yi/gJqxwy8KvY3 Q==;
X-CSE-ConnectionGUID: KL+yNrUUT+GPMHKnam87CQ==
X-CSE-MsgGUID: pqtiTEVaQcGquoUB8da7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758230"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:31 -0800
X-CSE-ConnectionGUID: sT3d2AXjQ8iYam4jKT0M+Q==
X-CSE-MsgGUID: liWzZJ7hRQS9pb6qT7Vy/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894639"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:29 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/8] drm/i915/backlight: Take luminance_set into account for
 VESA backlight
Date: Fri, 20 Feb 2026 10:32:12 +0530
Message-Id: <20260220050217.2453681-4-suraj.kandpal@intel.com>
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

When deciding what functions to enable to help control backlight we
used to only check aux_enable. Now with PANEL_LUMINANCE_OVERRIDE in
picture we need to take care that we do not enable PWM function if
luminance_set is set.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 05d6d033f60b..cb39696491a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -486,7 +486,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable) {
+	if (!(panel->backlight.edp.vesa.info.aux_enable ||
+	      panel->backlight.edp.vesa.info.luminance_set)) {
 		u32 pwm_level;
 
 		if (!panel->backlight.edp.vesa.info.aux_set)
-- 
2.34.1

