Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C665110A88D4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB8E10EAA8;
	Thu, 26 Mar 2026 17:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esl0mSXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A8B10E9AE;
 Thu, 26 Mar 2026 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545324; x=1806081324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOm+YQIuUvHejsfV+0upTfvCP4kMBvEtqZ7O2r/JQmQ=;
 b=esl0mSXtj0MKjY52ey4Y6tVLb0rGnak3nVaPhjsYswOPTfXEhL/msHaK
 twvFLj77LwIy5aNoQ96glPFBoXlGnnX0a1zq1cMjtWLQz8/HUsK7LcHBh
 94Sssf4MBw/7NOiD9a0I2oFokPoEk2hlf11OQcHSeljy+fGq5K5WOM/qR
 lsN58CYQq5u8BkvpKh24jiT36W9uOgAnQz7iEyyoCZfr0vLDqdT9vQ91a
 glvo1YiNDqJp4HMwl9W2y9YpdB8NBMkBHcqDK3lQXFTA1QiDod2g+rqmc
 eQKdR1JzynBcGoagp3IY/qY8m9DC2BqTdV3MxyFzf1pxKsOWMQuUMzSQv A==;
X-CSE-ConnectionGUID: q3taVmpUSxCFYMrEx+Qjrw==
X-CSE-MsgGUID: qb0c1Lg1Sk+p40LfyAGIXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630565"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:23 -0700
X-CSE-ConnectionGUID: OOeMLJD8Sr6J+nx/st5WDA==
X-CSE-MsgGUID: fCpec7hPRDS2htLvxw81KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975548"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:21 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 05/19] drm/i915/display: Validate target DC state against
 allowed_dc_mask
Date: Thu, 26 Mar 2026 22:45:43 +0530
Message-ID: <20260326171557.2065632-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Validate the requested target DC state against allowed_dc_mask to
avoid programming unsupported DC states.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 0afae5c2f62b..12967db27c8d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -302,6 +302,13 @@ void intel_display_power_set_target_dc_state(struct intel_display *display,
 	struct i915_power_domains *power_domains = &display->power.domains;
 
 	mutex_lock(&power_domains->lock);
+
+	if ((state & power_domains->allowed_dc_mask) != state) {
+		drm_dbg_kms(display->drm,
+			    "Rejecting DC state 0x%x (allowed mask 0x%x)\n",
+			     state, power_domains->allowed_dc_mask);
+		goto unlock;
+	}
 	power_well = lookup_power_well(display, SKL_DISP_DC_OFF);
 
 	if (drm_WARN_ON(display->drm, !power_well))
-- 
2.43.0

