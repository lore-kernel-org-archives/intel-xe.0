Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15470606A321
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZLWJ6ZQh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E504112958;
	Fri, 30 Oct 2026 17:14:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D548B11294E;
 Fri, 30 Oct 2026 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380434; x=1824916434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6jpoKxHDCLTHdFpPJTkyF6Q0iT8MkPJ20221l/h+Z5I=;
 b=ZLWJ6ZQhrCjR0E4zfYOg0oawNcJ6NfAvG+uuWCf9JZgfg611t2AuVtzc
 cTsT7GnO58ocA6920KcS0DvYyUvZLWexuHI42xm/zD8o5Tw/IlzBeTx7Y
 crF0pWt1ZWu2MALIWwYRCsq4V/+Nq+LwXY1W18ipM2SQPSkv1ggL3QJko
 TemlWw4j0oMuVP3Nm9mnmTOqtPmBxR/HBmSgKmQ2sFdnWBuYtoEvqI+yp
 yvLp/X0+6PgVpH0rzbuGznbN6k/r4IaYLYwur+uvUXFC66dKucsobNEf6
 JYcm4x6FlX2YrnpsxtQMCTvX6Y69EbZTouzOvgzbRvfMAAKb6EEEXz8SC g==;
X-CSE-ConnectionGUID: /ztbBF7gQ929xS5iTZXWXg==
X-CSE-MsgGUID: xJXzJsk/QbiY2UxoKp+NLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144538"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:54 -0700
X-CSE-ConnectionGUID: WdJNyYLfRuGfO4GnqqpJCQ==
X-CSE-MsgGUID: hN3PSYR0RSu+bnBv4//fcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490928"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:54 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/10] drm/i915: Fix intel_crtc_vblank_on() with port sync
Date: Fri, 30 Oct 2026 19:13:21 +0200
Message-ID: <20261030171327.29829-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

When port sync is used we first iterate the secondary transcoders
and leave them transmitting the idle pattern rather than producing
actual pixels. Only after the primary transcoder has finished its
link training we switch DP_TP_CTL on all the transcoders over to
normal mode, after which all the timings generators will start.

Defer the intel_crtc_vblank_on() calls for all the transcoders until
the timing generators have started, to avoid the frame/scanline
counters jumping erratically after the vblank machinery is up and
running.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 34 +++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 12222e5096d4..ed39f1e265a9 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3243,6 +3243,35 @@ static void intel_ddi_post_disable_hdmi(struct intel_atomic_state *state,
 	intel_dp_dual_mode_set_tmds_output(intel_hdmi, false);
 }
 
+static void trans_port_sync_vblank_on(struct intel_atomic_state *state,
+				      const struct intel_crtc_state *crtc_state)
+{
+	const struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+	int i;
+
+	if (!crtc_state->sync_mode_slaves_mask)
+		return;
+
+	for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
+		struct intel_crtc *slave_crtc = to_intel_crtc(conn_state->crtc);
+		const struct intel_crtc_state *slave_crtc_state;
+
+		if (!slave_crtc)
+			continue;
+
+		slave_crtc_state =
+			intel_atomic_get_new_crtc_state(state, slave_crtc);
+
+		if (slave_crtc_state->master_transcoder != crtc_state->cpu_transcoder)
+			continue;
+
+		intel_crtc_vblank_on(state, slave_crtc_state);
+	}
+
+	intel_crtc_vblank_on(state, crtc_state);
+}
+
 static void intel_ddi_post_disable_hdmi_or_sst(struct intel_atomic_state *state,
 					       struct intel_encoder *encoder,
 					       const struct intel_crtc_state *old_crtc_state,
@@ -3571,7 +3600,10 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 	else
 		intel_ddi_enable_dp(state, encoder, crtc_state, conn_state);
 
-	intel_crtc_vblank_on(state, crtc_state);
+	if (is_trans_port_sync_mode(crtc_state))
+		trans_port_sync_vblank_on(state, crtc_state);
+	else
+		intel_crtc_vblank_on(state, crtc_state);
 
 	intel_hdcp_enable(state, encoder, crtc_state, conn_state);
 }
-- 
2.55.0

