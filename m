Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6FEBFD10
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 08:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB910E36F;
	Mon, 13 Apr 2026 08:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDB2HcAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F0610E36E;
 Mon, 13 Apr 2026 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776068178; x=1807604178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VfzdL5vmpH2jtd3TPg/Ohr6vrLYdVWP0UOLv4wKwRgc=;
 b=MDB2HcAqwvEBC0lHvcw+ZKVIkJV0KoZV9raIhqNZpB2B2TCT9DEe0xSK
 D4pwsXXHSMt6F95oBOQ9Rxprx4MK/bXYNqnGDVWtqeqZnowBUY/4P4JuI
 p3CQuiPH3xPZSd050IyOTz3CcZW6AezYOB66tT4vEnoQX9kscdRX+CB/2
 G3A+/7TaMwA2ehVwwIL4n6/StU8f13wvD5OAJlLoZfanLrXgA7r8jCs3Y
 i4Z0+QcWiHCD4o3svQdLb9rT2IHkzMITSwUJhrj/9lQZPAK5BN4FiW5jl
 kHPBwwT9cv4IASsrwRLHs0PXDg7UpEeY8XMqaRjcGyB/Td5n63W2VwU0D g==;
X-CSE-ConnectionGUID: T1E7anC1TxSl6YAt+QIF8A==
X-CSE-MsgGUID: B1MOvkSISY2nAnG9q3EWJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88381794"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="88381794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:16:17 -0700
X-CSE-ConnectionGUID: 2CJbZ0bmRMSCWWoZVaQnoA==
X-CSE-MsgGUID: ejHCZZxvShWZNwb+vFWIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="228853184"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:16:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [PATCH v6] drm/i915/display: change pipe allocation order for
 discrete platforms
Date: Mon, 13 Apr 2026 11:16:09 +0300
Message-ID: <20260413081609.969342-1-jani.nikula@intel.com>
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

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: Also remove WARN_ON()

v3: Limit to discrete

v4: Revamp

v5: Don't screw up the loop variable, dummy

v6: Rebase, drop FIXME comment
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 29 ++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index c88a6810c49f..03de219f7a64 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -411,8 +411,6 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
 
 	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
-
 	if (HAS_CASF(display) && crtc->num_scalers >= 2)
 		drm_crtc_create_sharpness_strength_property(&crtc->base);
 
@@ -426,6 +424,31 @@ static int __intel_crtc_init(struct intel_display *display, enum pipe pipe)
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
@@ -435,7 +458,7 @@ int intel_crtc_init(struct intel_display *display)
 		    INTEL_NUM_PIPES(display), str_plural(INTEL_NUM_PIPES(display)));
 
 	for_each_pipe(display, pipe) {
-		ret = __intel_crtc_init(display, pipe);
+		ret = __intel_crtc_init(display, reorder_pipe(display, pipe));
 		if (ret)
 			return ret;
 	}
-- 
2.47.3

