Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C6C55843
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDBC10E86A;
	Tue,  4 Aug 2026 06:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRM/Ll6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96210E11A;
 Tue,  4 Aug 2026 06:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785825063; x=1817361063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVeR0IK9SqGiVJJJa4TssM12vuiUi9b5zKMwEIJBqAI=;
 b=cRM/Ll6tAx2d18V23smEjsqULHIKJAF6SKXvJNsXxmtloli84cRWodx/
 U+3URLHGC8dBliS4TQrRppg+Bi6pccOufVg4I77UxMcBAN1hnhJmpFiam
 vyelb0lVnEbn5bOCSAiFzppo0Yee1VPoQzEB57SyU+9C7zgAOUz6zVWFb
 8kxB7q3sDLL4Z9J4yH6R+m3Ps4LcxD6OmGLO+aJ/SMXafYOWNSWMEI57Q
 v4Kdgwfd5wGZRFjpnt2b/pNU23XcFv8r0kpDlS2c7i666rGR7/DzVl91s
 r55BtyMCDoo7JRZ8rpaVMuGwN+Is+LcdOS7+XBVuIWjk6+YFktLbYUeri w==;
X-CSE-ConnectionGUID: bbDxUchXTUGc9FKFHsdkTQ==
X-CSE-MsgGUID: 6dCIrwEyTa6ZtzDHQrlKpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90179804"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="90179804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:31:02 -0700
X-CSE-ConnectionGUID: YmPOB8KHTRWqD/OGgiwetA==
X-CSE-MsgGUID: o3TpI1tlS6WP7iI9M/c83w==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 23:31:00 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 1/2] drm/i915/flipq: Drain the flip queue before disabling
 pipe planes
Date: Tue,  4 Aug 2026 06:30:56 +0000
Message-ID: <20260804063058.969207-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804063058.969207-1-mika.kahola@intel.com>
References: <20260804063058.969207-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A plane update queued into a pipe's flip queue is executed by the pipe
DMC asynchronously, potentially several vblanks later. If a later,
unrelated commit disables the pipe before that queued update has run,
intel_crtc_disable_planes() can end up racing a write that is still
only queued, not yet applied to hardware:

  cursor D assertion failure (expected off, current on)
  WARNING: .../intel_display.c:406 at assert_plane+0x11e/0x140 [xe]

Add intel_flipq_drain() and call it before intel_crtc_disable_planes()
for pipes being disabled, so any queued-but-not-yet-executed entry is
neutralized before we synchronously write the real plane-disabled state
and before assert_planes_disabled() checks it.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 ++
 drivers/gpu/drm/i915/display/intel_flipq.c   | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_flipq.h   |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..3656b9be5b5c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7003,6 +7003,8 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
 		if ((disable_pipes & BIT(crtc->pipe)) == 0)
 			continue;
 
+		intel_flipq_drain(crtc);
+
 		intel_crtc_disable_planes(state, crtc);
 
 		drm_vblank_work_flush_all(&crtc->base);
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index bf278f60bba7..cd2cd8eda447 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -326,6 +326,19 @@ void intel_flipq_disable(const struct intel_crtc_state *crtc_state)
 	intel_de_write(display, PIPEDMC_SCANLINECMPUPPER(crtc->pipe), 0);
 }
 
+/* Empty a pipe's flip queue, discarding any entries still queued. */
+void intel_flipq_drain(struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(crtc);
+
+	if (!intel_flipq_supported(display))
+		return;
+
+	intel_flipq_preempt(crtc, true);
+
+	intel_flipq_reset(display, crtc->pipe);
+}
+
 static bool assert_flipq_has_room(struct intel_crtc *crtc,
 				  enum intel_flipq_id flipq_id)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.h b/drivers/gpu/drm/i915/display/intel_flipq.h
index 012e3e9a6bcb..c39ee0aa2ce7 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.h
+++ b/drivers/gpu/drm/i915/display/intel_flipq.h
@@ -22,6 +22,7 @@ void intel_flipq_reset(struct intel_display *display, enum pipe pipe);
 
 void intel_flipq_enable(const struct intel_crtc_state *crtc_state);
 void intel_flipq_disable(const struct intel_crtc_state *old_crtc_state);
+void intel_flipq_drain(struct intel_crtc *crtc);
 
 void intel_flipq_add(struct intel_crtc *crtc,
 		     enum intel_flipq_id flip_queue_id,
-- 
2.43.0

