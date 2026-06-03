Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4FCCD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60C710FB72;
	Wed,  3 Jun 2026 10:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxoMgkrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5392F10FB72
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780482112; x=1812018112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xmFNIGSuAzFSkcsKlB+6BSR5SiAAZhf58VZ/BdFIwp0=;
 b=AxoMgkrgs6uvhXxE5ceEpz2VcUvpjza5NwPrILUX1sXPPmblqnCLjEBi
 eOrgzhnQsLr6OqnjcK7XHryq2zAFDePpsnUN1cKYrwObSJr6tTbZ0RVLK
 l1N2XZVqOSyoQP803Y+ROusg9AjgnMxo1Gll+FH+eXD1jeZrnh/eh9JDT
 uIe3XnAJl7DwllLgXDYvtF2xLjvbo2nJ5EJmuB03eY8Z+7ur2H67ojDMd
 x9IKfr+ngFrs7ysq7KAeXkl75+uikO2Ewi/FYapQrAnq99F/8c1DPObn9
 xvWvZoWqgreRB/mmsicKOwXq1t4CKwfj8vV73b0W4W3k9tttDfKcqFLPB g==;
X-CSE-ConnectionGUID: rNQiOPPhQeCyO5N/b7QFOg==
X-CSE-MsgGUID: Q1Aesu8bQaGxVf3i7hH4yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81143217"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81143217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:21:51 -0700
X-CSE-ConnectionGUID: yZD0HT5VS6a8/Mvroixc8Q==
X-CSE-MsgGUID: fMOv4JsfR4qcG/IY041qXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248495558"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 03:21:47 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 00/10] Introduce Xe PCIe FLR
Date: Wed,  3 Jun 2026 15:47:00 +0530
Message-ID: <20260603101814.916948-1-raag.jadav@intel.com>
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

Raag Jadav (10):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
  drm/xe/gt: Introduce FLR helpers
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pm: Introduce xe_device_suspend/resume()
  drm/xe: Improve wedged state management
  drm/xe/pci: Introduce PCIe FLR
  drm/xe/doc: Wire up PCI Error Handling

 Documentation/gpu/xe/index.rst              |   1 +
 Documentation/gpu/xe/xe_pci_error.rst       |   8 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c            |  51 ++++++-
 drivers/gpu/drm/xe/xe_bo_evict.h            |   2 +
 drivers/gpu/drm/xe/xe_device.c              | 155 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.h              |  14 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  42 +++++-
 drivers/gpu/drm/xe/xe_exec_queue.h          |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +
 drivers/gpu/drm/xe/xe_execlist.c            |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |   5 +
 drivers/gpu/drm/xe/xe_gsc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_gsc.h                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |  33 +++++
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |  29 ++++
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |  12 ++
 drivers/gpu/drm/xe/xe_huc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_huc.h                 |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                 |  17 +++
 drivers/gpu/drm/xe/xe_lrc.h                 |   2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  12 ++
 drivers/gpu/drm/xe/xe_migrate.h             |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |   1 +
 drivers/gpu/drm/xe/xe_pci.h                 |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c           | 126 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c                  | 103 +------------
 drivers/gpu/drm/xe/xe_uc.c                  |  72 +++++++++
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  67 +++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h               |   1 +
 drivers/gpu/drm/xe/xe_uc_types.h            |  14 ++
 37 files changed, 720 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

-- 
2.43.0

