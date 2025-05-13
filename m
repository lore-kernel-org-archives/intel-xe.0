Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BD3C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 09:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CACE10E1BA;
	Tue, 13 May 2025 09:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3w8rhhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B9210E364
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747127926; x=1778663926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H4W0pfdamxblnuFFsmHvkkIYOEPJ1NoY6SBog61ueks=;
 b=X3w8rhhlmKjKegpWWbAVDc39+CIg9Ys5V83bZ0YRX8aNHhUSeewmBhPm
 9+vFFaHOFWdXdgsTzGysIobt+cGpWKbCy4bAMfNdF5SGg5Y3ujVrBQ4V9
 muzodq0K1NfwHQFa6YVlAZ3Dptg7diML6z3xtAPbX3DP4RyBBah1myy8w
 krIHjrHfU1Ia7xXcQy1nHY8fSdklET8/b7S84bv3NXIbHi2Xrqgtt0lNq
 ADyTWtrzTE9k9AUcL1s8utxNIOumrliGvt5R5XP8IoRBuR0XqU1xXCdZi
 OxCN+Mu1voNfqsEkWTCLjDNPMgLlIZQN2W1QTb33Hdgg6PrmMVqd2uz5B Q==;
X-CSE-ConnectionGUID: AD1lchz4TrWADI6UjdtEAw==
X-CSE-MsgGUID: dyIH26njRnaXoO4MkkqUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127688"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49127688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:45 -0700
X-CSE-ConnectionGUID: 9wsqkBBpSzqynT4drWVelA==
X-CSE-MsgGUID: U7Wq/+9NRUCVaiHktqgRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142409118"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:32 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 0/4] drm/xe: Improve wedged mode handling
Date: Tue, 13 May 2025 11:18:23 +0200
Message-Id: <20250513091827.4825-1-lukasz.laguna@intel.com>
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

Lukasz Laguna (4):
  drm/xe: Validate wedged_mode parameter and define enum for modes
  drm/xe: Don't update wedged mode in case of an error
  drm/xe/vf: Disallow setting wedged_mode=2
  drm/xe/pf: Allow wedged_mode=2 only in debug config

 drivers/gpu/drm/xe/xe_debugfs.c      |  9 +++++----
 drivers/gpu/drm/xe/xe_device.c       | 30 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  7 ++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 ++--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
 drivers/gpu/drm/xe/xe_module.c       |  5 +++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 8 files changed, 48 insertions(+), 13 deletions(-)

-- 
2.40.0

