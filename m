Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4EEC41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BE910E755;
	Fri, 22 Dec 2023 07:38:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0910E755
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230723; x=1734766723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lbP2a/xpRMF2zk6rY/E4iR7teUEi3l3N7sxj+53Uqto=;
 b=DfEizhyOTIs55uUDH7WFlPWr9C69863mqxllQAxgwB4xaxX2cQpf5coE
 SvkNT/MWshVNIOrZQLHrXdq1Aad+WsSZPb0kEcsGWr3Rnu2bAXI1g+zPf
 +lmWiUQ+EFq4H/8CkXyPXDAasePcQCsItvL1cKxrvxOZ8qXaEkI3heqhp
 Vg2EZtOYLWV+js0Y5HY6mmYaLD8Cyyvub1aGSxYImOMMIMuHpI6M+PlHF
 rmyXvKx7O75EttB2vmvCFPF7iSmARUV+CCzPVz04y+jO4ABDCvQf8kB1v
 CddIDCOSnKPtXjNMqK+CNHQnjGNF/Z63YgBAsWjR+v/INcLG8tegSCO1p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9480997"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9480997"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582568"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582568"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:37 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/8] Engine busyness
Date: Fri, 22 Dec 2023 13:15:54 +0530
Message-Id: <20231222074602.817518-1-riana.tauro@intel.com>
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

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

GuC also provides a periodically total active ticks that GT has been
active for (GuC loaded and running). 
This counter is exposed to the user such that busyness can
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

v4: rebase
    fix review comments

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface and add engine busyness counter

Riana Tauro (7):
  drm/xe: Move user engine class mappings to functions
  drm/xe/guc: Add interface for engine busyness ticks
  drm/xe/uapi: Add configs for Engine busyness
  drm/xe/guc: Add PMU counter for total active ticks
  drm/xe/guc: Expose engine busyness only for supported GuC version
  drm/xe/guc: Dynamically enable/disable engine busyness stats
  drm/xe/guc: Handle runtime suspend issues for engine busyness

 drivers/gpu/drm/xe/Makefile                 |   3 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_device.c              |   2 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |  19 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  39 ++
 drivers/gpu/drm/xe/xe_gt.h                  |   3 +
 drivers/gpu/drm/xe/xe_guc.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 371 +++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  22 +
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  25 +
 drivers/gpu/drm/xe/xe_hw_engine.c           |  51 ++
 drivers/gpu/drm/xe/xe_hw_engine.h           |   3 +
 drivers/gpu/drm/xe/xe_module.c              |   5 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 655 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h                 |  27 +
 drivers/gpu/drm/xe/xe_pmu_types.h           |  49 ++
 drivers/gpu/drm/xe/xe_query.c               |  23 +-
 include/uapi/drm/xe_drm.h                   |  60 ++
 20 files changed, 1346 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.40.0

