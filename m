Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D525CA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DC410EE64;
	Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gyqp3XtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5710EE47;
 Tue, 29 Sep 2026 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679916; x=1822215916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvtETqjahmEdbPRABf7Kpuhb2vu14G3YeKCxJDprYsc=;
 b=Gyqp3XtMGpLIiwetpxF1nKdVeSq3AvjQX9MMD+pOvQkvHu+cOE2I5L0z
 ckUjbsiW6r6Rq95oENZ7qtOS9YJ/NH9A8AgL5zdwSzL3j+Z2ntiPJ4Yh7
 +6FCqXhYIEmPxJOm4XGgfBLI3s0p/YdoOc8IctbsqjgDUzXV28JoldTOR
 7nkHyB3OFb/E+0fDoGqhwIGwcfi+wXGutD0i9UGvsmvsODQX6JSIbHbZB
 7aMyCPMUdez3QboPP1R7jTQiWyep8GhkrX9djIIxURQlUwYb4mN7cL0gD
 knxjdo03Zu2qmO+NzvAO9l0iAfluv3sBMASStS4xvTpkfMqrHbwNi2WY2 Q==;
X-CSE-ConnectionGUID: rCp9mFWPQeWo7ldXwetaOg==
X-CSE-MsgGUID: EvspYizDQOiOSBmqhAHQVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295495"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:01 -0700
X-CSE-ConnectionGUID: 9yTP8sMlRjqunpfAzBqyXQ==
X-CSE-MsgGUID: pPcAXdDUTyqcdLUZFK+iSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887329"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:59 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 04/10] drm/i915/dp: Use the common downstream bw check in
 compute_bpc
Date: Tue, 29 Sep 2026 16:18:29 +0530
Message-ID: <20260929104835.1050882-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
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
index d03340aadc16..3478adb3fba8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1653,8 +1653,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
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

