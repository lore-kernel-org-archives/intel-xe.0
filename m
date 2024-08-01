Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ED5C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAE110E95A;
	Thu,  1 Aug 2024 12:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6r7PRJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952A910E95A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517089; x=1754053089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pYrLuccCkIW9LTZ6DA/nVbReaKVjOoy79VHpQwBSMyw=;
 b=M6r7PRJSO0bN376++9OO4ADQyaZcpGiqT4HL3tU/8x1zCUv3M2ItFnzO
 56ofuD/RVuD0qFUW7XYz9qSyueif/Q5R7FWq0M1YqtHYDs+WFGagCOeuL
 /B70Pw5aA7NPycPn8QYw8UpnOZnLbKNhR9Rkcz5uqnNND9b/FUfvY2UYT
 lLI7pc47ZlkkCy0kupMNUcet/qkC6dXooK6masXaQlXcEegNrGX/+yVFS
 +jtyvIPFd9WtQaUv+aZyy3AnseSLNlFO8wRSuFbcJPvy7icyl6MlPi+v1
 yGk9O8PcP2bZ6YpvV+ETcjnG+nIM7Fj0cTiEFxEPHodjxM9IBLgFo6fyg g==;
X-CSE-ConnectionGUID: //y8yPiTRKKvhb/otrfjOw==
X-CSE-MsgGUID: vY2uy8sqSUmUY0fUFYjB0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357115"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:08 -0700
X-CSE-ConnectionGUID: UbOUwN/IQK+v9wR33hOqAQ==
X-CSE-MsgGUID: Miz3kWqYRgCFJiwqf5rIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110030"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:07 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 00/13] Parallel submission of dma fence jobs and LR jobs
 with shared hardware resources
Date: Thu,  1 Aug 2024 14:56:41 +0200
Message-ID: <20240801125748.355078-1-francois.dugast@intel.com>
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

v4: Fix build issue reported by CI, improve commit message of first patch

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
 drivers/gpu/drm/xe/xe_exec_queue.c            | 138 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  15 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 338 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |  29 ++
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  48 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  20 --
 15 files changed, 577 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h

-- 
2.43.0

