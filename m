Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C016D606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eNONH2Uz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7010E09A;
	Sun, 15 Nov 2026 13:23:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6895F10E09A;
 Sun, 15 Nov 2026 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794749010; x=1826285010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCrL02cGhjA+fiFxJjeu04XRaMILz3PahsFY35VY0pw=;
 b=eNONH2UzTKxgB5pzx7+3JzoO/ONsYZ+XrHKOCLTbovgvrDZj7xYS1jKS
 Rg2l8+dNTGlEONUISYwy8KQ0LmiQ1k1sZfsQkQwblMSrtwOnmOQAZqDmo
 h33Yl1hYiHJKpxXXU/0x9zgU+w8vMt37FyKQmBa5kEOSj8YbPiOkmwWKE
 hhVepPemE90oa1xkPjOOyVX41irt8qYZjyew+RrxD23eH8FoHEECjbqeD
 qxuntIQDe5hGUWPMLT4p+7cjvg72NyD5g3r7qWXVWKihd/qKsu7jT5/F3
 fgwJddAXxoL4uM6/VjJblo4m8u3AbvNs4mZcbfAKyUlMY3QAYnMCBF5Ia g==;
X-CSE-ConnectionGUID: zlFf8f95Q621yP5fW9JRWQ==
X-CSE-MsgGUID: 5/Sz3n33RA+K3E9/DfyWXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3483751"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3483751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:30 -0800
X-CSE-ConnectionGUID: EE/qymTSRrCvjlrOoKNfQg==
X-CSE-MsgGUID: GR0ItwTcR7GtORlrUew8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9751540"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:29 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 1/2] drm/i915/psr: clean function's name from typo
Date: Sun, 15 Nov 2026 14:23:04 +0100
Message-ID: <20261115132305.3326951-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
References: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apply s/_continous_/_continuous_/ for
man_trk_ctl_continuos_full_frame().

No functional change.

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd16563603249..f1091c85d7018 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2615,7 +2615,7 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
 	       PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE;
 }
 
-static u32 man_trk_ctl_continuos_full_frame(struct intel_display *display)
+static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)
 {
 	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
 	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
@@ -2712,7 +2712,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 	val |= man_trk_ctl_partial_frame_bit_get(display);
 
 	if (full_update) {
-		val |= man_trk_ctl_continuos_full_frame(display);
+		val |= man_trk_ctl_continuous_full_frame(display);
 		goto exit;
 	}
 
@@ -3273,7 +3273,7 @@ void intel_psr2_panic_force_full_update(const struct intel_crtc_state *crtc_stat
 
 	/* SF partial frame enable has to be set even on full update */
 	val |= man_trk_ctl_partial_frame_bit_get(display);
-	val |= man_trk_ctl_continuos_full_frame(display);
+	val |= man_trk_ctl_continuous_full_frame(display);
 
 	/* Directly write the register */
 	intel_de_write_fw(display, PSR2_MAN_TRK_CTL(display, cpu_transcoder), val);
@@ -3725,7 +3725,7 @@ static void intel_psr_configure_full_frame_update(struct intel_dp *intel_dp)
 			       man_trk_ctl_enable_bit_get(display) |
 			       man_trk_ctl_partial_frame_bit_get(display) |
 			       man_trk_ctl_single_full_frame_bit_get(display) |
-			       man_trk_ctl_continuos_full_frame(display));
+			       man_trk_ctl_continuous_full_frame(display));
 }
 
 static void _psr_invalidate_handle(struct intel_dp *intel_dp)
-- 
2.45.2

