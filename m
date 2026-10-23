Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F96606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQsFfTC+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADB110E2A8;
	Fri, 23 Oct 2026 21:12:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0E10E6E8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789830; x=1824325830;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yBNJp+5iRVbf9AVG2bOG4ITJ5Sy+oC87BGHgVT4R3XI=;
 b=EQsFfTC+wFsGvHGKngUayPKgeXcWNYOezIdiewxh9KeMCBURqjiQbq92
 e5WR6p/CjsVWPj8m9f7wVCgvjKx0O6iV73/6JVvGET3m45x4dYe40YOR0
 RA3Vjk1le0ndFRtqCtifsxddHHHjCqqqblHgMIucwEPVMiiRmSy0MZOti
 ET/CXbRSxsmkwE//JK4bekUSzwGTXNd+lEIZNBgEUaXeXCyyhyp3MCjmN
 pvQxK6AYRnpYMbVVyIkA6QPBQJFaHoOfRzrOaI0UZ5nzqzd8j5xNCPQkF
 8PGNAEXpby/7+gCRi8t0hh2jkqT7jIdC44I4i/Ab9cd3if6pL2obJ6bio w==;
X-CSE-ConnectionGUID: PWJwCttVQ2anRK/CXW5T1w==
X-CSE-MsgGUID: uon+vgVaST+AYiAFzf/vjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562580"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562580"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:30 -0700
X-CSE-ConnectionGUID: CvUOW1+hTYC5H/sVe4ROUA==
X-CSE-MsgGUID: 9yGMyxizSwyaDjNutW0bhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804709"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:28 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:29 -0300
Subject: [PATCH 01/10] drm/xe: Bail from adjust_idledly() if in VF mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-1-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
In-Reply-To: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index f35181fc4e49..6a1d5250ba1b 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -73,6 +73,6 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
-14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
-		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
+		MEDIA_VERSION_RANGE(1301, 3503)
 16030224309	GRAPHICS_VERSION(3510)

-- 
2.56.0

