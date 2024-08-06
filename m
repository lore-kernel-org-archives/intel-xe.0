Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FE7C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030D610E3E1;
	Tue,  6 Aug 2024 19:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gvis5GJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DCF10E3E8
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972478; x=1754508478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RhZ0MEwPJ32pRNQex6L/lOayKfSAekyY1/OimR6rvac=;
 b=Gvis5GJeW96Y1cCAbdF4FavtXmyo67Q7IxIsvAG+D8E5GS5XFJp9qYIb
 /cNQweRa4SRCpgJeKw6BgO2xnqj4ePRPX4Izi9zhTxOoZwcMzeg6oVmHE
 GaXI3hE/8IMztq7FJCkqw929ZliJM720Cbm3Ow1C8Ni9nBz5IOGVilL/v
 SkENBn7X8bw0vMQN71YNeSu2o5no0Gx1EEUpsTI7yDQce34ogj285emys
 nmyOG92rJJXxGPK6nvT1zrC1iBhNghzoqq6fmwkQxxm/oCwk5ke16lwwu
 mbQkk5iDCOJvBuCfRjELJpXGThEG1gu5Kk4Gj+fA/szJ961DxhJJKpeRb w==;
X-CSE-ConnectionGUID: spcoTzvATaKSWKmQ9oYIKQ==
X-CSE-MsgGUID: L/QraWfTTKKMrz38KmeltQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682119"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682119"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:27:57 -0700
X-CSE-ConnectionGUID: rKBx5wyBTSy867vtxaxnhA==
X-CSE-MsgGUID: afs9IjIvSX+/Q45WBW1Amg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585002"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:27:55 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 00/13] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Tue,  6 Aug 2024 21:26:58 +0200
Message-ID: <20240806192739.1076344-1-francois.dugast@intel.com>
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

v5: Resent for CI

v6: Fix kernel doc, address Matt's comments from v4

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
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 348 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  20 -
 15 files changed, 526 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
2.43.0

