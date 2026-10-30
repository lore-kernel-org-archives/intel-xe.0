Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fnJ2FS6Z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AAC112940;
	Fri, 30 Oct 2026 17:14:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91806112953;
 Fri, 30 Oct 2026 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380452; x=1824916452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O8Sl1eyI46zUsuava8yoXlDHBLcIH+r5nCrvt2QAlpo=;
 b=fnJ2FS6ZfUkudabvqdJZb+CR6jOOo0rjaph54p/vArctcR6NRoSdVDsT
 pITw/Og45eAG+N6EXd4/lF2hylFJZUGWEDTyA47+6cgysFMrH+v5+uUWP
 CodLuWOmJaV3txOlM8Nq5Ia4wP1pz3pc2sUDVTWPKAM5/58AafS1/sBlP
 kOvr+ujlMfn7eHYfhn0ge07TlGVflcMEB7KemBzi6aaJQA28oNjZttgYI
 hwM8sGLVUc6pquZfNx7cVS549/hRDKmMrFcJyHgjd3IwGoDJfmdq8uGT3
 Bu/irPgqHDX/wFHcNFIPfGJVV8zBzqo+FgEG17Rum0XA53+BW8XI5cr8i A==;
X-CSE-ConnectionGUID: TMlZhpyTTJmFsO+af7yadQ==
X-CSE-MsgGUID: bBIbsuq8RvOmcanyWLt+aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2053937"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2053937"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:12 -0700
X-CSE-ConnectionGUID: 7Y5LZtWFSC+0wYzd7lgLHw==
X-CSE-MsgGUID: t8N4SgymTJSX0bG3ytmVWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5625329"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:11 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/10] drm/i915: Fix FEC wait with port sync on pre-LNL
Date: Fri, 30 Oct 2026 19:13:25 +0200
Message-ID: <20261030171327.29829-10-ville.syrjala@linux.intel.com>
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

On pre-LNL platforms FEC_DECODE_EN isn't transmitted until
the timing generator starts, which happens after TRANSCONF
has enabled and DP_TP_CTL link training is switched to
normal. With port sync enabled we always enable TRANSCONF
for all the synced transcoders first, but defer the DP_TP_CTL
switch until the primary transcoder (which is done last)
has finished its link training.

Defer the FEC status checks to the point where all the
synced timing generators have started, and thus FEC_DECODE_EN
has actually been sent on all the links.

On LNL+ FEC_DECODE_EN gets sent immediately when enabling
FEC in DP_TP_CTL, so it can stick to its way of checking for
FEC status immediately after enabling FEC. Looks like there
is still some kind of vestigial timing generator dependency
even on LNL+ as I can't seem  to re-transmit FEC_DECODE_EN
after both DP_TP_CTL has been switched to normal and
TRANSCONF has been enabled. But as long as we enable FEC
before enabling TRANSCONF (which we always do) FEC_DECODE_EN
is apparently sent immediately. Currently we actually double
check the FEC on LNL+ (once immediately on enabling FEC, and
a second time where we also check it on pre-LNL). But apart
for wasting a bit of time the second check is harmless.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 45 ++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e97e586bed72..4f335bbf7076 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2431,6 +2431,39 @@ int intel_ddi_wait_for_fec_status(struct intel_encoder *encoder,
 	return 0;
 }
 
+static void trans_port_sync_wait_for_fec_status(struct intel_atomic_state *state,
+						struct intel_encoder *encoder,
+						const struct intel_crtc_state *crtc_state,
+						bool enabled)
+{
+	const struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
+	int i;
+
+	if (!crtc_state->sync_mode_slaves_mask)
+		return;
+
+	for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
+		struct intel_encoder *slave_encoder =
+			to_intel_encoder(conn_state->best_encoder);
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
+		intel_ddi_wait_for_fec_status(slave_encoder, slave_crtc_state, enabled);
+	}
+
+	intel_ddi_wait_for_fec_status(encoder, crtc_state, enabled);
+}
+
 static void intel_ddi_enable_fec(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
@@ -3595,8 +3628,6 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 
 	intel_enable_transcoder(crtc_state);
 
-	intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
-
 	if (is_hdmi)
 		intel_ddi_enable_hdmi(state, encoder, crtc_state, conn_state);
 	else
@@ -3623,6 +3654,16 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 	else
 		intel_crtc_vblank_on(state, crtc_state);
 
+	/*
+	 * On pre-LNL FEC_DECODE_EN will only be sent when the timing
+	 * generator starts. Also note that FEC_DECODE_EN cannot be
+	 * re-sent without restarting the timing generator.
+	 */
+	if (is_trans_port_sync_mode(crtc_state))
+		trans_port_sync_wait_for_fec_status(state, encoder, crtc_state, true);
+	else
+		intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
+
 	intel_hdcp_enable(state, encoder, crtc_state, conn_state);
 }
 
-- 
2.55.0

