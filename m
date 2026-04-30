Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68CBFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550910E402;
	Thu, 30 Apr 2026 13:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJVZrMpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00D010E402;
 Thu, 30 Apr 2026 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777555622; x=1809091622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ciEt+6Cwvk1amiFekkaqrQdGnMkdRI/J8yDvgkQoXw=;
 b=MJVZrMpoRDnyJ1OH/Ui0lGsFl8KMvdb7WzxOZPQ7tVIZnG8BW36pqO7I
 WxXO2iDlzzAiNWdiC8XrWQ3FJZJsPVplGjfQNmkTD1T6pDVfVTYfiHlg2
 5G7rljbEbew+wg5CsxTvrlwIZzYqas15hSeIlcJnRarb5P7ea/AkLyBTD
 TmburWlToKKFTHnjT1VT8dFCPMv++/9TSMfqgk2nl6HTNj/E2nBJ932/T
 rNLJMvMjbhb5QBoTyb6N/nfXRTDHgDaKrnuU42OsGpyO+LDzDRoi8tF+U
 bYeubyWalrccCzZehXR0WtnkE5jU6GZ+Plow5WINiQ/I9sfs/OJTBrbpU g==;
X-CSE-ConnectionGUID: jdOfadUCTMCz/vGaQogIIA==
X-CSE-MsgGUID: sUOaolpOTlyVkSld96dMcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78398718"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78398718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:02 -0700
X-CSE-ConnectionGUID: EJzjVB5bRUa63AuYVFu5Wg==
X-CSE-MsgGUID: P6gRI9a2TWih8Mn8SE00ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="257919840"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:26:59 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/5] drm/i915/intel_panel: Reduce redundant
 intel_panel_fixed_mode() calls
Date: Thu, 30 Apr 2026 18:42:15 +0530
Message-ID: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

This series addresses feedback from Jani Nikula to reduce
intel_panel_fixed_mode() calls in encoder code [1].

Currently, encoder code calls intel_panel_fixed_mode() directly to check
for or get fixed mode state, then calls intel_panel_mode_valid() or
intel_panel_compute_config(), which repeat the lookup internally.

This series avoids those redundant calls by:
 - Extending intel_panel_mode_valid() to return the effective target clock
   via out parameter
 - Dropping direct intel_panel_fixed_mode() calls from encoder mode_valid
   paths
 - Dropping redundant fixed mode checks from compute_config paths

Note: intel_sdvo.c retains two intel_panel_fixed_mode() calls in
intel_sdvo_create_preferred_input_timing() and intel_sdvo_pre_enable()
as they seem to indeed need the fixed modes.
It might need a bit more work to get rid of them.

[1] https://lore.kernel.org/intel-gfx/0fb737c2484e116721b944befff146d9069ecee3@intel.com/

Ankit Nautiyal (5):
  drm/i915/intel_sdvo: Check fixed_mode->clock against max_dotclock in
    mode_valid
  drm/i915/intel_panel: Avoid calls to intel_panel_fixed_mode() in
    mode_valid
  drm/i915/intel_dvo: Drop call to intel_panel_fixed_mode() from
    compute_config
  drm/i915/intel_sdvo: Drop call to intel_panel_fixed_mode() from
    compute_config
  drm/i915/dp: Drop call to intel_panel_fixed_mode() from compute_config

 drivers/gpu/drm/i915/display/intel_dp.c    | 12 +++------
 drivers/gpu/drm/i915/display/intel_dsi.c   |  7 +++---
 drivers/gpu/drm/i915/display/intel_dvo.c   | 29 ++++++----------------
 drivers/gpu/drm/i915/display/intel_lvds.c  |  7 +++---
 drivers/gpu/drm/i915/display/intel_panel.c |  9 ++++++-
 drivers/gpu/drm/i915/display/intel_panel.h |  3 ++-
 drivers/gpu/drm/i915/display/intel_sdvo.c  | 11 +++++---
 7 files changed, 34 insertions(+), 44 deletions(-)

-- 
2.45.2

