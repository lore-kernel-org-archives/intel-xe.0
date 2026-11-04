Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DD606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lpp82B83
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA5710FA14;
	Wed,  4 Nov 2026 07:48:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11710FA14
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793778528; x=1825314528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZLBVSeFkcf2sFybWhGUx4gvt+R+HTXTbx2cWo1R2wU=;
 b=Lpp82B83fqs1Z8k1mZW6Ra39YaZ4XC8OJfYcLofCb44iT9YrdonJ6URV
 J1548RxiuUtpe5WyScUEnGFgiCrEP0jl0IIsq8xK0MTQ5EJ2GqO0DMOwc
 QjNP7lwVi5cHLYBT4xIvC3K5LW/8ZeMH4aq3kZy9spCaO2OY0yO8jTL2l
 gJwxtKwR2uVPDi+96fHklnKKdepWduW0zNSz6R/BZAiUCl+TDtewaG3CG
 f+nfjTbdZeI6dP2qn2vmYvLtnIj3fhR4EncTELcUqqARQkOYtvbA9jssf
 IcX/DsdMTrL9z2rbdU9dUsAPXc7nCHq/dPFt9PGLVtenvUConM9MoINjo A==;
X-CSE-ConnectionGUID: kqFLx06bRmGfoPQxkHZirA==
X-CSE-MsgGUID: WPhRQatQS06GWpvWwjGk6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2536073"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2536073"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:48:47 -0800
X-CSE-ConnectionGUID: t17tZCjqSg6KmYDN/MYEkw==
X-CSE-MsgGUID: SToMIfgZQsuTJgRETxzWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8520920"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 03 Nov 2026 23:48:44 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v13 00/10] Introduce Xe PCIe FLR
Date: Wed,  4 Nov 2026 13:17:28 +0530
Message-ID: <20261104074813.1415191-1-raag.jadav@intel.com>
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
     Maintain wedge reference on FLR failure (Lukasz)

v11: Wait for xe_pcode_ready() before resume (Riana)
     Update GuC CT path to check against permanent wedging (Lukasz, Riana)
     Put wedge reference only if device is wedged during resume() (Riana)
     Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
     Use 'PCI reset' in logs (Riana)

v12: s/xe_wedge_not_recoverable/xe_wedged_permanent (Riana)
     Refine error logging and documentation (Riana)

v13: Handle ULLS fini (Sashiko)
     Re-initialize cpu bind queue (Sashiko)
     Prevent PM ref leak on slot reset failure (Sashiko)

Raag Jadav (10):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/guc_submit: Introduce guc_exec_queue_reinit_kernel()
  drm/xe/gt: Introduce FLR helpers
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit() and xe_cpu_bind_reinit()
  drm/xe/pm: Introduce xe_device_suspend/resume()
  drm/xe: Introduce temporary device wedging
  drm/xe/pci: Introduce PCIe Function Level Reset
  drm/xe/doc: Wire up PCI Error Handling

 Documentation/gpu/xe/index.rst              |   1 +
 Documentation/gpu/xe/xe_pci_error.rst       |   8 +
 drivers/gpu/drm/xe/xe_bo_evict.c            |  43 +++++-
 drivers/gpu/drm/xe/xe_bo_evict.h            |   1 +
 drivers/gpu/drm/xe/xe_cpu_bind.c            |  11 ++
 drivers/gpu/drm/xe/xe_cpu_bind.h            |   1 +
 drivers/gpu/drm/xe/xe_device.c              | 161 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device.h              |   2 +
 drivers/gpu/drm/xe/xe_device_types.h        |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |  47 +++++-
 drivers/gpu/drm/xe/xe_exec_queue.h          |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   2 +
 drivers/gpu/drm/xe/xe_execlist.c            |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  17 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |   5 +
 drivers/gpu/drm/xe/xe_gsc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_gsc.h                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |  41 +++++
 drivers/gpu/drm/xe/xe_gt.h                  |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |  29 ++++
 drivers/gpu/drm/xe/xe_guc.h                 |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |   6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |   9 ++
 drivers/gpu/drm/xe/xe_huc.c                 |  14 ++
 drivers/gpu/drm/xe/xe_huc.h                 |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                 |  15 +-
 drivers/gpu/drm/xe/xe_lrc.h                 |   2 +
 drivers/gpu/drm/xe/xe_migrate.c             |  39 ++++-
 drivers/gpu/drm/xe/xe_migrate.h             |   2 +
 drivers/gpu/drm/xe/xe_pci.c                 |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c           | 158 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.c                  | 103 +------------
 drivers/gpu/drm/xe/xe_uc.c                  |  74 +++++++++
 drivers/gpu/drm/xe/xe_uc.h                  |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c               |  67 ++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h               |   1 +
 drivers/gpu/drm/xe/xe_uc_types.h            |  14 ++
 drivers/gpu/drm/xe/xe_wedge.c               |  48 +++++-
 drivers/gpu/drm/xe/xe_wedge.h               |  13 +-
 drivers/gpu/drm/xe/xe_wedge_types.h         |  13 +-
 41 files changed, 847 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst

-- 
2.43.0

