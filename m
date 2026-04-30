Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09F5FF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465C310E5AF;
	Thu, 30 Apr 2026 13:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bc2RtIc6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95B010E6BE;
 Thu, 30 Apr 2026 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777555627; x=1809091627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6mDQS9sXWObE/SLyJMVIDEA6OcLyzLiq6rQoVEkrC8=;
 b=bc2RtIc6kzUZCjE01itkplaLRrIdmJmwGb5fzS2EiwIBSDNZgYaJABSw
 nmHWmpoj7MPnfBZ37k+LwpnUa9vCgeWi948l3+yCojCKZWoVo9cV1NTV5
 ZUu/aXLDkc/9KWYsIJEF/bHoCG17u5D1F3/w+147wNtyDkDACRiHVaHAp
 khAS9DJ92M5QJppe7gtiJbqEgZNJB6fVR5xsq0EPc1sQoNYaXu6JlqQh4
 IwILmXRAHPp0lQK7pMN4+ec2yBXYKUuT8MdlGr+nM7pZKZj0k9M8Y9cjT
 lsFgWTWw6N8P+54P5zRPnR7Y6aeq54Tzoh2Q0jyXUClZW2MV9j1FdVxoi g==;
X-CSE-ConnectionGUID: uZJl6fIQTayE5DDHyg+Yyw==
X-CSE-MsgGUID: Gpr6vuaUSzur8eJhYQb+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78398726"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78398726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:07 -0700
X-CSE-ConnectionGUID: 3U7Jx5DxRA6fixXrlFvhsQ==
X-CSE-MsgGUID: 0FtzpLYjTzCsxTxKRKiTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="257919877"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:05 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 3/5] drm/i915/intel_dvo: Drop call to intel_panel_fixed_mode()
 from compute_config
Date: Thu, 30 Apr 2026 18:42:18 +0530
Message-ID: <20260430131220.3891497-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
References: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
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

The function intel_dvo_compute_config() calls intel_panel_fixed_mode() only
to check if there is a valid fixed_mode and based on that it then calls
intel_panel_compute_config().

However, since the intel_panel_compute_config() already checks for
fixed_mode and we can drop the call to intel_panel_fixed_mode().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dvo.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index 65015477abed..dd1a995c2979 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -246,11 +246,9 @@ static int intel_dvo_compute_config(struct intel_encoder *encoder,
 				    struct intel_crtc_state *pipe_config,
 				    struct drm_connector_state *conn_state)
 {
-	struct intel_dvo *intel_dvo = enc_to_dvo(encoder);
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
-	const struct drm_display_mode *fixed_mode =
-		intel_panel_fixed_mode(intel_dvo->attached_connector, adjusted_mode);
+	int ret;
 
 	/*
 	 * If we have timings from the BIOS for the panel, put them in
@@ -258,13 +256,9 @@ static int intel_dvo_compute_config(struct intel_encoder *encoder,
 	 * with the panel scaling set up to source from the H/VDisplay
 	 * of the original mode.
 	 */
-	if (fixed_mode) {
-		int ret;
-
-		ret = intel_panel_compute_config(connector, adjusted_mode);
-		if (ret)
-			return ret;
-	}
+	ret = intel_panel_compute_config(connector, adjusted_mode);
+	if (ret)
+		return ret;
 
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		return -EINVAL;
-- 
2.45.2

