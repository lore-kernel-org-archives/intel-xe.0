Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B1606A323
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rnv38ZCJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1610E7F5;
	Fri, 30 Oct 2026 17:13:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946810E7F5;
 Fri, 30 Oct 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380420; x=1824916420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JjwL7EYklkYRd0hWWXAN4MQYwa+GOXDUB6H41Gjyxg=;
 b=Rnv38ZCJP3fhZDCQw0TXGg03druCthDOKWdwwLWdxpzZe8AOaVPMFWZ0
 zGU9tBjSr4qpuXaDNHAkKuTRtCoK429Bg2JnrPjPkTDiaaXYKrYqHRePa
 yrEUMCRhbKJdoT5fakzMpCVyrNvC2F0SB+IYjHic0XVUI/GGfRZEaKSS5
 AlKpFdUvASL825bXRc4TPikv+oduCPjqvSrue/BpfrrIMPjtyFaqNjKUw
 ON9JOuOJeMJuvdLSyUB1PJE3IHwc/S8GQWAytsDfT94zlflB2xaMxzpGV
 EX34TD77zoNfB7LL500/E4iA7kGRMRLh+C9ZnK6hKNoI/iVKPxaV03z9K A==;
X-CSE-ConnectionGUID: otqLU8G5QNy7TXyW/g2muw==
X-CSE-MsgGUID: lw6mfTLyTZGMJA6K+lyYbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2053868"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2053868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:40 -0700
X-CSE-ConnectionGUID: ggDsJG0fRcmhNM+KvqUDTA==
X-CSE-MsgGUID: O44TLAvoSfymQeObMISBfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5625258"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/10] drm/i915: Do intel_crtc_vblank_on() later on HSW+
Date: Fri, 30 Oct 2026 19:13:18 +0200
Message-ID: <20261030171327.29829-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We are doing intel_crtc_vblank_on() too early. The timing generator
doesn't actually start until:
HDMI: DDI_BUF_CTL is enabled, TRANSCONF is already enabled earlier
DP SST: switching DP_TP_CTL to normal mode or enabling TRANSCONF.
        The order varies between the platorms a bit, but whichever
        happens last is the important step

All of that is guaranteed to have happened after
intel_ddi_enable_{dp,hdmi}() have been called, not before.
Reorder the function calls appropriately. This takes care of the
typical use cases. Fixing the more exotic port sync case will
need a bit of extra work.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ed7d4cbbfb5a..9fb455d980ce 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3572,6 +3572,11 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 
 	intel_ddi_wait_for_fec_status(encoder, crtc_state, true);
 
+	if (is_hdmi)
+		intel_ddi_enable_hdmi(state, encoder, crtc_state, conn_state);
+	else
+		intel_ddi_enable_dp(state, encoder, crtc_state, conn_state);
+
 	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state) {
 		const struct intel_crtc_state *pipe_crtc_state =
 			intel_atomic_get_new_crtc_state(state, pipe_crtc);
@@ -3579,13 +3584,7 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 		intel_crtc_vblank_on(pipe_crtc_state);
 	}
 
-	if (is_hdmi)
-		intel_ddi_enable_hdmi(state, encoder, crtc_state, conn_state);
-	else
-		intel_ddi_enable_dp(state, encoder, crtc_state, conn_state);
-
 	intel_hdcp_enable(state, encoder, crtc_state, conn_state);
-
 }
 
 static void intel_ddi_disable_dp(struct intel_atomic_state *state,
-- 
2.55.0

