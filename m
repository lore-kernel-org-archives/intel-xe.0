Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE6606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fmH8N96b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B010EC36;
	Mon, 26 Oct 2026 08:29:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFE210EC36;
 Mon, 26 Oct 2026 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793003353; x=1824539353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjuTioj8c35eU02CdZOyIDS8CLMwO4r04IMFYlCBE+Y=;
 b=fmH8N96bHTTYs1MdMkoYDF7eIdgovCE15HVEtIZu+1ssobrw1Iv46nJl
 J8NSDACC1xeRd+a650/zDIQ6gE6SkDZvqjD0uw8Shjv5qcgshNKw9NQjd
 dOOu1he2SjebFn6LdGqWeLaFvJ2fdTtbHnYPjKpdEK8uvf6KDOHTYyax/
 f4aPcHngqU2Pz4MEfvLWqv2H5Au6YX92/Qw1SerPMgpshV36LULpaybJv
 XgV7eAS6mD6J49u1YdwNMmI1imYvfWMOFQhnwlwTJ/FAX0VdwIe2fDjfX
 sYb2Asfz4DndEiBxwF7Ge+wD/4cTmHI5pkikqDK1VqDtOcEnSqbjrFGvq w==;
X-CSE-ConnectionGUID: Qp7e6qNsT5ykgTauvlCvvQ==
X-CSE-MsgGUID: ZA7eokMmSKylBH8K/39hsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1547731"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1547731"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 01:29:13 -0700
X-CSE-ConnectionGUID: RL7b1lgxSzmfNcxVTN8WXA==
X-CSE-MsgGUID: MyqmGknyQaOQ97yAGHUZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6033394"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.190.238.88])
 by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 01:29:12 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 1/1] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
Date: Mon, 26 Oct 2026 13:58:46 +0530
Message-ID: <20261026082906.802048-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026082906.802048-1-animesh.manna@intel.com>
References: <20261026082906.802048-1-animesh.manna@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
sequence, before intel_encoders_disable(). With this ordering, the wait
for CMTG_STATE to clear after CMTG_ENABLE is cleared intermittently
times out:

  xe 0000:00:02.0: [drm] CMTG: A disable timeout
  WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]

This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
disables and re-enables the eDP across modesets and suspend/resume.

Move the CMTG disable after intel_encoders_disable(), so the eDP-side
teardown (panel unprepare, ALPM disable, backlight off) has completed,
but keep it before intel_encoders_post_disable() and
intel_dpll_disable(). The transcoder timing generator, DDI buffer and
port PLL are therefore still running while CMTG_STATE is polled, and
the requirement to disable CMTG before the transcoder and the port PLL
feeding it are turned off is preserved.

v2:
- Modify commit description regarding PSR exit. [Dibin]
- Add fixes tag. [Jani, Dibin]
v3:
- Add a cover letter with links to v1 and v2 for the review
  history. [Dibin]

Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index afe70e9ce347..5e40487e9ab0 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc *pipe_crtc;
 
-	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
-		intel_cmtg_set_clk_select(old_crtc_state);
-		intel_cmtg_disable(old_crtc_state);
-	}
 	/*
 	 * FIXME collapse everything to one hook.
 	 * Need care with mst->ddi interactions.
 	 */
 	intel_encoders_disable(state, crtc);
+
+	/*
+	 * Disable CMTG after the encoders are disabled, but before the
+	 * transcoder and port PLL are torn down in
+	 * intel_encoders_post_disable()/intel_dpll_disable().
+	 */
+	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
+		intel_cmtg_set_clk_select(old_crtc_state);
+		intel_cmtg_disable(old_crtc_state);
+	}
+
 	intel_encoders_post_disable(state, crtc);
 
 	intel_dpll_disable(old_crtc_state);
-- 
2.43.0

