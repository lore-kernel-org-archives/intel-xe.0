Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7122AC87FCB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 08:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364AD10E0A8;
	Tue, 12 Aug 2025 08:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+fH4WxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D2C10E0A8
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754988365; x=1786524365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTkPTqbBtlmXk/XkG3P9IBb+b/vAYSk/n+rVWPWGdUc=;
 b=f+fH4WxVVrATYwL8Aj2T945V3x4alUnD6tioyU2vv89QyF4tz5lXDCx0
 nC5UTGjbn0v3aedaQgdLwmjWwFLCpcoPfax2Nom6hEf3OLcUHK2oVEZFN
 WguYkNtdDz2j/D3nTKDCiFJCIkP4avnzYRaZLA5uHITNAqHngGBcbHadg
 zijy0mCfFqQ2ID94PDiL6D36OPEmCMWU39L0qBEg9ohhjiyOkjDuS4XKb
 dxSBv7WbjitOSl4XJS9zGVwpolN0u5dra8Q3pp+suv3Idct4mAkUJQ5IK
 1jYrCaEEeW/SbH7OVZDIwiyRroDWXeIGRRNo7URKT45TAaonzBsY62Wq4 w==;
X-CSE-ConnectionGUID: /07ripKoS8awcVr7s6O5VA==
X-CSE-MsgGUID: TK721/oEQ/S2rJXPnf34FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67857778"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67857778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:04 -0700
X-CSE-ConnectionGUID: 45h9PIcQTk6mTxwJCP5G5A==
X-CSE-MsgGUID: d8NB6uuAR4S00gZuI9fvmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165645680"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:03 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v9 0/4] drm/xe: Improve wedged mode handling
Date: Tue, 12 Aug 2025 10:45:53 +0200
Message-Id: <20250812084557.7805-1-lukasz.laguna@intel.com>
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

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged mode to upon-any-hang
  drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      | 78 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device.c       | 52 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.h       |  2 +
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 14 ++---
 drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +--
 drivers/gpu/drm/xe/xe_module.c       |  5 +-
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 10 files changed, 147 insertions(+), 35 deletions(-)

-- 
2.40.0

