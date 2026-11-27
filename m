Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A70606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n4DhmOvf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6479D112BEB;
	Fri, 27 Nov 2026 16:02:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B6112BEA;
 Fri, 27 Nov 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795795359; x=1827331359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GdiwaJI8MTRwkbK+qJZv3+tXyxRnRLCM2fE2rlUph6o=;
 b=n4DhmOvfEfgpm/7TA9ZYYFjXB3pTRIBDErJ7iYxexYR+v5LkojhQJ1dG
 1Pr0GVDxBt72ll82lzbdvVw9o0E2XtZer1sKKnG0m5wbIpdvPHCO/IAWG
 aGVWA9jjPqhc8AO1Ymrh9uAzOa0RURT4rjM3yeEKxRaLGxRUD8zay3iVY
 5abDxEmPO26XNrSjelRFZrv+6Ns0I2qc5n7n7wRd0vjTq+lTgO9VURTJA
 BpIwgFhuNZ4sYIa4drgmiq0bnlMI4yNihDgjXHUErHuDQ8/0sg68/5K6B
 pr4MLGPJNVRaWVcsmrpyns6kwkfGCXUXBnFHDjkvbgUrRH2R8p8CEa+gs w==;
X-CSE-ConnectionGUID: jEPQII0xRNi2DHp555s+uA==
X-CSE-MsgGUID: 30hdelZ4Raul5nhWDCM+hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4776448"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4776448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 08:02:39 -0800
X-CSE-ConnectionGUID: UmHiN81US3WErydxlnA36w==
X-CSE-MsgGUID: FMbjQvlHQSOtnyrZpW/4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12292616"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa004.jf.intel.com with ESMTP; 27 Nov 2026 08:02:38 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Leave the PSR frame change to the joiner
 primary
Date: Fri, 27 Nov 2026 16:02:35 +0000
Message-ID: <20261127160235.3208777-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With PSR2 on joined pipes the secondary's DSB also sends the trans push
and polls the PSR2 status of the primary's transcoder. The poll gets no
response and the DSB times out:

 [CRTC:354:pipe B] DSB 0 response timeout
 [CRTC:354:pipe B] DSB 0 timed out waiting for idle (current head=0x140, head=0x0, tail=0x180)

Both are per transcoder and the primary already does them. Skip them
on the secondary when the primary is in the same commit.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 19caae633d29..f9d0a5972feb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7649,6 +7649,11 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 
 	if (new_crtc_state->commit_type == INTEL_COMMIT_DSB &&
 	    !intel_color_uses_chained_dsb(new_crtc_state)) {
+		struct intel_crtc *primary_crtc = intel_primary_crtc(new_crtc_state);
+		/* One transcoder: the joiner primary pushes and waits for PSR */
+		bool via_primary = primary_crtc != crtc &&
+			intel_atomic_get_new_crtc_state(state, primary_crtc);
+
 		/*
 		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
 		 * trans push case to ensure we are not waiting two vblanks
@@ -7656,7 +7661,8 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		if (!intel_psr_use_trans_push(new_crtc_state))
 			intel_dsb_wait_vblanks(new_crtc_state->dsb_commit, 1);
 
-		intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
+		if (!via_primary)
+			intel_vrr_send_push(new_crtc_state->dsb_commit, new_crtc_state);
 
 		/*
 		 * Wait for idle is needed for corner case where PSR HW
@@ -7665,8 +7671,9 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		 * here for both Frame Change mechanism (trans push
 		 * and register write).
 		 */
-		intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
-					    new_crtc_state);
+		if (!via_primary)
+			intel_psr_wait_for_idle_dsb(new_crtc_state->dsb_commit,
+						    new_crtc_state);
 
 		/*
 		 * In case PSR uses trans push as a "frame change" event and
-- 
2.43.0

