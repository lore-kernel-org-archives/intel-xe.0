Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEE9CD98E8
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9B810EB43;
	Tue, 16 Jun 2026 12:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngEAdFRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481010EB3B;
 Tue, 16 Jun 2026 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613958; x=1813149958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vr8eTxTh9ecTPSdPR7SBWgm0G0f2gMpSVgbAewEvI78=;
 b=ngEAdFRzPpDMntw17RSQg8AsEDoHaMuXr2RshfS6dnrdGow/g/MehBis
 Fv/Bep77ApDMYyzwdMAYnBsf9px63kuHvGYGHHNgmxH2u3ncctIF/IxTR
 9lEBOIjAKyui7HQPFE4gkrB4TP1S1mKuenbpz6zA4lkGmLeEMYkHW2OYa
 jb6Fcy7tuKPQRsyqlbKK1biCNajGZwyP9KMjwfrDPkQS2XE1g1qlUCF8p
 A8nVLD5nTev5zStZDEtUP+7V7outXEKkhtmSzuD0tWr6LW2DkXP+qrNDs
 zOjBzKRBqiiIRiHKOX94lWIXCMpr6XkWCmeFL5ubsAKPYD9qonznkewl0 A==;
X-CSE-ConnectionGUID: echqEfVKTwGNpJpf+q2bGg==
X-CSE-MsgGUID: W5N1YoA1Rp60xy0dzWgong==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513286"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:58 -0700
X-CSE-ConnectionGUID: YEtxEk9PTOmN4WRowwRNTQ==
X-CSE-MsgGUID: NV5QcP3/TjGxXuJptgaS9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876369"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:57 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 32/39] drm/i915/display: PSR2: Set idle_frames to 0 for DC3CO
Date: Tue, 16 Jun 2026 18:14:08 +0530
Message-ID: <20260616124416.2442161-33-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

Force idle_frames to 0 when DC3CO is eligible.

Changes in v2:
- Extend existing Wa_16025596647 condition
  instead of adding a new if block (Uma Shankar)

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 0f4263885416..091da8341b0f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1082,10 +1082,11 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 	u32 psr_val = 0;
 	u8 idle_frames;
 
-	/* Wa_16025596647 */
-	if ((DISPLAY_VER(display) == 20 ||
-	     IS_DISPLAY_VERx100_STEP(display, 3000, STEP_A0, STEP_B0)) &&
-	    is_dc5_dc6_blocked(intel_dp) && intel_dp->psr.pkg_c_latency_used)
+	/* DC3CO / Wa_16025596647 */
+	if (intel_dp->psr.dc3co_allowed ||
+	    ((DISPLAY_VER(display) == 20 ||
+	      IS_DISPLAY_VERx100_STEP(display, 3000, STEP_A0, STEP_B0)) &&
+	     is_dc5_dc6_blocked(intel_dp) && intel_dp->psr.pkg_c_latency_used))
 		idle_frames = 0;
 	else
 		idle_frames = psr_compute_idle_frames(intel_dp);
-- 
2.43.0

