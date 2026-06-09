Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E94CD98D5
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCDE10E2FC;
	Tue,  9 Jun 2026 12:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egOne78x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F4C10E302;
 Tue,  9 Jun 2026 12:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006645; x=1812542645;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B2likRfXbB5389TWoxlSspVLJR47s1dzZHKtzBtNb4w=;
 b=egOne78xrn6sduuyWm5t9Y2AbslLKwS/k7UPkPgYZnXfMIJxulXsp5R2
 nIyZyO8ck031xlm9g4L8EULD5714mBU/iza7aey4Ex0mgRnpuvPHcsM9t
 n10+xuBJzqRwlN9tw1uartSHEnKVmbxdNZrb7U0/WDkGWRj4HhjrDU8ep
 wbELmWDUcUlVUjhPQfyAx3iVY+PbM3pKU4dujNQNffuSIZUmqoGNp8mNI
 TqnJ5YFYqe53tK7pn7cG3vkDaFnhI0DbEDtYR0hh4CgSnZ4iZy8hKfBS4
 9C83ZiAVFTQ99nrKIoPLt9u9jtVEdwz843icnoN08q31KmeozUOJj5KDd A==;
X-CSE-ConnectionGUID: 4uTEDs28TZaxOwTa99x92Q==
X-CSE-MsgGUID: 8rss4NrwQTaLljHfdwKeDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340405"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:05 -0700
X-CSE-ConnectionGUID: EeKFXD+tTayZI9KIw0i8yQ==
X-CSE-MsgGUID: CO/iZmuxSgiVk6C+FL11pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988417"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:04 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 19/36] drm/i915/cmtg: Restore CMTG after DC6 exit
Date: Tue,  9 Jun 2026 17:32:33 +0530
Message-ID: <20260609120250.867750-20-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

Restore CMTG registers after DC6 exit, as they lose their values
in the low-power state.

v2: Introduce intel_cmtg_restore() instead of calling multiple cmtg
functions. [Uma]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c       |  9 +++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h       |  1 +
 drivers/gpu/drm/i915/display/intel_display.c    | 10 +++++++---
 .../gpu/drm/i915/display/intel_display_power.c  | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_display_power.h  |  2 ++
 5 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index b7f4be33ce2e..8be6f7f28e35 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -434,3 +434,12 @@ void intel_cmtg_program(const struct intel_crtc_state *crtc_state)
 	intel_cmtg_set_hwgb(crtc_state);
 	intel_cmtg_enable_ddi(crtc_state);
 }
+
+void intel_cmtg_restore(const struct intel_crtc_state *crtc_state)
+{
+	intel_cmtg_set_clk_select(crtc_state);
+	intel_cmtg_set_timings(crtc_state, false);
+	intel_cmtg_set_vrr_timings(crtc_state);
+	intel_cmtg_set_vrr_ctl(crtc_state);
+	intel_cmtg_set_m_n(crtc_state);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 51fc3f5a89f4..37f90123c397 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -22,5 +22,6 @@ bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_enable_interrupt(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_disable_interrupt(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_program(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_restore(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aee783d1316f..161bed86fec5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7568,12 +7568,16 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
 		bool modeset = intel_crtc_needs_modeset(new_crtc_state);
+		bool dc3co_to_dc6 = intel_display_power_get_and_reset_dc3co_to_dc6(display);
 
 		/*
-		 * TODO: CMTG needs to be restored on DC6 exit and DC3co entry condition
-		 * need to be checked before calling CMTG functions.
+		 * TODO: DC3co entry condition need to be checked before calling CMTG functions.
 		 */
-		if (modeset && new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+		if ((modeset || dc3co_to_dc6) &&
+		    new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+			if (dc3co_to_dc6)
+				intel_cmtg_restore(new_crtc_state);
+
 			intel_cmtg_program(new_crtc_state);
 			intel_cmtg_enable_interrupt(new_crtc_state);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 2e51dfcd5dce..e75002819bf5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -285,6 +285,19 @@ sanitize_target_dc_state(struct intel_display *display,
 	return target_dc_state;
 }
 
+bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *display)
+{
+	struct i915_power_domains *power_domains = &display->power.domains;
+	bool ret;
+
+	mutex_lock(&power_domains->lock);
+	ret = power_domains->dc3co_to_dc6;
+	power_domains->dc3co_to_dc6 = false;
+	mutex_unlock(&power_domains->lock);
+
+	return ret;
+}
+
 /**
  * intel_display_power_set_target_dc_state - Set target dc state.
  * @display: display device
@@ -320,6 +333,10 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	if (!dc_off_enabled)
 		intel_power_well_enable(display, power_well);
 
+	if (power_domains->target_dc_state == DC_STATE_EN_DC3CO &&
+	    state == DC_STATE_EN_UPTO_DC6)
+		power_domains->dc3co_to_dc6 = true;
+
 	power_domains->target_dc_state = state;
 
 	if (!dc_off_enabled)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index 56dc89eed3f8..b9c9b68072af 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -138,6 +138,7 @@ struct i915_power_domains {
 	 */
 	bool initializing;
 	bool display_core_suspended;
+	bool dc3co_to_dc6;
 	int power_well_count;
 
 	u32 dc_state;
@@ -179,6 +180,7 @@ void intel_display_power_sanitize_state(struct intel_display *display);
 
 void intel_display_power_suspend_late(struct intel_display *display, bool s2idle);
 void intel_display_power_resume_early(struct intel_display *display);
+bool intel_display_power_get_and_reset_dc3co_to_dc6(struct intel_display *display);
 void intel_display_power_set_target_dc_state(struct intel_display *display,
 					     u32 state);
 u32 intel_display_power_get_current_dc_state(struct intel_display *display);
-- 
2.43.0

