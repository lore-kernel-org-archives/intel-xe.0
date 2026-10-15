Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEC2CC6B2F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 06:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F009710EB96;
	Thu, 15 Oct 2026 06:27:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64910EB96
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792045616; x=1823581616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LUxQFxWjn3tj50bBxu5w/OIxbpi20lX9gcMMpW6/9Xw=;
 b=jG53oICU8Lsyyi6CuYQd1evWeLNh30DNBnKE87vPwzbmDvo7sEGwYETZ
 JMETXAGXKKpCt0MILhTkLGtmSQttIsFmPqZLZ2938ACMixT8Tet5z6JLc
 j3giUIH8dY1qb+WzuzdmLKNmpumECGBy5GcNhuOKHoR/bn3mWEK3mEH41
 /VItC6DWokhity8B2cRND2wjosZF4fNxQhY0CupHbJkgViRtjDaXhfEtb
 /hsiL93sfLt2grg9/aj/bm5Y5/kaWCUeEp4FlXOmH/rK9EGPAJ2bXHYit
 qzSIkSxFg/S9g7u3vpqyQOGoWCvGT5JTP78AVxavkpxN5gXbgGf7tv8sq A==;
X-CSE-ConnectionGUID: ZTCxGVhaTUeOXgOOWC8Zcg==
X-CSE-MsgGUID: NGpD3YK+Sem6mlK4e5ZNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="817279"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="817279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:26:56 -0700
X-CSE-ConnectionGUID: 7DBgKJWVQcOVimEnmYbpsQ==
X-CSE-MsgGUID: RxNYFAyQQEuTwlYdCc3zng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1566592"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 14 Oct 2026 23:26:54 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 0/7] Introduce xe_wedge
Date: Thu, 15 Oct 2026 11:55:31 +0530
Message-ID: <20261015062623.385048-1-raag.jadav@intel.com>
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

