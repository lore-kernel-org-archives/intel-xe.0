Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691CF46C40
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A010E139;
	Mon,  6 Apr 2026 14:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoVw29rc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9491410E139
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775484700; x=1807020700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DNKn0NxgXREHFhU7fW6ZghYAbRt0fMUoE8wv7QtKsLk=;
 b=UoVw29rcWYb3wqNu2MnG2O6kKHPc4ZcSm9K6UcrGq2k8spGJGlf/Nzrb
 g/GHWtnOUU+cKXfKTAA5hfKTWA6Es+6WHPyNf7Ol8vYVBK5BS6awCyM7j
 ZYXh5roTv02T1HLXIZdOYpWUb3nmEY7vom1AtrqygxjCxvn6mO/qtXK7B
 yhLo6Hce9FMUYrzwNNOW4GCd2Kvki6jUv2IdhDQ5d/hF7FIdgxQ2r2WSd
 W0zKqF77nFNekUwpVisM8YwhIxjWao5Y0op6mVACigoo5hIqyNgue3GlI
 JCvDEENukSWD4vT7gcrOlCKZ53fHNvSdiy7K+zBdue4EnPngCS/f3xcN1 A==;
X-CSE-ConnectionGUID: poKLh9JVQpe3FRs8Rtd/cA==
X-CSE-MsgGUID: c+/goVxYTnaeA6BaKA7JMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76443861"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76443861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:11:40 -0700
X-CSE-ConnectionGUID: JeVOseMgSyGgjfUNUYBnow==
X-CSE-MsgGUID: H1o8QD4xSe6U2D8/CAWFqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227788208"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 07:11:35 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/9] Introduce Xe PCIe FLR
Date: Mon,  6 Apr 2026 19:37:13 +0530
Message-ID: <20260406140722.154445-1-raag.jadav@intel.com>
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
of different components which I've skipped here for my lack of competence,
so feel free to join in and support them.

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

Raag Jadav (9):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
  drm/xe/gt: Introduce FLR helpers
  drm/xe/irq: Introduce xe_irq_disable()
  drm/xe: Introduce xe_device_assert_lmem_ready()
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pci: Introduce PCIe FLR

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
 drivers/gpu/drm/xe/xe_device.c           |  10 +-
 drivers/gpu/drm/xe/xe_device.h           |   1 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
 drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
 drivers/gpu/drm/xe/xe_gsc.h              |   1 +
 drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
 drivers/gpu/drm/xe/xe_gt.h               |   2 +
 drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
 drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
 drivers/gpu/drm/xe/xe_guc.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
 drivers/gpu/drm/xe/xe_huc.c              |  14 ++
 drivers/gpu/drm/xe/xe_huc.h              |   1 +
 drivers/gpu/drm/xe/xe_irq.c              |  13 +-
 drivers/gpu/drm/xe/xe_irq.h              |   1 +
 drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +
 drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
 drivers/gpu/drm/xe/xe_migrate.h          |   1 +
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci.h              |   2 +
 drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
 drivers/gpu/drm/xe/xe_uc.h               |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
 drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
 33 files changed, 510 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
2.43.0

