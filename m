Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B3BC98312
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4AB10F0BA;
	Wed, 23 Sep 2026 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="MyhJ3PLN";
	dkim-atps=neutral
Received: from mail-vs2-f21.google.com (mail-vs2-f21.google.com
 [74.125.227.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E97610E7CC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 04:13:47 +0000 (UTC)
Received: by mail-vs2-f21.google.com with SMTP id
 71dfb90a1353d-5c83397eeeeso388107e0c.2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 21:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790136826;
 x=1790741626; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=uY7JdksW0dTmvrMShfTjEy2ny76rGHlPsZMFTYu8kuQ=;
 b=MyhJ3PLNO6vyxWGQo0Pu1mSBdeOwJjO3d1Q5V96mrhjiAwMVCjJg/HA17222kv+fM+
 09CuVobRFts35A2wrL9pXkEYm4uy9sbvcDJKN4Nb2Gd+PfpzNGhp8NJemz8vqFaZWHAu
 o0cwEgWLQs/L/0Hvt3UCZ+Hi2fU1OO2iYuaHv/kuMSFP1q+yHtzaP86iG6I3AK2/itiW
 fg3m5+QT9Q9VvhW6QcjQy/d1xNR4UmBIIKfZpJQZAu8ig+ibd6FWfo0k/r0KI7BEoU7w
 mfXHkd9S0ofqum0ny4MYRXpeNKpDdU9BjeuFhzJYSuZyvE4CNy++p6WiK+lhC8CQS98F
 bWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790136826; x=1790741626;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uY7JdksW0dTmvrMShfTjEy2ny76rGHlPsZMFTYu8kuQ=;
 b=PffeAPMC3LJXsF2WE1hvoCzNM1Lbs/5SNzq7rY+c0gB9GD8gIEh5iC7i6HQOfw6Os4
 LnMob3FHdGYhipYoE3A2XiEHXtVwroUVZnoCQ68RTvksjlk/4Itzj3HjkDGv90/g8VvZ
 agbISBsvqbzQb46vu/w2sXH0eYvY4m/fI3GjFw6b+OzRULAOCmTSpVB4+tH602uG50Iw
 083PVFqVxVwMDALUbn5tONcf10TNrdn8c2mAqucVuOS/6LVszym8YJTfdIA3xRMkiAKz
 7Rushv9FtD2qOISyXKnaMj9M7dDEcgz5rTevYXZctb3jBRvbpr34GjDU+OULCXdmowtt
 mwLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxEpQeX/02fEeMzjMfQeIdWw3aVMN1c7X5mKXi1MwS+na5KXspcuecNEWEgHj+NDCOwK8gI88Behg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nObHH6gHvlY/3IczvIQjnOziHeWDMLjEbl86nQ7Xq9xaL/amYx
 oL0G1k6J+V5wg0STO2RGKGzBjW6KgvH/78lYSC2cJQye0AC85eYxVzThGqGRebhWHOg=
X-Gm-Gg: AYBFou1fuLmnnmpT8HpMZGho+9Y5wkZ3hZJcmCdjIdGwbER5lAL039kd3qdSZDNi9pn
 7jLkhznSYLWaLJTqf5mv5fmSbAElllZghpwUzi1gZzmelhNUSyzF7LNY87qFqMGijErccn6oLEO
 YQahC2wdNEXBP88a4DTdlWhcztrDdGNr5THCdKGogaHVcRqwY1O3CiEhVrRj4nmu8MHjHTbgysP
 tiJrVd8WuIQh0B6V0s/hRxJmQB6I+ss6kseaEfzpX20GGuNURwwuX5gaLRHISHvKoIZ/95rPaDS
 mpydOxUlNgVrQVtaa6KyI4RMhTLvOjCHwv8o8EI60jC3vGaQK2IBFsEZTcJJv0WZWSq+8m1YrXB
 0BsgIynJqDjy1VCKMDvMBO0QVVcRgLfnawWu8YZ0yf4rj3ttDTEl7dM+j/W73uinjsRotYD19Ia
 HQNJ3eBLX+TmfSbQeCU5uYmZs3h6LtYxI4CM3ZX1Zw5Ouff/f6OO4iKfs0h1xk7vu9/XQtGX4AS
 4grUymLW+o58s0DsGyI3Of45uoP8fK9iLgST+7O89530bo03AGmvtz1kEOWnu4rxAKXheIQ7oXh
 rGaz/hyAB2Y+XCtGq6pVLLysC8KPCuzXESv7a73Ig2S7iUO/G/0Emnm6lub+SeNFs7yfix01mA=
 =
X-Received: by 2002:a05:6122:f92:b0:5c9:a60b:e5a3 with SMTP id
 71dfb90a1353d-5c9f165900dmr1979665e0c.14.1790136825877; 
 Tue, 22 Sep 2026 21:13:45 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c9f053a418sm1828790e0c.13.2026.09.22.21.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 21:13:45 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they are
 disabled
Date: Wed, 23 Sep 2026 00:13:42 -0400
Message-ID: <20260923041342.2146450-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:53 +0000
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

Since commit 38a7e9bf69bd ("drm/i915/dp: Set relevant Downspread Ctrl
DPCD bits for PR + Auxless ALPM") link training sets
DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE (DPCD 0x107 bit 6) whenever eDP
Panel Replay runs with the Adaptive-Sync SDP enabled. That tells the
sink that fixed-vtotal AS SDPs keep coming while PR is active.

When the sink supports asynchronous video timing in PR (DPCD 0xb1
ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR clear),
disable_as_sdp_when_pr_active is set and PR_ALPM_CTL[AS SDP
Transmission in Active Disable] is programmed, so the source stops
sending the AS SDP for as long as PR is active. The sink is promised
AS SDPs that never arrive.

This is not a VRR-only case: intel_vrr_compute_config() always
computes fixed refresh timings with vrr.flipline set, so the AS SDP is
enabled on every eDP sink that supports it (from code reading; the
measurements below used an EDID override).

The commit that added the bit notes that it applies even if AS SDPs
are briefly suspended. With the PR_ALPM_CTL bit set they are not
briefly suspended, they are off for the whole of PR Active.

Commit 186113b419a2 ("drm/i915/dp: Compute and include coasting vtotal
for AS SDP") notes that the hardware reflects the PR_ALPM_CTL bit in
the AS SDP payload. Even so, with 0x107 bit 6 set this sink stutters,
and with it clear it does not (below).

Seen on a Dell XPS 16 DA16260 (Panther Lake, LG eDP panel, sink OUI
00:22:b9, 3200x2000@120 with DSC) with the Panel Replay quirk removed
locally: PR_ALPM_CTL = 0x11, DPCD 0x107 = 0xc0 (bit 7 because this
setup uses an EDID override that adds a 20-120 Hz range with unchanged
timings; the stock EDID has none). The desktop visibly stutters under
Panel Replay while the source flips at a steady 8.33 ms (1434 of 1437
commit intervals over 12 s).

Both ways of making source and sink agree were tested with a local
debug switch selecting each behaviour, PR entered by a full modeset
each time:

  AS SDP kept on in PR Active   PR_ALPM_CTL 0x01, 0x107 0xc0
  (this patch) AS SDP off       PR_ALPM_CTL 0x11, 0x107 0x80

Both are smooth on the desktop right after PR entry. With this patch,
some stutter comes back after several minutes on this panel; that is
left for a separate change. On a static VT (no compositor, one update
per second, 30 s each) the first gets 0 DC5 entries and this patch
gets 550 (DMC DC3->DC5 count; on the KDE desktop neither mode reached
DC5 because the compositor keeps vblank interrupts enabled). So keep
the AS SDP off and stop promising it.

Only set the bit when the source keeps sending the AS SDP in PR
Active: disable_as_sdp_when_pr_active is clear, or AS SDP skip frames
is in use, which clears the PR_ALPM_CTL bit and keeps a periodic AS
SDP going.

Also fix the comment in intel_dp_compute_as_sdp(), added by the
coasting vtotal commit above, which says the PR_ALPM_CTL bit is never
programmed. It was already being programmed when that comment was
added.

Fixes: 38a7e9bf69bd ("drm/i915/dp: Set relevant Downspread Ctrl DPCD bits for PR + Auxless ALPM")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
Notes:

- Based on drm-tip of 2026-09-22, also applies to next-20260922.
  The measurements used an equivalent local debug switch on 7.3-rc4
  (its second setting programs the same PR_ALPM_CTL 0x11 / 0x107 0x80
  as this patch does there). The rc4 version of this change (without
  the skip-frames term, which rc4 lacks) builds but has not been run
  on its own yet. The drm-tip version builds cleanly with W=1 (i915
  and xe) but has not been run.

- Ankit, does this match your reading of the spec for 0x107 bit 6?
  The public material I could find does not settle it; the argument
  here is consistency with PR_ALPM_CTL plus the measurements above.

- With skip frames, a seamless VRR toggle reprograms PR_ALPM_CTL but
  0x107 is only written at link training, so bit 6 can go stale on
  display version 35+ in either direction (also if
  enable_periodic_assdp is toggled without a modeset). Before this
  patch only the bit-set direction could happen. It cannot happen on
  PTL.

- Not fixed here: on this panel, with no AS SDP at all in PR Active,
  a fresh PR enable (e.g. DPMS on after the screen blanked) can leave
  the sink locked to a bad phase, and a 1 s AS SDP burst cleared it. PTL
  appears not to implement the skip-frames field. That and the
  question of how Intel wants it handled are in the bug thread:
  https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealtyinc.ca/
  The DA16260 Panel Replay quirk stays until that is settled.

 drivers/gpu/drm/i915/display/intel_dp.c               | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 11 +++++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ffddf4b33728..f7d32ed98745 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3156,11 +3156,12 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 
 	/*
 	 * For Panel Replay with Async Video Timing support, the source can
-	 * disable sending the AS SDP during PR Active state. In that case,
-	 * the sink needs the coasting vtotal value to maintain the refresh
-	 * rate. The HW only samples this on PR_ALPM_CTL[AS SDP Transmission
-	 * in Active Disable], which we never program, so providing the value
-	 * unconditionally when the sink advertises the capability is safe.
+	 * stop sending the AS SDP during PR Active (PR_ALPM_CTL[AS SDP
+	 * Transmission in Active Disable], see intel_alpm_configure_pr_as_sdp())
+	 * and the sink then keeps the refresh rate using the coasting vtotal of
+	 * the last AS SDP it received. The coasting vtotal bytes are fully
+	 * under driver control, so fill them in whenever the sink advertises
+	 * the capability.
 	 *
 	 * #TODO:
 	 * If we ever advertise support for coasting at other refresh targets,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index b6e8b13ee4db..6fe4c1e47eff 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -29,6 +29,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
+#include "intel_alpm.h"
 #include "intel_display.h"
 #include "intel_display_core.h"
 #include "intel_display_jiffies.h"
@@ -1124,7 +1125,17 @@ static bool
 intel_dp_pr_with_as_sdp_enabled(struct intel_dp *intel_dp,
 				const struct intel_crtc_state *crtc_state)
 {
+	/*
+	 * DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE tells the sink that the AS SDP
+	 * keeps coming during PR Active. With disable_as_sdp_when_pr_active,
+	 * intel_alpm_configure_pr_as_sdp() sets PR_ALPM_CTL[AS SDP Transmission
+	 * in Active Disable] and the source stops sending it for as long as PR
+	 * is active, unless AS SDP skip frames is used. The sink then keeps
+	 * the refresh rate using the coasting vtotal of the last AS SDP.
+	 */
 	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
+		(!crtc_state->disable_as_sdp_when_pr_active ||
+		 intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state)) &&
 		(crtc_state->infoframes.enable &
 		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC));
 }
