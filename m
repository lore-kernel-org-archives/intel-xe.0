Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773FCC5B573
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5566610EA55;
	Tue, 11 Aug 2026 04:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkftQuWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0F210E27C;
 Tue, 11 Aug 2026 04:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424374; x=1817960374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jW/ZPncS3kIdyJJte/RxIghlk04g2CaUW24Fa7CuQ6U=;
 b=ZkftQuWwM2gq1s/IGo/WRiGAUSIOw8F+p8FbvXp5SiBBdQcQujtADOGm
 jvld7TWdN1bkPyelQA6hkdS6BYtweIAh27CJto8kdz17FzLi6vrxgSVl+
 YtzYU1FPIxpLKx91EIScDslkEGCPWhNwubU5K4Eo3pn72xTvkBdqsEx4H
 rW44SxbrlARFku8qUzkTg/J6zPxlkIngvJPqyl2c+MTXA/T4a7uQqHuHY
 5YT0aWcUU+GccpHuWxAPj93nkRh8Nr/DTB6vTogxAqmKfKnRhZBTtdyxX
 W1uYuefF+k49jn4HY+fSSb+3jZlwuzvg+zANYiYtfk3EhzrZAiMG4KRi+ A==;
X-CSE-ConnectionGUID: w1RkKJ+dS26SLiYRb+pXUg==
X-CSE-MsgGUID: vx4RDODoS1uDlOp6qyHknw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708329"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:34 -0700
X-CSE-ConnectionGUID: rmUvWoZES3qllVbbnkEDBw==
X-CSE-MsgGUID: gHpIhY4UTEOHeGDGXjGIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082750"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:32 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 4/8] drm/i915/dp: Use the common downstream bw check in
 compute_bpc
Date: Tue, 11 Aug 2026 10:12:30 +0530
Message-ID: <20260811044234.593986-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
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

Currently the FRL bandwidth check is only added for the mode_valid phase.
Add the check in the compute_config phase also, replacing the TMDS-only
check with the common function that checks for both TMDS and FRL.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6296c3d32970..652215fdb1a7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1661,8 +1661,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 	for (; bpc >= 8; bpc -= 2) {
 		if (intel_hdmi_bpc_possible(crtc_state, bpc,
 					    intel_dp_has_hdmi_sink(intel_dp)) &&
-		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state->sink_format,
-					      respect_downstream_limits) == MODE_OK)
+		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state->sink_format,
+					   respect_downstream_limits) == MODE_OK)
 			return bpc;
 	}
 
-- 
2.50.1

