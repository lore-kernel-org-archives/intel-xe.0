Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27247CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 19:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC88310E94A;
	Wed, 27 May 2026 19:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPsolxAg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC710E94A;
 Wed, 27 May 2026 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779908451; x=1811444451;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0ggWKcJc3CLk3+u3Re9rNzH88AJGd3CvQ+BGQ0yNYdw=;
 b=bPsolxAgW8DNzGN1L9rah5OcC+IECOCPBdJzHTDd1ooVyw9StequEFOy
 SbeQ2F/3wIdyH3bb4ZpqHKch5GELHFEw+ccbCU11+t0YlcDoQlwgPKDY+
 LrvnLG275JeWOmLMxXmx8JUjCdQ5ASPWJ2wtwueH7xr8oOmS77UqScmmG
 ZZuCG1Ove4G3ZlV7IegCnqu6EWULZ78MjzxDxJ0XDTaq0bVTaieIYTUOk
 DzzAOKgS7TxkeZxWW82U8KNwuF7VFTi9FPj/2xnUS399ZFPMasoLrvKqd
 dur0EsnXMExl4J3f/Yp+5vKNmCHpnEajFqRP+v2LvYLqRF2eJyNHmlYvU A==;
X-CSE-ConnectionGUID: p7+Y6+zJSHKe57DRVd3yKA==
X-CSE-MsgGUID: nF8gGFq+TY6tLx0EhjXPRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80602156"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80602156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:51 -0700
X-CSE-ConnectionGUID: JidYLiMaTA+t6DSB+24dow==
X-CSE-MsgGUID: 2k1CTQK/T0WyY3hmA7bqKA==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:50 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI 15/17] drm/i915/display: program CMTG before DC3CO enable
Date: Thu, 28 May 2026 00:30:02 +0530
Message-ID: <20260527190004.118730-16-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
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

CMTG provides the clock required in DC3CO state.
Gate the DC3CO enable on successful CMTG enable.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9b0191d02e20..87c318e52890 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7512,6 +7512,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct ref_tracker *wakeref = NULL;
 	int i;
 	u32 target_dc_state;
+	bool cmtg_status = false;
+	bool dc3co_allowed = intel_display_power_dc3co_allowed(display);
+
 	/*
 	 * Delay re-enabling DC states by 17 ms to avoid the off->on->off
 	 * toggling overhead at and above 60 FPS.
@@ -7629,7 +7632,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
-	intel_cmtg_program(state);
+	if (dc3co_allowed)
+		cmtg_status = intel_cmtg_program(state);
 
 	intel_wait_for_vblank_workers(state);
 
@@ -7727,7 +7731,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	}
 
 	if (intel_display_power_dc3co_supported(display)) {
-		if (intel_display_power_dc3co_allowed(display)) {
+		if (dc3co_allowed && cmtg_status) {
 			/*
 			 * Use minimal re-enable delay to allow DC3CO entry on
 			 * the next idle frame, unlike the 17ms guard needed to
-- 
2.43.0

