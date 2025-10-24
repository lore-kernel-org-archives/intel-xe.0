Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E284CCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 18:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2FD10EB2E;
	Fri, 24 Oct 2025 18:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0SVXrIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BABB10EB2C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761329060; x=1792865060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l4Ls2eQCLXaRfxDEgoZ4i7U/u16cSn0FBACFktD+vTU=;
 b=j0SVXrIMzAwJ8J3Gp6cf3zBXUbzW+BKMwsHPch2gOSmTpYDhOkaI36jd
 GB5NTtni6dTzghKMZMBV8zySyx0sMHCZ7wAsraklPZ/nqgPWYKp26uSyf
 h5YEOzw8Dm6xdU/7e/lzlJgDXxQEkVRHRosZWwkqxyiVQbz3ZnWQ9HaiN
 gx1uoPd4Dga8NGypws7ZQbPXmelAiruA0djmTZFuQ7BfY4vrEGSru1MU3
 ICz+cnc2rvcF8yW6zZ/lZKiaK4q29EiyivlWvfmryq+UTghc4OpOjhbd9
 1f9KpnqRvOAhTc2CF2GbbLt1Cqy+JoN3dSqyJ7gVuzWJLBcZDYN8RIUMd A==;
X-CSE-ConnectionGUID: t7KIjC/4TT2BMqIlPlLLOw==
X-CSE-MsgGUID: HofHxZBjR6+lG4qoPvs1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67349328"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67349328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
X-CSE-ConnectionGUID: YheoBmrpSuis2m8rSc1VAQ==
X-CSE-MsgGUID: O+rn28jYQ+m9tlASy/vExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183709632"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 11:04:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v2 0/7] Pagefault refactor
Date: Fri, 24 Oct 2025 11:04:07 -0700
Message-Id: <20251024180414.1379284-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

We likely need multiple page fault producers feeding into a common
consumer backend. Additionally, our current page fault work queue
design—being per-GT rather than per-device—makes little sense. Clean up
pagefault handling with clear layers.

Matt

Matthew Brost (7):
  drm/xe: Stub out new pagefault layer
  drm/xe: Implement xe_pagefault_init
  drm/xe: Implement xe_pagefault_reset
  drm/xe: Implement xe_pagefault_handler
  drm/xe: Implement xe_pagefault_queue_work
  drm/xe: Add xe_guc_pagefault layer
  drm/xe: Remove unused GT page fault code

 drivers/gpu/drm/xe/Makefile             |   3 +-
 drivers/gpu/drm/xe/xe_device.c          |   5 +
 drivers/gpu/drm/xe/xe_device_types.h    |  11 +
 drivers/gpu/drm/xe/xe_gt.c              |   8 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c    | 679 ------------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h    |  19 -
 drivers/gpu/drm/xe/xe_gt_types.h        |  65 ---
 drivers/gpu/drm/xe/xe_guc_ct.c          |   6 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  95 ++++
 drivers/gpu/drm/xe/xe_guc_pagefault.h   |  15 +
 drivers/gpu/drm/xe/xe_pagefault.c       | 436 +++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.h       |  19 +
 drivers/gpu/drm/xe/xe_pagefault_types.h | 136 +++++
 drivers/gpu/drm/xe/xe_svm.c             |   3 +-
 drivers/gpu/drm/xe/xe_vm.c              |   1 -
 15 files changed, 723 insertions(+), 778 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
 create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h

-- 
2.34.1

