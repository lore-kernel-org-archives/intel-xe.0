Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC880EE2091
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11D910E12B;
	Fri,  6 Feb 2026 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBKp7fEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25310E12B;
 Fri,  6 Feb 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770381444; x=1801917444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BdwuLFPl4Gy7Qzr8EFyVUVK221UsB28h5WmgftupD4o=;
 b=VBKp7fEVMzpxfTDscd6eD9c1+i8bo1aNlBzGWa1sSKRso10+YJ2xg9re
 JI/6ZMWNpvI5nyyr6Al8zTdtDshjvURYy27KjT/tcN4znDUIoD9OlY6zl
 3MUClCZ7yXJXaUKVA8PTUaxIYVHq2ToeQySBJ7G/V5xS6JDPkIKc8Tceb
 B8j+AcopxVg9AThITcPRyqasLn1lC9yoRNmaD5HDyBTVqtRp4JFNO2SFR
 wh97EIhoo8apA7W5Fi71k+Na/NCqH/BMoT7UgBPNJbpv861q52w7P3skk
 jkUR8ve1QKVP0fpqxbMmRKVy3HiEY3MMgtnJKks6LIh3YBKXT+pCjCt3u w==;
X-CSE-ConnectionGUID: zzXCEM3KR/CPoS7SVZZH7Q==
X-CSE-MsgGUID: M+mZfLMpTjW1OeGHJVDhIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="59159872"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="59159872"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:37:24 -0800
X-CSE-ConnectionGUID: sRhyIfcHQSKQ3otG9MXIhQ==
X-CSE-MsgGUID: eIacdOamRQuGU1hX+/FPsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215353931"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:37:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [CI] drm/i915/display: change pipe allocation order for discrete
 platforms
Date: Fri,  6 Feb 2026 14:37:15 +0200
Message-ID: <20260206123715.234245-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

When big joiner is enabled, it reserves the adjacent pipe as the
secondary pipe. This happens without the user space knowing, and
subsequent attempts at using the CRTC with that pipe will fail. If the
user space does not have a coping mechanism, i.e. trying another CRTC,
this leads to a black screen.

Try to reduce the impact of the problem on discrete platforms by mapping
the CRTCs to pipes in order A, C, B, and D. If the user space reserves
CRTCs in order, this should trick it to using pipes that are more likely
to be available for and after joining.

Limit this to discrete platforms, which have four pipes, and no eDP, a
combination that should benefit the most with least drawbacks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: Also remove WARN_ON()

v3: Limit to discrete

v4: Revamp

There are a number of issues in IGT with assuming CRTC index == pipe, at
least with CRC and vblank waits. With them being used a lot in tests, we
won't get enough test coverage until they're fixed.
---
 drivers/gpu/drm/i915/display/intel_crtc.c    | 29 ++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_display.c |  2 ++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index ed3c6c4ce025..c06b06cb1db7 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -393,8 +393,6 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
-
 	if (HAS_CASF(display) && crtc->num_scalers >= 2)
 		drm_crtc_create_sharpness_strength_property(&crtc->base);
 
@@ -406,6 +404,31 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
 	return ret;
 }
 
+#define HAS_PIPE(display, pipe) (DISPLAY_RUNTIME_INFO(display)->pipe_mask & BIT(pipe))
+
+/*
+ * Expose the pipes in order A, C, B, D on discrete platforms to trick user
+ * space into using pipes that are more likely to be available for both a) user
+ * space if pipe B has been reserved for the joiner, and b) the joiner if pipe A
+ * doesn't need the joiner.
+ *
+ * Swap pipes B and C only if both are available i.e. not fused off.
+ */
+static enum pipe reorder_pipe(struct intel_display *display, enum pipe pipe)
+{
+	if (!display->platform.dgfx || !HAS_PIPE(display, PIPE_B) || !HAS_PIPE(display, PIPE_C))
+		return pipe;
+
+	switch (pipe) {
+	case PIPE_B:
+		return PIPE_C;
+	case PIPE_C:
+		return PIPE_B;
+	default:
+		return pipe;
+	}
+}
+
 int intel_crtc_init(struct intel_display *display)
 {
 	enum pipe pipe;
@@ -415,6 +438,8 @@ int intel_crtc_init(struct intel_display *display)
 		    INTEL_NUM_PIPES(display), str_plural(INTEL_NUM_PIPES(display)));
 
 	for_each_pipe(display, pipe) {
+		pipe = reorder_pipe(display, pipe);
+
 		ret = __intel_crtc_init(display, pipe);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 295f14416be7..2a7a9c5639ee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5959,6 +5959,8 @@ static int intel_atomic_check_joiner(struct intel_atomic_state *state,
 		 * This works because the crtcs are created in pipe order,
 		 * and the hardware requires primary pipe < secondary pipe as well.
 		 * Should that change we need to rethink the logic.
+		 *
+		 * FIXME: What about with reordered pipes?
 		 */
 		if (WARN_ON(drm_crtc_index(&primary_crtc->base) >
 			    drm_crtc_index(&secondary_crtc->base)))
-- 
2.47.3

