Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99371CD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F09210EAB6;
	Tue, 16 Jun 2026 12:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1pF6gjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132510EAB6;
 Tue, 16 Jun 2026 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613922; x=1813149922;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8uTDKqCMEz1R9aKbt083HPdJeBZQTCEQ50eVhDzXph4=;
 b=l1pF6gjdBaVZJaHiG9BCJkPhx8XFyVh2XIiz5Pop3bxXzymkeRsBGMUa
 8I1P/0Rr+pQ8TyAKNIzrdi69XOMql8pasEkJVaFAwyOzahqmxqEF2+kLV
 k7ry1Oibf1sMNhI98j2N9bN2ozO5dRMUaJXQsSrHnFdXHVC2KUdpRLJDX
 Wh/upDCnU3fvEGG6lmVFcVQPQmp3is+c9CaywfZZw8LPkB/Qr14Fm0KvC
 H5rp3k6WL5WR/PhBx48mGbMatTNIDp+mVXH88wH+mu6jNPWdW47uaAUTX
 p3uCZriTEG5ISCrIaTCPl20OcRRm+zT79NM14MToEhsuRtD5MF19+zchK A==;
X-CSE-ConnectionGUID: Rnl2z0ZESQKFvgBAyz7sMg==
X-CSE-MsgGUID: uXm5mZ8FQWOMnzp95rKfdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513227"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513227"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:22 -0700
X-CSE-ConnectionGUID: OdYQCyLgTuCFX/+jaCuKHw==
X-CSE-MsgGUID: rmkAXh5USmmAy5cQjGLlvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876250"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:21 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 03/39] drm/i915/cmtg: Add CMTG transcoder offset in struct
 _device_info
Date: Tue, 16 Jun 2026 18:13:39 +0530
Message-ID: <20260616124416.2442161-4-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

As all cmtg registers offset from base cmtg register is similar to
normal transcoder register, so follow existing way of defining
transcoder register for cmtg as well. Add base CMTG offset in
struct _display_device_info which will be used to derive the actual
register address for platform supporting CMTG.

Bspec: 68989
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 .../gpu/drm/i915/display/intel_display_device.c    | 14 ++++++++++++++
 .../gpu/drm/i915/display/intel_display_device.h    |  2 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 69a9f782935c..f17fc2c68472 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -101,6 +101,8 @@ static const struct intel_display_device_info no_display = {};
 #define TRANSCODER_EDP_OFFSET 0x6f000
 #define TRANSCODER_DSI0_OFFSET	0x6b000
 #define TRANSCODER_DSI1_OFFSET	0x6b800
+#define TRANSCODER_CMTG0_OFFSET 0x6F000
+#define TRANSCODER_CMTG1_OFFSET 0x6F100
 
 #define CURSOR_A_OFFSET 0x70080
 #define CURSOR_B_OFFSET 0x700c0
@@ -1352,6 +1354,18 @@ static const struct intel_display_device_info xe2_lpd_display = {
 		BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B) |
 		BIT(INTEL_FBC_C) | BIT(INTEL_FBC_D),
 	.__runtime_defaults.has_dbuf_overlap_detection = true,
+	.trans_offsets = {
+		[TRANSCODER_A] = TRANSCODER_A_OFFSET,
+		[TRANSCODER_B] = TRANSCODER_B_OFFSET,
+		[TRANSCODER_C] = TRANSCODER_C_OFFSET,
+		[TRANSCODER_D] = TRANSCODER_D_OFFSET,
+		[TRANSCODER_CMTG0] = TRANSCODER_CMTG0_OFFSET,
+		[TRANSCODER_CMTG1] = TRANSCODER_CMTG1_OFFSET,
+	},
+	.__runtime_defaults.cpu_transcoder_mask =
+		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
+		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) |
+		BIT(TRANSCODER_CMTG0) | BIT(TRANSCODER_CMTG1),
 };
 
 static const struct intel_display_device_info wcl_display = {
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 12e5a522a299..acb9ca87dda7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -292,7 +292,7 @@ struct intel_display_runtime_info {
 	u32 rawclk_freq;
 
 	u8 pipe_mask;
-	u8 cpu_transcoder_mask;
+	u16 cpu_transcoder_mask;
 	u16 port_mask;
 
 	u8 num_sprites[I915_MAX_PIPES];
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index 453f7b720815..ea89473c177f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -45,6 +45,8 @@ enum transcoder {
 	TRANSCODER_DSI_1,
 	TRANSCODER_DSI_A = TRANSCODER_DSI_0,	/* legacy DSI */
 	TRANSCODER_DSI_C = TRANSCODER_DSI_1,	/* legacy DSI */
+	TRANSCODER_CMTG0,
+	TRANSCODER_CMTG1,
 
 	I915_MAX_TRANSCODERS
 };
-- 
2.43.0

