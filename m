Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D89CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 05:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0C810EC12;
	Thu, 28 May 2026 05:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtlsZubX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0C410EC06;
 Thu, 28 May 2026 05:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779944540; x=1811480540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j4IRDBKWWVd3Hx5eMzYZUuswfQAqEg144JkteJSeb0A=;
 b=EtlsZubXJ5vhNgqJOIQA6V2+EQKBd4mNeLp2dOuz05U4b55C4Ssvrt15
 UjUYqbLYTCw8rDvpZ4EWYPOvW+1hetQJkK3hrwbbhoKihhZExtnVag9Qn
 uYWcvpWqFsdUxJwB0xszCjz22bdlV15+yiTTgyt1eonG0vK1x+QfJwtdn
 DctOawh4cgYlwW9HoFe6iiJrkjYmmT5pa23PUTDnqxlb1aQ/YnQGLmOln
 Qrj2i/nqbl0uQ8MLwQTc6cX3hAAMYoam4lQZ4klRkPf4OnnEoyNco0jgs
 wbrnIKBMPybUobecgw+C4g5R9466+W1znc30LvUCzkrnw4ELFK1N1yhTh w==;
X-CSE-ConnectionGUID: QUTI858kRPCC04/qT31/dQ==
X-CSE-MsgGUID: mnKaVG5RQbmZ8zY9ZR6Prw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80895722"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80895722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:20 -0700
X-CSE-ConnectionGUID: 00NWhH4JQc6FADIVxG6qsw==
X-CSE-MsgGUID: b2R/sP9cQ0ieDSXZ4D9bAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="238025981"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:19 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2 15/17] drm/i915/display: program CMTG before DC3CO enable
Date: Thu, 28 May 2026 10:31:29 +0530
Message-ID: <20260528050131.466351-16-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f4d11bd91e72..f04ca01dbf30 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7518,6 +7518,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct intel_power_domain_mask put_domains[I915_MAX_PIPES] = {};
 	struct ref_tracker *wakeref = NULL;
 	u32 target_dc_state;
+	bool cmtg_status = false;
+	bool dc3co_allowed = intel_display_power_dc3co_allowed(display);
 
 	/*
 	 * Delay re-enabling DC states by 17 ms to avoid the off->on->off
@@ -7635,7 +7637,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
-	intel_cmtg_program(state);
+	if (dc3co_allowed)
+		cmtg_status = intel_cmtg_program(state);
 
 	intel_wait_for_vblank_workers(state);
 
@@ -7732,7 +7735,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	}
 
 	if (intel_display_power_dc3co_supported(display)) {
-		if (intel_display_power_dc3co_allowed(display)) {
+		if (dc3co_allowed && cmtg_status) {
 			/*
 			 * Use minimal re-enable delay to allow DC3CO entry on
 			 * the next idle frame, unlike the 17ms guard needed to
-- 
2.43.0

