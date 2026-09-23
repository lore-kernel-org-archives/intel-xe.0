Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C14CC9830C
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 13:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D1510E8BB;
	Wed, 23 Sep 2026 13:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpABlCUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A12C10F054;
 Wed, 23 Sep 2026 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790171369; x=1821707369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K7ZTXUF0JYsYrWDm/9C0KQJWGK1UvMTiVg2Th9HSRbM=;
 b=YpABlCUhtc9YNbzfjG2qJFsctuj2IFP5hvBjIIhUikqLl8PZn6DoPDXj
 d16K5yl0AmA5h/Ik8Bh5eQ33ZIYA5KoQVFlHikE9pPerLf0i1E3ECKBDN
 MiABGAnjFQidChu8CDvoaKOkf2tHHlwq5p+iHAarCzxEfMQyxoPunBFAn
 eSoHNtArUQ1foUROmCkbyXZJu9MNYL8R8UvEjMHTzvGD/DRf+J82w4Tkg
 a8sEZMbkc3qT+bLVk2/kElwzLsoYLXG7qRg09BFQ/5jLFQkUXfdSPwXPX
 4zkis6T9Z6ZDsuQ7d66IJflBHksbIBOh29SzHIrEMBZGC3Vp8C4r0DMJz g==;
X-CSE-ConnectionGUID: usCJNWzyRxWJomtawyA32g==
X-CSE-MsgGUID: eoLkU7xpRDqYLB12TNz/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116390615"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="116390615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:49:28 -0700
X-CSE-ConnectionGUID: 643Fwmp6SBqsrkIYPuxh8Q==
X-CSE-MsgGUID: sN7UPeDpQ86rqA9OA9cUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="301550157"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 06:49:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm/i915/display: Update the CMN_SDP_TL in fastset path
Date: Wed, 23 Sep 2026 19:03:07 +0530
Message-ID: <20260923133307.323439-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
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

Commit bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
enabled the CMN_SDP_TL for the modeset path, but missed to add it to the
fastset path.

Since dip.cmn_sdp_tl is already skipped from the strict pipe-config
comparison during fastsets, it was always intended to get updated
without full modeset, but the update to the register was missed.

During a fastset, if CMN_SDP_TL changes, update the register
similar to the EMP_AS_SDP_TL, which gets updated in
intel_vrr_set_transcoder_timings().

Fixes: bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e3e0d2f8faef..01604c4e8615 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -69,6 +69,7 @@
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_display_driver.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
@@ -999,6 +1000,12 @@ static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
 		old_crtc_state->vrr.cmrr.cmrr_n != new_crtc_state->vrr.cmrr.cmrr_n;
 }
 
+static bool cmn_sdp_changed(const struct intel_crtc_state *old_crtc_state,
+			    const struct intel_crtc_state *new_crtc_state)
+{
+	return old_crtc_state->dip.cmn_sdp_tl != new_crtc_state->dip.cmn_sdp_tl;
+}
+
 static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
@@ -6924,6 +6931,9 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 		if (vrr_params_changed(old_crtc_state, new_crtc_state) ||
 		    cmrr_params_changed(old_crtc_state, new_crtc_state))
 			intel_vrr_set_transcoder_timings(new_crtc_state);
+
+		if (cmn_sdp_changed(old_crtc_state, new_crtc_state))
+			intel_dip_cmn_sdp_transmission_line_enable(new_crtc_state);
 	}
 
 	intel_fbc_update(state, crtc);
-- 
2.50.1

