Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9FAC98310
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF9210F00D;
	Wed, 23 Sep 2026 12:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFBuPsNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4D10F00A;
 Wed, 23 Sep 2026 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164833; x=1821700833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RL/PV8D0qGvDADxAHBtf7mT/ajwPOZ07xbH0XpDY0co=;
 b=ZFBuPsNwnfwlUiMUuWBkXmXICGdXJLesSua2tzU9rEmOdRtDuyeVy7Tm
 wvQQ6lRTFT4rr1aSRz+6MEuaB0QzhDXuTygVsyIkwaqD11sZEJ/6fs2M6
 3G1cBuP6yDsEPXIx4DS5VS6W37Vrix2W8IgIVjcM5epYWI5ohviU+Xbd8
 sOIFZrgh0G9dFyHQABkeIvOXoyA7lfGqcAUDdS8MOdgeeWxTB0suSYpG2
 tWQytLwTY9KmpV0Wzm7JLtDrZGTxiNxLuB4BFInAIhgkVW3JHbjuOEV8+
 ZpTvkfTse+cMLzpftN2r1w+H8CnJ4SlP9jBnH7lQjvSAx3tjqObmHwLy3 w==;
X-CSE-ConnectionGUID: s5b1SQP5RWSgDGSecKX7jQ==
X-CSE-MsgGUID: 1xUvpuiXRZ2Vm/QCPzekRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965163"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965163"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:51 -0700
X-CSE-ConnectionGUID: kUkY13oaRiCed1UX9Gj64A==
X-CSE-MsgGUID: y3MKdK4yTIOQlTprw6lPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665836"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:50 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Allow forcing the joiner on eDP
Date: Wed, 23 Sep 2026 11:59:41 +0000
Message-ID: <20260923115941.746934-6-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
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

intel_dp_has_joiner() rejects eDP unless the VBT enables the pipe
joiner, and the debugfs file is only created when that returns true, so
i915_joiner_force_enable can never turn it on.

Always create the file for DP and eDP, and let a forced pipe count
above one override the VBT.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c |  5 ++---
 drivers/gpu/drm/i915/display/intel_dp.c              | 12 +++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 3e302f23f247..e55fa01addb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -1352,9 +1352,8 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
 				    connector, &i915_dsc_fractional_bpp_fops);
 	}
 
-	if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
-	     connector_type == DRM_MODE_CONNECTOR_eDP) &&
-	    intel_dp_has_joiner(intel_attached_dp(connector))) {
+	if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+	    connector_type == DRM_MODE_CONNECTOR_eDP) {
 		debugfs_create_file("i915_joiner_force_enable", 0644, root,
 				    connector, &i915_joiner_fops);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2480b8ce3bec..80ce71ce4c20 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -473,9 +473,15 @@ bool intel_dp_has_joiner(struct intel_dp *intel_dp)
 	if (intel_dp->mso_link_count)
 		return false;
 
-	if (intel_dp_is_edp(intel_dp) &&
-	    !connector->panel.vbt.edp.pipe_joiner_enable)
-		return false;
+	if (intel_dp_is_edp(intel_dp)) {
+		bool pipe_joiner_enable = connector->panel.vbt.edp.pipe_joiner_enable;
+
+		if (connector->force_joined_pipes > 1)
+			pipe_joiner_enable = true;
+
+		if (!pipe_joiner_enable)
+			return false;
+	}
 
 	return DISPLAY_VER(display) >= 12 ||
 		(DISPLAY_VER(display) == 11 &&
