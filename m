Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A76C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 06:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B185610E285;
	Wed, 12 Jun 2024 06:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAvEJEkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166310E285
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718173756; x=1749709756;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g/DTyUpuyruLw81xOHOolYKXPYQPIls5uUGjWaebvhE=;
 b=QAvEJEkOktKBao9j2w6skwUYUxWwiqmLUDN5peWsg7WuC0YqGe5nf3YU
 WQR5HgveWVL0iUqSGrgxsb1+B1DXGWGDpv0+9VkRoXT1o35BmjTYrL/mf
 iW8LDM70BQDVhnISY8wnFOTKDKpCgdBqf8Amy9iw7AsXAYOvPyF86qSAR
 4AiBvmfpWxRw1ftVOZ0e2UOhff1D3M+FEvqlJZXDpA/gzJNFR+fsTr5ek
 emWJFAk7i1cJBWNWqzNbJdhRsg5eeLuxYw16w9LdCHruGWOIGE9wmvT8l
 sAf46U9dUjDXnB7lSAkQGdyd+xzxwvtTm3LFp6oiSkjSm6EjfFc6didJe Q==;
X-CSE-ConnectionGUID: VkVlKiaxRFaz3K6vjwNRNA==
X-CSE-MsgGUID: UV8CVXEKQ5SNjhi7aEwGzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18699657"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="18699657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:29:16 -0700
X-CSE-ConnectionGUID: LElkjQhwR1CojdllCTpeUw==
X-CSE-MsgGUID: u2Z142/TSb63TvCz5s1f9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39612487"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa010.jf.intel.com with ESMTP; 11 Jun 2024 23:29:15 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/display: Update vtotal math to address 32b build
Date: Wed, 12 Jun 2024 11:59:25 +0530
Message-ID: <20240612062925.271213-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
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

Fix vtotal division calculation which works for 32b systems.

Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 05f67dc9d98d..1e37383e14e7 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -149,7 +149,8 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 
 	crtc_state->cmrr.cmrr_n =
 		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
-	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
+	vtotal = DIV_ROUND_UP_ULL(adjusted_mode->crtc_clock * 1000 * multiplier_n,
+				  crtc_state->cmrr.cmrr_n);
 	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
 	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
 
-- 
2.45.2

