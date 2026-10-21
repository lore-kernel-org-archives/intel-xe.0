Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151C606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 19:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pr8W+Zy5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57D610E0AC;
	Wed, 21 Oct 2026 19:06:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0D110E05C;
 Wed, 21 Oct 2026 19:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792609597; x=1824145597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=28hHvmvg80LjCDszGV2z3iDDOAB4ytvebuHlD57GH4I=;
 b=Pr8W+Zy5tDbYDCSjlPY8SfygDBDEZKASYLtsUrs5bnvDxf+TJ54rhRgY
 ZXPPOFAprj7+2WIhV2k3iTfI4muGQIsixBicmUPXlUzVarK6GvrwqhjDr
 l/c/ZIsciTrRRbe6I+FuW2uXjekK4wPACAvlkBlD/qEa6SoHZPKSR/MVW
 K1FBYbWjaQ/7RGmbyoW1xgJ86bQSWPnZvDBFZwlCYak8MhhX316AKNmmz
 6CKg11s4s/Oj/L2KH5uzSZYgS0RkAiSjzJG8cev76CqI4sfV2XmAALpdr
 5Z3qmvD8Vv+tTd5sP+GSxFB2eUfV4tZobgFZBBKFc+0mQmlsxYR5MKkjJ g==;
X-CSE-ConnectionGUID: rHUSD2NKQQaMb5ZDEmvYRg==
X-CSE-MsgGUID: N7I0qJVnT1Kw1DPNYAF99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1236698"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1236698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 12:06:37 -0700
X-CSE-ConnectionGUID: MD847XAsRomAzGOB4Tq82Q==
X-CSE-MsgGUID: 7OpLLfOcRk6J7rjvfYfa3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3238770"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 12:06:34 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
Date: Thu, 22 Oct 2026 00:35:53 +0530
Message-ID: <20261021190631.527183-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
sequence, before intel_encoders_disable(). With this ordering, the wait
for CMTG_STATE to clear after CMTG_ENABLE is cleared intermittently
times out:

  xe 0000:00:02.0: [drm] CMTG: A disable timeout
  WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]

This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
disables and re-enables the eDP across modesets and suspend/resume.

Move the CMTG disable after intel_encoders_disable(), so the eDP-side
teardown (panel unprepare, ALPM disable, backlight off) has completed,
but keep it before intel_encoders_post_disable() and
intel_dpll_disable(). The transcoder timing generator, DDI buffer and
port PLL are therefore still running while CMTG_STATE is polled, and
the requirement to disable CMTG before the transcoder and the port PLL
feeding it are turned off is preserved.

v2:
- Modify commit description regarding PSR exit. [Dibin]
- Add fixes tag. [Jani, Dibin]

Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7602f633f49d..1c42aa477f3b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc *pipe_crtc;
 
-	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
-		intel_cmtg_set_clk_select(old_crtc_state);
-		intel_cmtg_disable(old_crtc_state);
-	}
 	/*
 	 * FIXME collapse everything to one hook.
 	 * Need care with mst->ddi interactions.
 	 */
 	intel_encoders_disable(state, crtc);
+
+	/*
+	 * Disable CMTG after the encoders are disabled, but before the
+	 * transcoder and port PLL are torn down in
+	 * intel_encoders_post_disable()/intel_dpll_disable().
+	 */
+	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
+		intel_cmtg_set_clk_select(old_crtc_state);
+		intel_cmtg_disable(old_crtc_state);
+	}
+
 	intel_encoders_post_disable(state, crtc);
 
 	intel_dpll_disable(old_crtc_state);
-- 
2.43.0

