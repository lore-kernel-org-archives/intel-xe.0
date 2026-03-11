Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BA9106286E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 11:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798D10E8B2;
	Wed, 11 Mar 2026 11:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnfmlwqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295FF10E8B0;
 Wed, 11 Mar 2026 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773229913; x=1804765913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arXqfYDMFzuT6CZnW8np6rVvc3bG9DPOL7S0qAumtis=;
 b=OnfmlwqFJ6wxUbI5DfXVOuR0x83kGoAe1V5kPn4pnClhtVQS5AumNDs3
 cMS23c/I+yeGLZC7hUI1iBESxZTVRxXzZ05XJLX2vQzbTW+rCliTPIR5g
 Vw3rR4NwDQdLUv6IldqPQCwoQZna8gbOo+ouxr0J5GGfpWUhDqLzQItZm
 o8NEdlT46GUlfQWiJCiCMREIaiy2GdSyvkLLFQdG1Ya7PzWhokZ75Pg0c
 5PFEOzzGjFkhMjwGgXrVw2JND+Xyph6dMC5H+odtaMBltw2C8CIfMtKfm
 h8TWKDES3i74dF+vs69+UpbNDjKWM5vSvJ87lKuVPCLj1+PFOfiJuhU1R Q==;
X-CSE-ConnectionGUID: CabOV/wHT1SLLu+Pset16A==
X-CSE-MsgGUID: XQ60bJNPSue2s+sIUEdBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204988"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74204988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:53 -0700
X-CSE-ConnectionGUID: dxYdZc6LTCO4OhGv4+OUVA==
X-CSE-MsgGUID: 9/LtSRdZRpCvf/GPI7nFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224602359"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:51:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/19] drm/i915/dp: Skip AS SDP for DP branch devices
Date: Wed, 11 Mar 2026 17:06:01 +0530
Message-ID: <20260311113611.3393194-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
References: <20260311113611.3393194-1-ankit.k.nautiyal@intel.com>
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

Currently, VRR is not implmented for DP branch devices.
So skip sending AS SDP for them.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 41908f68ffba..17af68a1a9e5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3130,6 +3130,12 @@ static bool intel_dp_can_use_as_sdp(struct intel_dp *intel_dp,
 	if (!intel_dp->as_sdp_supported)
 		return false;
 
+	/*
+	 * #TODO Implement AS SDP for DP branch device.
+	 */
+	if (drm_dp_is_branch(intel_dp->dpcd))
+		return false;
+
 	return crtc_state->vrr.enable;
 }
 
-- 
2.45.2

