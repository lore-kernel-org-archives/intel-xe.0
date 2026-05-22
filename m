Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27785CD5BB5
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 13:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CF110F602;
	Fri, 22 May 2026 13:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJHBX73I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58110E1FF;
 Fri, 22 May 2026 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779457387; x=1810993387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOtRNmhctbzcan/950a50PLnYU2Bc0yiMQv8r4UAwPc=;
 b=iJHBX73IAYgqzaCcezxUGPK9XUuiEuxeJ+IAgSyjF0tIHwVHAE2Tq1z9
 2FZ1WDEWtMg4nx9F9uBvpYsibl87DW2wqEhonZwNJqbHsTy04OB8mVTIN
 2D6eN6OfCx+XNq9Dc3l2I829p8567vEm/cIQxkGeOUBvq8JoR2zLs0lCv
 Wp2ojvgEClybYixkV/8erbX8Q1M9pwQekW0TfaB2aXGAckpdIDujoSzEd
 BWE/5LzTjDAX0Krc/ETWsE6fXB8nwX7uCLX0uFYOfNpfVG1SFNmKZEKHd
 IQNY9xuj2R9PwRBjqEbMz3hlz+8/h/xm3TDqNNBVL5GpYs1OOZdumAyVb Q==;
X-CSE-ConnectionGUID: /FV01igST4WSV3dhj09LPQ==
X-CSE-MsgGUID: L/FnsoczQiySp/q2QLv3hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="105850598"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="105850598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:43:07 -0700
X-CSE-ConnectionGUID: BhziLtrzQl6jnziJ8pbSHw==
X-CSE-MsgGUID: JGcYCymKSj+zcOe8rf86Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238317176"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:43:05 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 navaremanasi@google.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/6] drm/i915/panel: Preserve Vtotal-Vsync distance while
 adjusting vtotal
Date: Fri, 22 May 2026 18:55:07 +0530
Message-ID: <20260522132511.321540-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260522132511.321540-1-ankit.k.nautiyal@intel.com>
References: <20260522132511.321540-1-ankit.k.nautiyal@intel.com>
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

As we increase the vtotal to accommodate lower resfresh rate for fixed
modes, adjust the vtotal-vsync distance also.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 20c548eea6da..14c7eea8ccb1 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -237,11 +237,18 @@ int intel_panel_compute_config(struct intel_connector *connector,
 
 	drm_mode_copy(adjusted_mode, fixed_mode);
 
-	if (is_vrr && fixed_mode_vrefresh != vrefresh)
+	if (is_vrr && fixed_mode_vrefresh != vrefresh) {
+		int vsync_start_diff = adjusted_mode->vtotal - adjusted_mode->vsync_start;
+		int vsync_end_diff = adjusted_mode->vtotal - adjusted_mode->vsync_end;
+
 		adjusted_mode->vtotal =
 			DIV_ROUND_CLOSEST(adjusted_mode->clock * 1000,
 					  adjusted_mode->htotal * vrefresh);
 
+		adjusted_mode->vsync_start = adjusted_mode->vtotal - vsync_start_diff;
+		adjusted_mode->vsync_end = adjusted_mode->vtotal - vsync_end_diff;
+	}
+
 	drm_mode_set_crtcinfo(adjusted_mode, 0);
 
 	return 0;
-- 
2.45.2

