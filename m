Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C4606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=SI1O31Iy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074710FCD4;
	Wed, 25 Nov 2026 14:58:41 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779610F653
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:37:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-945e6d9ceeaso408892885a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 07:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534620; x=1796139420;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sktL+iYwKlFrZn878JDfdhMoNqmZJtrMcYUSS3thb2c=;
 b=SI1O31IyGhYNeaCCx4RCM0gJCcEeQ4HsFH/SZCPALu+Ew4A00PnqDHjRTEvf2pJrsu
 l394kSjwGsOGpGf1cdgdWPI4/tnSTlAJmcKoyrq7Kgyv+906mPSoKL7ZtK7/6oiB077g
 ql41kQZZ3qNb42uHdCZAHcDmvMw0HsTZYJBFeZWGlw2fIt0weAXI3adoQj0yZRLY7cBf
 +7+d8pt6tD8s9Es2A4K6B6NuS+nakoarqPZNIee5jltlObpZxBtR0ZEbmSe/wSOO+oDn
 W29uAmAB/+14KDouaOeXwMAsXtPlDZwU6+3raai8u9ZnpNhXJvI550sHTmp37Q5TnTGs
 Cabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534620; x=1796139420;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sktL+iYwKlFrZn878JDfdhMoNqmZJtrMcYUSS3thb2c=;
 b=U/si98hG3/XOAXMSXWEOPizu6ShXxLkMUWEYmlVNxPcwHkbPzfpiz7E6P6uP80mSDj
 TNiWGaWwWwokZZh+WYFQXenzhWqIhdMJN7b4DSFiTMZAwmeNOKpdxJ94cn24vhvnLTTs
 Fyulj3pCAJPibcUGazxi1lOCCziajt8S55wQ6QSKxHR+qEpJXx1slTdinMK7E4TCroVL
 RGy5cbxrbzAnlAAQBjIrI+OAhs5x7nNoKRi8RINKbVB+9qrTcuTZQIcIj0uxsjzF/eys
 AqIrHzcSBTfdPdaJdsHkuPwLmkju/5Gb20Oknf8bM3sbiywMRD7FFL9NUuGOrdf36zdl
 VH6A==
X-Forwarded-Encrypted: i=1;
 AL+hErGOb08zb3gAy0lzQR4tTo/PrpLf+AwDQtLWFD8Cpi+xyaWu0XzCWVPaSpV+edVNAwQSF11tji33lw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+YRk8CW3Q2CGBJo7Z6NrFXefYcVsrrCHDbxO16aGsOsaGyozJs
 dbkK0aI6dIG6LQqHNBl+vJQbYF26N7e79Dw/AN+63j0Bj7mi6UyG1Y4rR/43b9Jc118=
X-Gm-Gg: AZFdTZcvB5X/X+dJlwuVVreWcmZb5W2uBki0IRwMT5FbOl6nyEeXPR7E9ONKNAsWmf2
 Zl4Zcer2iMS9JjVe8mZOTLMsEMntRAXQ6D7PKAPPQm51Vs43lwKse+ulayLOl/rht/OX9mPAwol
 hRh+At5u2wTS5Ti97lS7z6LazEbZY9X18RlQ9KIM56AMCBzOeJucZ5qilh3qnaQXWd0S9P+Adwy
 /EjY0JTJed7KglGjSFK/ZS6D2+tmVKXNa4QwwwNtYnKIPSMvnZXzercaUB6fFYBS+YutUKUjCzN
 SFK5qYRlS7lVWaT2zAdBsU58CG5fGSavxjQz4ckgO+f/F/BnilNuVvKtjTyWg6k3NWXM0WgdTHS
 sp4VxD23kUtvHdZ+SoQQzje/LQltMLz+Nvdx2vqPL/XfuPP71EtK7FKxQYLhJRuCaOuu2uSHth7
 uR8iOOolQjTReuP64+w6nK4CdiTk6FIEGjlt5NUEimSLPzFwF4oIjo1DXrtrqBNEPcuF2smVtGK
 drP7sandAwRCsWhqe+9l5v16E9SSt/CtxN8AMi7uM6oEiWV7+7K6zoUJuwYH7DSZSsGiOyDRIHK
 IghF6aCXSXL0nP/ww31U5X8mIxVopMqOjd9yYMLvig992eNkfb3bDhUFZ6HSealXdsvAUvg/HnF
 lh0V2YjlF6RWEU2YuJwsWAPOHDmT1ftKgk4NLyH6/BkQ4LfxnFua5lAl463w7ppoYeokJGy3skn
 kG1t4MfZTE2xo0c8Fo63iIUtma9J+Xo1YaVEZFCQ3fnH58lY7m1G5Q9qYhFb78MPJpyC1SNgr3E
 HrU0aWgocEKYA==
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id
 af79cd13be357-949bab2a96bmr2668296385a.70.1795534619622; 
 Tue, 24 Nov 2026 07:36:59 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:36:59 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 2/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Date: Tue, 24 Nov 2026 10:36:53 -0500
Message-ID: <6c8469acdedb91f0435967f94b2a2b6aabba8711.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795527921.git.j@metarealtyinc.ca>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
 <cover.1795527921.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:58:40 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sinks that support async video timing in PR get the AS SDP suspended in
PR Active (disable_as_sdp_when_pr_active). The LG panel in the Dell XPS
16 DA16260 (sink OUI 00:22:b9) then judders while frames are updating,
with the source flipping at a steady 8.33 ms. Leaving the AS SDP on
fixes it but blocks DC5/DC6.

Clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] on a frontbuffer
flush (flips, cursor updates and frontbuffer rendering) and set it again
from a delayed work once there has been no flush for 6 frames, the same
idle time DC3CO and DC5/DC6 use.

Panel Replay is enabled with the AS SDP sent, so the bit is never set
while frames are still being updated, and the delayed work suspends it
once idle.

disable_as_sdp_when_pr_active is now computed in
intel_psr_compute_config_late(), after the AS SDP config, and is only set
when the AS SDP is actually sent, ALPM AUX-less is used and AS SDP skip
frames is not.

Fixes: d6a8336c5f06 ("drm/i915/alpm: Write PR_ALPM_CTL register")
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 84 ++++++++++++++++++-
 2 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d2916..991d3a2fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1823,6 +1823,11 @@ struct intel_psr {
 	bool dc3co_allowed;
 	/* DC3CO disable work */
 	struct delayed_work dc3co_work;
+	/* AS SDP in PR Active is sent while frames are being updated */
+	bool disable_as_sdp_when_pr_active;
+	bool as_sdp_in_active;
+	unsigned long as_sdp_idle_delay;
+	struct delayed_work as_sdp_work;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd1656360..62cda4365 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1704,10 +1704,23 @@ static inline bool compute_link_off_after_as_sdp_when_pr_active(struct intel_con
 		DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP);
 }
 
-static inline bool compute_disable_as_sdp_when_pr_active(struct intel_connector *connector)
+static bool compute_disable_as_sdp_when_pr_active(struct intel_dp *intel_dp,
+						  const struct intel_crtc_state *crtc_state)
 {
-	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
-		 DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const u8 *pr_dpcd = connector->dp.panel_replay_caps.dpcd;
+
+	if (pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
+	    DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR)
+		return false;
+
+	/* AS SDP skip frames needs the AS SDP to keep flowing in PR Active */
+	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
+		return false;
+
+	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
+		(crtc_state->infoframes.enable &
+		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC));
 }
 
 static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
@@ -1745,7 +1758,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	}
 
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
-	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
@@ -2183,6 +2195,45 @@ static bool psr_interrupt_error_check(struct intel_dp *intel_dp)
 	return true;
 }
 
+/*
+ * Sinks that support async video timing in PR get the AS SDP suspended in PR
+ * Active. Some of them then drift out of phase with the source and judder
+ * while frames are being updated. Send the AS SDP in PR Active from the first
+ * frame update and suspend it again once the display has been idle for
+ * as_sdp_idle_delay. DC5/DC6 needs the same number of idle frames, so little
+ * DC5/DC6 residency is lost.
+ */
+static void intel_psr_pr_as_sdp_suspend_work(struct work_struct *work)
+{
+	struct intel_dp *intel_dp =
+		container_of(work, typeof(*intel_dp), psr.as_sdp_work.work);
+
+	mutex_lock(&intel_dp->psr.lock);
+	if (intel_dp->psr.enabled && intel_dp->psr.as_sdp_in_active) {
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, true);
+		intel_dp->psr.as_sdp_in_active = false;
+	}
+	mutex_unlock(&intel_dp->psr.lock);
+}
+
+static void intel_psr_pr_as_sdp_flush_locked(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	lockdep_assert_held(&intel_dp->psr.lock);
+
+	if (!intel_dp->psr.disable_as_sdp_when_pr_active)
+		return;
+
+	if (!intel_dp->psr.as_sdp_in_active) {
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, false);
+		intel_dp->psr.as_sdp_in_active = true;
+	}
+
+	mod_delayed_work(display->wq.unordered, &intel_dp->psr.as_sdp_work,
+			 intel_dp->psr.as_sdp_idle_delay);
+}
+
 static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -2201,6 +2252,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	/* DC5/DC6 requires at least 6 idle frames */
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
 	intel_dp->psr.dc3co_exit_delay = val;
+	intel_dp->psr.as_sdp_idle_delay = val;
 	intel_dp->psr.psr2_sel_fetch_enabled = crtc_state->enable_psr2_sel_fetch;
 	intel_dp->psr.su_region_et_enabled = crtc_state->enable_psr2_su_region_et;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
@@ -2211,6 +2263,9 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.io_wake_lines = crtc_state->alpm_state.io_wake_lines;
 	intel_dp->psr.fast_wake_lines = crtc_state->alpm_state.fast_wake_lines;
 	intel_dp->psr.entry_setup_frames = crtc_state->entry_setup_frames;
+	intel_dp->psr.disable_as_sdp_when_pr_active =
+		crtc_state->disable_as_sdp_when_pr_active;
+	intel_dp->psr.as_sdp_in_active = false;
 
 	if (!psr_interrupt_error_check(intel_dp))
 		return;
@@ -2243,6 +2298,17 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.enabled = true;
 	intel_dp->psr.pause_counter = 0;
 
+	/*
+	 * Start with the AS SDP sent, the idle work suspends it once there has
+	 * been no frame update for as_sdp_idle_delay.
+	 */
+	if (intel_dp->psr.disable_as_sdp_when_pr_active) {
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, false);
+		intel_dp->psr.as_sdp_in_active = true;
+		mod_delayed_work(display->wq.unordered, &intel_dp->psr.as_sdp_work,
+				 intel_dp->psr.as_sdp_idle_delay);
+	}
+
 	/*
 	 * Link_ok is sticky and set here on PSR enable. We can assume link
 	 * training is complete as we never continue to PSR enable with
@@ -2419,6 +2485,8 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.pipe_mask = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
+	cancel_delayed_work(&intel_dp->psr.as_sdp_work);
+	intel_dp->psr.as_sdp_in_active = false;
 }
 
 /**
@@ -2449,6 +2517,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 	mutex_unlock(&intel_dp->psr.lock);
 	cancel_work_sync(&intel_dp->psr.work);
 	cancel_delayed_work_sync(&intel_dp->psr.dc3co_work);
+	cancel_delayed_work_sync(&intel_dp->psr.as_sdp_work);
 }
 
 /**
@@ -3853,6 +3922,8 @@ void intel_psr_flush(struct intel_display *display,
 
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
+		intel_psr_pr_as_sdp_flush_locked(intel_dp);
+
 		if (intel_dp->psr.pause_counter)
 			goto rearm;
 
@@ -3931,6 +4002,7 @@ void intel_psr_init(struct intel_dp *intel_dp)
 
 	INIT_WORK(&intel_dp->psr.work, intel_psr_work);
 	INIT_DELAYED_WORK(&intel_dp->psr.dc3co_work, psr2_dc3co_disable_work);
+	INIT_DELAYED_WORK(&intel_dp->psr.as_sdp_work, intel_psr_pr_as_sdp_suspend_work);
 	mutex_init(&intel_dp->psr.lock);
 }
 
@@ -4775,6 +4847,10 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 	}
 
 	intel_psr_set_non_psr_pipes(intel_dp, crtc_state);
+
+	crtc_state->disable_as_sdp_when_pr_active =
+		crtc_state->has_panel_replay &&
+		compute_disable_as_sdp_when_pr_active(intel_dp, crtc_state);
 }
 
 int intel_psr_min_guardband(struct intel_crtc_state *crtc_state)
-- 
2.56.1

