Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF1FC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038FA10EC26;
	Wed, 22 Jul 2026 04:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwK38KEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBF010EC26;
 Wed, 22 Jul 2026 04:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695784; x=1816231784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3nvJZQZyJeh/8UjhKNI4yHk0AwbYHR2wj2uBcv2Cys=;
 b=TwK38KEExRrgcOV2zLKkjytp0fPIfsLBkpOCyFUcrwYlnCIEL1Q58Gys
 SP2Ew/1EInZVOkYnXeSVLHJ14DjvNx0Cm2ngVFDINmlPa6z+FhQW3jmcc
 A1RorUCgvIZXEpWHgQuXGUYR7qT/IoUy/ouiey9A96vDBvN9ZABmA0QKk
 jLhMAFvpfoex5fc09/tXNG3/jwTMz44yxUVsnZBG+Es/9ODjVpqkyWCFq
 5/ojZ9okMU4A4WSbzub8jW/UHv1dWf2cbjgyu6Huo1QoN2I0m0SK25iAf
 XTsJprYi0oOe/IUQxxeFWX9VSUz2V6PxtLjxjhp314i6Bkskc+wVTafcc g==;
X-CSE-ConnectionGUID: vWyP9Cw+R4OhZ83gTP4YiA==
X-CSE-MsgGUID: 1Yn7LV08RKeA8zZ+sN5ISg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298482"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:44 -0700
X-CSE-ConnectionGUID: FUU0Gq1FRoKtnnbEA/n/ag==
X-CSE-MsgGUID: OWu16WDgSYaafgdTeHlp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603218"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:40 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in case
 of CMRR enabled
Date: Wed, 22 Jul 2026 10:09:13 +0530
Message-ID: <20260722043923.3241977-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
enabled.

--v2:
- Restrict selective update config check (Ankit)
- Commit message change

--v3:
- Commit changes

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40e3d7095996..6a90ded5d1fa 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1587,6 +1587,12 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_display *display = to_intel_display(intel_dp);
 
+	if (crtc_state->cmrr.enable) {
+		drm_dbg_kms(display->drm,
+			    "Selective update cannot be enabled when CMRR is enabled\n");
+		goto unsupported;
+	}
+
 	if (HAS_PSR2_SEL_FETCH(display) &&
 	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
 	    !HAS_PSR_HW_TRACKING(display)) {
-- 
2.48.1

