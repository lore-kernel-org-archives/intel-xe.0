Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DBC3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D95C10E7A2;
	Wed, 24 Jul 2024 19:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGC2Dj9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210A10E795
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849701; x=1753385701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1hZjHtcmTvEKl7EiALV4mykZftbu5vWANAF6xSm+yE0=;
 b=VGC2Dj9pC2+AcoROndf5z1NT4tMUB1Bp4oYtmSmKf1MCrffM7ToRX1Tb
 6UQMutIvXaUdvl8JiDuyLPvzwd7iuBhFACXA3QpfwSdsbo3jTIFp2H9vu
 koClMJLnHEYiwA0jDEu4M+nHdaZQgwobawFCe8V6wLu/y3EEuSxC3yVqT
 EZq/Z5XAY0fTeWiaNL1DC5h3Na3mpMC7ccJdU2PNQ7OXpxoVRUcuGD2eu
 V/XIL4vQVBHVHhhVORHDQb080hePc+SjNIlH7I4H9fQ/Qw0XBOBGqsrcO
 52b3B8QiUV+2kRuqihVzqLuao4DV2VIrpXeBjTA/KO6L51qcJ1Hu5ob95 g==;
X-CSE-ConnectionGUID: nRiStGGcQ4yZb2enMkgpzQ==
X-CSE-MsgGUID: IAOb+LCVRNOygIB1fKjSoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691122"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:00 -0700
X-CSE-ConnectionGUID: wm8rsp62QeqK5qA4pjb1/A==
X-CSE-MsgGUID: v3+oAG/ERfWz8XIn8/VlHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292195"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:34:59 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 00/12] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Wed, 24 Jul 2024 21:32:53 +0200
Message-ID: <20240724193431.2685833-1-francois.dugast@intel.com>
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

v2: The main purpose of this new version is to address (hopefully) all the
comments from Matt on the RFC [1]. Individual commits provide more details about
the changes. This version also adds a dependency to another series [2] on
CPU binds. While the new series of IGT tests [3] designed to test this feature
do pass on PVC, this series still lacks thorough testing and some more or less
sporadic issues are already identified (namely a circular lockdep and failure
waiting for GuC suspend). While I chase those, I am sharing this version already
to get feedback on the resolution of the previous comments and course correct
if needed.

[1] https://patchwork.freedesktop.org/series/136192/
[2] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5
[3] https://patchwork.freedesktop.org/patch/604958/

Francois Dugast (12):
  drm/xe/hw_engine_group: Introduce xe_hw_engine_group
  drm/xe/guc_submit: Make suspend_wait interruptible
  drm/xe/hw_engine_group: Register hw engine group's exec queues
  drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
  drm/xe/exec_queue: Prepare last fence for hw engine group resume
    context
  drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
  drm/xe/hw_engine_group: Ensure safe transition between execution modes
  drm/xe/exec: Switch hw engine group execution mode upon job submission
  drm/xe/guc_submit: Allow calling guc_exec_queue_resume with pending
    resume
  drm/xe/hw_engine_group: Resume exec queues suspended by dma fence jobs
  drm/xe/vm: Remove restriction that all VMs must be faulting if one is
  drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.h                |  10 -
 drivers/gpu/drm/xe/xe_device_types.h          |   4 -
 drivers/gpu/drm/xe/xe_exec.c                  |  20 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  41 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  14 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 337 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  48 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  20 --
 14 files changed, 492 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
2.43.0

