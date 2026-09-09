Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C412BC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3912E10F21E;
	Wed,  9 Sep 2026 16:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlb8ngma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1951C10F21E;
 Wed,  9 Sep 2026 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970702; x=1820506702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZS/VWLfl8Rt607CENR+5bgo1zM2NXobscobgqfz/EnI=;
 b=mlb8ngma/npFz1NfA2R5IC6MLlUCcrj1mG83XwznmVS+xtkjQq/T7yQO
 7wJOGeE8ELiELRrSYPKANUCVlwZzlctdp9Nw2ymEXm2Gk7mgRfdDcgDzw
 R6KgC+3QP/yTIAyH3Hi0WokTkAlXUwW1nMe67pFER8+5YC3V+k0SLC1x1
 Ko8OTriBk0v4wclYwD0ffHu3+c7J2HKUnFF0J5s/oE06u4D8uVMXP+9Mo
 Ff1ihNUjoKEw4RBrEbSLUzpwDX94ArtM62rnkCtIONbjsBVuhnO9EsFmb
 SrMWxriDxkqV8W9gDafBlz732pMWki+MO/io5fgVyNYN6orB7psuZRsxX Q==;
X-CSE-ConnectionGUID: zA5zs2aSShSfR3nRE0Ghjw==
X-CSE-MsgGUID: 1vv5byfZQ6WCMrUU/IsdEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100064628"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100064628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:11 -0700
X-CSE-ConnectionGUID: 41Q6xor9QDCb5OEvBADpuw==
X-CSE-MsgGUID: T7WtwTltTv2TIv+leGCWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275503342"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:11 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 09/13] drm/i915: Extract commit_dsb_max_cmds()
Date: Wed,  9 Sep 2026 19:17:26 +0300
Message-ID: <20260909161730.12969-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

The code to determine the number of required DSB commands for
the commit is now split into two parts in a messy way, and the
comment explaining the numbers is completely ditached from the
place that actually has those numbers. Consolidtate it all into
a single function that makes sense.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 31 +++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7741f1395375..d7bd1b862aa9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7402,29 +7402,40 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 	intel_color_prepare_commit(state, crtc);
 }
 
+static unsigned int
+commit_dsb_max_cmds(const struct intel_crtc_state *crtc_state)
+{
+	/* just enough to start the chained DSB */
+	if (!crtc_state->use_dsb && !crtc_state->use_flipq)
+		return 16;
+
+	/*
+	 * Rough estimate:
+	 * ~64 registers per each plane * 8 planes = 512
+	 * Double that for pipe stuff and other overhead.
+	 * ~4913 registers for 3DLUT
+	 * ~200 color registers * 3 HDR planes
+	 */
+	if (crtc_state->plane_color_changed)
+		return 8192;
+	else
+		return 1024;
+}
+
 static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	unsigned int size = new_crtc_state->plane_color_changed ? 8192 : 1024;
 
 	if (!new_crtc_state->use_flipq &&
 	    !new_crtc_state->use_dsb &&
 	    !new_crtc_state->dsb_color)
 		return;
 
-	/*
-	 * Rough estimate:
-	 * ~64 registers per each plane * 8 planes = 512
-	 * Double that for pipe stuff and other overhead.
-	 * ~4913 registers for 3DLUT
-	 * ~200 color registers * 3 HDR planes
-	 */
 	new_crtc_state->dsb_commit = intel_dsb_prepare(state, crtc, INTEL_DSB_0,
-						       new_crtc_state->use_dsb ||
-						       new_crtc_state->use_flipq ? size : 16);
+						       commit_dsb_max_cmds(new_crtc_state));
 	if (!new_crtc_state->dsb_commit) {
 		new_crtc_state->use_flipq = false;
 		new_crtc_state->use_dsb = false;
-- 
2.54.0

