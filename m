Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F8CF5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207210E01F;
	Sun,  8 Mar 2026 13:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agrLcmd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2A10E01F
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978284; x=1804514284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bWWGZtkghu+yA3dqwgTN6YJJxL+S9rKzdIlqwt2up78=;
 b=agrLcmd8G9DvYf+Nqcwzuhgrt3yiCTQXQB0DHj0qaT03Zmyd5s3plX1F
 oN4+y9OCXVXHRfgvNaf9diAXl/zgZO6f/QrV38e4f7ucjdg/OlhQmBnz0
 SLYQ4RdDN0r0+kFQZNKF3Y8eB6AneVdI4xq8QjAQrX49SWlaQr2N08HI1
 QQENVe+ct0jeh8CGB/SeKcKF9eLMHYFLEAdS4EAYpyWuj3sV3wz1WsWpS
 oZC7AxdpopsxQRvJqmh+Bu1UNO1m4eGMhTmuHu4oL696Q9zO6Egl5WigD
 OTCF0jezWNewUV+O+mUZGWsF6oC/6bhY1CS77SHG3n37BjHP53QRO6aCu w==;
X-CSE-ConnectionGUID: msKRB/zpRXGRYbViSB73XQ==
X-CSE-MsgGUID: Kj+QWTOjTQexzlZ03DzifQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934690"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934690"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:04 -0700
X-CSE-ConnectionGUID: yZmWhoCTTwyFvZYo6a5KuQ==
X-CSE-MsgGUID: 3l6tQGEDQMiEhUNeNRejOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523257"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 00/10] Introduce Xe PCIe FLR
Date: Sun,  8 Mar 2026 19:25:26 +0530
Message-ID: <20260308135536.3852304-1-raag.jadav@intel.com>
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

Raag Jadav (10):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/hw_fence: Synchronize fence irq before destroying the job
  drm/xe/guc_submit: Support cancelling submission
  drm/xe/gt: Introduce FLR helpers
  drm/xe/irq: Introduce xe_irq_disable()
  drm/xe: Introduce xe_device_assert_lmem_ready()
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pci: Introduce PCIe FLR

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c      |  51 +++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h      |   2 +
 drivers/gpu/drm/xe/xe_device.c        |  10 +-
 drivers/gpu/drm/xe/xe_device.h        |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c    |  34 +++++-
 drivers/gpu/drm/xe/xe_exec_queue.h    |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c |  11 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |   1 +
 drivers/gpu/drm/xe/xe_gsc.c           |  14 +++
 drivers/gpu/drm/xe/xe_gsc.h           |   1 +
 drivers/gpu/drm/xe/xe_gt.c            |  32 ++++++
 drivers/gpu/drm/xe/xe_gt.h            |   2 +
 drivers/gpu/drm/xe/xe_guc.c           |  23 ++++
 drivers/gpu/drm/xe/xe_guc.h           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c    |  24 +++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |   1 +
 drivers/gpu/drm/xe/xe_huc.c           |  14 +++
 drivers/gpu/drm/xe/xe_huc.h           |   1 +
 drivers/gpu/drm/xe/xe_hw_fence.c      |   5 +
 drivers/gpu/drm/xe/xe_hw_fence.h      |   1 +
 drivers/gpu/drm/xe/xe_irq.c           |  13 ++-
 drivers/gpu/drm/xe/xe_irq.h           |   1 +
 drivers/gpu/drm/xe/xe_lrc.c           |  17 +++
 drivers/gpu/drm/xe/xe_lrc.h           |   2 +
 drivers/gpu/drm/xe/xe_migrate.c       |  12 +++
 drivers/gpu/drm/xe/xe_migrate.h       |   1 +
 drivers/gpu/drm/xe/xe_pci.c           |   1 +
 drivers/gpu/drm/xe/xe_pci.h           |   2 +
 drivers/gpu/drm/xe/xe_pci_err.c       | 150 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sched_job.c     |   1 +
 drivers/gpu/drm/xe/xe_uc.c            |  36 +++++++
 drivers/gpu/drm/xe/xe_uc.h            |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c         |  39 +++++--
 drivers/gpu/drm/xe/xe_uc_fw.h         |   1 +
 35 files changed, 489 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
2.43.0

