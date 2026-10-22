Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749D606A323
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m5p8kX9k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8FF112521;
	Thu, 22 Oct 2026 11:56:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4D112510;
 Thu, 22 Oct 2026 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670168; x=1824206168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+902+lcafMm8ogysjgt3NCO969tcjdr7Js2f9bfCT+Q=;
 b=m5p8kX9kJF3VIx3v0szI9vfdTGESvX60EusbdDjSt9wvjukWe0ZzSQYO
 gk87+SBfzGETFSWd4ahadkDUbaaFTSmiAd5a/i9iW2hXKgK85StPdWILv
 rqlJsQ1bDLuoArYfSo08gZvtAcPJxexEs2/WaT2FD+tUgi3UM0cQn2zYy
 8Fjui1aINLIu7G4FmsrQtP424N/OxxzM3z6jZ/YoVOvMphy54Qkdswxpv
 gQig4x2wFK+ZFR+v5/UQUYEM3bZMvJssM2vN05zfmtsfwsTAnJ1LYQoyK
 q57Ydu5aLAlDmOUBANe3EcgdKyeQHFki6eJZFLmjDkglJBZENFWVcu4uA A==;
X-CSE-ConnectionGUID: +etP3xeuR4q6gufnNbqPzg==
X-CSE-MsgGUID: t1/ZRN4HRs6qq53rFTtUiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1426734"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1426734"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:08 -0700
X-CSE-ConnectionGUID: D1yAUheqTsSr2Jj8oIIyfA==
X-CSE-MsgGUID: pFjEqIf7TPGCkuCRmHEhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3396009"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Skip redundant frame/scanline/time reads for
 async flips
Date: Thu, 22 Oct 2026 14:55:48 +0300
Message-ID: <20261022115548.32678-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
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

The frame/scanline/time information we read out at the
start of intel_pipe_update_end() is never used if we
we are performing an async flip. Skip the redundant work.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 829ff2a2c025..139c9dae536e 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -732,15 +732,19 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
-	int scanline_end = intel_get_crtc_scanline(crtc);
-	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
-	ktime_t end_vbl_time = ktime_get();
+	ktime_t end_vbl_time;
+	u32 end_vbl_count;
+	int scanline_end;
 
 	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
 
 	if (new_crtc_state->do_async_flip)
 		goto out;
 
+	scanline_end = intel_get_crtc_scanline(crtc);
+	end_vbl_count = intel_crtc_get_vblank_counter(crtc);
+	end_vbl_time = ktime_get();
+
 	trace_intel_pipe_update_end(crtc, end_vbl_count, scanline_end);
 
 	/*
-- 
2.55.0

