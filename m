Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678E606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 05:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lEV6BD+J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDF7112307;
	Thu, 22 Oct 2026 05:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C269010E1F9
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792646005; x=1824182005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VjmHF3jqx2EcPIbdpdTFM1AoWRJtLkje+V8V3/TDB+Y=;
 b=lEV6BD+JmIS+nrPj9JYaQLWKUx2Aik24OwSzkaSoXPVbIpn8qz6bY66Q
 T2temk4PGe5q6Kqf/Yb3L/3XdwyYzdIGY04OOuzMlMAWo0ktZysx0kLm8
 4hL5M707iSj3uSzKDWPAu5zGnTs2BJ669nMGbYRwtpWBcfsc+4zno46JY
 fQ1QQX8MdGU7PvehzsLWv0yu5w4D/6ol4jSJCNsKX5mdEHUFP6DRQyVLU
 8R/RqqulXwn84GI+Naoo6aAg4asuhLB8mebE6No80VaLgxLJHp5yyLmsw
 Zbd9sF++QNv+/mYcrxZPKSoahYFAZAsdHmzNfXJ5w7JxIOOAq1jbQ3N14 g==;
X-CSE-ConnectionGUID: IR0y2pSAR9CF895akrjQWw==
X-CSE-MsgGUID: uDL29HRRQ+aFo9HVLhaw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1393918"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1393918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:13:24 -0700
X-CSE-ConnectionGUID: TGB9BJ+YS3OQcktgNNJW+w==
X-CSE-MsgGUID: mW5cF6wZRWihD0HFtdR4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3268700"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2026 22:13:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 0/9] Introduce xe_wedge
Date: Thu, 22 Oct 2026 10:42:24 +0530
Message-ID: <20261022051303.282805-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the history of xe technical debt, this series takes one more step and
consolidates all wedging implementation into a dedicated xe_wedge component.

While at it, this fixes a few pre-existing issues related to wedge handling.
Detailed description in commit message.

 v1: https://patchwork.freedesktop.org/series/172727/

 v2: Split fixes into separate patches (Rodrigo, Michal)
     Also move struct xe_wedge and wedged_mode debt to xe_wedge (Lukasz, Michal)
     Naming and aesthetic adjustments (Lukasz, Michal)

 v3: Respect the component namespace (Rodrigo)
     Avoid chaining header includes (Rodrigo)
     Squash debugfs changes with xe_wedge patch (Lukasz)

 v4: Introduce for_each_initialized_gt() (Michal)
     Include xe_sriov.h (Rodrigo)

 v5: Flush GT wedge worker to avoid races (Sashiko)
     Drop IRQ safe wedging for its flawed design

 v6: Move wedge worker initialization to xe_gt_init_early() (Rodrigo)
     Don't flush GT wedge worker to avoid deadlock (Sashiko)
     Include IRQ safe wedging with redesign

 v7: Guard GT wedge worker with runtime PM (Rodrigo)
     Retain xe_pm_runtime_get_noresume() in IRQ context (Rodrigo)

 v8: Rebase

 v9: Drop runtime PM guard from GT wedge worker (Matthew Brost)

v10: Guard wedge callers with runtime PM (Sashiko)

v11: Use traditional xe_pm_runtime_get/put() with goto (Sashiko)

v12: Teardown GT wedge worker alongside GT reset worker (Sashiko)

v13: Avoid deadlock with GuC CT waiters (Sashiko)

v14: Rebase

Raag Jadav (9):
  drm/xe/gt: Use GT ordered workqueue for wedging
  drm/xe: Drop xe_device_set_wedged_method()
  drm/xe/hw_error: Guard csc_hw_error_work() with runtime PM
  drm/xe: Move xe_device_wedged_fini() registration to
    xe_device_probe_early()
  drm/xe: Make xe_device_declare_wedged() IRQ safe
  drm/xe/pci_error: Flush GT wedge worker before bus reset
  drm/xe/amc: Guard xe_amc_work() with runtime PM
  drm/xe: Introduce xe_wedge
  drm/xe/ras: Move xe_ras_process_errors() to xe_ras

 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                 |  11 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
 drivers/gpu/drm/xe/xe_device.c              | 190 +-------------
 drivers/gpu/drm/xe/xe_device.h              |  14 +-
 drivers/gpu/drm/xe/xe_device_types.h        |  28 +--
 drivers/gpu/drm/xe/xe_gsc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  48 +++-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   9 +
 drivers/gpu/drm/xe/xe_guc.c                 |   5 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  14 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
 drivers/gpu/drm/xe/xe_hw_error.c            |   2 +
 drivers/gpu/drm/xe/xe_mert.c                |   5 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |  13 +-
 drivers/gpu/drm/xe/xe_ras.c                 |  11 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |   4 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 262 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h               |  24 ++
 drivers/gpu/drm/xe/xe_wedge_types.h         |  44 ++++
 32 files changed, 468 insertions(+), 339 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

