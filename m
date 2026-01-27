Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769F5D2F00E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 12:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAD210E564;
	Tue, 27 Jan 2026 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXMHLQPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6610E562;
 Tue, 27 Jan 2026 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769517701; x=1801053701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZewjcD2O1hK7WJrE2bkhTajFmpLFBJDrCvKru+3g1oQ=;
 b=YXMHLQPiC13I+0yVhuWMR6oNojECylcmf1+AHQhn/3eJZjqvFRYj7UtP
 dluyTpabR9vkkD3nrVgbeYLeDHtxHaQRm4Zbhoc1FU/0llOb0XEa8mz1D
 gFtX/cmkPkt0G27q4ugzUj6G9OAQtySpdcmM4TwUnVsnjQQkAOntDEVny
 QQWIdReQPYgP8ioeN6XHR9yzDkePwD+0hTFWSqIYa9F5oGgd9FkB3RuPE
 fYnq0WIBX9ahwu2himgvGuwQpQFYrOeRl62ngvqqW3tpZGCG8Zq58sZJp
 quCcsIAvVFwDpkFUa8MfMxXnOTNnyKvZj0KpxE6JRi9liBtZx52Gr6FwY g==;
X-CSE-ConnectionGUID: Cf/dLc+eRlaYnyyMOd3UdA==
X-CSE-MsgGUID: kwTowIDLQnScsJyIa0MAdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70767647"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70767647"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:41 -0800
X-CSE-ConnectionGUID: kWfMEJ1lSzCVGLMuoDFZRQ==
X-CSE-MsgGUID: 5evWL38MQeS2Q0HKPLtwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239231225"
Received: from ettammin-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:39 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v11 04/11] drm/i915/vrr: Add helper for PSR to enable Frame
 Change event on trans push
Date: Tue, 27 Jan 2026 14:41:13 +0200
Message-ID: <20260127124120.1069026-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127124120.1069026-1-jouni.hogander@intel.com>
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add new helper to enable PSR Frame Change event generation using trans push
mechanism. This helper is to be used by PSR code on PSR enable.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 9 +++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index f26989c74268..66c68e7f3a49 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -973,6 +973,15 @@ void intel_vrr_transcoder_disable(const struct intel_crtc_state *old_crtc_state)
 		intel_vrr_tg_disable(old_crtc_state);
 }
 
+void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder),
+		       trans_vrr_push(crtc_state, false));
+}
+
 bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->vrr.flipline &&
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index bedcc8c4bff2..4f16ca4af91f 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -33,6 +33,7 @@ void intel_vrr_dcb_increment_flip_count(struct intel_crtc_state *crtc_state,
 					struct intel_crtc *crtc);
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state);
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state);
+void intel_vrr_psr_frame_change_enable(const struct intel_crtc_state *crtc_state);
 void intel_vrr_get_config(struct intel_crtc_state *crtc_state);
 int intel_vrr_vmax_vtotal(const struct intel_crtc_state *crtc_state);
 int intel_vrr_vmin_vtotal(const struct intel_crtc_state *crtc_state);
-- 
2.43.0

