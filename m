Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0445CA1017
	for <intel-xe@archiver.kernel.org>; Sun,  7 Sep 2025 07:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19DB10E185;
	Sun,  7 Sep 2025 07:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIqjzERi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E822A10E01F;
 Sun,  7 Sep 2025 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757231188; x=1788767188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WX4V5EDb+17dMPsRlhZvZ+Y0Wu/h+wHqhdTZxyhw/X0=;
 b=AIqjzERi6uxbw+21lfBiGIiuTha/IX8CXNKBxVClP19KsLoHNbeUF6Zd
 OXfzXOT2vlR41acH4wKSs8kIkiPQlEq4puSOdfq1eE5NKnSGHlFkOqsmf
 7fcbI9sE1e683awy6YwOO3GFj6PtBro4KeTMQy7RQLoz7stJ8++e+4D8v
 vSJc434euq/IAl/YDbov+pedG9AWZRvBBk/sgWnwC/V6HFWxuSxreKwvN
 9dp3+eJ8nhI003+i0+b+N6LfVXz3HK56r/6zvhIhDuTS98zc0KXN91jEH
 faMRkOBVRZCuPXMygw6rXesBgTu91FwDoQLfj/DPJXkjMjuxohnUzWXyk A==;
X-CSE-ConnectionGUID: lGnscGuJQhi4srwaMTDtPQ==
X-CSE-MsgGUID: ISjMNTv6RX+g6bBqgmoW6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70220281"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; d="scan'208";a="70220281"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2025 00:46:17 -0700
X-CSE-ConnectionGUID: CzLRNVgCQgqktj+a8KTScw==
X-CSE-MsgGUID: vkI5irnxTZOLkXYffECrUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; d="scan'208";a="176873930"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2025 00:46:15 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 01/14] drm/i915/vrr: Use crtc_vsync_start/end for computing
 vrr.vsync_start/end
Date: Sun,  7 Sep 2025 13:02:28 +0530
Message-ID: <20250907073241.19632-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250907073241.19632-1-ankit.k.nautiyal@intel.com>
References: <20250907073241.19632-1-ankit.k.nautiyal@intel.com>
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

Use adjusted_mode->crtc_vsync_start/end instead of
adjusted_mode->vsync_start while computing vrr.vsync_start/end.
For most modes, these are same but for 3D/stereo modes the
crtc_vsync_start is different than vsync_start.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 3eed37f271b0..266cf5e1859d 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -406,10 +406,10 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (HAS_AS_SDP(display)) {
 		crtc_state->vrr.vsync_start =
 			(crtc_state->hw.adjusted_mode.crtc_vtotal -
-			 crtc_state->hw.adjusted_mode.vsync_start);
+			 crtc_state->hw.adjusted_mode.crtc_vsync_start);
 		crtc_state->vrr.vsync_end =
 			(crtc_state->hw.adjusted_mode.crtc_vtotal -
-			 crtc_state->hw.adjusted_mode.vsync_end);
+			 crtc_state->hw.adjusted_mode.crtc_vsync_end);
 	}
 }
 
-- 
2.45.2

