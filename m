Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA92D3E785
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF3E10E6B5;
	Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7RMZwGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CCC10E6B5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414977; x=1796950977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CMQmPAla+YsROHv47e7WxHxDMdBXHE+DLK/tXSHGUs=;
 b=f7RMZwGNZrRRboZvbIGBF4aYC7U6taOLoT+KQc88C1DnSbGVcTRQDQog
 P25apPYUx9lOoXywwpG+9QqBu5EAPANEiC4YQat7mwqpJTRo0pAFAU0e8
 k/ELtytf8JIhYn+dz+kuUO2+Kfdue+48POxbdzf7pGDrTtC0iG8APSa49
 D2gJi0FNRAWABeY6YNW5epK0QBUMcOoTn773pWjwLgE5K8VATsAj6i/Kp
 DS4dGvHshSGwnEcRyxQOnJEQ6xNbGMM4ht+pNBJ+MGUuXW8gKQCF2UH6O
 EZogoJgQMiEW5zylcixkpIldg16eYwWrAuD5PY40FX2XVMrwzvzwEBeR7 w==;
X-CSE-ConnectionGUID: oMK0OXiMSDy1T3s0tX+I6w==
X-CSE-MsgGUID: r9C/8G1jT/220lyarU+5aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442858"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
X-CSE-ConnectionGUID: FaYxbv2wRZK3b0nzrGQAyA==
X-CSE-MsgGUID: HQ9g8b+QQOSxkvvtYky8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664073"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 00/17] drm/xe: Multi Queue feature support
Date: Wed, 10 Dec 2025 17:02:48 -0800
Message-ID: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

Changes in v4:
- uapi change due to rebase
- Remove unwated patch 'drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p'
- Use xe_guc_ct_wake_waiters(), remove vf recovery support
- Fix IS_ENABLED(CONFIG_LOCKDEP) check
- Revert stop/restart of all submission queues in the group in TDR
- Assert !multi_queue where applicable
- Fix CGP_CONTEXT_ERROR message

Changes in v5:
- Add FIXME in TDR (Matt Brost)
- Keep multi-queue disabled (until FIXME are addressed) by removing
  patch 'drm/xe/multi_queue: Enable multi_queue on xe3p_xpc'
- Ban group for guc reported errors

Changes in v6:
- In TDR, trigger cleanup of group only for multi-queue case

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Mateusz Hoppe <mateusz.hoppe@intel.com>

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
  drm/xe/multi_queue: Teardown group upon job timeout
  drm/xe/multi_queue: Tracepoint support
  drm/xe/multi_queue: Support active group after primary is destroyed
  drm/xe/doc: Add documentation for Multi Queue Group
  drm/xe/doc: Add documentation for Multi Queue Group GuC interface

 Documentation/gpu/xe/xe_exec_queue.rst        |  14 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   4 +
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
 drivers/gpu/drm/xe/xe_device.c                |   9 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 431 ++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  59 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 584 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  29 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  64 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  44 ++
 21 files changed, 1292 insertions(+), 83 deletions(-)

-- 
2.43.0

