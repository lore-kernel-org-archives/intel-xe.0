Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5F8606A324
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QN/8Z5ED
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A352112955;
	Fri, 30 Oct 2026 17:14:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227C112940;
 Fri, 30 Oct 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380439; x=1824916439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ePUHD/7BED/xa9So2qAsFOozkmvb8edIHI2hVNjElM=;
 b=QN/8Z5EDcevYPsMH5zjrUT7I9ZMvc0ZmEDsGLsG6S2uMq5SVuPS32hVW
 sy+7nM0yx8WHKB9uLoheMGtHh89iH2Rnl3m3g59LLw96kBc9+2xUQ8VsV
 wX29TybWx+JmTdy0UgEF7vyXkS8v95PvvgivXFHPciFtjGTEzasbLkPDX
 iruWMDi2SKgOa3MAIgBN0aDSGoH7QuXy3OHe3dvFH1hoovomcjRDXyWfp
 R59r5s+dGIVATcUrhA29OzYqUduKrU3IMWYSPRH53rqR2cUBtCG4YINCG
 PKBx4T4O1kAhCtpibjJw8y1cQOHZt/nnrNemmmg4kqAClx40Hn1TnJyRn w==;
X-CSE-ConnectionGUID: Y+wDCcVTRkqe7fKCwo/ZAg==
X-CSE-MsgGUID: 30xoIVWpQY68Q8+Atrsf0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144558"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:59 -0700
X-CSE-ConnectionGUID: L3fegPb5RNibjAkdCc/GDA==
X-CSE-MsgGUID: H5Zi+0RzTDmvysIdur5Zbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490931"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:58 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 06/10] drm/i915: Wait for timing generator to start in
 intel_crtc_vblank_on() on HSW+
Date: Fri, 30 Oct 2026 19:13:22 +0200
Message-ID: <20261030171327.29829-7-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The HSW+ modeset sequences (perhaps excluding DSI) should now do the
intel_crtc_vblank_on() calls after the timing generator has actually
been started. However it looks it may take a few moments until the
scanline counter actually starts to tick. Wait for that to happen
before we enabled vblank interrupts for the pipe. This should
guarantee that the vblank machinery will never see the frame/scanline
counters jumping erratically, which can cause real problems.

As for DSI, I have no hardware to test it, so can't tell whether
we're calling intel_crtc_vblank_on() in a good spot or not. I
guess we'll eventually find out when someone tries runs this on
machine with DSI...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index fe7af983f9f5..ae720e400073 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -128,8 +128,21 @@ u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
 
 void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
+	/*
+	 * Make sure the timing generator has really started so
+	 * the sampled frame/scanline counter values don't jump
+	 * erratically.
+	 *
+	 * TODO do this for older platforms as well after
+	 * rearranging the modeset sequence a bit.
+	 */
+	if (DISPLAY_VER(display) >= 9 ||
+	    display->platform.broadwell || display->platform.haswell)
+		intel_wait_for_pipe_scanline_moving(crtc);
+
 	crtc->vblank_psr_notify = intel_psr_needs_vblank_notification(crtc_state);
 
 	assert_vblank_disabled(&crtc->base);
-- 
2.55.0

