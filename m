Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E7C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E726A10E7CF;
	Thu,  8 Aug 2024 18:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ic+YVxcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67710E732
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142553; x=1754678553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pmvv/nsDzJUVkzpea7/ogEemT/ZGRaGIEmqzk/MlO94=;
 b=ic+YVxcTl14DBWVAI81QQdRm2o6YP0LS7OPLvCEHBBMXDM0tTyoT649D
 q0adtToyrMlYqAwOxCPbd+jEBaRl7wT9C7tnO3j3vqce2bWA+AyFNjAnu
 EDwW7jikVU0a6jTHJBnjsvXDM9OZnv5rFO0XBjcXcPUT+0EayPjxeE7ny
 aY3orx6WT/BHn9oTGv+mjLlmPkTDam4RuqB24YgdHmpxuD2+yphsGEJc2
 pnYzgN4cCf5xluPIj6AATsxbEIsjUeNJuvDRzmpY2raGlM3c5XQnmiHAR
 hb8SvWMn6KEtvogAbz1thJE+nWkLBwnqLjnvhWtYiAUlZd94MTLi2AFcL w==;
X-CSE-ConnectionGUID: lDMYbTRKTXC2gnGlJRKnKA==
X-CSE-MsgGUID: rbJh4nihQi243Vb4vM+cfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921583"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:33 -0700
X-CSE-ConnectionGUID: 6+q5KHwARfetRjLAmCWCMA==
X-CSE-MsgGUID: j9uGV015Qw2r+93rVfs24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975905"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 00/11] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Thu,  8 Aug 2024 20:40:18 +0200
Message-ID: <20240808184220.1715625-1-francois.dugast@intel.com>
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

v8: Address Matt's comments on v7 such as propagating errors up the stack, drop
    patch #10, squash patches #9 and #11


Francois Dugast (11):
  drm/xe/hw_engine_group: Introduce xe_hw_engine_group
  drm/xe/guc_submit: Make suspend_wait interruptible
  'drm/xe/hw_engine_group: Register hw engine group's exec queues
  drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
  drm/xe/exec_queue: Remove duplicated code
  drm/xe/exec_queue: Prepare last fence for hw engine group resume
    context
  drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
  drm/xe/hw_engine_group: Ensure safe transition between execution modes
  drm/xe/exec: Switch hw engine group execution mode upon job submission
  drm/xe/vm: Remove restriction that all VMs must be faulting if one is
  drm/xe/device: Remove unused xe_device::usm::num_vm_in_*

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device.h                |  10 -
 drivers/gpu/drm/xe/xe_device_types.h          |   4 -
 drivers/gpu/drm/xe/xe_exec.c                  |  20 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  49 ++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  12 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 372 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  20 -
 15 files changed, 534 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
2.43.0

