Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB9AC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2637810ED19;
	Wed, 26 Aug 2026 13:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5fZlSIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA3F10ED18;
 Wed, 26 Aug 2026 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751645; x=1819287645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uW2Nyuzr3bxOGhTVRdkd0xrO69ZDW/2QVYvTdnWl5Q8=;
 b=E5fZlSIQqUP0KLWFb2hbAeJzSTTKcV0KV2uxxSTm5T9cbDpkFHtccuIk
 NDp1E0EnorGpFqHzkTMo6NPEQiloDRDNgCnwW0s1DhGODvw0hTrep2kR4
 e5cGe2/z11iCkAn9Lec9SjCNahAqcpV09+HeM8HNO6s+IeIAQ2eurshkT
 xhc5mXdJmCwEW5xRwNe6jdbH8krWD+A7E5e0Te6tWTYT7dxjJzAkXg9Q9
 MayLoiTej1Y8DlRd4zVq32yetEFeDPj9VIqmmVSYoahTAUpGDoxtSuwPg
 rpesh3sjaRv9kYfvx9Q58Aiz0ROpmuDpkkRbXNsPHeCNbNRTY4IIxUThL Q==;
X-CSE-ConnectionGUID: Cdt0PnS5QWq3aFPa1vAmWQ==
X-CSE-MsgGUID: twfjo280TT2GEpXB1W2z7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88152256"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88152256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:45 -0700
X-CSE-ConnectionGUID: RSnON1SySaCcIiIg/u8MVw==
X-CSE-MsgGUID: HFOTWL2RQM+CDmMaLLvRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264980483"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 02/14] drm/i915/cdclk: Pass CDCLK in MHz to pcode on DG2
Date: Wed, 26 Aug 2026 16:40:21 +0300
Message-ID: <20260826134033.13976-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

We are currently trying to pass the CDCLK in kHz to the pcode
on DG2, while the pcode expects a value in MHz units. Adjust
the units appropriately.

v2: Call it 'cdclk_mhz' (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 25 +++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c3206c9de239..308bcdd01699 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2730,8 +2730,9 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 		intel_atomic_get_old_cdclk_state(state);
 	const struct intel_cdclk_state *new_cdclk_state =
 		intel_atomic_get_new_cdclk_state(state);
-	unsigned int cdclk = 0; u8 voltage_level, num_active_pipes = 0;
+	u8 voltage_level, num_active_pipes = 0;
 	bool change_cdclk, update_pipe_count;
+	unsigned int cdclk_mhz = 0;
 
 	if (!intel_cdclk_changed(&old_cdclk_state->actual,
 				 &new_cdclk_state->actual) &&
@@ -2752,8 +2753,12 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	 * if CDCLK is decreasing or not changing, set bits 25:16 to current CDCLK,
 	 * which basically means we choose the maximum of old and new CDCLK, if we know both
 	 */
-	if (change_cdclk)
-		cdclk = max(new_cdclk_state->actual.cdclk, old_cdclk_state->actual.cdclk);
+	if (change_cdclk) {
+		unsigned int cdclk = max(new_cdclk_state->actual.cdclk,
+					 old_cdclk_state->actual.cdclk);
+
+		cdclk_mhz = DIV_ROUND_UP(cdclk, 1000);
+	}
 
 	/*
 	 * According to "Sequence For Pipe Count Change",
@@ -2764,7 +2769,7 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
+	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
 			   change_cdclk, update_pipe_count);
 }
 
@@ -2775,8 +2780,9 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 		intel_atomic_get_new_cdclk_state(state);
 	const struct intel_cdclk_state *old_cdclk_state =
 		intel_atomic_get_old_cdclk_state(state);
-	unsigned int cdclk = 0; u8 voltage_level, num_active_pipes = 0;
+	u8 voltage_level, num_active_pipes = 0;
 	bool update_cdclk, update_pipe_count;
+	unsigned int cdclk_mhz = 0;
 
 	/* According to "Sequence After Frequency Change", set voltage to used level */
 	voltage_level = new_cdclk_state->actual.voltage_level;
@@ -2789,8 +2795,11 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	 * According to "Sequence After Frequency Change",
 	 * set bits 25:16 to current CDCLK
 	 */
-	if (update_cdclk)
-		cdclk = new_cdclk_state->actual.cdclk;
+	if (update_cdclk) {
+		unsigned int cdclk = new_cdclk_state->actual.cdclk;
+
+		cdclk_mhz = DIV_ROUND_UP(cdclk, 1000);
+	}
 
 	/*
 	 * According to "Sequence For Pipe Count Change",
@@ -2801,7 +2810,7 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk,
+	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
 			   update_cdclk, update_pipe_count);
 }
 
-- 
2.54.0

