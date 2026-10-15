Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D073CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 08:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE81121A8;
	Thu, 15 Oct 2026 08:11:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67010EB9D
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792051875; x=1823587875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hjFMcg1i7XfCxBkLJQtxv91+yH0rqkQ39tgXzvByeYM=;
 b=jwYa54TNOgJdhvIKpXrqTS2Hyv/UVgsSQGbGvgciFUilYEzB8V9bS3Tr
 +OOsOM/6w2O9kELJFqkYcttO5HPDeb++LU1DRG/x9dsYA07cmBQxVmeQC
 rz9CDFXkh7p93x/9pRMaLxWKgEmVPcdT2oE3fDBKa2gpPgJNW69i31Rpb
 KNEyheKZBKHJH7cXpRVr/0rDmLvdqxcfV9CAeUSZvnRgJxUdhM0qoiV11
 BqMf/mgYsKMM3urwrvMexOic18MA8hKv20XCl+R/cInOI8RSQX8et73f/
 4XssfdabNY6/DNxJ1HqZv3bSQj/VeJlj+Ganb6PKvGh6p+hsCRQvLS4OX g==;
X-CSE-ConnectionGUID: vD/yxfCURYiy7CEkbqQYxg==
X-CSE-MsgGUID: DXPkYJQIS6+RmWJoo7gWkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="719078"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="719078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 01:10:59 -0700
X-CSE-ConnectionGUID: 9OhEqTrCTq64mpAEogFu2Q==
X-CSE-MsgGUID: TPBlHwChR+CYNwdV3Kq+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1541473"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 15 Oct 2026 01:10:58 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 0/7] Introduce xe_wedge
Date: Thu, 15 Oct 2026 13:40:14 +0530
Message-ID: <20261015081042.415942-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Raag Jadav (7):
  drm/xe/gt: Use GT ordered workqueue for wedging
  drm/xe: Drop xe_device_set_wedged_method()
  drm/xe: Move xe_device_wedged_fini() registration to
    xe_device_probe_early()
  drm/xe: Make xe_device_declare_wedged() IRQ safe
  drm/xe/pci_error: Flush GT wedge worker before bus reset
  drm/xe: Introduce xe_wedge
  drm/xe/ras: Move xe_ras_process_errors() to xe_ras

 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
 drivers/gpu/drm/xe/xe_device.c              | 190 +-------------
 drivers/gpu/drm/xe/xe_device.h              |  14 +-
 drivers/gpu/drm/xe/xe_device_types.h        |  28 +--
 drivers/gpu/drm/xe/xe_gsc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  26 +-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   9 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  14 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
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
 31 files changed, 444 insertions(+), 331 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

