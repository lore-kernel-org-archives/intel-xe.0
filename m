Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312AAC0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD1F10E2AC;
	Mon, 27 Nov 2023 14:04:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E071610E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701093865; x=1732629865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hc7HqahbrSBCkMK28PGS9lfyBys4zb9E3aWzmjxWyvo=;
 b=hHVLaZ3cTFjTdzeX8MIQYSMyxUdWkDewCqtxoLsDZ7j2RwVCf5VB4KE/
 IsW8NFeVw0RgKZjc3nvzq8BUSkl7Rp6frPKIllMvnGRa1xYYwYJeDLCuY
 1Qyepe+OS9L9SY1ilyH3f+OW4GHUGY147RPY30JWN96/pyM+jsOyoytP/
 i2JUK4YUfszyZ2sI9xjFshVtBUC2I7C1iKPKFpzE2+OGcowWzp0CPNGU4
 jwLg/SCwAb7AQ4dZZLSvwzYgyVT2NB6Tzsd+hUjXDswv62KOfEnPLvLtV
 iVP3mRUhSqktO0UUhE62Eu3o31WQO7PYW+J3+bL9ifvNy/mO3lZdH9lv6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="457039771"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="457039771"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="761604420"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="761604420"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:04:08 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 19:41:17 +0530
Message-Id: <20231127141125.2913415-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] Engine Busyness
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


Riana Tauro (8):
  drm/xe: Move user engine class mappings to header
  drm/xe/guc: Add interface for engine busyness ticks
  drm/xe/guc: Expose engine busyness only for supported GuC version
  drm/xe/guc: Add PMU counter for total active ticks
  drm/xe/uapi: Add configs for Engine busyness
  drm/xe/pmu: Add PMU counters for engine busy ticks
  drm/xe/guc: Dynamically enable/disable engine busyness stats
  drm/xe/guc: Handle runtime suspend issues for engine busyness

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |  17 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  26 ++
 drivers/gpu/drm/xe/xe_gt.h                  |   3 +
 drivers/gpu/drm/xe/xe_guc.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 366 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  21 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  25 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h     |  18 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 189 +++++++++-
 drivers/gpu/drm/xe/xe_pmu.h                 |   2 +
 drivers/gpu/drm/xe/xe_query.c               |  22 +-
 include/uapi/drm/xe_drm.h                   |  21 ++
 15 files changed, 691 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h

-- 
2.40.0

