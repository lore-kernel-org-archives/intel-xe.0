Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C673FA1FD4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B310EEA5;
	Wed, 22 Apr 2026 16:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhQQV54y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7894A10EE9A;
 Wed, 22 Apr 2026 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875181; x=1808411181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yoyUG7SFRRQOOQdVgX/1MVfyn4quaI7LH/Nuhbxez3A=;
 b=ZhQQV54y717Qa+rVOhmtqmRxNVCW8LJy0b4mDdsredXhMqSo+PyzQGgj
 UvUROtiW8wzq35MbVpzdCB24C6DBZpYnNp8uKO71sp7Yp+V1CqWgJnp03
 rNfXz3fugGUAboDkaPJxUD+eqxFnMgQUWQXrAyPELUo4LuqetVhtXOfhk
 cj35sKinZYL7Rfj6UL+nQUEbrxVARH5bzFWWgz0Q7i7w3w8mFKJ12WlIr
 /Cz3C0FHqd/TCHuQ85U4+EBjNgi9UA8SJqMUppf8NCIubDNzfm/pXqdR6
 XTlIuAeyVw3gXKOAIBFDvNTIDzyqb9CU0TyO7EMokIev7sVsOPEIh3epN g==;
X-CSE-ConnectionGUID: T3m+q0zaR7mmz9dM0a2csQ==
X-CSE-MsgGUID: xBAKw4ZGRMqRvMcC8PAhww==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247616"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:21 -0700
X-CSE-ConnectionGUID: 94QWlhNlSzGr07eMyxyc/A==
X-CSE-MsgGUID: 2kNBfzuTSs+t+Wrgqf/6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816173"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:19 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 09/13] drm/i915/display: PSR2: Set idle_frames to 0 for
 DC3CO
Date: Wed, 22 Apr 2026 21:56:17 +0530
Message-ID: <20260422162622.1869831-10-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_psr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 2e0478e3d560..ff9ce7d2a5aa 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1069,10 +1069,11 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
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

