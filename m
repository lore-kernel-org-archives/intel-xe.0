Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7356FEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FB210EBCE;
	Fri, 27 Feb 2026 17:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNbJDBxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DA510EBCE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211795; x=1803747795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DyZzeJGHVQBLWobl8q2QUJPK7iFl3+mALQACQZGhQaE=;
 b=mNbJDBxkf9d0bIlDIIrRuof/RnxA3k4z/oSw6OFdnzLXnigKvSLNnt0L
 U1clhE1wCb7lC4NDMcCQX8S/a0523Mf8rAqlqgejmieUEKa7PngLcKUvR
 cuKSGvW2IItj30sXeCWIGiDDFjLRLeguA5ExnSo/zhwnH1gAvYVOXWEuz
 7jSiS9NM6GrdgdF3irA6jDfH4MGiIERHRhXNy2X77uHKtiZ/YYyiPjp0Z
 iXqNdCvDQiB28bYqNlKdGEervIowYdTxj5UAU2GEaJ5Tb2lh6vWNA31Uf
 nlg2atFsVHV1lvMpw4udVjKquM/KALZODEXe+tixXcx9xqnCWkBrblQvh w==;
X-CSE-ConnectionGUID: 81vPa+MSRpWhUaOfNaCzqg==
X-CSE-MsgGUID: KX8j2cfRQ0SrhiS3lwALsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169886"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:14 -0800
X-CSE-ConnectionGUID: VKVhE4yVTQereWcWHOWoew==
X-CSE-MsgGUID: VpI6gtQGREeNCqRgyt5ZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964615"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:11 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/9] Introduce Xe PCIe FLR
Date: Fri, 27 Feb 2026 22:30:40 +0530
Message-ID: <20260227170049.3418863-1-raag.jadav@intel.com>
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
only limited to reloading GT. This needs to be extended for a lot of
different components which I've skipped here for my lack of competence,
so feel free to join in and support them.

PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
a spin and let me know if any regressions.

Trigger it with:

$ echo 1 > /sys/bus/pci/devices/<BDF>/reset

v2: Re-initialize migrate context (Matthew Brost)
    Add kernel doc (Matthew Brost)
    Spell out Function Level Reset (Jani)

Raag Jadav (9):
  drm/xe/uc_fw: Allow re-initializing firmware
  drm/xe/gt: Introduce FLR helpers
  drm/xe/irq: Introduce xe_irq_disable()
  drm/xe: Introduce xe_device_assert_lmem_ready()
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/lrc: Introduce xe_lrc_reinit()
  drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
  drm/xe/migrate: Introduce xe_migrate_reinit()
  drm/xe/pci: Introduce PCIe FLR

 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c   |  51 ++++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h   |   2 +
 drivers/gpu/drm/xe/xe_device.c     |  10 +-
 drivers/gpu/drm/xe/xe_device.h     |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c |  34 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h |   1 +
 drivers/gpu/drm/xe/xe_gsc.c        |  14 +++
 drivers/gpu/drm/xe/xe_gsc.h        |   1 +
 drivers/gpu/drm/xe/xe_gt.c         |  32 ++++++
 drivers/gpu/drm/xe/xe_gt.h         |   2 +
 drivers/gpu/drm/xe/xe_guc.c        |  14 +++
 drivers/gpu/drm/xe/xe_guc.h        |   1 +
 drivers/gpu/drm/xe/xe_huc.c        |  14 +++
 drivers/gpu/drm/xe/xe_huc.h        |   1 +
 drivers/gpu/drm/xe/xe_irq.c        |  13 ++-
 drivers/gpu/drm/xe/xe_irq.h        |   1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 149 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_lrc.h        |   2 +
 drivers/gpu/drm/xe/xe_migrate.c    |  65 ++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h    |   1 +
 drivers/gpu/drm/xe/xe_pci.c        |   1 +
 drivers/gpu/drm/xe/xe_pci.h        |   2 +
 drivers/gpu/drm/xe/xe_pci_err.c    | 150 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.c         |  36 +++++++
 drivers/gpu/drm/xe/xe_uc.h         |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c      |  39 ++++++--
 drivers/gpu/drm/xe/xe_uc_fw.h      |   1 +
 28 files changed, 544 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
2.43.0

