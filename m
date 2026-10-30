Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD29606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RFLZVy/a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0910E8AE;
	Fri, 30 Oct 2026 22:58:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9CA10E3E2
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793401086; x=1824937086;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=LhrZQIXOrgiwKw3klVms9EP5azEzdD0yppe02a6kWU8=;
 b=RFLZVy/a3qjROWkYm5ogMNRmOS3lSZbVa3ykVPIPADMGgpr7cwCSNOtA
 jsTfTx7jYsipncMXEKEl4M6KjD55C29for2Rb3HcGatXU6Ssx97rqJTEt
 K/44Nkgry4847gBWgLGrJnB6zevC74lCiPzyysruOnhqlwUt8Z2GFoY9O
 Q3ZHLpYJHYTicGLsEHLHslPrt63x5IhGX0ELXZbsPMOqTXY1epMKCTGcp
 dhUuElXnixc8PmAAcSbUYCx01FkaND7Opv9rj4xpLKTQVo4VMqFHKxfsK
 Qp6K/TwfFe9O4mzeUiDguThP1AgzSxqmD9FzbEZKRsY0MJSqaO0JuXLOD g==;
X-CSE-ConnectionGUID: EIvKOsQ+SgKowT0+S+zBqw==
X-CSE-MsgGUID: 031nSz1hSca4XJYVstJvTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2197983"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2197983"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:06 -0700
X-CSE-ConnectionGUID: OaiBpeggRKGLmyJiVLdQ9w==
X-CSE-MsgGUID: bJn0zV8tTci7mSDmzSe1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5637693"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 30 Oct 2026 19:57:40 -0300
Subject: [PATCH v2 01/10] drm/xe: Bail from adjust_idledly() if in VF mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-wa_16031259911-v2-1-919fa1c27070@intel.com>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
In-Reply-To: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
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
index 96132c6e3340..0774f6d5a81f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -74,6 +74,6 @@
 		GRAPHICS_VERSION(3510)
 14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
 14027054324	GRAPHICS_VERSION(3511)
-14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
+		MEDIA_VERSION_RANGE(1301, 3503)
 16030224309	GRAPHICS_VERSION_RANGE(3510, 3511)

-- 
2.56.0

