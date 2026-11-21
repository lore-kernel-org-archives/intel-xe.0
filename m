Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E41D606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=ET2Gx8SH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E6010EF1E;
	Mon, 23 Nov 2026 15:17:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F410E992
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:57 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-949664ee41cso200060185a.3
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263956; x=1795868756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tcZXZrs3ZFR6YeXPhB828injGk6+cM/kVYYXx9ZN/FU=;
 b=ET2Gx8SHR7uUAOLLu2kfnQwQQWs/vXtWSwHFdWwTm8b3eZG41iFzo6B0zy1UAN3f/I
 RM89Md67DpEXf3UWwbGm2bkkCnE5R7fWwzP/hSih6VQfrLOx7IvgocupYGbmypD/YKSN
 p2nteE1kTsj3tSMhsqMD2BTTAlAu+wzEEz7ZFIbfOheY/9S9H7rve/+6rh+rB1IqujUT
 GKg2omzocW3ZHZh2xEvPwWW77D6DlFbFlsv0qQazhrZdZYbJHjvTWe4tBxFxoiTuPmWp
 1XX2LP5BQL4SgNTjTkiK1NF3e5dzi9ZuBLMUQz7WcRbBBJPh3paApHyjYCJQob1XkLIz
 o3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263956; x=1795868756;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tcZXZrs3ZFR6YeXPhB828injGk6+cM/kVYYXx9ZN/FU=;
 b=v6uKRJciJWRXQ4YO3V1KSVzh5faAOJgBqPA2ifZYeedX3WdAPAavcr+/4cEkKEwgxy
 KIlcgsUUlwZMoDz/9udpmor5ZjdgAffDBi+Gd72/9/zywucl7onahGzIq3HH5WAKgHPE
 5XArIWGYvcpdtNH4eTHXG7HWIY5N6Wfa5P3Vk7QXCvMRkmztr0GW4truZ3YRNDiHvQEH
 SnMB4YNqvIIb+QIC90l365SJgX1DR1taGk7PTp61JixeWjteuKFi7oIqhnk4D8ahdOpD
 ww/5MaP2Z3kirJtJe6aVzw2oSSjQmfJT1nvLaqtvm4OyiIQKA/sh75lo4AT4I1WfnvBn
 AQVA==
X-Forwarded-Encrypted: i=1;
 AL+hErHFh+1Sb0i0ziTY98rmhZz93ppoCMqXz74kP/TegQHgtmw7s1dYnkTlkKKP0alSTb8dfxVLO35coQ==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8GhgiGWzEZz0+3+DrKvIqwd5rxx6OLk+fbF1vOB8PFZ+qYLZ5T
 9N1SfUE7KaTfO8GuNuSSoyUeBlKER1VHV3maP52MCTaEcdiv0tDhaEao8uCkqVw3G8U=
X-Gm-Gg: AZFdTZeM2tGoNR7grkcU1CViIxWQ7o+yZqTz4i5vzIAzhk2dPlErDDuqetu8WNJYPbx
 0J38JV0RU9ZN/+kN0eIleYrbdKG+hvxBYkUhRDInEPl0Tm5U2CQvTfd6umTPPjjnNg8hlnUy5cG
 V4iF/9UcDw2AqOQLiE3mtih+CHK8XFbEcnjBw3Pe7CJYtLcD3ho6k72eihP9PGIl320tTZJhGT/
 rRvKnVhmx8gqqfKcczJRY2cYraEYqvrYnIkaWhdmcCdnGNMn4f4w+kgUxqD10p2V92ZpGm3e3sq
 NNSalHR3Den3LC21KdRqYdOOlv/cKg9nc9x4BaDPEhOUyTrfVzSjueDO4CZroyubsFqPiPCX+EM
 gvdGp/Sc1SBXf/jnqndMwxrKz0iNtgh6PAeEbxT9TcNCo+8cDzLqRd9e/SWweFAhwMznLTmfXXt
 spdS36+A7OB6/GYIbEAbYIjlnjCJGteDWCVHK+qQAmTDqx03tka9FrylLLdKp6+u4BXsRl+bQF8
 u0NPOg6/mIm/Vyq77wDxERFndoOJZWUm27htiZ7UTiKjFkmJLg2xE1/FV7RVIeI6dlrEFnPcDbM
 ngc+HVck/7r2wYbPyeTuJNl/45eGO7p+FoLmANk+ebeC7Sdz2GEhskV76YSdRGJeAMvCTXRFJ2L
 KiBgzLzqECaUww2r0byCv28+E4VPWITn84i6hJ/imJk2GYF5jHnxeEauAcGRb2qodkrPak2EkpB
 noXNsNKLuSa6KLwrbHkA77IqklhF3t0kjfvBY29XTQ/nwc0SFaLItw74NNcE8feGpE8EErbJESO
 8euCRgR
X-Received: by 2002:a05:620a:410c:b0:949:aa6d:8244 with SMTP id
 af79cd13be357-949ba9b7e65mr944597285a.27.1795263956102; 
 Sat, 21 Nov 2026 04:25:56 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:55 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 2/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Date: Sat, 21 Nov 2026 07:25:48 -0500
Message-ID: <ada2073fc66fa74685b73ac085513c5299b1526f.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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

disable_as_sdp_when_pr_active is now computed after the AS SDP config
and is only set when the AS SDP is actually sent, ALPM AUX-less is used
and AS SDP skip frames is not.

Fixes: d6a8336c5f06 ("drm/i915/alpm: Write PR_ALPM_CTL register")
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 90 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
 4 files changed, 94 insertions(+), 4 deletions(-)

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
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797..7b8a8c3a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3830,6 +3830,7 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 	intel_vrr_compute_config(pipe_config, conn_state);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
+	intel_psr_compute_as_sdp_config(intel_dp, pipe_config);
 	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd1656360..8407b34f2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1704,10 +1704,38 @@ static inline bool compute_link_off_after_as_sdp_when_pr_active(struct intel_con
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
+}
+
+/**
+ * intel_psr_compute_as_sdp_config - compute whether the AS SDP is suspended in PR Active
+ * @intel_dp: Intel DP struct
+ * @crtc_state: crtc state
+ *
+ * Must be called after the AS SDP infoframe has been computed.
+ */
+void intel_psr_compute_as_sdp_config(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state)
+{
+	crtc_state->disable_as_sdp_when_pr_active =
+		crtc_state->has_panel_replay &&
+		compute_disable_as_sdp_when_pr_active(intel_dp, crtc_state);
 }
 
 static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
@@ -1745,7 +1773,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	}
 
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
-	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
@@ -2183,6 +2210,47 @@ static bool psr_interrupt_error_check(struct intel_dp *intel_dp)
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
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       true);
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
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       false);
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
@@ -2201,6 +2269,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	/* DC5/DC6 requires at least 6 idle frames */
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
 	intel_dp->psr.dc3co_exit_delay = val;
+	intel_dp->psr.as_sdp_idle_delay = val;
 	intel_dp->psr.psr2_sel_fetch_enabled = crtc_state->enable_psr2_sel_fetch;
 	intel_dp->psr.su_region_et_enabled = crtc_state->enable_psr2_su_region_et;
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
@@ -2211,6 +2280,9 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.io_wake_lines = crtc_state->alpm_state.io_wake_lines;
 	intel_dp->psr.fast_wake_lines = crtc_state->alpm_state.fast_wake_lines;
 	intel_dp->psr.entry_setup_frames = crtc_state->entry_setup_frames;
+	intel_dp->psr.disable_as_sdp_when_pr_active =
+		crtc_state->disable_as_sdp_when_pr_active;
+	intel_dp->psr.as_sdp_in_active = false;
 
 	if (!psr_interrupt_error_check(intel_dp))
 		return;
@@ -2243,6 +2315,10 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.enabled = true;
 	intel_dp->psr.pause_counter = 0;
 
+	if (intel_dp->psr.disable_as_sdp_when_pr_active)
+		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
+						       true);
+
 	/*
 	 * Link_ok is sticky and set here on PSR enable. We can assume link
 	 * training is complete as we never continue to PSR enable with
@@ -2419,6 +2495,8 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.pipe_mask = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
+	cancel_delayed_work(&intel_dp->psr.as_sdp_work);
+	intel_dp->psr.as_sdp_in_active = false;
 }
 
 /**
@@ -2449,6 +2527,7 @@ void intel_psr_disable(struct intel_dp *intel_dp,
 	mutex_unlock(&intel_dp->psr.lock);
 	cancel_work_sync(&intel_dp->psr.work);
 	cancel_delayed_work_sync(&intel_dp->psr.dc3co_work);
+	cancel_delayed_work_sync(&intel_dp->psr.as_sdp_work);
 }
 
 /**
@@ -3853,6 +3932,8 @@ void intel_psr_flush(struct intel_display *display,
 
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
+		intel_psr_pr_as_sdp_flush_locked(intel_dp);
+
 		if (intel_dp->psr.pause_counter)
 			goto rearm;
 
@@ -3931,6 +4012,7 @@ void intel_psr_init(struct intel_dp *intel_dp)
 
 	INIT_WORK(&intel_dp->psr.work, intel_psr_work);
 	INIT_DELAYED_WORK(&intel_dp->psr.dc3co_work, psr2_dc3co_disable_work);
+	INIT_DELAYED_WORK(&intel_dp->psr.as_sdp_work, intel_psr_pr_as_sdp_suspend_work);
 	mutex_init(&intel_dp->psr.lock);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index d545fdaa0..ddeccb3a9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -80,6 +80,8 @@ int intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state)
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+void intel_psr_compute_as_sdp_config(struct intel_dp *intel_dp,
+				     struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
-- 
2.56.1

