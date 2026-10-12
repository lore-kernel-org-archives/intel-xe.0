Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56077CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7A910F0AE;
	Mon, 12 Oct 2026 12:42:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0833910F087;
 Mon, 12 Oct 2026 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808920; x=1823344920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47clLTOInfmKivCuxa4Xt56Jdaw2cQuR0i5KwNQOFeg=;
 b=gruxh+lqEV68Fs8tkTdF9glBCFDp74yK6dN0rc7rq6D/SsY6KZVTRphF
 orXu8SFRZYIg1lvCRNWHBixYaOX9XQDOZYJwJjtPABgnpbQMKxqRXx8PP
 E27OGhEz2W+kbZdZnRrEaqjv8puOptPusds6W5zuJnGCbd5+qJoMqhgoT
 YEd9SRH2n4GlHbArexLCfXsyNMorgiI9yOpKPfE6EQGML2slCxdtwoGAn
 cCysPrVScy/y9H7GudL5xQq/plQ4prGdadaIzny50AHy7gwP1r7ZW07LK
 OmxXMteFfD5LSKODWKyqCiIJp+C+QtroaCRmt0IKGte0J1r0+faS6YgyJ Q==;
X-CSE-ConnectionGUID: PMYwyfPCS5mhI1+myoBWEA==
X-CSE-MsgGUID: 4HOSS9VvQjW46Ka6mz6yOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506218"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:57 -0700
X-CSE-ConnectionGUID: ZSdpLLhuTo2MS5ZrNbfyYw==
X-CSE-MsgGUID: 2zjJOMSDQtClLxVIikD4Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808190"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:57 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 6/6] drm/i915/display: Allow forcing the joiner on eDP
Date: Mon, 12 Oct 2026 12:41:45 +0000
Message-ID: <20261012124145.1960050-7-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
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

intel_dp_has_joiner() rejects eDP unless the VBT enables the pipe
joiner, and the debugfs file is only created when that returns true, so
i915_joiner_force_enable can never turn it on.

Always create the file for DP and eDP, and let a forced pipe count
above one override the VBT.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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
-- 
2.43.0

