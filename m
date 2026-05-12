Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB8CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 13:47:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818E210EAEF;
	Tue, 12 May 2026 13:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSBwRhe9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384D010EAC9;
 Tue, 12 May 2026 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778593645; x=1810129645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Xm7qa05sL1/2NcEGqxibzNC3p0MOuoi/m8+a/Cvv1c=;
 b=GSBwRhe9zRhYbTcP2vBmAY70PJ+bTnoOuAKqYkrOrUqUbBand0JI6YR9
 uDhni7mUnefe0bzdoqQ2bAcqP9WKbwbfLFO8M+iPHKtiuiEU5DVyNhHaS
 5WzlmQVg/wpk4YVwehb/GjvzbaHFNyXYUCcmQUspl3Q/lqdpF3StibMXP
 /Jnl0XopoFv5hLOiduPdPY1v50Ohlahnrfgjo99lCt3dKYSle4u9yiNEp
 hYEUXlKvaTREpeFMhldlDVvMy5GZMdMZ5mxXtS8EdNZw2p/dX/GHvnj6b
 GOCHY0EU+KOZyljAZybCSsnqVfGv/fFU30ebp5zJ5vPbJG3D4Vw3VAkbX Q==;
X-CSE-ConnectionGUID: jW47lsxkT+u5kcfKLgsmgg==
X-CSE-MsgGUID: 00j4ImlFSYezifNcnRWDKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90604317"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="90604317"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:47:24 -0700
X-CSE-ConnectionGUID: NEMCmyJTRsCtZwGMSIn4Pw==
X-CSE-MsgGUID: MJqQ5lx5TUWzuiUCr/SZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="261257377"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:47:22 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 navaremanasi@google.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/6] drm/i915/panel: Preserve Vtotal-Vsync distance while
 adjusting vtotal
Date: Tue, 12 May 2026 19:02:45 +0530
Message-ID: <20260512133249.2475882-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260512133249.2475882-1-ankit.k.nautiyal@intel.com>
References: <20260512133249.2475882-1-ankit.k.nautiyal@intel.com>
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

As we increase the vtotal to accomodate lower resfresh rate for fixed
modes, adjust the vtotal-vsync distance also.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 20c548eea6da..14c7eea8ccb1 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -237,11 +237,18 @@ int intel_panel_compute_config(struct intel_connector *connector,
 
 	drm_mode_copy(adjusted_mode, fixed_mode);
 
-	if (is_vrr && fixed_mode_vrefresh != vrefresh)
+	if (is_vrr && fixed_mode_vrefresh != vrefresh) {
+		int vsync_start_diff = adjusted_mode->vtotal - adjusted_mode->vsync_start;
+		int vsync_end_diff = adjusted_mode->vtotal - adjusted_mode->vsync_end;
+
 		adjusted_mode->vtotal =
 			DIV_ROUND_CLOSEST(adjusted_mode->clock * 1000,
 					  adjusted_mode->htotal * vrefresh);
 
+		adjusted_mode->vsync_start = adjusted_mode->vtotal - vsync_start_diff;
+		adjusted_mode->vsync_end = adjusted_mode->vtotal - vsync_end_diff;
+	}
+
 	drm_mode_set_crtcinfo(adjusted_mode, 0);
 
 	return 0;
-- 
2.45.2

