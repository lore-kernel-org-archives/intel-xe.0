Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15314C61CE5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754710E706;
	Tue,  3 Jun 2025 23:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQJtgVrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBA210E6CE
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 23:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748994883; x=1780530883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AcrNCiKyIKwrmNRL2Vw8dmZyY3ygMfp3Z0GXKI/g2to=;
 b=SQJtgVrLAGfWDCZ/F7OhXR70gwIYbcjfHqfzEJv6fo9dhXcYWtmJUWbh
 yucKIl3uN6jb26F5vd60mAuVWWUcNgzJ32COoAvafunwyA4BRyCzJHWDs
 M21HJLplzPD93bm6W/FhqZVWgB0q5sxcvsilHL9wi554OiDzvsgojUIPE
 hUxkPcSKw5TFe3fDZz9zpo+M7HvkGOdWHBz/RuMO4H/sOYQsqsqIxoshx
 aW96Ow+Kp4RE0DpHv8s3xscN8wuCtIM3R7tYYKK/JNMIj2w70UXB0clde
 EZ9jRmsfNmby273BO4vBbEuYE66UuJZqtpplc2vuwNV0UkcSRTrTdHZLN g==;
X-CSE-ConnectionGUID: nVLnmjgeQd2whrRgx/wzyw==
X-CSE-MsgGUID: vF3nnJCUQS+O8bsuhwZU7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50970535"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50970535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:41 -0700
X-CSE-ConnectionGUID: X30dzjs2RXO/Bv+p7FUKzw==
X-CSE-MsgGUID: NMc9EDMPT8O8VCRFVdq57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="168176350"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v3 0/4] Fixes for VF GuC version
Date: Tue,  3 Jun 2025 16:54:33 -0700
Message-ID: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
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

v3: minor cleanup and doc improvement

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (4):
  drm/xe/uc: Prepare uc_fw_version for storing the VF ABI version
  drm/xe/vf: Boostrap all GTs immediately after MMIO init
  drm/xe/vf: Use uc_fw_version to store the negotiated GuC ABI
  drm/xe/vf: Store the GuC FW info in guc->fw

 drivers/gpu/drm/xe/xe_device.c              |  11 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 166 +++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  19 +--
 drivers/gpu/drm/xe/xe_guc.c                 |   8 -
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  37 ++++-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
 8 files changed, 151 insertions(+), 98 deletions(-)

-- 
2.43.0

