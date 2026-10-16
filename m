Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118ADCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C604E112619;
	Fri, 16 Oct 2026 07:27:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEA8112602
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135622; x=1823671622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NcACwqbm0kci6i8Z1DGl9+dYScQFZ9UXjkKRZSZbn3g=;
 b=cgjgKmNDMGH4TPv0ApoDsNczDdGjbkxF2DmgsgVwQETYKhInzEVoGehN
 hOAP2t5EbUzx8vs6iUhiYGg7y+rZgseuw1kd/gsbKXIgpCDlrXhGj1LFO
 gYwZPEyWlQNo0dGjt8xN3NsYm4CwcNtbtSjZHEVLrvRRVNcMipp4BtW5j
 lorMqH1Ydnr+Tyx5LLfJouFp+wruv+Dr0YB1771Pkk5B6nNFylQjr1Z+C
 JozVm+fdngpvdmCwXc4Hpw9XjZYCSGAiqE/bvSdHsb+PVry1YJgptcPHb
 ehS92ghHEk3YTAgKyn2DtDssQklhm9uSICZuw+VeuSsUUQ71candWW992 g==;
X-CSE-ConnectionGUID: LUa/PBZwRwiNKG62lWljYQ==
X-CSE-MsgGUID: 0XbP4/fAQ1Sjaf6qPAIHmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="806115"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="806115"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:27:02 -0700
X-CSE-ConnectionGUID: aT+xu/1MRByVoEp9rPYZDQ==
X-CSE-MsgGUID: DL8cy4BhTAiZ1b8+CTmiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3673843"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 00:26:58 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 0/9] Introduce xe_wedge
Date: Fri, 16 Oct 2026 12:55:54 +0530
Message-ID: <20261016072623.457392-1-raag.jadav@intel.com>
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

 v9: Drop runtime PM guard from GT wedge worker (Matthew Brost)

v10: Guard wedge callers with runtime PM (Sashiko)

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
 drivers/gpu/drm/xe/xe_amc.c                 |   6 +-
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
 drivers/gpu/drm/xe/xe_hw_error.c            |   1 +
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
 32 files changed, 447 insertions(+), 331 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
 create mode 100644 drivers/gpu/drm/xe/xe_wedge_types.h

-- 
2.43.0

