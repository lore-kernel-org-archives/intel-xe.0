Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71447606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJUM27/Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5A7112A94;
	Fri, 23 Oct 2026 10:01:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A432B112A6F;
 Fri, 23 Oct 2026 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749658; x=1824285658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBnrhAgZLfz26Ey/FEpYiPiAgNBxO3g09rFS0Ymkh4Q=;
 b=WJUM27/Yk4jDC9QsLzaMoRTU9GQRaF4Xw0gLCJXaVD98+qtbMeyclgLe
 VC8w3YvCPYJMgBnslp1pKOuUTH7DWfSTmcEhjVtHc5/gHnurhmb3DTohD
 9GqnMXCgaXwELZDV24Ooa/IG11+sCi17yozlcUzZHNybgFWYjGctYsVEl
 2ON3pavIaepnxfH8DX1hKm6nxMf0yJaXg9kJfZ2K/9LjFDsKXJaBzbKRg
 PDdtajeLa8I1vqJUd3tLEXoGNpK5rVtQto5LwsXBPGbE/TkJvkRQUzJI5
 3k5/jySI5IdADCiqXPzln3IWfccS1Be8BEqpSpdBXTrGH8GsmV3FFhVjF g==;
X-CSE-ConnectionGUID: EKi28AsASJmNjwGeP+l5jQ==
X-CSE-MsgGUID: M5F3XneNS5CVPC59REOCTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384252"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:00:57 -0700
X-CSE-ConnectionGUID: JzuN4M3tRg2sdckLQ5AFRg==
X-CSE-MsgGUID: Gk1ypn4NReKB0Kqqqk5vPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932687"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:00:56 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 1/9] drm/i915/psr: Track all joined pipes for frontbuffer
 tracking
Date: Fri, 23 Oct 2026 10:00:44 +0000
Message-ID: <20261023100052.683192-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

psr.pipe is the joiner primary only, so frontbuffer bits coming from a
secondary pipe get masked out and the update goes unnoticed. Add
psr.pipe_mask covering every joined pipe and use that instead.

No functional change, joiner is still rejected in compute_config().

v2: Split the active_non_psr_pipes change into its own patch (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 25 ++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8f9fb2603638a..4756e50a3b707 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1802,6 +1802,7 @@ struct intel_psr {
 	bool enabled;
 	int pause_counter;
 	enum pipe pipe;
+	u8 pipe_mask;
 	enum transcoder transcoder;
 	bool active;
 	struct work_struct work;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 4ae47d33096a6..27ccccdc72315 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -36,6 +36,7 @@
 #include "intel_cursor_regs.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
@@ -1802,6 +1803,19 @@ static void psr2_dc3co_disable_work(struct work_struct *work)
 	mutex_unlock(&intel_dp->psr.lock);
 }
 
+/* Frontbuffer bits for every pipe driving this PSR/Panel Replay instance. */
+static unsigned int psr_frontbuffer_mask(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	unsigned int mask = 0;
+	enum pipe pipe;
+
+	for_each_pipe_masked(display, pipe, intel_dp->psr.pipe_mask)
+		mask |= INTEL_FRONTBUFFER_ALL_MASK(pipe);
+
+	return mask;
+}
+
 static void
 psr2_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits)
 {
@@ -1817,8 +1831,7 @@ psr2_dc3co_flush_locked(struct intel_dp *intel_dp, unsigned int frontbuffer_bits
 	 * At every frontbuffer flush flip event modified delay of delayed work,
 	 * when delayed work schedules that means display has been idle.
 	 */
-	if (!(frontbuffer_bits &
-	    INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe)))
+	if (!(frontbuffer_bits & psr_frontbuffer_mask(intel_dp)))
 		return;
 
 	mod_delayed_work(display->wq.unordered, &intel_dp->psr.dc3co_work,
@@ -2179,6 +2192,7 @@ static void intel_psr_enable_locked(struct intel_dp *intel_dp,
 	intel_dp->psr.panel_replay_enabled = crtc_state->has_panel_replay;
 	intel_dp->psr.busy_frontbuffer_bits = 0;
 	intel_dp->psr.pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
+	intel_dp->psr.pipe_mask = intel_crtc_joined_pipe_mask(crtc_state);
 	intel_dp->psr.transcoder = crtc_state->cpu_transcoder;
 	/* DC5/DC6 requires at least 6 idle frames */
 	val = usecs_to_jiffies(intel_get_frame_time_us(crtc_state) * 6);
@@ -2398,6 +2412,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.pipe_mask = 0;
 	cancel_delayed_work(&intel_dp->psr.dc3co_work);
 	intel_dp->psr.dc3co_allowed = false;
 }
@@ -3617,8 +3632,7 @@ void intel_psr_invalidate(struct intel_display *display,
 			continue;
 		}
 
-		pipe_frontbuffer_bits &=
-			INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe);
+		pipe_frontbuffer_bits &= psr_frontbuffer_mask(intel_dp);
 		intel_dp->psr.busy_frontbuffer_bits |= pipe_frontbuffer_bits;
 
 		if (pipe_frontbuffer_bits)
@@ -3698,8 +3712,7 @@ void intel_psr_flush(struct intel_display *display,
 			continue;
 		}
 
-		pipe_frontbuffer_bits &=
-			INTEL_FRONTBUFFER_ALL_MASK(intel_dp->psr.pipe);
+		pipe_frontbuffer_bits &= psr_frontbuffer_mask(intel_dp);
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
 		/*
-- 
2.43.0

