Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11ACC02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 00:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA0610E537;
	Thu, 16 Jan 2025 00:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zrny6hxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01D410E537
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 00:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986286; x=1768522286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hWneiCb+Nr3qGZhAMON4JvVcD8rtXFqIjTLdkhEIueM=;
 b=Zrny6hxJRYP5arwUu+4oFbqVafUNmo2L9oFPuF11XnmhCqtGnE61nEEk
 nmc/1k7OvQuPuKNFfMn3ttyIVpsZ1f/A3LTfOk8vjCgqTip4k3aWrI6vx
 OGyo1VqySeUJZHPh1Gk/RgdZnpAaHKzJsHNOX5YZdmBl3wXBZOtMBGEqo
 zl3saLF063fQgFqSLg7P5I6CSuMZSdD0sCZRxMGAAa/buZ6Ts9eqnCtFf
 W5Ms4cvP3h6+f/MhsLnoeZm+PTsf30rVYKcrDHLmwacSL0PiTzx9YxvqV
 pyQ+J4XX4HfELHGwTKdGn+3H5OWZ12Nyv1csSgdts/XqJhXuhUnULbRGI Q==;
X-CSE-ConnectionGUID: VYSJzCbRT6KsmU9yKfJBOQ==
X-CSE-MsgGUID: hzjgslijQxuJE5dWNEge/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47832051"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47832051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:26 -0800
X-CSE-ConnectionGUID: Cu57ZejLS1i99lCNN2w3RQ==
X-CSE-MsgGUID: 1zlwyTD9RbqCuMd5j63iKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105072872"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:25 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 00/13] Add PXP HWDRM support
Date: Wed, 15 Jan 2025 16:10:56 -0800
Message-ID: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PXP (Protected Xe Path) allows execution and flip to display of protected
(i.e. encrypted) objects. The HW supports multiple types of PXP, but
this series only introduces support for PXP HWDRM, which is mainly
targeted at encrypting data that is going to be displayed.

Even though we only plan to support 1 type of PXP for now, the interface
has been designed to allow support for other PXP types to be added at a
later point in time.

A user is expected to mark both BO and exec_queues as using PXP and the
driver will make sure that PXP is running, that the encryption is
valid and that no execution happens with an outdated encryption.

The mesa implementation of the new interfaces is in review here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30723

The IGT tests for PXP are in review here:
https://patchwork.freedesktop.org/series/142450/

v2: code cleaned up and fixed while coming out of RFC, addressed review
feedback in regards to the interface.

v3: code and documentation improvements following review feedback

v4: Major rework of the internal status tracking to avoid doing
submissions under lock. Split the exec queue patch into 2 for ease of
review.

v5: minor fixes to comment and logs. Since the patches have grown, it
makes more sense to keep them split instead of squashing them, so
reworded some of the commit messages accordingly.

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (13):
  drm/xe/pxp: Initialize PXP structure and KCR reg
  drm/xe/pxp: Allocate PXP execution resources
  drm/xe/pxp: Add VCS inline termination support
  drm/xe/pxp: Add GSC session invalidation support
  drm/xe/pxp: Handle the PXP termination interrupt
  drm/xe/pxp: Add GSC session initialization support
  drm/xe/pxp: Add PXP queue tracking and session start
  drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues
  drm/xe/pxp/uapi: Add a query for PXP status
  drm/xe/pxp/uapi: Add API to mark a BO as using PXP
  drm/xe/pxp: add PXP PM support
  drm/xe/pxp: Add PXP debugfs support
  drm/xe/pxp: Enable PXP for MTL and LNL

 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  41 +
 .../xe/compat-i915-headers/pxp/intel_pxp.h    |  16 +-
 drivers/gpu/drm/xe/display/intel_bo.c         |   2 +-
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 .../gpu/drm/xe/instructions/xe_mfx_commands.h |  28 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   8 +
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h         |  23 +
 drivers/gpu/drm/xe/xe_bo.c                    |  98 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   5 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   6 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c                |   6 +
 drivers/gpu/drm/xe/xe_device_types.h          |   8 +-
 drivers/gpu/drm/xe/xe_exec.c                  |   6 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |  60 +-
 drivers/gpu/drm/xe/xe_exec_queue.h            |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   8 +
 drivers/gpu/drm/xe/xe_execlist.c              |   2 +-
 drivers/gpu/drm/xe/xe_irq.c                   |  20 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  18 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   7 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   4 +
 drivers/gpu/drm/xe/xe_pm.c                    |  39 +-
 drivers/gpu/drm/xe/xe_pxp.c                   | 902 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h                   |  35 +
 drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 120 +++
 drivers/gpu/drm/xe/xe_pxp_debugfs.h           |  13 +
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 588 ++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  22 +
 drivers/gpu/drm/xe/xe_pxp_types.h             | 135 +++
 drivers/gpu/drm/xe/xe_query.c                 |  29 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                    | 165 +++-
 drivers/gpu/drm/xe/xe_vm.h                    |   8 +
 drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
 include/uapi/drm/xe_drm.h                     |  94 +-
 39 files changed, 2497 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pxp_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_types.h

-- 
2.43.0

