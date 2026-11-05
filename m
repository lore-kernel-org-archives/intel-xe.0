Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C17606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGpUcgsB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAE3112A2D;
	Thu,  5 Nov 2026 23:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D9F10E20B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921544; x=1825457544;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=pzwcyRByWODeZtDQ+mxg598aHDMfNwFxoPjKs3Lyw9c=;
 b=kGpUcgsB2m42+Z0fds6CKpiMdFVKfCZ++HGxyI7DBdg27TukkZvGL73y
 6LTDdYBwhgJaI/4au10PjK3MWsXrW/zfaw8pDTPcVDJSnUDz4ASHQJTBa
 vdffwd8cwuZGCZ2pAI0RYHavj+tHr6FGKMVT2ttd9ifBAlON1JohwiwEK
 hIDfl2ZYmMQoByS/Xla0GDkUqrZnp0nyWJl5ezCoKaYKu2TvSgZsezCq0
 xhnuJ317xPlOst++bSbM7gPyCGQimMB6wS+obmmTh9SjB99ee/pizWs1y
 PCE2aCPeh1WLdxNH0jkG8fBF6t6WrXGgvXII9y+P2nNC12pQWkd5Bo3yD Q==;
X-CSE-ConnectionGUID: F3z7rHQIRyWTFmyvz68uJA==
X-CSE-MsgGUID: QuLk+BwNS2GkMuPZBk2sFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769902"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:20 -0800
X-CSE-ConnectionGUID: mJrmJqoFQR2x8kAhY6Sc1w==
X-CSE-MsgGUID: XjGuyd5pTwiy0MmIWautfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7186917"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:18 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:48 -0300
Subject: [PATCH v3 01/10] drm/xe: Bail from adjust_idledly() if in VF mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-1-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both Wa_14025941587 and Wa_16023105232 apply adjustments to
RING_IDLEDLY and take different approaches to avoid SRIOV VF mode.

Let's converge them into a consistent approach.  Since
adjust_idledly() should avoid SRIOV VF irrespective of what
workarounds are enabled, choose to add an early return in that
function instead of having each related workaround add
FUNC(xe_rtp_match_not_sriov_vf) to their rules.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c  | 6 ++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 55ee0c892c1e..50e8c5103bdc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -611,8 +611,10 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	bool wa_applied = false;
 	bool clamped_below_maxcnt = false;
 
-	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
-	    XE_GT_WA(gt, 14025941587)) {
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
+	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
 		u32 mincnt_idledly_ns = 5000;
 
 		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 61aa50a63764..ba02a7a53b73 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -74,7 +74,7 @@
 		GRAPHICS_VERSION(3510)
 14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
 14027054324	GRAPHICS_VERSION(3511)
-14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
+		MEDIA_VERSION_RANGE(1301, 3503)
 16030224309	GRAPHICS_VERSION_RANGE(3510, 3511)
 14028709524	GRAPHICS_VERSION(3510)

-- 
2.56.0

