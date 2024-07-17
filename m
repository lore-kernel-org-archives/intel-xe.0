Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FF6C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D4810EAEE;
	Wed, 17 Jul 2024 13:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSp139TB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9076210EAEE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221721; x=1752757721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HiKiE+VgFN6H23MJWD8IuzZqHBqZEJD+Lizs1U8oLyc=;
 b=CSp139TBZ1oh52ALuhHSL/4FidGRuGpoSSVuzpGCpe42aoQdldWVo3vM
 NLZUEscdT3+99KSnuwgGIOG66ccEjItuGl4/TO1SgAEL+uVdJjAnKL2J3
 zQD0SrNzhK5mh6uLbks0PhDxtcrGcMMmbd7W71GZacl2mSuZB0/jqICKu
 d4O5ZfJkbwqbrZfzG3+jJfBPgZQX26eaXqz+OhAt7eboUTt/4NtOd1q0g
 5dMHsTCMO4zsJSwSvWtAwLrGa4Nq5wyh7JOItyIg1HACSE4Z1KgIN2DAz
 wQFCuolOl1texoGwP4V8Ll9DhCWiaJkrvV+Q18iJH7sZusSfybs2vhhxI A==;
X-CSE-ConnectionGUID: SaD0KTpEQJehl43hw5o1+w==
X-CSE-MsgGUID: PvhF6nKnQgCY+YKaZIx0yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832045"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:41 -0700
X-CSE-ConnectionGUID: m8xlCDGUSPiIq0cNY7Y8oA==
X-CSE-MsgGUID: HaNSug+/S2+8Xvt16CiWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55531993"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 0/9] Parallel submission of dma fence jobs and LR jobs with
 shared hardware resources
Date: Wed, 17 Jul 2024 15:07:21 +0200
Message-ID: <20240717130821.1073379-1-francois.dugast@intel.com>
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

Currently Xe KMD only allows either all VMs on the device to be page-faulting
VMs, or none of them to be page-faulting VMs. This prevents page-faulting
workloads from waiting for a dma-fence in the fault handler, as the page fault
would then hold the execution resources, which means the dma-fence would never
signal and this would create a deadlock.

This limitation in the driver prevents mixing dma-fence jobs and long-running
faulting jobs, for example if an application would submit 3D jobs for the
compositor but also SVM compute jobs on the same device. To safely lift this
restriction, a finer approach is introduced in this series.

Hardware engines which share resources and would block each other are assigned
to the same hardware engine group. This group ensures mutual exclusion of the
execution of dma fence jobs and long running jobs on the shared hardware
resources.

If a long running job is executing when a dma fence job is submitted, the long
running job is preempted, the dma fence job executes, then the long running
job is resumed. If a dma fence job is executing when a long running job is
submitted, we wait for completion of the dma fence job before executing the
long running job.

This has been tested on PVC with new IGT tests [1].

[1] https://patchwork.freedesktop.org/series/136191/

Francois Dugast (9):
  drm/xe/hw_engine_group: Introduce xe_hw_engine_group
  drm/xe/exec_queue: Add list link for the hw engine group
  drm/xe/hw_engine_group: Register hw engine group's exec queues
  drm/xe/hw_engine_group: Add helper to suspend LR jobs
  drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
  drm/xe/hw_engine_group: Ensure safe transition between execution modes
  drm/xe/exec: Switch hw engine group execution mode upon job submission
  drm/xe/hw_engine_group: Resume LR exec queues suspended by dma fence
    jobs
  drm/xe/vm: Remove restriction that all VMs must be faulting if one is

 drivers/gpu/drm/xe/xe_device.h           |  10 -
 drivers/gpu/drm/xe/xe_exec.c             |  14 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 256 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h        |   9 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  31 +++
 drivers/gpu/drm/xe/xe_vm.c               |   8 -
 8 files changed, 318 insertions(+), 19 deletions(-)

-- 
2.43.0

