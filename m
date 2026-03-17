Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0FDFF6E8B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289AA10E577;
	Tue, 17 Mar 2026 22:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="te4g+eVn";
	dkim-atps=neutral
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com
 [74.125.82.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F4710E577
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:09:40 +0000 (UTC)
Received: by mail-dy1-f201.google.com with SMTP id
 5a478bee46e88-2c0cd2e4aa6so11150347eec.0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773785379; x=1774390179;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9+LGfzzHtFhuiKFHVAi1M/hVQayAnDIQqfT0FtjDgc0=;
 b=te4g+eVnztgOmfEUn0Y1ZFl5AzczLQ4+C7Rmwrpbx5rHwIsVCLSaPIpGVYPdrHDIiB
 d6tTqAq3s71Z6sbxAWm0sPyiYYtjqGWYAbfmzLoQXGbHtxZoFI5K9L4oIY5TN5rayyPI
 XOfkU1PZnK9QYb3zuf9O8RpKVMaA5/Mu/llAPgCRmhpp6inZDrp4mSXEpGXJvlgBaqbx
 PztatdChLI8Ct5dpFPwVP4iVRyjxOoHi5tNUKxEQ3AMyzIf3gHg80pT75AEPn8wx0CBq
 IoEugxJISrQh7GbfKljbTnNqTtrzUt3kC1Mow0BeMn/DMbHZSQwKJFKcUGuxNW+GvHLc
 kczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785379; x=1774390179;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+LGfzzHtFhuiKFHVAi1M/hVQayAnDIQqfT0FtjDgc0=;
 b=bxfj4TlMe6iOZdZcl4GLNqwiZmm71PDdc8YJMPllK/DCK7Mmc736m/645S0P+ihS+M
 1TUKgwUVzkVAWQlsCeBGeZ842RKfyf2NAECWJU0FQI78HZqmGsGTcTj5aey6a4XD9nIS
 gSVpHRbz+dW5LCYFTaz1Ys/j9zpiIKWWUabOofEQDbjU82IlxocaMfhCud/7WK44wSE0
 NY6/2z/t4DJ9i57kQ9mtXkeY72dflj8Jn8nKIIPIPVLmsOOuBlcMNlZpqujVWdtg2FEb
 LjTs+qNTAqPCem++buMUaI+zOBs7Bk7/Lo8WS8KNXpRmLk3iRep12BR1aymM4ecqYsfa
 MCTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Hr6gBvCsQkmo3JgCMipObUiOUwlrLPOdn7PXmUxqBFrfLWgiycrbT/zcYRkG+oEwNk/79K0Vjg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ96MRfBV+sVkDBHajpfwQ7vxaA4xEazS7YGGhiiBEc255TJ/I
 DTQOmWlXdTgeOU6hS7uYli29F47corZPeHQr5MitxDzKW8jaQQgpXm0w14IyCOqEqlqWnKgsbqV
 q/wzNq06kUPyR4Q==
X-Received: from dybuh11.prod.google.com
 ([2002:a05:7301:750b:b0:2be:82ee:95dc])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:3743:b0:2c0:dfb2:b50d with SMTP id
 5a478bee46e88-2c0e50ea96emr621094eec.25.1773785379305; 
 Tue, 17 Mar 2026 15:09:39 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:09:03 -0700
In-Reply-To: <20260317220908.130968-1-jdsultan@google.com>
Mime-Version: 1.0
References: <20260317220908.130968-1-jdsultan@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260317220908.130968-3-jdsultan@google.com>
Subject: [PATCH v4 2/2] drm/i915/display: Sync state to BIOS for seamless
 handoff
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Manasi Navare <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>, 
 Rajat Jain <rajatja@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Align DP timings and C10 PLL state with BIOS values if within a 0.5%
clock threshold. This prevents minor mismatches from triggering a full
modeset during the first atomic commit, ensuring a flicker-free handoff.

Signed-off-by: Juasheem Sultan <jdsultan@google.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 67 ++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c4246481fc2f..22e5e931f134 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6397,6 +6397,71 @@ static int intel_atomic_check_config_and_link(struct intel_atomic_state *state)
 
 	return ret;
 }
+
+// Helper function to sanitize pll state
+static void intel_sanitize_pll_state(struct intel_crtc_state *old_crtc_state,
+		struct intel_crtc_state *new_crtc_state)
+{
+	int j;
+
+	for (j = 4; j < 9; j++) {
+		if (new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] !=
+				old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j]) {
+			new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] =
+				old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j];
+		}
+	}
+}
+
+/*
+ * intel_dp_sanitize_seamless_boot - Snap driver state to BIOS state for seamless handoff.
+ * @state: the atomic state to sanitize
+ *
+ * This function compares the driver's calculated new_state with the inherited BIOS state
+ * (old_state). If they are within a small threshold (e.g., 0.5% for clock), it "snaps"
+ * the new_state to match the BIOS state exactly. This prevents minor state mismatches
+ * that would otherwise force a full modeset (and a screen flicker) during the initial
+ * kernel handoff.
+ */
+static void intel_dp_sanitize_seamless_boot(struct intel_atomic_state *state)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
+	struct intel_crtc *crtc;
+	struct intel_encoder *encoder;
+	int i;
+
+	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		/*
+		 * We must check old_crtc_state->inherited because new_crtc_state->inherited
+		 * is cleared at the start of intel_atomic_check for userspace commits.
+		 */
+		if (!old_crtc_state->inherited || !new_crtc_state->hw.active)
+			continue;
+
+		if (intel_crtc_has_dp_encoder(new_crtc_state)) {
+			int old_clock = old_crtc_state->hw.adjusted_mode.crtc_clock;
+			int new_clock = new_crtc_state->hw.adjusted_mode.crtc_clock;
+			int threshold = old_clock / 200; /* 0.5% */
+
+			if (abs(new_clock - old_clock) <= threshold) {
+				new_crtc_state->hw.pipe_mode.crtc_clock = old_clock;
+				new_crtc_state->hw.adjusted_mode.crtc_clock = old_clock;
+				new_crtc_state->pixel_rate = old_crtc_state->pixel_rate;
+				new_crtc_state->dp_m_n = old_crtc_state->dp_m_n;
+			}
+		}
+
+		for_each_intel_encoder_mask(display->drm, encoder,
+				new_crtc_state->uapi.encoder_mask) {
+			if (intel_encoder_is_c10phy(encoder)) {
+				if (!new_crtc_state->dpll_hw_state.cx0pll.ssc_enabled)
+					intel_sanitize_pll_state(old_crtc_state, new_crtc_state);
+			}
+		}
+	}
+}
+
 /**
  * intel_atomic_check - validate state object
  * @dev: drm device
@@ -6447,6 +6512,8 @@ int intel_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	intel_dp_sanitize_seamless_boot(state);
+
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
 		if (!intel_crtc_needs_modeset(new_crtc_state))
 			continue;
-- 
2.53.0.851.ga537e3e6e9-goog

