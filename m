Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE26606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Da/cCjOG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5881112C4F;
	Fri, 23 Oct 2026 16:59:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D045112C39;
 Fri, 23 Oct 2026 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792774732; x=1824310732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIVed6F2FCSg0xpV6g3dcjL2UejhmxjVICGI4ccreUQ=;
 b=Da/cCjOGvV79cn/rv0TqV8Z6Dzty1IZl8n1HC5Jk5GhHq+El6D9JJk+S
 uL/UMIV3atBJ+GwDb2GGgsTDYXXGEq/LwiKlzprH7ul/IXiM52MEAXFrS
 87FlaD92hjo3J08AcLLgNoDMNWKY3990w2lMbY3+b9VNn/yfwvOFitAe9
 xI01JVDfvXLbQmwG0hQWTalukRY76QpeUf3eCNx2Ny3Gkx7RoynJz17Nr
 YMKvKiWPxcVxpyR8xT8pavkldxta2zFTuBRLQSuwE+bmEzsdXiq4U8dLG
 X31tvIb0uIyfNlU3g5SZt05I3/jWpfKWPuNHTsNBgzXTdcdbA4DO8Ym5k w==;
X-CSE-ConnectionGUID: r8kWPIzXTZSOeWwOBoCO7Q==
X-CSE-MsgGUID: Eou83k7gT6yQToH+JB6D/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428618"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428618"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:52 -0700
X-CSE-ConnectionGUID: yHjJZw5mS2SID0OAOp3h/Q==
X-CSE-MsgGUID: 3BMmNRqvRamtjtT/U7Kryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3798607"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 09:58:50 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/13] drm/i915/vrr: Include VRR safe window in state dump
Date: Fri, 23 Oct 2026 19:58:02 +0300
Message-ID: <20261023165803.31016-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Include information about the VRR safe window in the CRTC state
dump. Obviously the safe window changes dynamically depending
on whether/when a push happens, but we can at least dump the
vmin/vmax extremes. Avoids having to calculate these by hand
while debugging things.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c |  3 +++
 drivers/gpu/drm/i915/display/intel_vrr.c             | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h             |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index c51b21222dc6..f07c64bbc8ba 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -314,6 +314,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d\n",
 		   intel_vrr_vmin_vblank_start(pipe_config), intel_vrr_vmax_vblank_start(pipe_config),
 		   intel_vrr_vmin_vtotal(pipe_config), intel_vrr_vmax_vtotal(pipe_config));
+	drm_printf(&p, "vrr: safe window start: %d, vmin safe window end: %d, vmax safe window end: %d\n",
+		   intel_vrr_safe_window_start(pipe_config), intel_vrr_vmin_safe_window_end(pipe_config),
+		   intel_vrr_vmax_safe_window_end(pipe_config));
 	drm_printf(&p, "vrr: dc balance: %s, vmin: %d vmax: %d guardband: %d, slope: %d max increase: %d max decrease: %d vblank target: %d\n",
 		   str_yes_no(pipe_config->vrr.dc_balance.enable),
 		   pipe_config->vrr.dc_balance.vmin, pipe_config->vrr.dc_balance.vmax,
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 3d31d37af4e2..d8f17a44dbe6 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1303,6 +1303,18 @@ static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
 	return vblank_start - crtc_state->set_context_latency;
 }
 
+int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state)
+{
+	return vrr_safe_window_end(crtc_state,
+				   intel_vrr_vmin_vblank_start(crtc_state));
+}
+
+int intel_vrr_vmax_safe_window_end(const struct intel_crtc_state *crtc_state)
+{
+	return vrr_safe_window_end(crtc_state,
+				   intel_vrr_vmax_vblank_start(crtc_state));
+}
+
 int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
 {
 	return vrr_safe_window_end(crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 332f9b4a57cc..6f7b7e3e2902 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -50,6 +50,8 @@ void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
 			 struct intel_crtc *crtc);
 bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
 int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state);
+int intel_vrr_vmin_safe_window_end(const struct intel_crtc_state *crtc_state);
+int intel_vrr_vmax_safe_window_end(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state);
 
 int intel_vrr_dcb_vmin_vblank_start_next_live(const struct intel_crtc_state *crtc_state);
-- 
2.55.0

