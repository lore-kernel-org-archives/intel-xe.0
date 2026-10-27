Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D54606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 04:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DlDu6ubw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038A310E218;
	Tue, 27 Oct 2026 04:39:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66CD10E1B4;
 Tue, 27 Oct 2026 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793075933; x=1824611933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0eKY7ef5t5p6uzEYZt6fIYR+9rOzfSXzphA0VBrucho=;
 b=DlDu6ubwaLLR43SN4Xt4YhLqY8mJrf9zcqVU/odhVF2GbIIDpQDd6TVY
 npxY/r3eVg9DniqUbPTbiYC8PdHh+M+5M51f+u/tFx1YChzkCRVjwDcWO
 jP+sTbJDFDYHNoNGMB4jjFkiZLnnOuDZE7M1TBiKqpsalbUFHxh0+nbGj
 qazgWgPcewJr88qGpF1fuqMpU8S6rDMOmLTuM5A0m3hwDubXK0by7XFsj
 BrHAgo8O9eL6iaCbzn6+dMbCPUsxLt5uDzJfGhDEE7WFAPY/6omiEwVo7
 bun9bc8togW/jiPkC/Ez4qK1CCEMypnZkIxF/BHlUpFWzHVK7F/ZUOXU8 A==;
X-CSE-ConnectionGUID: rbBCx/B4Tcet33d3vvCfaA==
X-CSE-MsgGUID: x2LGMo4MRdW5eE/TziDSDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1676394"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1676394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 21:38:53 -0700
X-CSE-ConnectionGUID: H64OD67ETzCSI5ZaFRj61A==
X-CSE-MsgGUID: 9AgTeVGmRpW6KkFsjnIqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4402355"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by orviesa003.jf.intel.com with ESMTP; 26 Oct 2026 21:38:51 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 Vidya Srinivas <vidya.srinivas@intel.com>,
 Charlton Lin <charlton.lin@intel.com>
Subject: [PATCH v2] drm/i915/display: Limit scaler count and disable pipe
 joiner on WCL
Date: Tue, 27 Oct 2026 09:58:56 +0530
Message-ID: <20261027042856.1906320-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261007072334.1801956-1-vidya.srinivas@intel.com>
References: <20261007072334.1801956-1-vidya.srinivas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pipe joining is not supported in the WCL display configuration.
Modes that would require joining are rejected, matching the
4k 60Hz maximum resolution documented for the platform.

Also, WCL support single pipe scaler instead of two.

Bspec: 74286

v2: Rebase onto latest upstream

Suggested-by: Charlton Lin <charlton.lin@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++++-
 drivers/gpu/drm/i915/display/intel_dp.c             | 4 ++--
 drivers/gpu/drm/i915/display/skl_scaler.c           | 7 ++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index f17fc2c68472..c74256359c25 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1813,7 +1813,10 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
 		for_each_pipe(display, pipe)
 			display_runtime->num_scalers[pipe] = 0;
-	else if (DISPLAY_VER(display) >= 11) {
+	else if (DISPLAY_VERx100(display) == 3002) {
+		for_each_pipe(display, pipe)
+			display_runtime->num_scalers[pipe] = 1;
+	} else if (DISPLAY_VER(display) >= 11) {
 		for_each_pipe(display, pipe)
 			display_runtime->num_scalers[pipe] = 2;
 	} else if (DISPLAY_VER(display) >= 9) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 00e02e019d25..ef164a797618 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -485,9 +485,9 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 			return false;
 	}
 
-	return DISPLAY_VER(display) >= 12 ||
+	return ((DISPLAY_VER(display) >= 12 && DISPLAY_VERx100(display) != 3002) ||
 		(DISPLAY_VER(display) == 11 &&
-		 encoder->port != PORT_A);
+		 encoder->port != PORT_A));
 }
 
 static int dg2_max_source_rate(struct intel_dp *intel_dp)
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509..3c1037ddf47d 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -377,12 +377,17 @@ calculate_max_scale(struct intel_crtc *crtc,
 		 * scaler supports a vertical scaling factor
 		 * of more than 1.0, while a horizontal
 		 * scaling factor of 3.0 is supported.
+		 * On versions > 30, no downscaling
+		 * on second scaler
 		 */
 		*max_hscale = 0x30000 - 1;
 
 		if (scaler_id == 0)
 			*max_vscale = 0x30000 - 1;
-		else
+		else if (DISPLAY_VER(display) >= 30) {
+			*max_hscale = 0x10000;
+			*max_vscale = 0x10000;
+		} else
 			*max_vscale = 0x10000;
 	} else if (DISPLAY_VER(display) >= 10 || !is_yuv_semiplanar) {
 		*max_hscale = 0x30000 - 1;
-- 
2.45.2

