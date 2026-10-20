Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED36606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+G+mCPd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465B410EFB5;
	Tue, 20 Oct 2026 19:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B0C10E215
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792523326; x=1824059326;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b/nzW1ph5E+AyCTHpxYXxGNR1BuBf/zyBAxv4Q9lp0Q=;
 b=Q+G+mCPdG9bdnLjRph75zVYopU/Os9Xb0MFep24jvT4cF4z7T9XQ263K
 MsTqvMJSnEgx+W2cyhpYPXDhK0PZfq5H/LkH8APySuUXqy7zpy5xMxZu8
 MBzGn9H4tY6u/2zVcIc11vHbMtiLjOca9N54PykEc/5mE6pgM7AkXGT/7
 imbSqA5vQV/7dJtH5utAc8uHErfGdhxwOnGJY5yk8DEMxMfiUzz3PZmNh
 GQDGMFGetbJYHHcnzV9+U+zDrHnj+DQiAK0TxFGWNa9shIuOQh+zimxA4
 oGJa7C1VGMkNdoJ7+8pgcWDwyWvNKOvQeO+ZZ8eIdRybvIlp3TPsQ5obv w==;
X-CSE-ConnectionGUID: iQ/OweNXQEOwidN48ihu4g==
X-CSE-MsgGUID: 4jdzsCEDSFOLD1OiFQLq1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1339816"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1339816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:08:45 -0700
X-CSE-ConnectionGUID: gblY3YaVTtyDx4897PDmuA==
X-CSE-MsgGUID: zZoXhRhFS+2LzJ2M6A31Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3226591"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 12:08:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/3] Add a minimum age gate to the shrinker 
Date: Tue, 20 Oct 2026 12:08:37 -0700
Message-Id: <20261020190840.854525-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Working through Sashiko issues, don't review quite yet.

Matt

Matthew Brost (3):
  drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED madvise state
  drm/ttm: Allow skipping to the next priority in the bo LRU cursor
  drm/xe: Add a minimum age gate to the shrinker

 drivers/gpu/drm/ttm/ttm_bo_util.c    |   3 +
 drivers/gpu/drm/ttm/ttm_resource.c   |  35 +++++-
 drivers/gpu/drm/xe/Kconfig.profile   |  15 +++
 drivers/gpu/drm/xe/xe_bo.c           | 151 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |   6 +
 drivers/gpu/drm/xe/xe_bo_types.h     |  16 ++-
 drivers/gpu/drm/xe/xe_device_sysfs.c |  35 ++++++
 drivers/gpu/drm/xe/xe_shrinker.c     | 165 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_shrinker.h     |   3 +
 drivers/gpu/drm/xe/xe_vm.c           |   4 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   7 ++
 include/drm/ttm/ttm_bo.h             |  19 +++
 include/drm/ttm/ttm_resource.h       |   2 +
 13 files changed, 446 insertions(+), 15 deletions(-)

-- 
2.34.1

