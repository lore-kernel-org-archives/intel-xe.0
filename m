Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5272EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423C10E321;
	Wed,  1 Jul 2026 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoINAdLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEBF10E321
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894935; x=1814430935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+8qdYblj8MuSNotw+3WDTjgkpMIAfhtNC6Zd6lQl1g=;
 b=eoINAdLMMMlm/kzTr/VMQNoDlw2KOSqpzMMSSl3fW+4HPCHfv3ACY7wr
 ds+vRvM7KSzxFuTMSNzeMqIiNZNZs/YW6NyMBW6An3lv84fJZyZqkqtFU
 csJz/IANNdZM6pZjF49voDClMf3Z8H0Oa3XKkeaLQcK3YPjdr0ZMhLP2l
 v7r/+sPow4ZDjzz9cCyKJjTlEt2rQGXOd7cERT5NtEaSnVe8pFrJQDK5b
 nIrQs1Sfxu+Xypad8ADpejtgowYQbugZIb+pVfDG72TjIFWh2eCiM2bAA
 iQjzvt15Tp8Z4vEUpGfrUAxHanZKhX3rPAOr8TgbQvcDVHtJBiP25TkS2 Q==;
X-CSE-ConnectionGUID: 0XeAS2QuQPWltgXNTSWlFQ==
X-CSE-MsgGUID: a8XbISCKTOezO96+k3f3Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83492925"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83492925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:35:34 -0700
X-CSE-ConnectionGUID: aPU8QceFS/yf/8f/jv629g==
X-CSE-MsgGUID: buyrSL4vQfCJbIzcc9uQLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="276806164"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 01:35:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 00/10] Introduce Xe PCIe FLR
Date: Wed,  1 Jul 2026 13:59:24 +0530
Message-ID: <20260701083051.450259-1-raag.jadav@intel.com>
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
    Redesign wedged state management to prevent races
    Add 'Xe' prefix to document title (Rodrigo)

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
 drivers/gpu/drm/xe/xe_bo_evict.c            |  51 +++-
 drivers/gpu/drm/xe/xe_bo_evict.h            |   2 +
 drivers/gpu/drm/xe/xe_device.c              | 252 +++++++++++++++++---
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
 drivers/gpu/drm/xe/xe_pci.h                 |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c           | 129 ++++++++++
 drivers/gpu/drm/xe/xe_pm.c                  | 103 +-------
 drivers/gpu/drm/xe/xe_uc.c                  |  72 ++++++
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  67 ++++++
 drivers/gpu/drm/xe/xe_uc_fw.h               |   1 +
 drivers/gpu/drm/xe/xe_uc_types.h            |  14 ++
 37 files changed, 798 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

-- 
2.43.0

