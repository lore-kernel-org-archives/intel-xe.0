Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED305F99363
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40E910F037;
	Thu, 23 Apr 2026 10:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fx4z3xAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394F910F036
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938596; x=1808474596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vL8LdnMuDNnGI/uPmeeRKYkf6bakPqPiongxg7Nr3Mo=;
 b=Fx4z3xALaVRTph1aHrHoC2oIppcBPltTul20OGw7qMOsS7WQSkltJBbv
 2iJAs50oyXF63/eZxTJBLdxQP+mKMhp0jODiivaGZTbum03FydbHEKilM
 nW1M+BuAV+TOWJgr5RhmJxxKqcNA3hh3KzNZO66mGOAjMomBr7T0yQIb3
 REimw6wl5H4FojIjxoQM4LHoCCGJfgXdO9mzPfxnpBR0IMZqUNpzTJJoG
 0RSmMWwCN0193u/UchfmDcjj3Zs86NdDqAhRIyX6CdLtI8eQ/jUUxwrsu
 Mne0dZemqaCzzJvb2JpXRmBXdmxodwYyCV8q4ZS7woqzVnBs1BnmaHRsU g==;
X-CSE-ConnectionGUID: pP0ViW3yQqG+EFcU8W3lbg==
X-CSE-MsgGUID: vNzxl0MURF+j8Dykf9PK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600241"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600241"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:15 -0700
X-CSE-ConnectionGUID: sKfNfl1ASZ+wZjQktZXLtA==
X-CSE-MsgGUID: Gob1CqkpSf2cDYZyvitEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522701"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:11 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 0/8] Introduce Xe PCIe FLR
Date: Thu, 23 Apr 2026 15:30:09 +0530
Message-ID: <20260423100017.1051587-1-raag.jadav@intel.com>
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
    Repurpose system suspend/resume flow for FLR (Daniele)

Raag Jadav (8):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
  drm/xe/gt: Introduce FLR helpers
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pm: Introduce xe_device_suspend/resume()
  drm/xe/pci: Introduce PCIe FLR

 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
 drivers/gpu/drm/xe/xe_device.c           | 150 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  42 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |   6 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
 drivers/gpu/drm/xe/xe_gsc.c              |  14 +++
 drivers/gpu/drm/xe/xe_gsc.h              |   1 +
 drivers/gpu/drm/xe/xe_gt.c               |  48 ++++++++
 drivers/gpu/drm/xe/xe_gt.h               |   2 +
 drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
 drivers/gpu/drm/xe/xe_guc.c              |  29 +++++
 drivers/gpu/drm/xe/xe_guc.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
 drivers/gpu/drm/xe/xe_huc.c              |  14 +++
 drivers/gpu/drm/xe/xe_huc.h              |   1 +
 drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +
 drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
 drivers/gpu/drm/xe/xe_migrate.h          |   1 +
 drivers/gpu/drm/xe/xe_pci.c              |   1 +
 drivers/gpu/drm/xe/xe_pci.h              |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c        | 113 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.c               | 103 ++--------------
 drivers/gpu/drm/xe/xe_uc.c               |  39 ++++++
 drivers/gpu/drm/xe/xe_uc.h               |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c            |  49 ++++++++
 drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
 33 files changed, 631 insertions(+), 107 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

-- 
2.43.0

