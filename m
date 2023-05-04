Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB40FC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 11:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831C010E05F;
	Thu,  4 May 2023 11:15:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577AD10E05F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683198924; x=1714734924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bsJqZbJzITM8Wbw3rHY03TKUPpZw6nP7FuMSyLlwLzw=;
 b=LE/8UmJ8gVEsxtfVXWkvViS9n7CzIkgogUzXDQTlNTpwbru3QwvaMG2r
 /PR2/3xNYfMIKYFn9DX1NX1lIaEJKmbS2g0UgOFtLvkQVAXNKnC8JFAyJ
 CAWYo1/vOQH7FYaPk9DjvDhqXvQyKIr8GNFQGtVQDwBNHPCHLOjuk4SKw
 tKL9+GpWat471gMbwMf3MmvTmlAma8skjWRffcHf/KqvppjJfMoY+dHA0
 bdsQWIZ6YGP9fLhQXrLy55srUwu/OnvsFcVDFmA+FqgPgn2fKb7EB5YHG
 1KZLkX2osMUq/jmwn+yqreKwaLCetUrvG1W29NANY9eI3uapgQYAFQkxQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333282431"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333282431"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 04:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943297250"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943297250"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 04 May 2023 04:15:21 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 16:50:17 +0530
Message-Id: <20230504112020.300498-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add sysfs entry to read per gt physical memory
in total including stolen memory.

The sysfs entry added can be read using:
cat /sys/class/drm/card1/gt/gt0/addr_range
cat /sys/class/drm/card1/gt/gt1/addr_range

As it involves drm_class, it required movement in
xe_device init flow, patch for same is part of this
series.

Actual physical memory per GT was dependent on infra patch
from Ruhl, Michael J, so I have added it as part of this
series to pass through pre-merge.
Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (3):
  drm/xe: Rework multi tile device memory initialization
  drm/xe: Register drm device prior to gt init
  drm/xe: Add sysfs entry to report per gt memory size

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device.c         |   8 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
 drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
 12 files changed, 291 insertions(+), 164 deletions(-)

-- 
2.25.1

