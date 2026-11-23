Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8E606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LeJed9ad
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4410F24C;
	Mon, 23 Nov 2026 22:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149BB10ECED;
 Mon, 23 Nov 2026 22:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474322; x=1827010322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=isqNn2VCNBTXAtM3j+1kV+sou8KKnfFc/OPXmSKqmPI=;
 b=LeJed9ad1jhD9luWo3591NUtaksIPoJvMRSbIYjijSMdR8WYW52mO5nx
 CZ3BRYNavOTgPMjAzHfMYfg8NunE3XsfnJdLEX4RavXM7nzUT7h80wGSQ
 2YJzjcCNslW7puTgrMFPDompQUlFS2Q3S5FmA0ZX/j244zZUjYN4T3O8B
 1cg0khZ1HOd7Gewr2VAwwRMTCD+Z+ueyAq922FwtH/ALJAsdyecDAm3Qn
 oViosYHPdr/t4MDq+7ja8En/R0SAkGH6QkmhNrCzJPQWKPLCdz+hY7y4T
 7FBNKgwcCAcQxlqrEHxWDilWFCKSCGcYaXDoZhyGrHwCWMr3j8oTsv3vP g==;
X-CSE-ConnectionGUID: HCPzIMTERZiFw4P109gd1w==
X-CSE-MsgGUID: ZBiW+ZIzSuGlRx2EYMUIVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4276463"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4276463"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:02 -0800
X-CSE-ConnectionGUID: C/qiOLxeQ6udKtjICMvmvw==
X-CSE-MsgGUID: myDuEL8jRwWXYTdXdQ5R6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13400350"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:52:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/9] drm/i915/fdi: Pass the full atomic state to
 ilk_check_fdi_lanes()
Date: Tue, 24 Nov 2026 00:51:34 +0200
Message-ID: <20261123225139.23087-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

ilk_check_fdi_lanes() is currently using the crtc_state_uapi.state
footgun. Get rid of it by passing the full atomic state all the
way from the top.

The crtc_state->uapi.state pointer is only valid up to
swap_state() after which it becomes NULL. Thus any code
using it cannot be reused between atomic_check() and
atomic_commit(). It's best if people just forget that
the pointer even exists. Then they are forced to pass in
the atomic state explicitly, thus guaranteeing its existence.

And while there, let's also eliminate all the redundant function
parameters. All we need is the overall state, the crtc, and the
one output parameter.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fdi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index c170d3104e4c..2a823494f8b2 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -182,13 +182,16 @@ static int pipe_required_fdi_lanes(struct intel_crtc_state *crtc_state)
 	return 0;
 }
 
-static int ilk_check_fdi_lanes(struct intel_display *display, enum pipe pipe,
-			       struct intel_crtc_state *pipe_config,
+static int ilk_check_fdi_lanes(struct intel_atomic_state *state,
+			       struct intel_crtc *crtc,
 			       enum pipe *pipe_to_reduce)
 {
-	struct drm_atomic_commit *state = pipe_config->uapi.state;
-	struct intel_crtc *other_crtc;
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *pipe_config =
+		intel_atomic_get_new_crtc_state(state, crtc);
 	struct intel_crtc_state *other_crtc_state;
+	struct intel_crtc *other_crtc;
+	enum pipe pipe = crtc->pipe;
 
 	*pipe_to_reduce = pipe;
 
@@ -226,7 +229,7 @@ static int ilk_check_fdi_lanes(struct intel_display *display, enum pipe pipe,
 
 		other_crtc = intel_crtc_for_pipe(display, PIPE_C);
 		other_crtc_state =
-			intel_atomic_get_crtc_state(state, other_crtc);
+			intel_atomic_get_crtc_state(&state->base, other_crtc);
 		if (IS_ERR(other_crtc_state))
 			return PTR_ERR(other_crtc_state);
 
@@ -247,7 +250,7 @@ static int ilk_check_fdi_lanes(struct intel_display *display, enum pipe pipe,
 
 		other_crtc = intel_crtc_for_pipe(display, PIPE_B);
 		other_crtc_state =
-			intel_atomic_get_crtc_state(state, other_crtc);
+			intel_atomic_get_crtc_state(&state->base, other_crtc);
 		if (IS_ERR(other_crtc_state))
 			return PTR_ERR(other_crtc_state);
 
@@ -326,15 +329,12 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
 
 static int intel_fdi_atomic_check_bw(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc,
-				     struct intel_crtc_state *pipe_config,
 				     struct intel_link_bw_limits *limits)
 {
-	struct intel_display *display = to_intel_display(crtc);
 	enum pipe pipe_to_reduce;
 	int ret;
 
-	ret = ilk_check_fdi_lanes(display, crtc->pipe, pipe_config,
-				  &pipe_to_reduce);
+	ret = ilk_check_fdi_lanes(state, crtc, &pipe_to_reduce);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -377,7 +377,7 @@ int intel_fdi_atomic_check_link(struct intel_atomic_state *state,
 		    !crtc_state->hw.enable)
 			continue;
 
-		ret = intel_fdi_atomic_check_bw(state, crtc, crtc_state, limits);
+		ret = intel_fdi_atomic_check_bw(state, crtc, limits);
 		if (ret)
 			return ret;
 	}
-- 
2.56.1

