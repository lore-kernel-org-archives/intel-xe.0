Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D78C5B543
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF04710E0F9;
	Wed, 28 May 2025 23:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWL+gzNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7321A10E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475762; x=1780011762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2tp+fQLZUbkCzsyuK4IH10vRfUxbM4VvBoS+YyK43Ec=;
 b=FWL+gzNGGOLq3Z+JHrxJl81Uh/YIRxjGyvtTH+8LpQ+MlIosSGaw/36f
 rAVD1TyS1qGjdhWjD/8EF3La6uRM/v2YbJqCcvNDUoww1lLEzFKxj0ZeG
 1iGFA5nDUuiEQHumufLPJOIm9M6LDae6z+Vl6+UPPrqPL4/ted8Ufl8Xz
 55dfQxVRbqLsrEwJgS/ysl/9YdwwOmoNcmMy5EV9UAN2eCFK6NHoX6YFr
 vOAWHyTDmDFcHZnu8RBxoRJXQv1tqR4+wx+e8bL6DielK/MziKjya4vJV
 AgPl3+sYlaewonzSqcUKW663EF4CXVetEW67yTS7fvc5gxlV7syjhi1PH w==;
X-CSE-ConnectionGUID: RajhdSBoTku7ANznwyKB5w==
X-CSE-MsgGUID: MNWG3vR4QUWGl0EVxp/qoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50674858"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50674858"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:41 -0700
X-CSE-ConnectionGUID: 1cgMNUzjT4yv0Bldl+TtIg==
X-CSE-MsgGUID: 2VoUv7OCS0+3m1HvZG+1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148245515"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v2 0/4] Fixes for VF GuC version
Date: Wed, 28 May 2025 16:42:30 -0700
Message-ID: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The VF currently stores the negotiated GuC compatibility version in a
private VF struct, so all the runtime checks using the common struct in
guc->fw are not working as expected. We can fix this by copying the value
over.

This also fixes the guc_info debugfs, printing the correct values for
the wanted and found versions.

v2: split out prep change to its own patch, bootstrap media GT early,
remove already merged debugfs MMIO fix

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
  drm/xe/vf: Boostrap all GTs immediately after MMIO init
  drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
  drm/xe/vf: Store the GuC FW info in guc->fw

 drivers/gpu/drm/xe/xe_device.c              |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 165 ++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  19 +--
 drivers/gpu/drm/xe/xe_guc.c                 |   4 -
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  37 ++++-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
 8 files changed, 150 insertions(+), 94 deletions(-)

-- 
2.43.0

