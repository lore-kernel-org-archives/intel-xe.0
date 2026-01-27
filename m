Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F1D2F010
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 12:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEF910E572;
	Tue, 27 Jan 2026 12:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKQLlK4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9910E56A;
 Tue, 27 Jan 2026 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769517707; x=1801053707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IYHraH/Wx7BYiMi694s5Na72jocD/s1xsS0Cyhl9Wzg=;
 b=VKQLlK4V2c6oNOZKjB65w6UtG/FjPvzmjAjmcAhhjp++erRWFmUCwWI5
 PkXDYEvToC7t8nlw/a6+Hit5sZZLoHXYC9GpoT8oIVaekNwDaiSsMufHA
 KfR8GAXyANYgppv2aWtwlDSF/iL1SaxDpL/KCZP6GLMfVNCi0QZlaB469
 ofVpt3R6CMJapI+S2Fq6dI4TMGav0gmektipJXN81qfj5/mk7kpRjeR+T
 cQopiSm+lCKqv8CEECE4yAWUZ3KoJdQ3dSEUcOG4jUY37+4lz7BS8fXHS
 tcidiGTJbc4JMEmV7o/MST3O/ZrfbnmCbtDc2uf/BH939hKjoH2qBKa+3 Q==;
X-CSE-ConnectionGUID: za8D+psERHiXsGD84bIJTw==
X-CSE-MsgGUID: rjzqBQG9T1WWTHRkTLDLDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70767656"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70767656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:46 -0800
X-CSE-ConnectionGUID: kjN8aaqvTrCkyWBsEeZZNA==
X-CSE-MsgGUID: MMuX54+GRRm6Xmz6pCMmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239231235"
Received: from ettammin-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:44 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v11 07/11] drm/i915/display: Wait for vblank in case of PSR is
 using trans push
Date: Tue, 27 Jan 2026 14:41:16 +0200
Message-ID: <20260127124120.1069026-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127124120.1069026-1-jouni.hogander@intel.com>
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

In case PSR uses trans push as a "frame change" event and we need to wait
vblank after triggering PSR "frame change" event. Otherwise we may miss
selective updates.

DSB skips all waits while PSR is active. Check push send is skipped as well
because trans push send bit is not reset by the HW if VRR is not enabled ->
we may start configuring new selective update while previous is not
complete. Avoid this by waiting for vblank after sending trans push.

v2: some typos fixed

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7491e00e3858..176bd5e6f291 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7390,9 +7390,27 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 				new_crtc_state->dsb_color);
 
 	if (new_crtc_state->use_dsb && !intel_color_uses_chained_dsb(new_crtc_state)) {
-		intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
+		/*
+		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
+		 * trans push case to ensure we are not waiting two vblanks
+		 */
+		if (!intel_psr_use_trans_push(new_crtc_state))
+			intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
 
 		intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
+
+		/*
+		 * In case PSR uses trans push as a "frame change" event and
+		 * VRR is not in use we need to wait vblank. Otherwise we may
+		 * miss selective updates. DSB skips all waits while PSR is
+		 * active. Check push send is skipped as well because trans push
+		 * send bit is not reset by the HW if VRR is not
+		 * enabled -> we may start configuring new selective
+		 * update while previous is not complete.
+		 */
+		if (intel_psr_use_trans_push(new_crtc_state))
+			intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
+
 		intel_dsb_wait_for_delayed_vblank(state, new_crtc_state->dsb_commit);
 		intel_vrr_check_push_sent(new_crtc_state->dsb_commit,
 					  new_crtc_state);
-- 
2.43.0

