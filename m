Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C19FD0E6EA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C552010E3FF;
	Tue, 25 Nov 2025 13:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv7WCZvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171B810E3FF
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078873; x=1795614873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uI6HpyJ/do3LNypcIxwf3IJt5s5NG+PyPnbd7wR184s=;
 b=bv7WCZvxxjdq3foXKotqEnCJqg2lQyCpPGGmmAgeWDGOVDy+cvfGKLu7
 7YHH3fDff8RxL3v06/drd5BqA41l4uuskR+T0SBKa70NQvOk/Sn8RrbtG
 5BGbvEwfqJaBFeA91xh+8HLwOuK445oEpVTo41l8O9zCVYI0SK/EzfGlD
 9boLZ8nHVV66zHQTKp3eusSy42c61JBfNp8rw/hx+Xky+oi97WMZ7dyKt
 K8L/9Tvq69WLUoJjqQ+N3kTOrdw3dRjwZB7MyLw8eo0VOCXNhKNAp2OHJ
 eSkSPt1IT0t9Ulnyaq7GFQKCUeINkXOf/3HJZbOsO7hah+nSCMHI5MMYf Q==;
X-CSE-ConnectionGUID: NZmXDujmSzu2sWXHP9gpDQ==
X-CSE-MsgGUID: VGpHH9W7SDuN5bjYNszfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802554"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65802554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:33 -0800
X-CSE-ConnectionGUID: BQ1R1l7oRKGgif5W0YvVyw==
X-CSE-MsgGUID: dEjrGHycQ961lcOrinMOQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196953995"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:31 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v10 0/4] drm/xe: Improve wedged mode handling
Date: Tue, 25 Nov 2025 14:54:18 +0100
Message-Id: <20251125135422.11244-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported on VFs.

Additionally, validate the wedged_mode module parameter input, update
the internal wedged.mode state only on success, and allow setting
wedged_mode=2 only in debug builds if running as PF.

v1: https://patchwork.freedesktop.org/series/148214/#rev1
v2: Replace magic numbers with definitions (Matt, Michal)
    Use helper to sanitize wedged_mode (Michal)
    Change debug messages (Michal)
    Reorder patches (Michal)
    Add fixes tag (Matt)
v3: Rename xe_device_wedged_mode_validate to
    xe_device_validate_wedged_mode (Michal)
    Make enum nameless (Michal)
    Add default field in enum (Michal)
    Change names of enum fields to match modparam description (Michal)
v4: Fix GuC reset policy update
    Replace missing magic numbers with definitions
    Update debug message
v5: Remove old rb-s from the patch that changed
v6: Use string names instead of enum values in log messages (Michal)
    Handle inconsistent reset policy state between GTs (Michal)
    Use bool param in function toggling reset policy (Michal)
    Update commits titles and descriptions (Michal)
v7: Rebase series (Lukasz)
    Rename helpers (Michal, Lukasz)
    Split complex condition into smaller, separate ones (Michal)
    Don't introduce XE_WEDGED_MODE_MISCONFIGURED enum field (Michal)
    Add needs_policy_update helper (Michal)
v8: Apply missing rb (Lukasz)
v9: Simplify conditions (Rodrigo)
v10: Define enum outside of the xe_device struct
     Fix description of module parameter (Michal)

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged mode to upon-any-hang
  drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      | 73 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device.c       | 52 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.h       |  2 +
 drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +--
 drivers/gpu/drm/xe/xe_module.c       | 10 ++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 10 files changed, 159 insertions(+), 35 deletions(-)

-- 
2.40.0

