Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754FACA9EBE
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 09:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163CE10E042;
	Sat, 10 Oct 2026 09:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XldvgZai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5285F10E042
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791623304; x=1823159304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MKKVHefpPEx+aMca72vKDO0/RNjGrBMVLZSUPk3xrtY=;
 b=XldvgZaiDGc4S2ku2OpKc2LUdmJ3XBSqwcrQHSDPuGhbH4zlq2ROljPH
 P9lgoI0zPOMJAB20UGOCoz/46vqtMUBTZ9IaQjb9l1eNUsdSuvyL3v6S+
 nJnfdcmJKb7aiZI93CDLgRS2GvPIqf0G25Ty0oCtMd5rxi4nqE0D2KqCD
 kt9hDntsuzFh6LCperRBa+IXJafOtQZ1/1NJu6wXrQ0lLC3qIzUYaBtJ1
 kE5fwKrCoxHL73C921fGyNS/ay8ovbIfijqkAoUazqvie4W5pgGHzF1fZ
 SjxSCGL36iw7gsNfn11K39TYlMB7yT+pBAqHFD9l4xaqiuRVZ+5VFOZ5J w==;
X-CSE-ConnectionGUID: kmjASQ8SSl2nSee6XCdbTA==
X-CSE-MsgGUID: 6VM+cwClS9S5GKnGYxN+cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="290824"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="290824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2026 02:08:23 -0700
X-CSE-ConnectionGUID: ViRN+Xg3TTuCXAAO6uNUsw==
X-CSE-MsgGUID: CcUgPOaETtCW910LlrWlSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="427708"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 10 Oct 2026 02:08:21 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/5] Introduce xe_wedge
Date: Sat, 10 Oct 2026 14:36:17 +0530
Message-ID: <20261010090718.68308-1-raag.jadav@intel.com>
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

Raag Jadav (5):
  drm/xe/gt: Use GT ordered workqueue for wedging
  drm/xe: Move xe_device_wedged_fini() registration to
    xe_device_probe_early()
  drm/xe: Make xe_device_declare_wedged() IRQ safe
  drm/xe: Introduce xe_wedge
  drm/xe/ras: Move xe_ras_process_errors() to xe_ras

 Documentation/gpu/xe/xe_device.rst          |   2 +-
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                  |   3 +-
 drivers/gpu/drm/xe/xe_debugfs.c             |  66 +----
 drivers/gpu/drm/xe/xe_device.c              | 190 +------------
 drivers/gpu/drm/xe/xe_device.h              |  14 +-
 drivers/gpu/drm/xe/xe_device_types.h        |  28 +-
 drivers/gpu/drm/xe/xe_gsc.c                 |   3 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  26 +-
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   3 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   9 +
 drivers/gpu/drm/xe/xe_guc.c                 |   4 +-
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              |   7 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  11 +-
 drivers/gpu/drm/xe/xe_guc_rc.c              |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  13 +-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c       |   3 +-
 drivers/gpu/drm/xe/xe_mert.c                |   5 +-
 drivers/gpu/drm/xe/xe_pci_error.c           |   9 +-
 drivers/gpu/drm/xe/xe_ras.c                 |  12 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c            |   3 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c  |   5 +-
 drivers/gpu/drm/xe/xe_uc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +-
 drivers/gpu/drm/xe/xe_wedge.c               | 287 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h               |  20 ++
 drivers/gpu/drm/xe/xe_wedge_types.h         |  45 +++
 31 files changed, 462 insertions(+), 330 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

