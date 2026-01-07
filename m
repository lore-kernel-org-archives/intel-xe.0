Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B56D0D155
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A627E10E61A;
	Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjWgSw++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A051110E5A9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808074; x=1799344074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sJbqc9gDPetPXVHz44uY62zU7SodNzoaz99gJLZ1IKc=;
 b=UjWgSw++yjPeIU8iAlZU6X368iOCPaKMG7s25kOCZ0ZJ6zunQby1WBgP
 lc9MIupMCIBmmzIV2V+3u6KHQ+KEwiyYgn8Ks5v4BewsNN/5wgfY1oZCU
 MsAq5JynOuj58MLE+xRNT6ii7MKaqVFFwsH6ufElD1UQm0J/5Gt/UmNcV
 Q7+9lbvpYZvh15C+Tt6/kuVbsfBV25jy1vUeRmF/QCTA2uijed8a4zRkj
 vzVcZaRVuQ7QyCqFkn1bgJSR0yPfOF1hrMthhtyBNaxfgWYiG1bnVVMdD
 VSrq7tllTmv1G1mrpNr3ld0DycNheBKCnrJju/K5U7laJmNe+JK6brwCB A==;
X-CSE-ConnectionGUID: +yOF4U5fTZ6Jy6GxwP7hgA==
X-CSE-MsgGUID: oaQSQd8BSQia01GiSlBMnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69096470"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69096470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:45 -0800
X-CSE-ConnectionGUID: l9qvoCo9TzOIJF8+CqvYnw==
X-CSE-MsgGUID: tcsQnGwOQMOlT+ABZvbOgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202768572"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:44 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v12 0/4] drm/xe: Improve wedged mode handling
Date: Wed,  7 Jan 2026 18:47:37 +0100
Message-Id: <20260107174741.29163-1-lukasz.laguna@intel.com>
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
v12: Rename helpers to make wedged mode context explicit (Rodrigo)

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

