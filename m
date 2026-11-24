Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A1606A330
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iBvXytDi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECA610F670;
	Tue, 24 Nov 2026 14:18:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330CF10F666;
 Tue, 24 Nov 2026 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529910; x=1827065910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qN3hE59GDyh9eXfLxV+ucjVApbDYpIccGojOsiGdXrE=;
 b=iBvXytDiyslQo1b1ee9OIorh3JC3COg//knnJ44rKTTjfHS5XPoZMKhb
 rAnjrB7hllGunhmzrJeQ8bKQ/H1VL7y6PLVFphCOGF3xMRB6MVB9beKeq
 NvUUwlGobT2hM13w679jWFF8YAPWN9jOpLvim3OPs8S/WfG1KjZH9c8h3
 U4bODP/Od1NkTjfLvz9W+Z/TLQW9U1gHygQl2phfYYWiK8UwyQJnJQI5/
 HMa34XJCo16szfo2J5fuOK3aphtzBMq0d7qzhQsyUmYAHvTLrJRsfDrS1
 RklGtZceSU4WM1CaDTsJ6U6CjR9z0/14L1pl4XRmCknRUZrwhbfIuBNIL A==;
X-CSE-ConnectionGUID: sxVx90aKThOxOFomd/Bkuw==
X-CSE-MsgGUID: GPf1FTj0RuW0Wj6+YhlIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389694"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4389694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:14:56 -0800
X-CSE-ConnectionGUID: ZG4JtzZ4TFq9tX4xvBNwEg==
X-CSE-MsgGUID: q9CjTB18Tf66t9u+U/WO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11569623"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:13:02 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 1/3] drm/i915/flipq: Let the DMC send the PSR frame change
Date: Tue, 24 Nov 2026 14:12:58 +0000
Message-ID: <20261124141300.2600962-2-mika.kahola@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On PTL+ the flip queue entry has a "need push" bit that makes the DMC
send TRANS_PUSH after executing the entry. That is how the PSR/PR
"frame change" event should be generated for flip queue commits, as the
flip queue DSB has no commit epilogue to send it from.

Set it when PSR uses trans push. The enable bits are already programmed
at PSR enable time, so only the send is left to the DMC.

No functional change, as PSR is still excluded from the flip queue.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  3 ++-
 drivers/gpu/drm/i915/display/intel_flipq.c   | 20 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_flipq.h   |  3 ++-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 19caae633d29f..6de618d6735aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7047,7 +7047,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
 
 		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
-				new_crtc_state->dsb_commit);
+				new_crtc_state->dsb_commit,
+				intel_psr_use_trans_push(new_crtc_state));
 		break;
 
 	case INTEL_COMMIT_DSB:
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index e7cfacd8a5eff..ab51795ca4dd1 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -392,15 +392,17 @@ static void ptl_flipq_add(struct intel_display *display,
 			  struct intel_flipq *flipq,
 			  unsigned int pts,
 			  enum intel_dsb_id dsb_id,
-			  struct intel_dsb *dsb)
+			  struct intel_dsb *dsb,
+			  bool need_push)
 {
+	u32 push = need_push ? PTL_FQ_NEED_PUSH : 0;
 	int i = 0;
 
 	switch (flipq->flipq_id) {
 	case INTEL_FLIPQ_GENERAL:
 		intel_flipq_write(display, flipq, pts, i++);
 		intel_flipq_write(display, flipq, 0, i++);
-		intel_flipq_write(display, flipq, PTL_FQ_INTERRUPT |
+		intel_flipq_write(display, flipq, PTL_FQ_INTERRUPT | push |
 				  PTL_FQ_DSB_ID(dsb_id) |
 				  PTL_FQ_DSB_SIZE(intel_dsb_size(dsb) / 64), i++);
 		intel_flipq_write(display, flipq, intel_dsb_head(dsb), i++);
@@ -412,7 +414,7 @@ static void ptl_flipq_add(struct intel_display *display,
 	case INTEL_FLIPQ_PLANE_3:
 		intel_flipq_write(display, flipq, pts, i++);
 		intel_flipq_write(display, flipq, 0, i++);
-		intel_flipq_write(display, flipq, PTL_FQ_INTERRUPT |
+		intel_flipq_write(display, flipq, PTL_FQ_INTERRUPT | push |
 				  PTL_FQ_DSB_ID(dsb_id) |
 				  PTL_FQ_DSB_SIZE(intel_dsb_size(dsb) / 64), i++);
 		intel_flipq_write(display, flipq, intel_dsb_head(dsb), i++);
@@ -427,7 +429,8 @@ void intel_flipq_add(struct intel_crtc *crtc,
 		     enum intel_flipq_id flipq_id,
 		     unsigned int pts,
 		     enum intel_dsb_id dsb_id,
-		     struct intel_dsb *dsb)
+		     struct intel_dsb *dsb,
+		     bool need_push)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_flipq *flipq = &crtc->flipq[flipq_id];
@@ -441,10 +444,13 @@ void intel_flipq_add(struct intel_crtc *crtc,
 
 	intel_flipq_preempt(crtc, true);
 
-	if (DISPLAY_VER(display) >= 30)
-		ptl_flipq_add(display, flipq,  pts, dsb_id, dsb);
-	else
+	if (DISPLAY_VER(display) >= 30) {
+		ptl_flipq_add(display, flipq,  pts, dsb_id, dsb, need_push);
+	} else {
+		/* no DMC generated push before PTL */
+		drm_WARN_ON(display->drm, need_push);
 		lnl_flipq_add(display, flipq,  pts, dsb_id, dsb);
+	}
 
 	flipq->tail = (flipq->tail + 1) % intel_flipq_size_entries(flipq->flipq_id);
 	intel_flipq_write_tail(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.h b/drivers/gpu/drm/i915/display/intel_flipq.h
index 012e3e9a6bcbc..06e84bbc2e07c 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.h
+++ b/drivers/gpu/drm/i915/display/intel_flipq.h
@@ -27,7 +27,8 @@ void intel_flipq_add(struct intel_crtc *crtc,
 		     enum intel_flipq_id flip_queue_id,
 		     unsigned int pts,
 		     enum intel_dsb_id dsb_id,
-		     struct intel_dsb *dsb);
+		     struct intel_dsb *dsb,
+		     bool need_push);
 int intel_flipq_exec_time_us(struct intel_display *display);
 void intel_flipq_wait_dmc_halt(struct intel_dsb *dsb, struct intel_crtc *crtc);
 void intel_flipq_unhalt_dmc(struct intel_dsb *dsb, struct intel_crtc *crtc);
-- 
2.43.0

