Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA17E9A05F
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 20:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CD110E748;
	Thu, 19 Feb 2026 20:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mx6ZczX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C6A10E745;
 Thu, 19 Feb 2026 20:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771531864; x=1803067864;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ltJ4ePjSsFhrU9YY5N1xlukv6iXSKgetc0ahWa/QUpk=;
 b=Mx6ZczX8hbVxQYiFz/nd9nC5RT/T5fZYe6hafTwYt8n4hI/QO8C8II7A
 6bAUdJnelOVRkwoseiwXnOSxjyhxll8EH4LvpX2JlHWntuDs1/qef8KDp
 t43kr/KiLZcaxXPpZDwGZYBPRg/Hx9FcHbZJrw7PqK2aOKWtcl1KKkJPg
 5PqBcTA98u+sXWkDcuTmqIeXtUJ1GNOjOjJ/73LbilYbwTnBvja40vuC+
 OrBna4RXhccpNHALABVAPArA51c6gUD1Rg6LIXGY9lDv7zIJmNGyrajx8
 JKlipFNld5iprKScI2ZJlzSr1i/1uWuGdAFWizX0CaO5Yr61Mou3V6CkQ Q==;
X-CSE-ConnectionGUID: 5xiTlK6RRoCbfjkPgEm4Uw==
X-CSE-MsgGUID: kOcNDoY3Q+OYQCQv67aiog==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71654284"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71654284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:03 -0800
X-CSE-ConnectionGUID: IPkiQKgnQVq/2er9ZpS8FQ==
X-CSE-MsgGUID: tmOE4mZETyqBjIbAYUmkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214663956"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:11:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v5 0/5] Use new dma-map IOVA alloc, link,
 and sync API in GPU SVM and DRM pagemap
Date: Thu, 19 Feb 2026 12:10:52 -0800
Message-Id: <20260219201057.1010391-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v5:
 - Address Thomas's comments

Francois Dugast (1):
  drm/pagemap: Add helper to access zone_device_data

Matthew Brost (4):
  drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
  drm/pagemap: Drop source_peer_migrates flag and assume true
  drm/pagemap: Split drm_pagemap_migrate_map_pages into device / system
  drm/pagemap: Use dma-map IOVA alloc, link, and sync API for DRM
    pagemap

 drivers/gpu/drm/drm_gpusvm.c  |  62 +++++++--
 drivers/gpu/drm/drm_pagemap.c | 242 ++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.c   |   1 -
 include/drm/drm_gpusvm.h      |   5 +
 include/drm/drm_pagemap.h     |  22 +++-
 5 files changed, 247 insertions(+), 85 deletions(-)

-- 
2.34.1

