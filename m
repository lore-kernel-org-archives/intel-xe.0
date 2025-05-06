Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FCBC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 14:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5CE10E6CD;
	Tue,  6 May 2025 14:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0KkPOGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0C010E6D7;
 Tue,  6 May 2025 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746543461; x=1778079461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/JZjVZmL17FbzbZerbmRlMVIqtxGWgEiDqCo/N/qXM4=;
 b=l0KkPOGbZfkB5L52YU0shwHAODrMn0ZNws2fy4U/Vf0i/3sYIcSE4ZKE
 XXVlGimcvKyoVf4EOSG3WpO4/B6QNHsLaniMobPlUUbfKO6QxEBgz7zdR
 aJfvVZaUZspN7lySAPwuDMbldYVfD7uQPBQgJqBQ4YeWJzo2PPr9iXIsi
 n0l9998fifvMUdGZSonEE1xZV1pGHrvkn1FCKULWmAjtrbf0wNyOVhsAE
 l8U7Yiw6C3zL1LtDNLOCvXGv/jq2sSPa6ZNqqUShHdWw6y6J0m4UFVBOd
 ainESJryP/VbIewdSJeLYf8MWClAvDOZZtE9IqEqRNz9gazf/2NkW6QDP w==;
X-CSE-ConnectionGUID: n6yf8XffTrqGU5E6tHDoXg==
X-CSE-MsgGUID: 4qL5KBZuTJOVjGGsQwsueQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59206152"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59206152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:57:41 -0700
X-CSE-ConnectionGUID: mqyZ8xBFSZ616qERm4hrWQ==
X-CSE-MsgGUID: IR7hMSs/S9q8w3sziNp7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="166572250"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2025 07:57:39 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ville.syrjala@intel.com
Subject: [PATCH v4 14/17] drm/i915/vrr: Restructure VRR enablement bit
Date: Tue,  6 May 2025 20:25:14 +0530
Message-ID: <20250506145517.4129419-15-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250506145517.4129419-1-mitulkumar.ajitkumar.golani@intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Restructure bits for VRR enablement.

--v2:
- Separate multiple enablement from one patch.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 25 ++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 420ee917d6a9..92a1bd18fa7a 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -623,6 +623,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 ctl;
 
 	if (!crtc_state->vrr.enable)
 		return;
@@ -637,29 +638,29 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_de_write(display, TRANS_PUSH(display, cpu_transcoder),
 		       TRANS_PUSH_EN);
 
-	if (!intel_vrr_always_use_vrr_tg(display)) {
-		if (crtc_state->cmrr.enable) {
-			intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
-				       VRR_CTL_VRR_ENABLE | VRR_CTL_CMRR_ENABLE |
-				       trans_vrr_ctl(crtc_state));
-		} else {
-			intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
-				       VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state));
-		}
-	}
+	ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
+	if (crtc_state->cmrr.enable)
+		ctl |= VRR_CTL_CMRR_ENABLE;
+
+	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), ctl);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_display *display = to_intel_display(old_crtc_state);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
+	u32 ctl;
 
 	if (!old_crtc_state->vrr.enable)
 		return;
 
+	ctl = trans_vrr_ctl(old_crtc_state);
+	if (intel_vrr_always_use_vrr_tg(display))
+		ctl |= VRR_CTL_VRR_ENABLE;
+
+	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), ctl);
+
 	if (!intel_vrr_always_use_vrr_tg(display)) {
-		intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
-			       trans_vrr_ctl(old_crtc_state));
 		intel_de_wait_for_clear(display,
 					TRANS_VRR_STATUS(display, cpu_transcoder),
 					VRR_STATUS_VRR_EN_LIVE, 1000);
-- 
2.48.1

