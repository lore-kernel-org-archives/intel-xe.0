Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6FAEA7963
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 04:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1346810E1D9;
	Thu,  5 Feb 2026 04:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cjr2QAjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3610E1D9;
 Thu,  5 Feb 2026 04:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770265167; x=1801801167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sZVq3dgrahYfLPGi7tqzkxEJco2igJ0T5REaGhFyOyM=;
 b=Cjr2QAjL9TgcOVRWrnmWuGlPCMpWckz/GV7ftiKMSUwKrRZ4lk4GyqpJ
 VQDYokV9qF34BE8jPwFDID0J0pGcLCA44z3SXNRov4RyBYVwRBkz0Rcgg
 mCpoChSoEMwdCu4U/1+JsVxmlaqfuWeX1RF8RmZTiyVZouJVgdTwjOMzW
 rGqIZO3j14J86VmWIkF4+r40ky7YtcUybLmb5vFhIOGeaZKbGSRODrMT2
 3L/2ZLK3lbI9BaSRc6ZRiBC07qU7CTvR/C/6Pl2fsC67/pbpwdN5vo6Er
 jZZ8VFm5lqf8Z+CdYuugveyth6tFT0qLUywZ3Qi7y4ZDyhbAvmyacIa++ A==;
X-CSE-ConnectionGUID: 13rzniTMQ9ePs03BjU1GIg==
X-CSE-MsgGUID: AhRxgXXsTHeRm0CBRAF9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96914162"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="96914162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:19:26 -0800
X-CSE-ConnectionGUID: uN6z55LfSmuNMCecAD9i4A==
X-CSE-MsgGUID: d1BYKZuMSG+Ucziqab7ZeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210453866"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:19:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 0/4] Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM and DRM pagemap
Date: Wed,  4 Feb 2026 20:19:17 -0800
Message-Id: <20260205041921.3781292-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The dma-map IOVA alloc, link, and sync APIs perform significantly better
than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
This difference is especially noticeable when mapping a 2MB region in
4KB pages.

Use dma-map IOVA alloc, link, and sync APIs for GPU SVM and DRM page,
which mappings between the CPU and GPU.

Initial results are promising.

Baseline CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 333.99665178571428571429, .61102853199282922865
Average migrate 64K cpu time (us, percentage): 18.62723214285714285714, .30127985269960467173

After this series CPU time during 2M / 64K fault with a migration:
Average migrate 2M cpu time (us, percentage): 224.81808035714285714286, .51412827364772602557
Average migrate 64K cpu time (us, percentage): 14.65625000000000000000, .25659463050529524405

Matt

v2:
 - Include missing basline patch for CI
v3:
 - Fix memory corruption
 - PoC IOVA alloc for multi-GPU
v4:
 - Pack IOVA / drop dummy pages
 - Drop multi-GPU IOVA alloc

Francois Dugast (1):
  drm/pagemap: Add helper to access zone_device_data

Matthew Brost (3):
  drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
  drm/pagemap: Split drm_pagemap_migrate_map_pages into device / system
  drm/pagemap: Use dma-map IOVA alloc, link, and sync API for DRM
    pagemap

 drivers/gpu/drm/drm_gpusvm.c  |  62 +++++++--
 drivers/gpu/drm/drm_pagemap.c | 229 +++++++++++++++++++++++++---------
 include/drm/drm_gpusvm.h      |   5 +
 include/drm/drm_pagemap.h     |  14 +++
 4 files changed, 238 insertions(+), 72 deletions(-)

-- 
2.34.1

