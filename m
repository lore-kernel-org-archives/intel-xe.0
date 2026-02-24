Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE69E9B24D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 10:30:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0157B89083;
	Tue, 24 Feb 2026 10:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVdXir9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953C489083
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929016; x=1803465016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yr9Spe249bpfs7GWIiZI9bxX999UFkJigivD8VYw+xM=;
 b=AVdXir9UwXcCrqos+sjB/fFMY1/LkDkcAC4KAN2PaIUuhnskRpB4BrCb
 vdk9V3IeWaXfIDY6ouHG8Tl/zfmrwViZFDu+VhS9ePuhahLqzVmfpsPqz
 R7jHMtZjn/848EVLQ2jEg8N3wmJW/kRI4NUt6drz2lnF2NW+I2TzrzRHN
 L/RBwHfz7fYb2Hzz80Z3arICthXrMUu+3b6CAwefE96+k/ez/7PP+8U10
 sJ3X620s7CmrD9Rhh9i3scIFJfxtYFr5CUIg+o2AuoeseyymdhHEdlcQf
 qsDaOQtbyAnLjvUsnxqUmxlwrcKebNBr0Loao5xuzwPtT1lI009QTcpy1 Q==;
X-CSE-ConnectionGUID: wo6TTWJiQlqyfxCuWwBKfw==
X-CSE-MsgGUID: d16nmalfQF6B4BeUw7/Omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046303"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:16 -0800
X-CSE-ConnectionGUID: EBHyYOrBQ16HA+V9Zjx5fg==
X-CSE-MsgGUID: HWvbdUggSH6aTmQ4pyWHng==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 02:30:13 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/6] Introduce Xe PCIe FLR
Date: Tue, 24 Feb 2026 15:55:13 +0530
Message-ID: <20260224102618.3105171-1-raag.jadav@intel.com>
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

Here's my humble attempt at introducing PCIe FLR support in xe driver.
This is ofcourse a half baked implementation and only limited to reloading
uC firmwares. This needs to be extended for a lot of different components
which I've skipped here for my lack of competence, so feel free to join
in and support them.

PS: This works enough to allow a single exec test run after FLR but it
follows with a GuC crash on subsequent runs which I'm still investigating.

Raag Jadav (6):
  drm/xe/uc_fw: Allow reloading firmware
  drm/xe/uc: Introduce FLR helpers
  drm/xe/irq: Introduce FLR helper
  drm/xe: Introduce xe_device_assert_lmem_ready()
  drm/xe/bo_evict: Introduce xe_bo_restore_map()
  drm/xe/pci: Introduce PCIe FLR

 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
 drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
 drivers/gpu/drm/xe/xe_device.c   |   4 +-
 drivers/gpu/drm/xe/xe_device.h   |   1 +
 drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
 drivers/gpu/drm/xe/xe_gsc.h      |   1 +
 drivers/gpu/drm/xe/xe_gt.c       |  10 +++
 drivers/gpu/drm/xe/xe_gt.h       |   2 +
 drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
 drivers/gpu/drm/xe/xe_guc.h      |   1 +
 drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
 drivers/gpu/drm/xe/xe_huc.h      |   1 +
 drivers/gpu/drm/xe/xe_irq.c      |   7 +-
 drivers/gpu/drm/xe/xe_irq.h      |   1 +
 drivers/gpu/drm/xe/xe_pci.c      |   1 +
 drivers/gpu/drm/xe/xe_pci.h      |   2 +
 drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
 drivers/gpu/drm/xe/xe_uc.h       |   2 +
 drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
 drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
 22 files changed, 295 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
2.43.0

