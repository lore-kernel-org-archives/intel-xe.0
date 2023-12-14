Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C9FC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9290210E8ED;
	Thu, 14 Dec 2023 11:24:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C69310E8ED
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702553065; x=1734089065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kgbVtZpq3bxNjyWGZkv0g/GZrt5BRsR6+YcjW6rvdI4=;
 b=ScvdU5QBzLImSW5oyZ95KYU4u1FZButygt1JRczL2kXxJ0mhkZapv1wy
 qY/H49Rl0z37R9a5DkzfwY+o2JrQgAYl/qsanh6HUXn3gXHWJ8B9h7NZh
 s/8pLPEkgr3o4yJd8mmIPT9xOQSXq0hQFzmNSgJq16p//eMNTGGfAQoD1
 RMoXOU+rCJpIYfrVQQADMTyTI/DspHRvw48BXeGYgK7x4twNzBvYnAh5p
 aqjCNRnBYdYJomyE39BpG6uoWdARBN1n9wbbbuprTYIuS3PlKU/VDYMjv
 E4S6e0F9PduW0qo4OQzV+gDYk1rcxdpKe36jqed7iuLGXv47WGnfMHQrm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1940159"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1940159"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="17714156"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:24:22 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 00/10] Engine Busyness
Date: Thu, 14 Dec 2023 17:01:34 +0530
Message-Id: <20231214113144.251726-1-riana.tauro@intel.com>
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

The first two patches are added for compilation and are
part of https://patchwork.freedesktop.org/series/127664/

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

GuC also provides a periodically total active ticks that GT has been
active for. This counter is exposed to the user such that busyness can
be calculated as a percentage using

busyness % = (engine active ticks/total active ticks) * 100.

This can be listed as

sudo ./perf list
     xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
     xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]

and can be read as

        sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/,xe_0000_03_00.0/total-active-ticks-gt0/  -I 1000

v2: rebase
    fix review comments

v3: rebase
    add dropping of group busyness changes
    add pmu base implementation

Aravind Iddamsetty (1):
  RFC drm/xe/pmu: Enable PMU interface and add engine busyness counter

Ashutosh Dixit (2):
  drm/xe/pmu: Remove PMU from Xe till uapi is finalized
  fixup! drm/xe/uapi: Reject bo creation of unaligned size

Riana Tauro (7):
  drm/xe: Move user engine class mappings to functions
  RFC drm/xe/guc: Add interface for engine busyness ticks
  RFC drm/xe/uapi: Add configs for Engine busyness
  RFC drm/xe/guc: Add PMU counter for total active ticks
  RFC drm/xe/guc: Expose engine busyness only for supported GuC version
  RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
  RFC drm/xe/guc: Handle runtime suspend issues for engine busyness

 drivers/gpu/drm/xe/Makefile                 |   5 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   5 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c       |   2 +
 drivers/gpu/drm/xe/xe_device.c              |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  19 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  41 ++-
 drivers/gpu/drm/xe/xe_gt.h                  |   3 +
 drivers/gpu/drm/xe/xe_guc.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 375 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  22 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  25 ++
 drivers/gpu/drm/xe/xe_hw_engine.c           |  50 +++
 drivers/gpu/drm/xe/xe_hw_engine.h           |   3 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 326 ++++++++---------
 drivers/gpu/drm/xe/xe_pmu.h                 |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h           |  19 -
 drivers/gpu/drm/xe/xe_query.c               |  23 +-
 include/uapi/drm/xe_drm.h                   |  50 ++-
 21 files changed, 756 insertions(+), 247 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h

-- 
2.40.0

