Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA1BC021BC
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9675F10E4CB;
	Mon, 24 Feb 2025 17:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzy+lvna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D1F10E4AA;
 Mon, 24 Feb 2025 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418038; x=1771954038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bL6iipUOHw2XXs6Ut7qM4A+HlU1rv6ampztVmF7wB6w=;
 b=bzy+lvnaxci62Q1OJjMGDvsnGfcj8dwjcMaKI+rne80LNNu7BG8e1MPY
 ESw0AOFUlkgflgoyXYy83SbzYNVt0168pveXCm7q+s2aU/HfDFCmyCRIB
 YtMcphr/fyCgXNe1ZmJyvBdr5bcPnWXpoGkqJP0KuzINienLDRBx9ReUF
 HM91IOer+15b2uA4cds3rxk3fP4l/I2co4gp6jWGOhG0ZaQnWYpOslqxJ
 BwVMQ91FVDElmeq96pONmZDWXJ15A7wdUkB7SisCn2I9wko/eY+gqHuaI
 wBhXlPmOpQL9T91ZYnQYOrgYAdKAw4cdU7FcOxWbb4tsUaKo0oPYBXkru w==;
X-CSE-ConnectionGUID: TNvuFbRkSXS++YjQ5QGb8g==
X-CSE-MsgGUID: Iijz7b9WRnyft/Evds2zSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601780"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:17 -0800
X-CSE-ConnectionGUID: ulsop70dTualTpBpnDWg1w==
X-CSE-MsgGUID: uDcXdoz5S+2PNZRTZTK+dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374200"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:27:13 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/i915/dp: Make .set_idle_link_train() mandatory
Date: Mon, 24 Feb 2025 19:26:44 +0200
Message-ID: <20250224172645.15763-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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

Everyone implements the .set_idle_link_train() hook now.
Just make it mandatory.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index f208b947ef92..3bd15054effe 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -827,8 +827,7 @@ static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
 static bool intel_dp_use_post_lt_adj_req(struct intel_dp *intel_dp,
 					 const struct intel_crtc_state *crtc_state)
 {
-	return intel_dp->set_idle_link_train &&
-		drm_dp_post_lt_adj_req_supported(intel_dp->dpcd) &&
+	return drm_dp_post_lt_adj_req_supported(intel_dp->dpcd) &&
 		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;
 }
 
@@ -1248,9 +1247,6 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 {
 	intel_dp->link_trained = true;
 
-	if (!intel_dp->set_idle_link_train)
-		intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
-
 	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
 					       DP_TRAINING_PATTERN_DISABLE);
 
@@ -1482,10 +1478,8 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
 	if (ret)
 		ret = intel_dp_link_train_phy(intel_dp, crtc_state, DP_PHY_DPRX);
 
-	if (intel_dp->set_idle_link_train) {
-		intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
-		intel_dp->set_idle_link_train(intel_dp, crtc_state);
-	}
+	intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
+	intel_dp->set_idle_link_train(intel_dp, crtc_state);
 
 	if (ret)
 		ret = intel_dp_post_lt_adj_req(intel_dp, crtc_state);
-- 
2.45.3

