Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693BA606A32C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iNYZsz64
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9B10F678;
	Tue, 24 Nov 2026 14:18:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2985310F66B;
 Tue, 24 Nov 2026 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529915; x=1827065915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N3RABqQ5FakKoG0zwD2UfWdvY92eBNGzEh2wGXjOC9Q=;
 b=iNYZsz64Y3Ij+aRAUoQRkIEMGn5S/Vq/hbGhLpTLgFAM8ndoeenQIEt0
 bJODu9uzCwnC0WdtsNWbwM1KsEIsrtFinz7jov6faQLJCcn7B7u7H6lz+
 jf4LaR4lGeMq2Zem0kq0CjBwECfRNjC9eOn2fTw21fzD5DgtLjE/06sx0
 fNULIjR7AC8cERddOLBYarvHoG5/wuUSp4jdcGDje7qV6iXUm3A0GSNpg
 //1vYDuocnRhB8TMA86YFtKGwRhIwRxhjYso80HVubzHbKiMZ3swT7Np+
 c3U/QR8rmWGOdSKDqVXFzD9CuerpitkHzucZnaKHp42alue6eueqpv0VJ w==;
X-CSE-ConnectionGUID: 1mhuAYEWQIG5GaxPiogk1Q==
X-CSE-MsgGUID: 1Svxs7LRQQq3YZod0pnNRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389695"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4389695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:14:56 -0800
X-CSE-ConnectionGUID: ExexK+B0QH6fszX4ZuVpgQ==
X-CSE-MsgGUID: KpnujcC9Sq+oQFcR4dDu0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11569628"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:13:04 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 2/3] drm/i915/flipq: Allow flip queue commits with PSR2/PR on
 Xe3+
Date: Tue, 24 Nov 2026 14:12:59 +0000
Message-ID: <20261124141300.2600962-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124141300.2600962-1-mika.kahola@intel.com>
References: <20261124141300.2600962-1-mika.kahola@intel.com>
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

Allow PSR2 and Panel Replay with the flip queue on PTL+, where the
selective fetch and SU region programming go through the DSB and the
DMC generates the frame change event.

PSR1 stays excluded as it can't use the pipe DMC interrupt. LNL is
left out as it has no DMC generated push, and its flip queue trigger
is scanline based while PIPEDSL reads 0 in PSR2 deep sleep.

Joined pipes are left out as well. They share one transcoder, but
each pipe DMC would send its own push.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_flipq.c   | 27 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_flipq.h   |  1 +
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6de618d6735aa..c6875169ef225 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7524,7 +7524,7 @@ intel_atomic_commit_type(struct intel_atomic_state *state,
 	/* TODO handle VRR with flip queue */
 	if (intel_flipq_supported(display) &&
 	    !new_crtc_state->vrr.enable &&
-	    !new_crtc_state->has_psr &&
+	    intel_flipq_psr_supported(new_crtc_state) &&
 	    !intel_crtc_needs_color_update(new_crtc_state))
 		return INTEL_COMMIT_FLIPQ;
 
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index ab51795ca4dd1..24be0a3ec2e96 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -127,6 +127,33 @@ bool intel_flipq_supported(struct intel_display *display)
 	return DISPLAY_VER(display) >= 30 && intel_vrr_always_use_vrr_tg(display);
 }
 
+/*
+ * The flip queue completion is signalled via the pipe DMC interrupt,
+ * which isn't available with PSR1. PSR2 and Panel Replay can be used
+ * with the flip queue on PTL+, where the selective fetch and SU region
+ * programming go through the DSB and the DMC generates the frame
+ * change event (see PTL_FQ_NEED_PUSH).
+ *
+ * Joined pipes share one transcoder, but each pipe DMC would send
+ * its own push, so keep them on the DSB path.
+ */
+bool intel_flipq_psr_supported(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (!crtc_state->has_psr)
+		return true;
+
+	if (DISPLAY_VER(display) < 30 ||
+	    !HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display))
+		return false;
+
+	if (crtc_state->joiner_pipes)
+		return false;
+
+	return crtc_state->has_sel_update || crtc_state->has_panel_replay;
+}
+
 void intel_flipq_init(struct intel_display *display)
 {
 	struct intel_crtc *crtc;
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.h b/drivers/gpu/drm/i915/display/intel_flipq.h
index 06e84bbc2e07c..b5370191c472b 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.h
+++ b/drivers/gpu/drm/i915/display/intel_flipq.h
@@ -17,6 +17,7 @@ struct intel_display;
 struct intel_dsb;
 
 bool intel_flipq_supported(struct intel_display *display);
+bool intel_flipq_psr_supported(const struct intel_crtc_state *crtc_state);
 void intel_flipq_init(struct intel_display *display);
 void intel_flipq_reset(struct intel_display *display, enum pipe pipe);
 
-- 
2.43.0

