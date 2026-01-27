Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A459D2F000
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 12:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57210E566;
	Tue, 27 Jan 2026 12:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRU+H9E2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B802D10E564;
 Tue, 27 Jan 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769517700; x=1801053700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSA+lE+pCXhSeJ8oCqx9dsBaNBh7AwlCLB5uywrEk5I=;
 b=BRU+H9E2xAX5bF8DPloSrnIZfX/pHmZL+vWi9EL+Eg/AtCW7xbdhSpva
 FLV1YWKt/2vqRlsT8Pc0pJHCFZW1lAd4r79e6wXZg0sm37CD1CaiNS+Uz
 4Tw9i72jgy/qguQuPr6JK4uK3/w7tVt2pywlUUUHel1BU9mhHMjJU1hgW
 YDCB94aw3mQ4jtfWhpQwzHOTnjyGdTNZLIfYcEyDRgi270uXkI5MMSlU/
 UJqbkp7ZERUJmYSJ6V15kQF4nILfIpeMBDHGS1v0lA1CbNBcixp6SgCgA
 fQ1JGa3YsR9X76ZyN8K/A1ntblsZcOIbfsvcLZNySWCQ0UjauZZd2bqT2 g==;
X-CSE-ConnectionGUID: ASJFyrPMQXibW7YMbxPrPA==
X-CSE-MsgGUID: iSmtAd+GQ6mHOmi85i1t2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70767645"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70767645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:40 -0800
X-CSE-ConnectionGUID: jEY1jY0QQIePBg+20Bznow==
X-CSE-MsgGUID: deZnl/wiRu2rQSDqQ/vvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239231222"
Received: from ettammin-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 04:41:38 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v11 03/11] drm/i915/vrr: Add helper for parsing value to be
 written into TRANS_PUSH
Date: Tue, 27 Jan 2026 14:41:12 +0200
Message-ID: <20260127124120.1069026-4-jouni.hogander@intel.com>
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

On Lunarlake and onwards it is possible to generate PSR "frame change"
event using TRANS_PUSH mechanism. As a preparation add new helper to parse
value to be written into TRANS_PUSH register. Setting
LNL_TRANS_PUSH_PSR_PR_EN is done in upcoming change.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index db74744ddb31..f26989c74268 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -676,6 +676,22 @@ intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
 	intel_de_write(display, PIPEDMC_DCB_BALANCE_RESET(pipe), 0);
 }
 
+static u32 trans_vrr_push(const struct intel_crtc_state *crtc_state,
+			  bool send_push)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	u32 trans_vrr_push = 0;
+
+	if (intel_vrr_always_use_vrr_tg(display) ||
+	    crtc_state->vrr.enable)
+		trans_vrr_push |= TRANS_PUSH_EN;
+
+	if (send_push)
+		trans_vrr_push |= TRANS_PUSH_SEND;
+
+	return trans_vrr_push;
+}
+
 void intel_vrr_send_push(struct intel_dsb *dsb,
 			 const struct intel_crtc_state *crtc_state)
 {
@@ -690,8 +706,7 @@ void intel_vrr_send_push(struct intel_dsb *dsb,
 
 	intel_de_write_dsb(display, dsb,
 			   TRANS_PUSH(display, cpu_transcoder),
-			   TRANS_PUSH_EN | TRANS_PUSH_SEND);
-
+			   trans_vrr_push(crtc_state, true));
 	if (dsb)
 		intel_dsb_nonpost_end(dsb);
 }
@@ -876,7 +891,8 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 vrr_ctl;
 
-	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder), TRANS_PUSH_EN);
+	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder),
+		       trans_vrr_push(crtc_state, false));
 
 	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
 
-- 
2.43.0

