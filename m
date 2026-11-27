Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E52F606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=POMgivjJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB501122B7;
	Fri, 27 Nov 2026 06:10:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84F1121C8;
 Fri, 27 Nov 2026 06:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759801; x=1827295801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RN+r2m6zpgQNxPHS3vNQZRvIwspCaQiUZS1jDovssr4=;
 b=POMgivjJabS9w6PKBi3ePDis6Uujp5/Or0CuKPhsSpFgl7XYTkOuiuNc
 95tlpHG1b2DDfHBv/FJh6FE0KIbQ/5F8EwyrF7q0vaUo8uQSOl5O6jEq0
 oLDTKeiNb9dElkr2fkDv4lpSjwOR0MkklL33Em9SB+JbOtFPHr/etWnl+
 HBshscS+2ZFDrzdaVSdvFC5vISIcSd9yLiGIiysV5EH4vzNJymrc8n5L8
 RaMSM07DYV2LWWVRGYIj3d7LWgt97hzA8SATDL58zdBHlc1pbMhFpElhY
 2h0WUkLG7jcup3ZhPEw2fH6Wbu1KjfRoBFA0r6teNaKpLsPt2SrNpWaS5 g==;
X-CSE-ConnectionGUID: +ekn/1JkQL+h7K9CWX9LrA==
X-CSE-MsgGUID: iWYu77tYRlSgGHXm9+6abQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578265"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578265"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:10:01 -0800
X-CSE-ConnectionGUID: 7q98tet5Q5yevcmFNOtsYA==
X-CSE-MsgGUID: qFbzuIZ7RQSTcshIoz/hrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361946"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:58 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 11/18] drm/i915/ddi: Rename the port sync transcoders to
 transcoder_mask
Date: Fri, 27 Nov 2026 11:39:17 +0530
Message-Id: <20261127060924.1648295-12-suraj.kandpal@intel.com>
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

intel_ddi_port_sync_transcoders() returns a bitmask of transcoders.
Rename it to intel_ddi_port_sync_transcoder_mask(), and the variables
holding the mask to match.

No functional change.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index aae78c99beaf..30c6ba2c186a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4653,15 +4653,15 @@ static bool crtcs_port_sync_compatible(const struct intel_crtc_state *crtc_state
 }
 
 static u16
-intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
-				int tile_group_id)
+intel_ddi_port_sync_transcoder_mask(const struct intel_crtc_state *ref_crtc_state,
+				    int tile_group_id)
 {
 	struct intel_display *display = to_intel_display(ref_crtc_state);
 	struct drm_connector *connector;
 	const struct drm_connector_state *conn_state;
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(ref_crtc_state->uapi.state);
-	u16 transcoders = 0;
+	u16 transcoder_mask = 0;
 	int i;
 
 	/*
@@ -4692,10 +4692,10 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 		if (!crtcs_port_sync_compatible(ref_crtc_state,
 						crtc_state))
 			continue;
-		transcoders |= BIT(crtc_state->cpu_transcoder);
+		transcoder_mask |= BIT(crtc_state->cpu_transcoder);
 	}
 
-	return transcoders;
+	return transcoder_mask;
 }
 
 static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
@@ -4705,7 +4705,7 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct drm_connector *connector = conn_state->connector;
-	u16 port_sync_transcoders = 0;
+	u16 port_sync_transcoder_mask = 0;
 	int ret = 0;
 
 	if (intel_crtc_has_dp_encoder(crtc_state))
@@ -4719,21 +4719,22 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 		    crtc_state->uapi.crtc->base.id, crtc_state->uapi.crtc->name);
 
 	if (connector->has_tile)
-		port_sync_transcoders = intel_ddi_port_sync_transcoders(crtc_state,
-									connector->tile_group->id);
+		port_sync_transcoder_mask =
+			intel_ddi_port_sync_transcoder_mask(crtc_state,
+							    connector->tile_group->id);
 
 	/*
 	 * EDP Transcoders cannot be secondaries
 	 * make them the primary always when present
 	 */
-	if (port_sync_transcoders & BIT(TRANSCODER_EDP))
+	if (port_sync_transcoder_mask & BIT(TRANSCODER_EDP))
 		crtc_state->sync_primary_transcoder = TRANSCODER_EDP;
 	else
-		crtc_state->sync_primary_transcoder = ffs(port_sync_transcoders) - 1;
+		crtc_state->sync_primary_transcoder = ffs(port_sync_transcoder_mask) - 1;
 
 	if (crtc_state->sync_primary_transcoder == crtc_state->cpu_transcoder) {
 		crtc_state->sync_primary_transcoder = INVALID_TRANSCODER;
-		crtc_state->sync_secondaries_mask = port_sync_transcoders &
+		crtc_state->sync_secondaries_mask = port_sync_transcoder_mask &
 			~REG_BIT(crtc_state->cpu_transcoder);
 	}
 
-- 
2.34.1

