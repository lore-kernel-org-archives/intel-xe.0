Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F8606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bgi11THD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B7E112207;
	Fri, 27 Nov 2026 06:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38F9112125;
 Fri, 27 Nov 2026 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759787; x=1827295787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=td0q2Ydnk66o6m1aXqdTxlw6otwVwyPA4feZg4m141Q=;
 b=bgi11THDA7AheDB+wxyvMzsMM9QNd0hENcjzzT5c0RsqPiM/o5QauXSJ
 89aaLG3OLQC+5x1AUVxS++raYGUBlx2euq+R4bXzxpudhDy8XrTCofhBk
 5/7fMhFXZe5Mepugse+NdZT0sLtT6THIMtw6jbK+J/4WcnSqG+Sb1xpX4
 EqCTZzOyizEz5tyYpsidOXeie4KN6PY2PPSPyVN8SKeZQrxHHEUARswzh
 UmPkaNvQZsxZyrEkD5aOJGxyM0VD0IX3nwIbEnH5qSxfUZuYV+ZubM/4o
 r3JyaTipUfH1nVb8oktKwRC8YeK20+OC7PIEpdrg3258myRQoIlEvRhFo Q==;
X-CSE-ConnectionGUID: LciGZciCQhKpt3YHUBY1Lw==
X-CSE-MsgGUID: FnVcON1TQ5yzrW2Ka1cEMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578248"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578248"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:47 -0800
X-CSE-ConnectionGUID: m+w1+C41QNWBNwYWMLPi3A==
X-CSE-MsgGUID: Dvej6o6QQPW1LREQvEj0sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361923"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:44 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 05/18] drm/i915/ddi: Don't hold the DP link in idle with
 pipelock
Date: Fri, 27 Nov 2026 11:39:11 +0530
Message-Id: <20261127060924.1648295-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Port sync needs all the links in the group kept in the idle pattern
until every port is trained, and then switched to normal together.
Pipelock has no such requirement, each port can go to normal as soon
as it's trained. Limit the idle hold to port sync.

Bspec: 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index b664d7201d6f..fe18d9737f91 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2657,6 +2657,13 @@ static void mtl_port_buf_ctl_io_selection(struct intel_encoder *encoder)
 		     XELPDP_PORT_BUF_IO_SELECT_TBT, val);
 }
 
+static bool port_sync_hold_link_idle(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	return !HAS_PIPELOCK(display) && intel_crtc_in_sync_group(crtc_state);
+}
+
 static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				  struct intel_encoder *encoder,
 				  const struct intel_crtc_state *crtc_state,
@@ -2754,7 +2761,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 
 	/* 6.n Set DP_TP_CTL link training to Normal */
-	if (!intel_crtc_in_sync_group(crtc_state))
+	if (!port_sync_hold_link_idle(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	/* 6.o Configure and enable FEC if needed */
@@ -2904,7 +2911,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 
 	/* 7.k Set DP_TP_CTL link training to Normal */
-	if (!intel_crtc_in_sync_group(crtc_state))
+	if (!port_sync_hold_link_idle(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	/* 7.l Configure and enable FEC if needed */
@@ -2977,7 +2984,7 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state, true);
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 	if ((port != PORT_A || DISPLAY_VER(display) >= 9) &&
-	    !intel_crtc_in_sync_group(crtc_state))
+	    !port_sync_hold_link_idle(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	intel_ddi_enable_fec(encoder, crtc_state);
@@ -3369,7 +3376,8 @@ static void trans_port_sync_stop_link_train(struct intel_atomic_state *state,
 	struct drm_connector *conn;
 	int i;
 
-	if (!crtc_state->sync_secondaries_mask)
+	if (!port_sync_hold_link_idle(crtc_state) ||
+	    !intel_crtc_is_sync_primary(crtc_state))
 		return;
 
 	for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
-- 
2.34.1

