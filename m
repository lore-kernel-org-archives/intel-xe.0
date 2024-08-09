Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A43C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF210E967;
	Fri,  9 Aug 2024 15:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf2J4id/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84810E967
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218731; x=1754754731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5vi3w/41kjBi0yfnGGYGSbZudqnvWv+DkNPxNV497p0=;
 b=Hf2J4id/qbN6ngQQtU6TjPOjWDIUPcUpDs1KKzqctJx1h5Lh2JQ3LoCt
 nRStlygqQiQGEgXgVmrinBwlrKyTOkPsIOpYNBDb/cSb8qE+w+0ojSpRi
 2ScuCzB/DAIasZ8uYEVUbvZ93M4B1RdRFKtdVODFJbSxUSAXNZcKGvPFj
 VTB4n89ekASITcw4lPNR/CA45+CEJ7g5LRVNMyN+tkrImEq7uQZKHKSD+
 cvFnRfdd1H9lEYDeSd6TYyX1xUFRHYNIjgzkRm2a98EQAl5Fi2CCWNA3H
 Eh2FdqVYOwy8xpSko3qkNxQ+TuLTK8tPH+HkCeVhJB6tDOWL10UfHtpIH g==;
X-CSE-ConnectionGUID: dOmEUSMaQ1u8Met773v4Hw==
X-CSE-MsgGUID: j7KxOFRMQiin79EE0l4VNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207369"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:11 -0700
X-CSE-ConnectionGUID: +GjlsEStTLq8KSw8GW+mAw==
X-CSE-MsgGUID: /Pjc0FKaQZuWltwWmv1Nag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728691"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 00/11] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Fri,  9 Aug 2024 17:51:25 +0200
Message-ID: <20240809155156.1955925-1-francois.dugast@intel.com>
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

v9: s/xe_vm_in_lr_mode/xe_vm_in_fault_mode/ in patch #9

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

