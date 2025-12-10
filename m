Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8EED3B9B8
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4110E63E;
	Wed, 10 Dec 2025 00:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYfHvcdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C3910E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327161; x=1796863161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TFeSP+KAvC/3T7hf/wTUqUIB5j6Rb/Sfzjf0JhpVWPY=;
 b=nYfHvcdXr+9qYh0E5TuSDe6XJbr+BS09ktvS+vPK6HrtsDmSy8lFq1wH
 MLzjP9qf5FZqrHc1AbL7ydw5Un+dkvdGlXNIhO4ulbfraU7k344F5jG2B
 8H9ASO4ezuUV8GLEC9cWPK2e6tGruSlfZRX44mGGL/cCWg9SoHT7GQftl
 py9Kj82djJve+cuyjObCKp2tfBP3JyTfMS3rFdj8EY3+Dmb0Lbb7DJNHA
 3xHXmsFGvvchSIj6Uehyn/k8TCO+iWD/ffVjaHObpkjU6GDTjcREw1bGS
 5UMNymZrwfPrXYRty1v+mMLOGlI4o11mQXwTvje3OEnixDzFbpBSVZdhu A==;
X-CSE-ConnectionGUID: zzG5Ff+pQ7WYQzZDlrf/rw==
X-CSE-MsgGUID: XddjZr70TMSLVjXuhknFPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180364"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:20 -0800
X-CSE-ConnectionGUID: wiC0zT0pQ7+5YOLggQIg7A==
X-CSE-MsgGUID: HazynnR7T7uzX0BLo3FB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421498"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:20 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 00/17] drm/xe: Multi Queue feature support
Date: Tue,  9 Dec 2025 16:39:11 -0800
Message-ID: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c            | 581 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  29 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   1 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  64 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  44 ++
 21 files changed, 1289 insertions(+), 83 deletions(-)

-- 
2.43.0

