Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47739D1CDC6
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 11:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811F10E522;
	Tue,  9 Dec 2025 11:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSql7jAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C424D10E51E;
 Tue,  9 Dec 2025 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765279855; x=1796815855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yIALda2eCpbcS35GCgnbcuIyHKOGJFsgUQM71LgE7jg=;
 b=QSql7jAb6tv1shUrEH/kJ3nbxn7T6XVm6qEI77CpovsApYf0a4PROvPe
 +/Jc0TDtEt939AdGmFOblutPan9rTBEONxZJfla0JwJHt8BZJEtalhqZW
 2fsLQM+xGtlWYWdsoqkSIIvL8VWpckzIPFJ/EJ7B7CgL7uv29nWpAW6+o
 c7phJzeYMHErCmJn/3TiV+ZtrShFTxH+Zjgb68Y0az97FM854DDmc9rM8
 OHvh8prId284nBN5gTl6tzPMTeaThRDiB1cSwZqh7Iuu2ZYswl3Rm3Nt3
 4X+hW6uhnz/Yb+1zl1zIr9BGdUIxHC8RsWGH/G8DYg8w6qi/nz/cn4QcV w==;
X-CSE-ConnectionGUID: /DJnrzyVSp2/nVGg8urThg==
X-CSE-MsgGUID: v6qXkSRhRui3dp4svj6cag==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78699631"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="78699631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:30:54 -0800
X-CSE-ConnectionGUID: sN9s0VisRXSSNMPEATJewg==
X-CSE-MsgGUID: wGo0FrYTQMKjmyg45Xzh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196213304"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:30:53 -0800
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH 3/9] drm/i915/display: Add DC3CO enable/disable support
Date: Tue,  9 Dec 2025 17:03:26 +0530
Message-ID: <20251209113332.2770263-4-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20251209113332.2770263-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add explicit handling for DC3CO in the dc_off power well sequencing.
Introduce xe3lpd_enable_dc3co() and wire it into the dc_off power
enable flow. gen9_disable_dc_states() is also updated to disable the
corresponding DMC wakelock when transitioning out of DC3CO.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../drm/i915/display/intel_display_power_well.c  | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 6f62a4420f6e..6d8d9d7b7d0a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -821,6 +821,13 @@ void gen9_set_dc_state(struct intel_display *display, u32 state)
 	power_domains->dc_state = val & mask;
 }
 
+static void xe3lpd_enable_dc3co(struct intel_display *display)
+{
+	drm_dbg_kms(display->drm, "Enabling DC3CO\n");
+	intel_dmc_wl_enable(display, DC_STATE_EN_UPTO_DC3CO);
+	gen9_set_dc_state(display, DC_STATE_EN_UPTO_DC3CO);
+}
+
 static void assert_can_enable_dc5(struct intel_display *display)
 {
 	enum i915_power_well_id high_pg;
@@ -1009,9 +1016,13 @@ void gen9_disable_dc_states(struct intel_display *display)
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
@@ -1047,6 +1058,9 @@ static void gen9_dc_off_power_well_disable(struct intel_display *display,
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

