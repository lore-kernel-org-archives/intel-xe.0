Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1687CCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F110ED55;
	Mon, 19 Oct 2026 13:53:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE310ED4B;
 Mon, 19 Oct 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418018; x=1823954018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9vZ+WGO8nUu/bk11GIAoA14uzIUfBKiwjeNU771F7xw=;
 b=XofIznY1DYQWol6unZDGh/Z0TUO13Kre2IyCOgdgFFI3JEL/eudo15b0
 DD9LAAkC26aerEpE37hWhAL+wSlx4PZHmmzG3fPgaRJDaNxIRpKhL5f4t
 RJBwE/ZAz1mXXb8Rl5Evlet99E9YcrRpj0aR1uDsG5YRxnIw9NgUdd5hW
 1EyaeJABlrZZwFW+aWgBJbBo5VG6YOFX0O+nLMWsZb6iYcQ3EmmYlOneF
 6Zquen8QnS9kYedPH2UbqwpOlXQrIMm5pi48Y6CrR2l2hdfphyABm29Ep
 477e0304loJdcPdXCdZT6zdqInRb2w1ZL5DVddl04I8NtC8+DgkAoVDug g==;
X-CSE-ConnectionGUID: 1mbDXEfcRQui/86zw6pK3w==
X-CSE-MsgGUID: dHUzw5+jQeSCcJXyTplPiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085066"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:24 -0700
X-CSE-ConnectionGUID: kvIw68Q7QmKA55PkHg6agg==
X-CSE-MsgGUID: u73Es3vMTgG0xUw08Er6zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844378"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:22 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/15] drm/i915/pfit: Stop using HAS_PCH_SPLIT() in confusing
 places
Date: Mon, 19 Oct 2026 16:52:57 +0300
Message-ID: <20261019135309.23578-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop using HAS_PCH_SPLIT() in places that have nothing to
do with PCH. !HAS_GMCH is a more sensible thing top check for.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c               | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c         | 2 +-
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 86d1c9f7f0ff..0233f5053d95 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -4150,7 +4150,7 @@ static const struct intel_wm_funcs nop_funcs = {
 void i9xx_wm_init(struct intel_display *display)
 {
 	/* For FIFO watermark updates */
-	if (HAS_PCH_SPLIT(display)) {
+	if (!HAS_GMCH(display)) {
 		ilk_setup_wm_latency(display);
 		display->wm.funcs = &ilk_wm_funcs;
 	} else if (display->platform.valleyview || display->platform.cherryview) {
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 723dec35402a..d1440cc6dba4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6777,7 +6777,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 	if (DISPLAY_VER(display) >= 9) {
 		if (new_crtc_state->pfit.enabled)
 			skl_pfit_enable(new_crtc_state);
-	} else if (HAS_PCH_SPLIT(display)) {
+	} else if (!HAS_GMCH(display)) {
 		if (new_crtc_state->pfit.enabled)
 			ilk_pfit_enable(new_crtc_state);
 		else if (old_crtc_state->pfit.enabled)
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..dba34f034785 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -96,7 +96,7 @@ static int i915_sr_status(struct seq_file *m, void *unused)
 
 	if (DISPLAY_VER(display) >= 9)
 		/* no global SR status; inspect per-plane WM */;
-	else if (HAS_PCH_SPLIT(display))
+	else if (!HAS_GMCH(display))
 		sr_enabled = intel_de_read(display, WM1_LP_ILK) & WM_LP_ENABLE;
 	else if (display->platform.i965gm || display->platform.g4x ||
 		 display->platform.i945g || display->platform.i945gm)
-- 
2.55.0

