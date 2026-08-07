Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75CC5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 06:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D8E10F380;
	Fri,  7 Aug 2026 06:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+VFsT4M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE41A10F36F;
 Fri,  7 Aug 2026 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786084212; x=1817620212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9V98LT85ZWjLfO6if3pOvZmmMqC2Rq0EfleRkt2WRhg=;
 b=K+VFsT4MIXBW3UJXaQN205eAUKipQjoZYcRpMLR4vrtu3SfA6RoKvP9F
 7h6Fx6LVrAytzOMiTBqkiZo/1D6H3qHN5IWT4eJ4BC5D1zUb6FJWSfFxI
 pqEhglLkEl6GMsK/wnDXbGnRYQFWi8EIz5R8jggVlLPNLUfI8nWsNu3Mz
 TexG25LGL6nNlCVc6jGdD/4kKfGY5ew6597rMfwOEnnKijNuSUi+mF20d
 gKsbXtUBojXUzNw9gaehx9r/z4fi2KrbWo24XP2YkhDJIi0yqQaaMUR6R
 FPGac/duGXOM0Vj8r3chPyaL6YsfWgnob8JSKCgD1wpk5HqhtqcxSKuoZ Q==;
X-CSE-ConnectionGUID: SoCYGV58T6CjgIPctW2ZkQ==
X-CSE-MsgGUID: sJyQFQ+bQCWFvz5eATEO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85658658"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="85658658"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 23:30:11 -0700
X-CSE-ConnectionGUID: 4JL1eLPgSR+P5Edinmc7LQ==
X-CSE-MsgGUID: 28ZGtEmERr+dJPcjWSZtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="286987308"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2026 23:27:55 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid disable
 timeout
Date: Fri,  7 Aug 2026 11:24:52 +0530
Message-Id: <20260807055452.2997983-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

CMTG is enabled in sync-to-port mode, so its running state (CMTG_STATE)
can only clear while the port is actively timing. In hsw_crtc_disable()
the CMTG was torn down at the very beginning of the sequence, before the
encoders were disabled. At that point PSR may still be active on the eDP,
leaving the port timing generator idle. As a result, after clearing
CMTG_ENABLE the wait for CMTG_STATE to clear never completes and triggers:

  xe 0000:00:02.0: [drm] CMTG: A disable timeout
  WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]

This is intermittently seen with igt@kms_hdr@bpc-switch-suspend, which
repeatedly cycles the eDP in and out of PSR across suspend/resume.

Move the CMTG disable to after intel_encoders_disable() (so PSR is
exited) but before intel_encoders_post_disable()/intel_dpll_disable(),
so the transcoder timing generator and port PLL are still active while
CMTG_STATE is polled. The ordering requirement of disabling CMTG before
the transcoder and port PLL are brought down is preserved.

Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 829d7a411dcc..cc4d20fdda44 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1791,15 +1791,25 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
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
+	 * Disable CMTG after the encoders are disabled (so PSR is exited) but
+	 * before the transcoder timing generator and port PLL are torn down in
+	 * intel_encoders_post_disable()/intel_dpll_disable(). CMTG is synced to
+	 * the port, so its running state (CMTG_STATE) can only clear while the
+	 * port is actively timing. Doing this while PSR is still active leaves
+	 * the port idle and makes the CMTG_STATE clear wait time out.
+	 */
+	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
+		intel_cmtg_set_clk_select(old_crtc_state);
+		intel_cmtg_disable(old_crtc_state);
+	}
+
 	intel_encoders_post_disable(state, crtc);
 
 	intel_dpll_disable(old_crtc_state);
-- 
2.29.0

