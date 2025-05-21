Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B3EC3ABC9
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 12:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB3B11BFF6;
	Wed, 21 May 2025 12:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLP5Mxp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1A11BFD5
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747830318; x=1779366318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mOg2DFSlWo9d0EIOcw605BlIswTdsJebnthBu/N4CAI=;
 b=YLP5Mxp0UA1PTQqKai7Jm1PAMhfJVMpdoZjjgB2q9BBYpEp9F0306+5w
 L6GkvkMaaLmLyhDoparIqtnxgEHzIP4sB9acIGk6OwW3JvPkFULUZsqfe
 aTOsRkpCc3k9a5PT+4LWBbhc1tqxiPLpjnKOPuoxd4dURL4+N311nbudl
 YfnC9KMhbjrocXIW6j5nD/zZAybBvKDQNfXNvXA0aX55hEeMbefW0LLhD
 vxzJV/bQQ+AZ9DNnOua+GfAicJYgJmK6g2qiPHnqfb6ZlnBrJOoc+hTy3
 TL7/Tvd8tirnSmr5HOWL7DU+LksCTrvED7o3dD1+on0WBG0bDS01vh1qj A==;
X-CSE-ConnectionGUID: KZEdiMfaSrmMQ8nyv1sF6w==
X-CSE-MsgGUID: OudhrEmcQOSESDfTE1p+dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72324568"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72324568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:18 -0700
X-CSE-ConnectionGUID: FLp9e+7dQUiMy0R4h6Plcg==
X-CSE-MsgGUID: 7wJRLX5WTg+AVcZ3z9I1KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139945480"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:16 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v6 0/4] drm/xe: Improve wedged mode handling
Date: Wed, 21 May 2025 14:25:07 +0200
Message-Id: <20250521122511.5760-1-lukasz.laguna@intel.com>
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

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged mode to upon-any-hang
  drm/xe/pf: Allow upon-any-hang wedged mode only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      | 39 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.c       | 54 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      | 14 ++++----
 drivers/gpu/drm/xe/xe_guc_ads.h      |  4 ++-
 drivers/gpu/drm/xe/xe_guc_capture.c  |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 ++--
 drivers/gpu/drm/xe/xe_module.c       |  5 +--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 10 files changed, 113 insertions(+), 25 deletions(-)

-- 
2.40.0

