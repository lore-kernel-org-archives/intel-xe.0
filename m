Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C13C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369A10F19F;
	Fri, 18 Sep 2026 06:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWMeCai2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0010E03F;
 Fri, 18 Sep 2026 06:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789713514; x=1821249514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5L0Irvp9grMYA5Ip/aXoatCg+id4fZjM7eoqqQaDt+Y=;
 b=WWMeCai2XbJydWCL+D1tQ4nck0OqkzFEpfPnIurFjH3fC+E+nh3W6+Gr
 Abwx2ebn8Gb7W+T2DbEvOTF0k+DS13dLvopUg6wAPTE3g/ELM6iTFJJvV
 Aw6NUS0lxbF7fCHoXY73iOFAjPKngiHHUqxRhkgftAOfUhoYpMOwp6HiW
 nGZ4mwK2YDyQKwGnTgWY5L2s0FYAaH6VlfN8Zq6TacpHuDj5paJh+cyoF
 VXptjCMoWh6+Ub5rEBQzXT3lOd7YDKxwQUm1g3DxFbMPookS7hskuO9Lh
 Z5GBogRCOx6O3aAAj0mFCALOID+dM28nTHkdwNj9GPJ86cdfcoboAlnp/ w==;
X-CSE-ConnectionGUID: oQHjuM/QTT2aAFhYlztPqQ==
X-CSE-MsgGUID: B7Eo5Si4Q+qclhl20TxFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92708265"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208,223";a="92708265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 23:38:34 -0700
X-CSE-ConnectionGUID: fmsDcd/iQ1Kyt0NYieJw7Q==
X-CSE-MsgGUID: k0RdTS8TTS2NsFn7P6hy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
 d="scan'208,223";a="270548798"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2026 23:38:31 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Date: Fri, 18 Sep 2026 12:08:29 +0530
Message-Id: <20260918063829.1321703-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918060426.1162123-1-suraj.kandpal@intel.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
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

From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
which powers down the PHY. Which means we need to make sure
"Disable DC5/6" of AUX Programming sequence is honored.
Disable Dc5/6 when programming AUX.

Bspec: 68851, 68967
Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
-Fix commit message (Arun)
-Fix the if typo (Arun, Sashiko)

 drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 3cb07b0a901c..879b203f9258 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	u32 aux_clock_divider;
 	enum intel_display_power_domain aux_domain;
 	struct ref_tracker *aux_wakeref;
+	struct ref_tracker *dc_off_wakeref = NULL;
 	struct ref_tracker *pps_wakeref = NULL;
 	int i, ret, recv_bytes;
 	int try, clock = 0;
@@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	aux_wakeref = intel_display_power_get(display, aux_domain);
 
+	if (HAS_LT_PHY(display))
+		dc_off_wakeref = intel_display_power_get(display, POWER_DOMAIN_DC_OFF);
+
 	/*
 	 * The PPS state needs to be locked for:
 	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
@@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	if (pps_wakeref)
 		intel_pps_unlock(intel_dp, pps_wakeref);
 
+	if (dc_off_wakeref)
+		intel_display_power_put(display, POWER_DOMAIN_DC_OFF, dc_off_wakeref);
+
 	intel_display_power_put_async(display, aux_domain, aux_wakeref);
 out_unlock:
 	intel_digital_port_unlock(encoder);
-- 
2.34.1

