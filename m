Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A169CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 21:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C7111AB42;
	Fri,  5 Jun 2026 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="gfTTqF9w";
	dkim-atps=neutral
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jun 2026 21:37:54 UTC
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64411AB42;
 Fri,  5 Jun 2026 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1780694918;
 bh=B/EE8eEHQIgCSYl/OhEX/QNJofrBnUOSNrtEk+TU1F4=;
 h=From:To:Cc:Subject:Date:From;
 b=gfTTqF9w041qeJhDnC7Mx8ARk9dd3xh4S4OAWbIu2y54cQVUX6sSw+PKe7Sof3VTS
 Ok8/SI44r2TtryIl5kZA2SBf07OI2ivroFk90xXJ5UE1jhgQouoKyCocBVjFBbJ+6/
 cxq+66DXzER+YxHfvP6QlHD9DfXhrJJUk4pb0BEBBfmsD0mIbB7F6s4ezaNvX5I1tS
 rHSK+Kx0QEwhRMBm3+TfKLiBEgvEU8NUSJMfmQVQ6L6wHOanFFFVxhwyKVtUGRX6VB
 71vHOZaA3FBt2PSJukS9n5TcF6ak6UzdZM7tLTgVl/Wamxs0thoINyy3PsLFmVJ67R
 ytNGWCGMrvEfg==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 7529C3362B;
 Fri,  5 Jun 2026 23:28:38 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Fri, 5 Jun 2026 23:28:37 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 Alexander Kaplan <alexander.kaplan@sms-medipool.de>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/tc: Disable outputs instead of modesetting them on
 link reset
Date: Fri,  5 Jun 2026 23:28:37 +0200
Message-ID: <20260605212837.4265-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

After a DP-alt sink is disconnected with the link still active,
intel_tc_port_link_reset_work() tries to recover the link via a
modeset, flagging the active CRTCs with connectors_changed in
reset_link_commit(). By that point intel_dp_detect() has already
reset the sink capabilities (EDID, dfp.*, DSC DPCD - see the FIXME in
intel_dp_detect()), so the recovery modeset is computed without them.
Depending on which capabilities the connected mode requires, this
either fails the atomic check with -EINVAL, triggering the WARN in
intel_tc_port_link_reset_work():

  i915 0000:00:02.0: [drm] drm_WARN_ON(ret)
  WARNING: ... at drivers/gpu/drm/i915/display/intel_tc.c:1838
           intel_tc_port_link_reset_work+0x38c/0x420

or commits a configuration the disconnected link can't sustain: link
training fails and the output is left enabled on the disconnected
port. Either way the output stays enabled, keeping the TC PHY
ownership held and the TC mode locked. AUX transfers then get
rejected based on intel_digital_port_connected_locked(), so detecting
a newly connected sink keeps failing as well: the port can't be
recovered without disabling the output by some other means (in
practice a reboot).

Disable the affected outputs instead of modesetting them, matching
how commit c598c335da42 ("drm/i915/tc: Reset TypeC PHYs left enabled
in DP-alt mode after the sink disconnects") handles the equivalent
situation during boot/resume sanitization, for the same reason. The
disable also releases the PHY ownership synchronously - via the
encoder's post-PLL-disable hook - avoiding the IOM/TCSS firmware
timeout the above commit worked around, and unblocking the HPD status
updates of other TypeC ports. The output gets re-enabled via the
normal hotplug flow once a sink is connected again.

Preserving the sink capabilities across the disconnect instead (the
direction proposed for the DSC caps in the gitlab reports below)
would avoid the -EINVAL, but not the second failure mode: the
recovery modeset would still be committed against a dead link,
leaving the enabled output behind after a failed link training.
Disabling the output covers both.

Observed on PTL with a DP-alt -> HDMI 2.1 PCON adapter on a TV power
cycle (both failure modes above); reports with the matching WARN on
ADL and MTL in the links below.

Fixes: c598c335da42 ("drm/i915/tc: Reset TypeC PHYs left enabled in DP-alt mode after the sink disconnects")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14807
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11551
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
---
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index a21dd4e3fe4c..ae9da59ca8e3 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -5,6 +5,7 @@

 #include <linux/iopoll.h>

+#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_print.h>

 #include "intel_atomic.h"
@@ -1764,9 +1765,13 @@ static int reset_link_commit(struct intel_tc_port *tc,
 	struct intel_display *display = to_intel_display(tc->dig_port);
 	struct intel_digital_port *dig_port = tc->dig_port;
 	struct intel_dp *intel_dp = enc_to_intel_dp(&dig_port->base);
+	struct drm_connector_state *conn_state;
+	struct drm_connector *connector;
+	struct drm_plane_state *plane_state;
+	struct drm_plane *plane;
 	struct intel_crtc *crtc;
 	u8 pipe_mask;
-	int ret;
+	int i, ret;

 	ret = drm_modeset_lock(&display->drm->mode_config.connection_mutex, ctx);
 	if (ret)
@@ -1779,6 +1784,13 @@ static int reset_link_commit(struct intel_tc_port *tc,
 	if (!pipe_mask)
 		return 0;

+	/*
+	 * The sink is gone, so intel_dp_detect() has already reset the sink
+	 * capabilities, and recomputing the config for the still active mode
+	 * would fail (see the FIXME in intel_dp_detect()). Disable the
+	 * outputs instead; the next sink connect re-enables them via the
+	 * normal hotplug flow.
+	 */
 	for_each_intel_crtc_in_pipe_mask(display, crtc, pipe_mask) {
 		struct intel_crtc_state *crtc_state;

@@ -1786,7 +1798,33 @@ static int reset_link_commit(struct intel_tc_port *tc,
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);

-		crtc_state->uapi.connectors_changed = true;
+		crtc_state->uapi.active = false;
+
+		ret = drm_atomic_set_mode_prop_for_crtc(&crtc_state->uapi, NULL);
+		if (ret)
+			return ret;
+
+		ret = drm_atomic_add_affected_planes(&state->base, &crtc->base);
+		if (ret)
+			return ret;
+
+		ret = drm_atomic_add_affected_connectors(&state->base, &crtc->base);
+		if (ret)
+			return ret;
+	}
+
+	for_each_new_connector_in_state(&state->base, connector, conn_state, i) {
+		ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+		if (ret)
+			return ret;
+	}
+
+	for_each_new_plane_in_state(&state->base, plane, plane_state, i) {
+		ret = drm_atomic_set_crtc_for_plane(plane_state, NULL);
+		if (ret)
+			return ret;
+
+		drm_atomic_set_fb_for_plane(plane_state, NULL);
 	}

 	if (!__intel_tc_port_link_needs_reset(tc))

