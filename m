Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D6CD5BD5
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFFE10E6E2;
	Tue, 26 May 2026 19:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJqZjll9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923010E6E2;
 Tue, 26 May 2026 19:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823149; x=1811359149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bp0ZqlZBe6qyoUsuxM3UzttEB1/j0g/z3VNZFIMz/qc=;
 b=PJqZjll98D2vWQfKT4pTv6BQAQMKAKFHw84bITDoRXJvq9b0pK+o36K9
 opRAwn9Mq6vxuSCYMEia8AYXeIHXv7uL1GYkYUpU9pj25hc6oHS/0hVY9
 TuCxIP9wFFUpAnnZxpfoJT23dPo3bddrlN1x9Lf2HhWG9tusZMNPgK7z9
 7dC06ke8iR2WG+1ts5G5Kges20IuZD5T5UD3j+SYFacO4vdVLx4M+tswT
 V8Bk5KYKxfF9B+jzYY7CNjgpCgH74SH5bdtvDiSoP+Jmnsgk1r+j9EBsk
 RVUY/WJ/W7RGn+DUJsoax6l6YOckkagjI37D5VE4DrT7RCcJRH0UsdY3O g==;
X-CSE-ConnectionGUID: vSl9C1xwRgmJZja1BWh0bQ==
X-CSE-MsgGUID: 5FTuMkxLQ8qvj9OU368Aog==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83226298"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="83226298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:09 -0700
X-CSE-ConnectionGUID: OVoXk4aMT+Ok2kYNzjGx/w==
X-CSE-MsgGUID: ZyVhwD7qR561rqExStYcXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237841893"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:19:08 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: [PATCH v4 09/13] drm/i915/display: PSR2: Set idle_frames to 0 for
 DC3CO
Date: Wed, 27 May 2026 00:48:22 +0530
Message-ID: <20260526191826.3786009-10-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
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
index d4b294beecef..b4ce3d49d76e 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1079,10 +1079,11 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 	u32 psr_val = 0;
 	u8 idle_frames;
 
-	/* Wa_16025596647 */
-	if ((DISPLAY_VER(display) == 20 ||
-	     IS_DISPLAY_VERx100_STEP(display, 3000, STEP_A0, STEP_B0)) &&
-	    is_dc5_dc6_blocked(intel_dp) && intel_dp->psr.pkg_c_latency_used)
+	/* DC3CO / Wa_16025596647 */
+	if (intel_dp->psr.dc3co_eligible ||
+	    ((DISPLAY_VER(display) == 20 ||
+	      IS_DISPLAY_VERx100_STEP(display, 3000, STEP_A0, STEP_B0)) &&
+	     is_dc5_dc6_blocked(intel_dp) && intel_dp->psr.pkg_c_latency_used))
 		idle_frames = 0;
 	else
 		idle_frames = psr_compute_idle_frames(intel_dp);
-- 
2.43.0

