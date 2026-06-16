Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12838CD98F6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A054510EB2E;
	Tue, 16 Jun 2026 12:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDBrtwMT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F27910EB2C;
 Tue, 16 Jun 2026 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613951; x=1813149951;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dCjsqisTgH4ETeRI+6cCSJ9v9I7wUJijwnDcLBYTCT4=;
 b=jDBrtwMTJqF6ll/newKOfYNWXKw/NqIVMs66YEXGhtJHoy28o7Fq35m/
 PbqR5Urts9keZXgICwd+iFKv70F1HzrSslSPwakZ22CVo4J1AsISmSnb7
 zZLpNPryL+qO/7/0keGQBugvWaJzap5ygVo88tJMiOnx1KhrkNvAjKC0g
 giqPuegB87JuZu4MQV0M3spI701dnwpG+J+o/8HIPKCy3PW+De/uFmsbA
 B575oQhKgLja/2k6Na1pY1pD7GinieGUvy3Q9iI1jXibyTn1Yvr9xDYrm
 hVBXhA7qUMxJDEOqBFCr0XwhHxmknhVBwW5fm9yBVqLjog/00E+S/6g7V g==;
X-CSE-ConnectionGUID: xMaLzl5qRB2kOS+3AtOngQ==
X-CSE-MsgGUID: hMLV+j2KS4+xDN6iEwsZvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513267"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513267"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:51 -0700
X-CSE-ConnectionGUID: KUIOxMYjRoKL7R/uBJT1Pw==
X-CSE-MsgGUID: FSFV5nejTk6VCjhxFmM1aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876357"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:50 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 26/39] drm/i915/display: Add DC3CO DC_STATE enable/disable
 support
Date: Tue, 16 Jun 2026 18:14:02 +0530
Message-ID: <20260616124416.2442161-27-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add DC3CO handling to the dc_off power well sequencing and disable the
DMC wakelock when exiting DC3CO.

Changes in v5:
- Call assert_can_enable_dc3co() before dc3co enable (Manna Animesh)

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../i915/display/intel_display_power_well.c   | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 71ea2ecc8c88..9c8ea14a5cff 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -866,6 +866,24 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 	power_domains->dc_state = val & mask;
 }
 
+static void assert_can_enable_dc3co(struct intel_display *display)
+{
+	drm_WARN_ONCE(display->drm,
+		      (intel_de_read(display, DC_STATE_EN) &
+		       DC_STATE_EN_UPTO_DC3CO),
+		      "DC3CO already programmed to be enabled.\n");
+
+	assert_main_dmc_loaded(display);
+}
+
+static void xe3lpd_enable_dc3co(struct intel_display *display)
+{
+	assert_can_enable_dc3co(display);
+	drm_dbg_kms(display->drm, "Enabling DC3CO\n");
+	intel_dmc_wl_enable(display, DC_STATE_EN_UPTO_DC3CO);
+	gen9_set_dc_state(display, DC_STATE_EN_UPTO_DC3CO);
+}
+
 static void assert_can_enable_dc5(struct intel_display *display)
 {
 	enum i915_power_well_id high_pg;
@@ -1054,9 +1072,13 @@ void gen9_disable_dc_states(struct intel_display *display)
 	}
 
 	if (old_state == DC_STATE_EN_UPTO_DC5 ||
-	    old_state == DC_STATE_EN_UPTO_DC6)
+	    old_state == DC_STATE_EN_UPTO_DC6 ||
+	    old_state == DC_STATE_EN_UPTO_DC3CO)
 		intel_dmc_wl_disable(display);
 
+	if (old_state == DC_STATE_EN_UPTO_DC3CO)
+		return;
+
 	intel_cdclk_get_cdclk(display, &cdclk_config);
 	/* Can't read out voltage_level so can't use intel_cdclk_changed() */
 	drm_WARN_ON(display->drm,
@@ -1092,6 +1114,9 @@ static void gen9_dc_off_power_well_disable(struct intel_display *display,
 		return;
 
 	switch (power_domains->target_dc_state) {
+	case DC_STATE_EN_UPTO_DC3CO:
+		xe3lpd_enable_dc3co(display);
+		break;
 	case DC_STATE_EN_UPTO_DC6:
 		skl_enable_dc6(display);
 		break;
-- 
2.43.0

