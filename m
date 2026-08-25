Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD0BC5DF9C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056310E8E7;
	Tue, 25 Aug 2026 06:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX/9Xq9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987210E8EC;
 Tue, 25 Aug 2026 06:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638772; x=1819174772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qiNokZXjGQEKJETXRt5jm3/LrvjPdbbFyptOBGNVyGw=;
 b=HX/9Xq9VOuwIKGak5weD8hBUXSaef/ey5DtWzzsaMZl2hkUu2rPksGCN
 Q5/dix/GHg0QnQ98gtVb4QEFi47DG/3dQRnuimCGIYGewr5kRATot52rQ
 D0LugJjSd4x3E6JCkOCZzCGIqmzCH0yYhCwCV/L2BZ4Z/yjfoNTs8FM6d
 XYx2WqnvmXU8ly99+z27+ioQktf46AckpQl23DNR3BEhN6wUCSD5QURq1
 ZfvMzre2dpr25s5N8iHvSqgxVfUGojbFtf0hH31i2xuOKJMxBRjA1PMCr
 PnZnCaE3SXt184jxBqq+lletPXWPKZq9tb6ZFJeTDsvIUlUP3ZQXbEN2D Q==;
X-CSE-ConnectionGUID: 8SDH5aSVR222wZ3RjI9yGg==
X-CSE-MsgGUID: MpoLULLMSeWouRWzpkxtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112677"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:32 -0700
X-CSE-ConnectionGUID: GLXRXvjDTqG1+KoVznPiRA==
X-CSE-MsgGUID: UOhgK48UTsCm73ZDG8YpRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263912983"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:30 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM
Date: Tue, 25 Aug 2026 11:15:31 +0530
Message-Id: <20260825054536.3455704-11-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Issue a AUX write transaction to DPCD DP_TOTAL_LTTPR_CNT (0xf000a)
with total number of LTTPR before link training.

v2: Cosmetic changes. [Suraj]

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c        |  9 ++++++++-
 .../drm/i915/display/intel_dp_link_training.c    | 16 ++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 890bf2488554..d23f3bdf1339 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -563,7 +563,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
-	u32 alpm_ctl;
+	u32 alpm_ctl, alpm_ctl2, lttpr_count;
 
 	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
 					  !crtc_state->has_lobf))
@@ -613,6 +613,13 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 
 	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(crtc_state->alpm_state.check_entry_lines);
 
+	lttpr_count = drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
+
+	alpm_ctl2 = intel_de_read(display, ALPM_CTL2(display, cpu_transcoder));
+	alpm_ctl2 &= ~ALPM_CTL2_NUMBER_OF_LTTPR_MASK;
+	alpm_ctl2 |= ALPM_CTL2_NUMBER_OF_LTTPR(lttpr_count);
+
+	intel_de_write(display, ALPM_CTL2(display, cpu_transcoder), alpm_ctl2);
 	intel_de_write(display, ALPM_CTL(display, cpu_transcoder), alpm_ctl);
 	mutex_unlock(&intel_dp->alpm.lock);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cb92cff90614..1d5873cb64f5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -2265,6 +2265,20 @@ intel_dp_128b132b_link_train(struct intel_dp *intel_dp,
 	return passed;
 }
 
+static void intel_dp_update_lttpr_count(struct intel_dp *intel_dp,
+					int lttpr_count)
+{
+	/*
+	 * Program only for DP2.1 and return if LTTPR revison is less than 0x20
+	 * where 0:3 represents minor rev and 4:7 represent major rev
+	 */
+	if (!intel_dp_is_edp(intel_dp) ||
+	    intel_dp->lttpr_common_caps[0] <= 0x20)
+		return;
+
+	drm_dp_dpcd_writeb(&intel_dp->aux, DP_TOTAL_LTTPR_CNT, lttpr_count);
+}
+
 /**
  * intel_dp_start_link_train - start link training
  * @state: Atomic state
@@ -2304,6 +2318,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 
 	intel_dp_prepare_link_train(intel_dp, crtc_state);
 
+	intel_dp_update_lttpr_count(intel_dp, lttpr_count);
+
 	if (intel_dp_is_uhbr(crtc_state))
 		passed = intel_dp_128b132b_link_train(intel_dp, crtc_state, lttpr_count);
 	else
-- 
2.29.0

