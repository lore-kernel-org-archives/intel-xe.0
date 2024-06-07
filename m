Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF70C27C6E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6622110ECF8;
	Fri,  7 Jun 2024 18:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oyro0IWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3BC10E1D3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717785068; x=1749321068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Je5E56RqSV1eRekW3Lz3I7b622CRyXngaP4gfS+P2cU=;
 b=Oyro0IWLNW4j4/xDz9CKmsJIwkAxbDVP1ZwxwtuRr4tKA6mE7e1qj5jb
 E8WLOqSOnczWQHZcwKZiibPE3Yl23AQcH2omFlD5Mcj9xKjRkn/H4aoWY
 2joDmKwSX9hIjLp4M5yaW5nV+oYfNzRWdWW09aT+ZuUP3gkug093+rgL7
 tuSIYfV6VqhF26Jt1oJ+N5+czszMWWzFk0tUF1TN3+LtENFK9OPa42mXe
 3Jzs1Y5RZkva133d7gAKZwh3+8O3EWYW+LIekrnJJ44FdcutOaZdyV4gg
 aOsoK7Oy4uouitqf7tat9itELtIdLif0HIDJpCk/E2NievQyQVDWpURtj Q==;
X-CSE-ConnectionGUID: dkdcEU32R5mHyqqRsdYO2w==
X-CSE-MsgGUID: lYDcjRthTQmDy4KigFthdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18314394"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18314394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:07 -0700
X-CSE-ConnectionGUID: bqm9C9dAQ2+cmquPes/pWg==
X-CSE-MsgGUID: pUMEF6z4QgWxOioBnRWoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43342144"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:31:08 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: [PATCH v6 0/6] Tracing cleanup and add mmio tracing
Date: Fri,  7 Jun 2024 11:29:37 -0700
Message-Id: <20240607182943.3572524-1-radhakrishna.sripada@intel.com>
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

xe_trace.h is getting bloated. Group related events to their own
files. All bo, vm and vma related events have been moved to 
xe_trace_bo.h. GuC related trace events have been moved to
xe_trace_guc.h. Patches 1 and 2 splits the trace events into
seperate files.

In multi gpu environments, it is important to know the device from
which the event was triggered. Print the device id information along
with the trace information being printed. Patches 3, 4 and 5 make
changes to print the device id's if not already captured.

Mmio reg read writes are important tracing information that needs to be
captured and will be helpful in display debug. Patch 6 adds the reg
read/write tracing support.

Earlier versions of patch 6 can be found here:
v1: https://patchwork.freedesktop.org/series/119312/
v2: https://patchwork.freedesktop.org/series/132626/

v4: Fixes the review comments from Gustavo
v5: Fixes the kunit error reported.
v6: Remove unused string_helper inclusion in trace files and other 
    minor cleanups

Radhakrishna Sripada (6):
  drm/xe/trace: Extract bo, vm, vma traces
  drm/xe/trace: Extract guc related traces
  drm/xe/trace: Print device_id in xe_trace_bo events
  drm/xe/trace: Print device_id in xe_trace_guc events
  drm/xe/trace: Print device_id in xe_trace events
  drm/xe: Add reg read/write trace

 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/xe_bo.c                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  27 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |  13 +-
 drivers/gpu/drm/xe/xe_migrate.c             |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c                |  23 +-
 drivers/gpu/drm/xe/xe_pt.c                  |   8 +-
 drivers/gpu/drm/xe/xe_trace.h               | 380 ++++----------------
 drivers/gpu/drm/xe/xe_trace_bo.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_bo.h            | 247 +++++++++++++
 drivers/gpu/drm/xe/xe_trace_guc.c           |   9 +
 drivers/gpu/drm/xe/xe_trace_guc.h           | 110 ++++++
 drivers/gpu/drm/xe/xe_vm.c                  |   2 +-
 14 files changed, 492 insertions(+), 344 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_bo.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h

-- 
2.34.1

