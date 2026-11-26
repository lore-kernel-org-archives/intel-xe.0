Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5803A606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WfxPFRfF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB9C10FDD9;
	Thu, 26 Nov 2026 06:35:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130B710FCF1;
 Thu, 26 Nov 2026 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674921; x=1827210921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMgDrjh70Enh+6Pm5x2WnpOqV/xBAz5f8IucfWuNKz0=;
 b=WfxPFRfFseQyjpxr4WqhkhesIVe5cL+nfZSuXT+VUwppnloq1k8K2ek5
 BVHBT9FXz5AZl/t8w7TlrFB1Xs8dIsLIXwOxoW8TJaeWEPolVYfs0HNiU
 PZ1s0g0CijwrgrBTHvZaVPuzCP0MqaYz3G/SNspau6joxXXn1+nLO3ygo
 O474scXQo4kVqJ7Jo1vv/c6hLTvqmj2ZdGIKaYaj9IwPcGCAGnpmOYzrX
 Jt2FeDQQQ/E0pCzPTROVovFiVM6QWoMTH4sKd6zLPbhgq8IGO5Z+A7inG
 9+83C6E98/2wrLFsrIcq0ObUsaIHPCAaUbFWEiAhq6PFGlCrs/ZcG+xsL w==;
X-CSE-ConnectionGUID: rA0XXGfhQhGQ9UYV0MzwKw==
X-CSE-MsgGUID: NmSbLJTbS+GJB49aYApm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462661"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:20 -0800
X-CSE-ConnectionGUID: fd+wRcLtT/+dDzgk5yU3DQ==
X-CSE-MsgGUID: pwWZKXQSSSa9FgQ6WQaHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346762"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:18 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 07/15] drm/i915/display: Read out and verify pipelock state
Date: Thu, 26 Nov 2026 12:04:51 +0530
Message-Id: <20261126063459.863698-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Read back the pipelock secondary config from TRANS_DDI_FUNC_CTL2 and
add it to the state checker and the crtc state dump.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_crtc_state_dump.c  |  5 +++++
 drivers/gpu/drm/i915/display/intel_ddi.c      | 20 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 89103a298bae..e52fc317ad25 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -217,6 +217,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		   transcoder_name(pipe_config->sync_primary_transcoder),
 		   pipe_config->sync_secondaries_mask);
 
+	if (HAS_PIPELOCK(display))
+		drm_printf(&p, "pipelock: tg start delay: %u, per frame sync: %s\n",
+			   pipe_config->pipelock.tg_start_delay,
+			   str_yes_no(pipe_config->pipelock.per_frame_sync));
+
 	drm_printf(&p, "joiner: %s, pipes: 0x%x\n",
 		   intel_crtc_is_joiner_secondary(pipe_config) ? "secondary" :
 		   intel_crtc_is_joiner_primary(pipe_config) ? "primary" : "no",
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index fe18d9737f91..54c4f90cdfea 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3981,7 +3981,16 @@ static enum transcoder bdw_transcoder_master_readout(struct intel_display *displ
 {
 	u32 master_select;
 
-	if (DISPLAY_VER(display) >= 11) {
+	if (HAS_PIPELOCK(display)) {
+		u32 ctl2 = intel_de_read(display,
+					 TRANS_DDI_FUNC_CTL2(display, cpu_transcoder));
+
+		if ((ctl2 & GENLOCK_ENABLE) == 0 ||
+		    (ctl2 & GENLOCK_MODE_MASK) != GENLOCK_MODE_LOCAL_SECONDARY)
+			return INVALID_TRANSCODER;
+
+		master_select = REG_FIELD_GET(PORT_SYNC_MODE_MASTER_SELECT_MASK, ctl2);
+	} else if (DISPLAY_VER(display) >= 11) {
 		u32 ctl2 = intel_de_read(display,
 					 TRANS_DDI_FUNC_CTL2(display, cpu_transcoder));
 
@@ -4015,6 +4024,15 @@ static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 	crtc_state->sync_primary_transcoder =
 		bdw_transcoder_master_readout(display, crtc_state->cpu_transcoder);
 
+	if (HAS_PIPELOCK(display) &&
+	    crtc_state->sync_primary_transcoder != INVALID_TRANSCODER) {
+		u32 ctl2 = intel_de_read(display,
+					 TRANS_DDI_FUNC_CTL2(display, crtc_state->cpu_transcoder));
+
+		crtc_state->pipelock.tg_start_delay = REG_FIELD_GET(TG_START_DELAY_MASK, ctl2);
+		crtc_state->pipelock.per_frame_sync = ctl2 & PIPELOCK_PER_FRAME_SYNC;
+	}
+
 	for_each_cpu_transcoder_masked(display, cpu_transcoder, transcoders) {
 		enum intel_display_power_domain power_domain;
 		struct ref_tracker *trans_wakeref;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c5d8d1178dd6..3ce4d6c3d764 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5627,6 +5627,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_X(sync_secondaries_mask);
 	PIPE_CONF_CHECK_I(sync_primary_transcoder);
+	PIPE_CONF_CHECK_I(pipelock.tg_start_delay);
+	PIPE_CONF_CHECK_BOOL(pipelock.per_frame_sync);
 	PIPE_CONF_CHECK_X(joiner_pipes);
 
 	PIPE_CONF_CHECK_BOOL(dsc.config.block_pred_enable);
-- 
2.34.1

