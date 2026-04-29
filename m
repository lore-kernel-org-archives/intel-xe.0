Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3236FCCFA18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AF210EF0E;
	Wed, 29 Apr 2026 09:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOrG6W6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614EA10E3D5;
 Wed, 29 Apr 2026 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454823; x=1808990823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EfkpPvgybYC/xFcqsiWSxLHVgGhwk0JbDcbFNCBiu8A=;
 b=EOrG6W6wVhtc/mCox7wkKl6M40QzEOAH0Be3UxdiqHjTRkyqVNqnVAL9
 uA0uoxm6C2v4hLWYGOro05yHThPEtgbH91L/hgjxNSnytSTGH7Ibj+Sa8
 35Yi8r/ghYsWS/RndRmKxBdullVSnhXeWWXuAt3J+DWpujhwiyOuyMDnw
 rS7PBNtXoY2kFRFKlJbeaaQV0KqtWASu5wmvrltyAdGVcZMqjQMV/iKnX
 sHRuvFtUUnKsLWIBt5yaV770b3Uv8iz7D16C1/8BcV6xY7PAg9xgrXsjy
 Z00PQq0px51KB0gL4yTOL+bBvBT1qYI9VhtXmHiKKAG/qQYO7Y8dMNgWq w==;
X-CSE-ConnectionGUID: LAOdvFZRRV+TlpnmN7eiyw==
X-CSE-MsgGUID: 1686NsukRnSTWHN8B9c2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95946310"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95946310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:27:03 -0700
X-CSE-ConnectionGUID: gGI1kvbJR7OScrEmWUnxSg==
X-CSE-MsgGUID: ZB3IADG1S3OxFs9ztxALOQ==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:27:01 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v3 09/13] drm/i915/display: PSR2: Set idle_frames to 0 for
 DC3CO
Date: Wed, 29 Apr 2026 14:57:03 +0530
Message-ID: <20260429092707.485696-10-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
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

