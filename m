Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DDB107BCC6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E32C10EB9F;
	Fri, 13 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goAgYtLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393D10EB9B;
 Fri, 13 Mar 2026 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417809; x=1804953809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RauPyOCV3ty+QCdbiEjBIUH4y0BRazfXiRBmY2cdu68=;
 b=goAgYtLvstAWT19mok99wlMAWXifff4SixpX7ARmH44UwqOuysD5W3mK
 Hdh7A/aMCLZQcSBrgOEknt8Zm3nR1WbUc8ilgyWQcoBStsbouAQMKk0KK
 7XArN/0svUMRYWV9eljTTCvEfXixnkrzN+u+23jswW/ZOWw8xc528yqN1
 q6VPj6APQh7jKfGCxN0MNC8Is5XS2VmlNzLAQRz9zUp6gRkCNQGkZ7GzU
 YxUD0wtwBunjZ6Kzbj/qi8M/RsS9UhkGoHylHl/jAXpUfZN9UOcdCVOwl
 WQ39LCYCCz77YcqX1UZGTEeKSuBVVOasShpVq3TVtiXow3xgYiu36aJS1 Q==;
X-CSE-ConnectionGUID: 08nhNeL5Suq33DTv4qbhVw==
X-CSE-MsgGUID: RfiaFisBSZq9hsldu34xOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715458"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715458"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:03:29 -0700
X-CSE-ConnectionGUID: snADfxs6SLuGHc3vj0EJcA==
X-CSE-MsgGUID: fyJfQoZ4TFWKjDXHhFIDBQ==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:03:27 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 12/12] drm/i915/cmtg: disable CMTG if dc3co entry condition
 not met
Date: Fri, 13 Mar 2026 21:03:00 +0530
Message-Id: <20260313153300.3530695-13-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

DC3co entry condition can change dymamically and disable
CMTG if entry condition is not met for DC3co.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6febf569889f..f20d5ebe06ed 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1029,6 +1029,15 @@ static bool intel_crtc_lobf_disabling(const struct intel_crtc_state *old_crtc_st
 		 (new_crtc_state->update_lrr || new_crtc_state->update_m_n));
 }
 
+static bool intel_crtc_dc3co_disabling(const struct intel_crtc_state *old_crtc_state,
+				       const struct intel_crtc_state *new_crtc_state)
+{
+	if (!old_crtc_state->hw.active)
+		return false;
+
+	return is_disabling(dc3co.enable, old_crtc_state, new_crtc_state);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -6926,7 +6935,8 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
 
-	if (crtc->cmtg.enabled && intel_crtc_vrr_enabling(state, crtc)) {
+	if (crtc->cmtg.enabled && (intel_crtc_vrr_enabling(state, crtc) ||
+				   intel_crtc_dc3co_disabling(old_crtc_state, new_crtc_state))) {
 		intel_cmtg_disable(new_crtc_state);
 		intel_cmtg_mask_interrupt(new_crtc_state);
 	}
-- 
2.29.0

