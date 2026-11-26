Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255CD606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqHI7mCE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221B10FE4B;
	Thu, 26 Nov 2026 06:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6EA10FDE1;
 Thu, 26 Nov 2026 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674933; x=1827210933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XamhSVuFO8XGbngGN/WguJ2qXFNzbBDODaYgpYA3Mo=;
 b=cqHI7mCE7D9Wd2pEMGXGSifzI2uZlv4RbrllRsy7tIV6thvNchkdeoh1
 pPuVxieHNJAAqcKtYQ8WQGvcZopyf1iytYzqA5NqH0JiZEmWRlskbzD8X
 rsjo88rFcMrLGPnA6AvG4VQDYlbzmUemoB+rFJxSRCdY44oAVLWOKe35T
 O5PRecHRYGWNaBFf5ssksbeZ3/wjoW2f2cECMxFEjiyg3gyYlZwyOh6x1
 I8gG77E/hVjzXxds6DPnGeodWIcKCX2fdiFTYNLFLLAydOShKY3wr9jZB
 DHIZYxC1ySP9dqPRF8BaLStathgczAL8Ypfn837Q7w71H0BjFllx/MgDs w==;
X-CSE-ConnectionGUID: 0dgf/Y2cT/2Bkt+RFWh3Tg==
X-CSE-MsgGUID: lnrMCaQgSfWg2Tl3pgUHCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462679"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:33 -0800
X-CSE-ConnectionGUID: jP2LBcyZR+6wUKXsEshEiw==
X-CSE-MsgGUID: L9XRofJUSVmu2YELT+Y+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346799"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:31 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 13/15] drm/i915/display: Show transcoder sync state in
 i915_display_info
Date: Thu, 26 Nov 2026 12:04:57 +0530
Message-Id: <20261126063459.863698-14-suraj.kandpal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Print whether a CRTC is a port sync or pipelock primary or secondary,
and the pipelock config of a secondary. This lets IGT check that the
tiles of a tiled display are actually synced.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  1 +
 .../drm/i915/display/intel_display_debugfs.c  | 22 +++++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3ce4d6c3d764..adb4e49bfedf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -173,7 +173,7 @@ icl_wa_cursorclkgating(struct intel_display *display, enum pipe pipe,
 		     enable ? CURSOR_GATING_DIS : 0);
 }
 
-static bool intel_crtc_is_sync_secondary(const struct intel_crtc_state *crtc_state)
+bool intel_crtc_is_sync_secondary(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->sync_primary_transcoder != INVALID_TRANSCODER;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 4b31eef229ce..3db20ef2a910 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -366,6 +366,7 @@ intel_cpu_transcoder_mode_valid(struct intel_display *display,
 enum phy intel_port_to_phy(struct intel_display *display, enum port port);
 bool intel_crtc_in_sync_group(const struct intel_crtc_state *state);
 bool intel_crtc_is_sync_primary(const struct intel_crtc_state *state);
+bool intel_crtc_is_sync_secondary(const struct intel_crtc_state *state);
 u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes);
 u8 intel_crtc_joined_pipe_mask(const struct intel_crtc_state *crtc_state);
 bool intel_crtc_is_joiner_secondary(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3289535650aa..de9291a900d0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -540,6 +540,26 @@ static void crtc_updates_add(struct intel_crtc *crtc)
 }
 #endif
 
+static void intel_crtc_sync_info(struct drm_printer *p,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	const char *name = HAS_PIPELOCK(display) ? "Pipelock" : "Port sync";
+
+	if (intel_crtc_is_sync_primary(crtc_state)) {
+		drm_printf_indent(p, 1, "%s: primary, secondaries: 0x%x\n",
+				  name, crtc_state->sync_secondaries_mask);
+	} else if (intel_crtc_is_sync_secondary(crtc_state)) {
+		drm_printf_indent(p, 1, "%s: secondary of transcoder %s\n",
+				  name, transcoder_name(crtc_state->sync_primary_transcoder));
+
+		if (HAS_PIPELOCK(display))
+			drm_printf_indent(p, 2, "start delay: %u, per frame sync: %s\n",
+					  crtc_state->pipelock.tg_start_delay,
+					  str_yes_no(crtc_state->pipelock.per_frame_sync));
+	}
+}
+
 static void intel_crtc_info(struct drm_printer *p, struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
@@ -581,6 +601,8 @@ static void intel_crtc_info(struct drm_printer *p, struct intel_crtc *crtc)
 				  crtc_state->joiner_pipes,
 				  intel_crtc_is_joiner_secondary(crtc_state) ? "slave" : "master");
 
+	intel_crtc_sync_info(p, crtc_state);
+
 	intel_vdsc_state_dump(p, 1, crtc_state);
 
 	for_each_intel_encoder_mask(display->drm, encoder,
-- 
2.34.1

