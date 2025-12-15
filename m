Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4137FD5B85E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2EC10E346;
	Mon, 15 Dec 2025 17:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOX/PHDU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618310E346
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765820780; x=1797356780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ShiCSagD9GblPnFOffhcFsSL/FvAHqDQr0WGKbEYtMA=;
 b=QOX/PHDUlFFPbRAx8CqfdPyvq6ljQ9eP43sljhO3MwFNySAbrWUd2/kq
 3FzitFld9eFqbjQ9Mn4yhp2wGTMDa5iJK5629q7+vsSew326TAH8d1ifb
 dO5Z//Vde6apTAg15ovsd6AfmCELjCQe5zUVV870d3ndy7MH4Kg09CXem
 yfcWU0T6CdZl8lcthrrft2jpSVeMdh/uu4AIQbv6fF/ojnZ0zBvcdaw/C
 2rpIllcW6h3rTovzsVdLUPIGU9AUdYUtlTSKbncN7t8TgEYCY08lTgimQ
 HTgIb4t41S7sPtyGl9BVglFSzNsaT+orj5jc5vIRIGVqJr8iD7yGsTMdV g==;
X-CSE-ConnectionGUID: EpcF1qAlQ1Sw15HMVLkf4Q==
X-CSE-MsgGUID: c7u2Ge4mSiGeaEtTsvygmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612330"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:19 -0800
X-CSE-ConnectionGUID: mI6P7/5QSN+7aMcHK8qBdQ==
X-CSE-MsgGUID: Bn0eNA4BQ+2GCm81EJga5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198610919"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:18 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v11 0/4] drm/xe: Improve wedged mode handling
Date: Mon, 15 Dec 2025 18:46:09 +0100
Message-Id: <20251215174613.3701-1-lukasz.laguna@intel.com>
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
the driver's internal wedged.mode state only after successful reset
policy change, and allow setting wedged_mode=2 only in debug builds
if running as PF.

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
v11: Update the Xe Device Wedging doc (Rodrigo)
     Provide a more detailed commit description (Rodrigo)

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Update wedged.mode only after successful reset policy change
  drm/xe/vf: Disallow setting wedged mode to upon-any-hang
  drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      | 75 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device.c       | 60 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h       |  2 +
 drivers/gpu/drm/xe/xe_device_types.h | 23 ++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 16 +++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +--
 drivers/gpu/drm/xe/xe_module.c       | 10 ++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 10 files changed, 170 insertions(+), 39 deletions(-)

-- 
2.40.0

