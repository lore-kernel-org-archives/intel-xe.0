Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA69EDF14F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 10:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5462C10E7E0;
	Fri, 13 Feb 2026 10:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZf9zxnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE29B10E7D6;
 Fri, 13 Feb 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770978319; x=1802514319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYxtyMa+IuaVTW48mlG3UZqa+G4YE+5w2OSgTnXfqVI=;
 b=JZf9zxnI1Gxm/0fBs75hXeEQE11vGLWlx/bG0CIxgLPtouVBhWpJpS7X
 S03SgHVOWJpi/KtWcDEFT9c9cvhll/RlLBsnmR9VQKtyg8QEOOJpWTSDa
 /ahU0BVQIBO0Gf2a8DERBO48slr3qdMwD2g5eOC1wf5junF2r339QvspG
 eSshklm/gL0MjPDP3O9CzaRapPwg1XK8E6LB/wp2FcsX/pcK6ppZUG+k2
 28kf5nUU8io4crWNQN48d3Bc9yzMwI54Y+RoIsLY7RH3B1fzYjvFNP43Q
 g+6hcOy4QPj/7UaBwnTjbaLguygrl0lBOFZKejqtkd/hM6JS7okO/x3Jy A==;
X-CSE-ConnectionGUID: 6dmi/iaiSSemLsCwpKUgGg==
X-CSE-MsgGUID: hrk4+YbTQ7OSFj7O+nec4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72150661"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72150661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:19 -0800
X-CSE-ConnectionGUID: 2UHhJyYGQhK9QCIAMR4iIQ==
X-CSE-MsgGUID: Ug6AuvfqSi6kMCf6Kv8tlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212919592"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:18 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 04/16] drm/i915/display: convert W/As in intel_cdclk.c to
 new framework
Date: Fri, 13 Feb 2026 12:23:32 +0200
Message-ID: <20260213102500.406925-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260213102500.406925-1-luciano.coelho@intel.com>
References: <20260213102500.406925-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c      | 2 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 36b67b1a793d..35b7f06efb07 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -4007,7 +4007,7 @@ void intel_init_cdclk_hooks(struct intel_display *display)
 		display->cdclk.table = dg2_cdclk_table;
 	} else if (display->platform.alderlake_p) {
 		/* Wa_22011320316:adl-p[a0] */
-		if (display->platform.alderlake_p && IS_DISPLAY_STEP(display, STEP_A0, STEP_B0)) {
+		if (intel_display_wa(display, INTEL_DISPLAY_WA_22011320316)) {
 			display->cdclk.table = adlp_a_step_cdclk_table;
 			display->funcs.cdclk = &tgl_cdclk_funcs;
 		} else if (display->platform.alderlake_p_raptorlake_u) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 011749b680e8..aef6eca51119 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -104,6 +104,9 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return intel_display_needs_wa_16025573575(display);
 	case INTEL_DISPLAY_WA_22010178259:
 		return DISPLAY_VER(display) == 12;
+	case INTEL_DISPLAY_WA_22011320316:
+		return display->platform.alderlake_p &&
+			IS_DISPLAY_STEP(display, STEP_A0, STEP_B0);
 	case INTEL_DISPLAY_WA_22014263786:
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
 	case INTEL_DISPLAY_WA_22021048059:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 380cb64cf774..aa96d111111c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -41,6 +41,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_22010178259,
+	INTEL_DISPLAY_WA_22011320316,
 	INTEL_DISPLAY_WA_22014263786,
 	INTEL_DISPLAY_WA_22021048059,
 };
-- 
2.51.0

