Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C88CFA46E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 03:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C33C10E7EA;
	Fri, 21 Nov 2025 03:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6rcv5PG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2032110E7E5
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697141; x=1795233141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sDkhEMFhzaEUj9EBIku0AHCyfmKUQ/prxnogXseTNrU=;
 b=m6rcv5PGOYp1OaWMZuBpISiEvsQRSV9yyTxXOutN0W9ia+Pb6PUCbg0f
 xolAXvk0xbu0/Ls+vg8Hmn81Pofmp3nhuXB2b3OhB0K84j6Bzal9yhZ2s
 4YBNIeegBIFvLolM3CMAceUsswc6b44gwwF9UGdHdj6dQ57uQ3bRuD8O/
 jpdI7RVnIjhH7kgNA0LKJ6cF5XulsLcYLGdAUfwPh/8DIACqCljlygMGm
 lSLn7CLR7tSfOwOnK6Bywgec2/+60NPzgMSRJSUhwovShgvbfXEOSJsK3
 zRRu48JvUvD9yj+VA2CJSyUV+ffHXMT+/WEUcl/DLEhyRcCWcUxqmlg0L g==;
X-CSE-ConnectionGUID: yUwMfONbTR24dCK6IvuAkw==
X-CSE-MsgGUID: u+5Ye79fTKKxeTH5wNEMug==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76110527"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="76110527"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:20 -0800
X-CSE-ConnectionGUID: 4XDLzYKIQ/ysmLXtDunjXw==
X-CSE-MsgGUID: dEWZYQ31RWGcsEiUgvHFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="190857783"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:52:20 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v3 00/18] drm/xe: Multi Queue feature support
Date: Thu, 20 Nov 2025 19:51:34 -0800
Message-ID: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
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

Multi Queue is a new mode of execution supported by the compute and
blitter copy command streamers (CCS and BCS, respectively). It is an
enhancement of the existing hardware architecture and leverages the
same submission model. It enables support for efficient, parallel
execution of multiple queues within a single context.

Add support for multi-queue feature and enable it on xe3p_xpc.

The associated IGT patch series is,
https://patchwork.freedesktop.org/series/156866/

The Compute UMD usecase is,
https://github.com/intel/compute-runtime/pull/862

Changes in v2:
- Rename multi_queue_enable_mask to multi_queue_engine_class_mask.
- Remove group->lock, fix function semantics, add additional comments,
  add asserts, update uapi kernel-doc, move group->list_lock to right
  patch, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo.
- Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value.
- Add fs_reclaim lock dependency, add bspec ref, other minor cleanups.

Changes in v3:
- Add patch "drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p"
- Add patch "drm/xe/multi_queue: Reset GT upon CGP_SYNC failure"
- Code refactoring and kernel-doc update
- Assert CGP_SYNC message length is valid
- For CGP bo use PINNED_LATE_RESTORE/USER_VRAM/GGTT_INVALIDATE flags
- Properly handle cleanup of multi-queue group

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Gustavo Sousa (1):
  drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p

Niranjana Vishwanathapura (17):
  drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
  drm/xe/multi_queue: Add user interface for multi queue support
  drm/xe/multi_queue: Add GuC interface for multi queue support
  drm/xe/multi_queue: Add multi queue priority property
  drm/xe/multi_queue: Handle invalid exec queue property setting
  drm/xe/multi_queue: Add exec_queue set_property ioctl support
  drm/xe/multi_queue: Add support for multi queue dynamic priority
    change
  drm/xe/multi_queue: Add multi queue information to guc_info dump
  drm/xe/multi_queue: Handle tearing down of a multi queue
  drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
  drm/xe/multi_queue: Handle CGP context error
  drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
  drm/xe/multi_queue: Tracepoint support
  drm/xe/multi_queue: Support active group after primary is destroyed
  drm/xe/doc: Add documentation for Multi Queue Group
  drm/xe/doc: Add documentation for Multi Queue Group GuC interface
  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc

 Documentation/gpu/xe/xe_exec_queue.rst        |  14 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   4 +
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
 drivers/gpu/drm/xe/xe_device.c                |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 428 +++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  57 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
 drivers/gpu/drm/xe/xe_guc.c                   |   7 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 627 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  29 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  68 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  44 ++
 22 files changed, 1335 insertions(+), 91 deletions(-)

-- 
2.43.0

