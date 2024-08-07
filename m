Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2C1C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062510E18F;
	Wed,  7 Aug 2024 16:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2c8Jkfx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2610E18F
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047877; x=1754583877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6u2Bz7jMjQdX9qq2tGTHXtcQvA7N37M/8MXccIZ4uKk=;
 b=D2c8JkfxXEPAjciwnej/XLSxi/4zBToJfSW2q2CTpjzmQmmuaAykuWrP
 WAEx4idi+uDKQdyfe4Dg0ep/ZE/PICb4fzFgieEXets7ahNtlkXo/PxHy
 QFFEgxplFR7UYiCQmSe8bbf/Za2+pNeUbZwF2/uyc9TRnPzJaTiszm626
 1T7S34OGVJ6cmMgPJ0CtNQ/L5X0+lALFFRRiKS0RYbhxtKKz0WxaskBdo
 LbKkYYdoCoSqE1OB+BhQOZe6DT5roqH8YGWSSppAS8ZFQSVLNfqAG+NtF
 sKwcHxz4yhlHfpnbK/oyL6aehX50ahJ9eAdoGH4mnZKSw+O56tiEon1Sc Q==;
X-CSE-ConnectionGUID: zmlVbfTVSdG4Y4SBuZdlXQ==
X-CSE-MsgGUID: QoveAQ4+TOqEGgE8Dd6MZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20793775"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="20793775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:36 -0700
X-CSE-ConnectionGUID: A9FoBldrQiyrdl6of570Zg==
X-CSE-MsgGUID: lz9MNaAYQJuEufyF5xIvSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61790833"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 00/13] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Wed,  7 Aug 2024 18:23:29 +0200
Message-ID: <20240807162416.1307061-1-francois.dugast@intel.com>
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

v7: Fix warning in first patch due to missing switch case, also trigger a new CI
    run now that the CI images include python3-ply for the CI.checkpatch step

Francois Dugast (13):
  drm/xe/hw_engine_group: Introduce xe_hw_engine_group
  drm/xe/guc_submit: Make suspend_wait interruptible
  drm/xe/hw_engine_group: Register hw engine group's exec queues
  drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
  drm/xe/exec_queue: Remove duplicated code
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
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device.h                |  10 -
 drivers/gpu/drm/xe/xe_device_types.h          |   4 -
 drivers/gpu/drm/xe/xe_exec.c                  |  20 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  63 +++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  15 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 350 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  20 -
 15 files changed, 528 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
2.43.0

