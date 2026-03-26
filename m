Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3B10A88E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C95F10EB0E;
	Thu, 26 Mar 2026 17:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfXq0BaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BD610EA91;
 Thu, 26 Mar 2026 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545333; x=1806081333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/i9pvL2e8jNpXwLRarSRvZR/PxrW3QJVNkffTBCeFrg=;
 b=MfXq0BaSvCNyhahYNuTHreqBLMQ3pQFT08HkJH//axYq8bebB13RC2Q9
 0ZGoV52T6B2NOwNliH7x+KxzA6lzwWJlv/6y461LaCj+f9/gXtIOTP8Be
 PMMDpZGtS//t3qxfmuq5bgxclgPU+BATkJ/gAJPhER08XZ0JhrRjlswlA
 fyj+hEHn6aFeIWewOADL1PAFE0uvTHAAKpO5P733yeywmx3G0/zjgDmhu
 1rKxRGvN+FF79fKysPY0/5amy+EfhwelDET+DiDnRPwmld/B9xXb/ImON
 OKZESbJ4KdjNWSp8Zv75Q5O19FPISl7B7DXNbAjw6XfBH2HmgE6EYf4FM A==;
X-CSE-ConnectionGUID: orkpIzvEQKybL/qIMwLFvA==
X-CSE-MsgGUID: 753lbR6dRCOZ5vTXi6YTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630582"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:33 -0700
X-CSE-ConnectionGUID: ZNqbBKNQTE6hWOXGwLnYRw==
X-CSE-MsgGUID: IjzfZ0N0TWuyradicCnVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975585"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:31 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 10/19] drm/i915/display: Remove unused dc3co_exitline from
 intel_crtc_state
Date: Thu, 26 Mar 2026 22:45:48 +0530
Message-ID: <20260326171557.2065632-11-dibin.moolakadan.subrahmanian@intel.com>
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

Remove dc3co_exitline from struct intel_crtc_state, as it is not
used anywhere in the driver.

Also remove the corresponding register read in intel_psr_get_config().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 -
 drivers/gpu/drm/i915/display/intel_psr.c           | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 60366087038f..0a327c4df98d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1192,7 +1192,6 @@ struct intel_crtc_state {
 	bool pkg_c_latency_used;
 	/* Only used for state verification. */
 	enum intel_panel_replay_dsc_support panel_replay_dsc_support;
-	u32 dc3co_exitline;
 	u16 su_y_granularity;
 	u8 active_non_psr_pipes;
 	const char *no_psr_reason;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40adbd1c8ddc..987d49536548 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1822,7 +1822,6 @@ void intel_psr_get_config(struct intel_encoder *encoder,
 	if (DISPLAY_VER(display) >= 12) {
 		val = intel_de_read(display,
 				    TRANS_EXITLINE(display, cpu_transcoder));
-		pipe_config->dc3co_exitline = REG_FIELD_GET(EXITLINE_MASK, val);
 	}
 unlock:
 	mutex_unlock(&intel_dp->psr.lock);
-- 
2.43.0

