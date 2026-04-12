Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276DCE937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E274F10E29E;
	Sun, 12 Apr 2026 11:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGpZ+/Zp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6510E2A8;
 Sun, 12 Apr 2026 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992086; x=1807528086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQH5h69LBxuyyYtWHrpoV3x96lIVgojT7kz8aotSxpI=;
 b=bGpZ+/ZpKOZvh6ep+YBDlE1FDcKw1cnCoLHJT12Iikd3EsIIjONynjw0
 wkPHFyId9IciojsYGM5QJDH4OnqNsBqI8JSwzZcM8/OV2DgXQN6OicHLe
 u3rV4oGAeKUg77nGZvbJBaKYnIxB1rWaDOA9CwXmPmMUoNb5/yycftya8
 i97UJfBaE+16DFOLqVAnQPVUeGSY6kz4Ese4RXkYz4vFwMiQNLhL8zMlU
 1S2iUAJQCZEbdxbLiIX1HCxO3siEDB9BqauRrJ5snNo9xMJ55xeWUgBH/
 hoeyp9P4nJu5kdOAEubz8lJm8vQ3/QR367ScROvLmc6ck+HaQCLMy+KWp g==;
X-CSE-ConnectionGUID: 8Fz9B+tWTJaKbK2FIeU5rw==
X-CSE-MsgGUID: WSzZYaNJQn6iHJys/E1rFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115123"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:08:06 -0700
X-CSE-ConnectionGUID: psp318ThTyKq0vGEdZyd2Q==
X-CSE-MsgGUID: tSDo7uKkTbiH3/yz/59fLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507739"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:08:03 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 08/13] drm/i915/cmtg: Split CMTG support check from
 intel_cmtg_is_allowed()
Date: Sun, 12 Apr 2026 16:07:07 +0530
Message-Id: <20260412103712.4021213-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
References: <20260412103712.4021213-1-animesh.manna@intel.com>
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

Introduce a dedicated hook to check whether CMTG is supported. This
helper is used in both the enable and disable sequences, while
intel_cmtg_is_allowed() is now used only in enable path.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index f9cfb639b9fd..c043fb4f9789 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -82,6 +82,18 @@ static void intel_cmtg_dump_config(struct intel_display *display,
 		    str_yes_no(cmtg_config->trans_b_secondary));
 }
 
+static bool intel_cmtg_is_supported(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
+	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
+		return true;
+
+	return false;
+}
+
 static bool intel_cmtg_transcoder_is_secondary(struct intel_display *display,
 					       enum transcoder trans)
 {
@@ -190,11 +202,9 @@ void intel_cmtg_sanitize(struct intel_display *display)
 bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
-	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct i915_power_domains *power_domains = &display->power.domains;
 
-	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
-	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
+	if (intel_cmtg_is_supported(crtc_state) &&
 	    power_domains->target_dc_state == DC_STATE_EN_DC3CO)
 		return true;
 
-- 
2.29.0

