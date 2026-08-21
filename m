Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA498C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828AF10E210;
	Fri, 21 Aug 2026 11:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5RVmVlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CB310E210
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311513; x=1818847513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=62UVhG85Z5SiUJ9TFNOa7f0kRssIyx33r1GjfaiH68s=;
 b=Z5RVmVlVMQObwQ8dODtOwr/I0Zulfg4tgJlDk/CMB2F7bII7UiPCD5Oe
 /UcJr6W3hzS4haP1iLI7h4Kh8Wi9Ej8tFv892CjK5YaZrgrFfSJZIy6C7
 CJCRBMRf00s/sRRlus8xPosSOVonPjyHYSLI8nBTgDSkwacqrJSGwKUsL
 BmF11IwtSbfkdZEOJPDpE/pP28ArL9IGB+R2dZ4+3i8suBM2N1ckj0qEy
 FvftaIPZT2mc1KtLXrmNryj2SBeY/SRQ6G5EdpvqRi5nHPHdIOzsogMbH
 AdP8wAxk5UhtEyxlKTrpA9ZjrWi7pB1l+qkt2LPTm1V8P3H4+Iks1QOJE w==;
X-CSE-ConnectionGUID: 6ijv6IizTZ+gXsO1ttxL5g==
X-CSE-MsgGUID: yxq/s9+1RlyOU2K8/wawaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377518"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:12 -0700
X-CSE-ConnectionGUID: Y1MpBN2fS66/Ccb47cfqiA==
X-CSE-MsgGUID: CbmbV+mqS8S65LmgV0pHfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523383"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:08 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 00/10] Introduce Xe PCIe FLR
Date: Fri, 21 Aug 2026 16:53:22 +0530
Message-ID: <20260821112436.545405-1-raag.jadav@intel.com>
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

Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
support in xe driver. This is ofcourse a half baked implementation and
only limited to re-initializing GT. This needs to be extended for a lot
of components which are expected to be added as a follow up.

Detailed description in commit message and documentation.

PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
a spin and let me know if any regressions.

Trigger it with:

$ echo 1 > /sys/bus/pci/devices/<BDF>/reset

 v2: Re-initialize migrate context (Matthew Brost)
     Add kernel doc (Matthew Brost)
     Spell out Function Level Reset (Jani)

 v3: Cancel in-flight jobs before FLR

 v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)

 v5: Re-initialize kernel queues through submission backend (Matthew Brost)
     Prevent PM ref leak for wedged device (Matthew Brost)

 v6: Skip uC firmware selection during re-initialization (Daniele)
     Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
     s/flr_done/reinit (Daniele)
     Repurpose system suspend/resume helpers for FLR (Daniele)
     Add PCIe FLR documentation (Daniele)

 v7: Refine PCIe FLR documentation (Daniele)
     Introduce xe_pci_reset_skip() helper (Lukasz)

 v8: Set fw state to XE_UC_FIRMWARE_INIT_FAIL on failure (Daniele)
     Introduce xe_sched_reinit() (Daniele)
     Maintain timeout per scheduler instance (Daniele)
     s/reinit/reinit_kernel (Daniele)

 v9: Move drm_sched_is_stopped() assert to xe_sched_reinit() (Daniele)
     Add negative asserts for GSC and PXP (Daniele)
     Provide xe_lrc_ctx_init() as regular function (Daniele)
     Redesign wedged state management to prevent races (Sashiko)
     Add 'Xe' prefix to document title (Rodrigo)

v10: Spell out temporary device wedging in subject (Lukasz)
     Update documentation to include PCI Error Handling (Lukasz)
     Maintain wedged reference on FLR failure (Lukasz)

Raag Jadav (10):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
  drm/xe/gt: Introduce FLR helpers
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pm: Introduce xe_device_suspend/resume()
  drm/xe: Introduce temporary device wedging
  drm/xe/pci: Introduce PCIe Function Level Reset
  drm/xe/doc: Wire up PCI Error Handling

 Documentation/gpu/xe/index.rst              |   1 +
 Documentation/gpu/xe/xe_pci_error.rst       |   8 +
 drivers/gpu/drm/xe/xe_bo_evict.c            |  51 +++-
 drivers/gpu/drm/xe/xe_bo_evict.h            |   2 +
 drivers/gpu/drm/xe/xe_device.c              | 256 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h              |  10 +-
 drivers/gpu/drm/xe/xe_device_types.h        |  11 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  47 +++-
 drivers/gpu/drm/xe/xe_exec_queue.h          |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +
 drivers/gpu/drm/xe/xe_execlist.c            |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  17 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |   5 +
 drivers/gpu/drm/xe/xe_gsc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_gsc.h                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |  33 +++
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |  29 +++
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   9 +
 drivers/gpu/drm/xe/xe_huc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_huc.h                 |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                 |  15 +-
 drivers/gpu/drm/xe/xe_lrc.h                 |   2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  12 +
 drivers/gpu/drm/xe/xe_migrate.h             |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |   1 +
 drivers/gpu/drm/xe/xe_pci_error.c           | 138 ++++++++++-
 drivers/gpu/drm/xe/xe_pm.c                  | 103 +-------
 drivers/gpu/drm/xe/xe_uc.c                  |  73 ++++++
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  67 +++++
 drivers/gpu/drm/xe/xe_uc_fw.h               |   1 +
 drivers/gpu/drm/xe/xe_uc_types.h            |  14 ++
 35 files changed, 806 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst

-- 
2.43.0

