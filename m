Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D7EED61F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C1F10E687;
	Fri, 15 Sep 2023 17:47:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AC910E677;
 Fri, 15 Sep 2023 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800013; x=1726336013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ZurH9uHeYjOkHmpKNhkMDg35vl0KxSjF4/nYf5iANQ=;
 b=J2JKuVZ5jihDJZ7SBcTWZJ2kxZEeEV3lmjwgcyTKm4g4spQxxqhP97Yz
 tTrkKGPenh5sLdSsEjXbLn/pMqhBBBsrMWLSdx4li+HIt3Ipeq3SQ7tKD
 fH99a6N27pKPwubTA+8BykXKM5GS9RUhQmD+St8V2enApllnjV2hLSHQ7
 CYeIop9BQUKJMIuyrl1qOH3azD6j/bGNCPDnCLmJU/SC5tr2TVvetUczu
 73LtsljCsL2nsqauLEMlfqpHg9fpIuDAqffzfOUdrM0EeKxsjedv5SF+5
 ymYg/rIMnfn+ISWfuAs9Z8TULkLwnIQZN7AirRIplrhWSsXNdW9yppSbO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445779293"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445779293"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868818320"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868818320"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:46:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:46:50 -0700
Message-Id: <20230915174651.1928176-30-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915174651.1928176-1-lucas.demarchi@intel.com>
References: <20230915174651.1928176-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 29/30] drm/i915/xe2lpd: Write DBuf after CDCLK
 change in post plane
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Mika Kahola <mika.kahola@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Previously we always updated DBuf MBUS CTL and DBUF CTL regs after
CDCLK has been changed(CDCLK_CTL), however for Xe2-LPD we can't do like
that anymore. According to BSpec, we have to first update DBuf regs and
then write CDCLK regs, when CDCLK is decreased, which we do in post
plane.

So now we do CDCLK post plane update only after DBuf regs are
written (CDCLK/MDCLK separation requires MDCLK/CDCLK ratio to be written
to DBuf regs).

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6bbc9069754c..84c09958cca7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7040,7 +7040,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* Now enable the clocks, plane, pipe, and connectors that we set up. */
 	dev_priv->display.funcs.display->commit_modeset_enables(state);
 
-	if (state->modeset)
+	if (state->modeset && DISPLAY_VER(dev_priv) < 20)
 		intel_set_cdclk_post_plane_update(state);
 
 	intel_wait_for_vblank_workers(state);
@@ -7087,6 +7087,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	intel_dbuf_post_plane_update(state);
 	intel_psr_post_plane_update(state);
 
+	if (state->modeset && DISPLAY_VER(dev_priv) >= 20)
+		intel_set_cdclk_post_plane_update(state);
+
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		intel_post_plane_update(state, crtc);
 
-- 
2.40.1

