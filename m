Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD0FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 08:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D80C10EA70;
	Tue, 28 Apr 2026 08:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xz5LY8Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE0B10E31B;
 Tue, 28 Apr 2026 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777366087; x=1808902087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qB5KDwL61UQWvYZJr3cnaJpZrzxnHq7uDsf8MjY/XVw=;
 b=Xz5LY8CuY5WQw7sF+mUbb/DWy5M1axXphCPP3ZB6nIpcD2uxnj5gmzmA
 No54lWgtYh1VBtfN2flMDwbErRkW7lLAQU4OoVhPXMj2h6Y3RA7IZuEHE
 H2kpn969VlDqQw8Ugzw5D5A2nKCFITKthVbTzLfAveOGxtp4NOtRhDsEY
 CX2FBKPR1n66kD0zj28UVtGXXVDyJVqvH3GtH2Vl/8Lvbxw+tutChrBRp
 /hhdIfkCLE09usyMLOtnFI209pku423HXBtmZlSlZUP1P6UUWBxS6Dqw3
 K9nsKV064AdQmLiqGqbbOW7aOPjS1z3A77SlmkuuhIQCoYHHJlu57DTrd w==;
X-CSE-ConnectionGUID: MHo+DDTQSDGNAMDE1+jNeQ==
X-CSE-MsgGUID: 0ybPeXE/S5+3bwrtcvWqdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89357631"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89357631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:48:06 -0700
X-CSE-ConnectionGUID: XYM0tA5uRQimscrLHtjmug==
X-CSE-MsgGUID: 8JPsPSFOQyiPcxOWDVGM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="229538629"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:48:04 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/2] drm/i915/intel_panel: Add a helper to get the highest
 refresh rate mode
Date: Tue, 28 Apr 2026 14:03:22 +0530
Message-ID: <20260428083323.3745772-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260428083323.3745772-1-ankit.k.nautiyal@intel.com>
References: <20260428083323.3745772-1-ankit.k.nautiyal@intel.com>
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

Introduce a helper intel_panel_highest_vrefresh_mode() to get the
highest refresh rate mode from the list of fixed modes for a connector.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 15 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_panel.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 2a20aaaaac39..5e918ee0c8ea 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -158,6 +158,21 @@ intel_panel_highest_mode(struct intel_connector *connector,
 	return best_mode;
 }
 
+const struct drm_display_mode *
+intel_panel_highest_vrefresh_mode(struct intel_connector *connector)
+{
+	const struct drm_display_mode *fixed_mode, *best_mode = NULL;
+
+	/* pick the fixed_mode that has the highest vrefresh */
+	list_for_each_entry(fixed_mode, &connector->panel.fixed_modes, head) {
+		if (!best_mode ||
+		    drm_mode_vrefresh(fixed_mode) > drm_mode_vrefresh(best_mode))
+			best_mode = fixed_mode;
+	}
+
+	return best_mode;
+}
+
 int intel_panel_get_modes(struct intel_connector *connector)
 {
 	const struct drm_display_mode *fixed_mode;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
index 56a6412cf0fb..2f7a317995ea 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.h
+++ b/drivers/gpu/drm/i915/display/intel_panel.h
@@ -39,6 +39,8 @@ intel_panel_downclock_mode(struct intel_connector *connector,
 const struct drm_display_mode *
 intel_panel_highest_mode(struct intel_connector *connector,
 			 const struct drm_display_mode *adjusted_mode);
+const struct drm_display_mode *
+intel_panel_highest_vrefresh_mode(struct intel_connector *connector);
 int intel_panel_get_modes(struct intel_connector *connector);
 enum drrs_type intel_panel_drrs_type(struct intel_connector *connector);
 enum drm_mode_status
-- 
2.45.2

