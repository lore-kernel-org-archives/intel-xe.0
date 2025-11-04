Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6286FCCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB6A10E2B9;
	Tue,  4 Nov 2025 18:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdhJ3QqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC99F10E31C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282317; x=1793818317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ygDy6fR/3a6hBHo3p5gMRLoVhTDIUKihL3ugwyOBGz4=;
 b=MdhJ3QqWd3ojIl0YYtpZvZn9w77bN6h7G6IxuQbqgdJOTsiFUx9eqyYj
 F5HYOFL1roO/BkX7OW+U987n/fhT44rXqSXCR1uPB5j4ZLtEQJmvwgr1H
 UYDWnlCSkfa6J382XUIYikC7mWSthFnuhhMwCUamGLBDkv/pXV/qH+RSF
 1/E5hMlCIuk1hTDtGSeZ0CQN58idYIceEPQy6ZJdXm+d8454wtTqNQBy4
 bMPE3GsrLfF+fWJbQ69ImMGfl1qYFOvKSbiWbciqK3ZeJsVVirJrcd43e
 ljybHk1ITZSnZb/fnqljUXveCtqAzVVl6xug1ZCY+OGrk8kbfdT34Mwih Q==;
X-CSE-ConnectionGUID: vtjxs7reTE2huBizqaYQ+w==
X-CSE-MsgGUID: ZZ96d1M5TLevHEeJWXotqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247740"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:56 -0800
X-CSE-ConnectionGUID: mZrTDoo0QZOo1EX0ZjsCWw==
X-CSE-MsgGUID: IZz/PbdjTU6dY7cWNqqIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183061"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 00/16] drm/xe: Multi Queue feature support
Date: Tue,  4 Nov 2025 10:51:34 -0800
Message-ID: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

Changes in v2:
- Rename multi_queue_enable_mask to multi_queue_engine_class_mask.
- Remove group->lock, fix function semantics, add additional comments,
  add asserts, update uapi kernel-doc, move group->list_lock to right
  patch, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo.
- Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value.
- Add fs_reclaim lock dependency, add bspec ref, other minor cleanups.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (16):
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
 drivers/gpu/drm/xe/xe_exec_queue.c            | 425 +++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  57 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 614 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  29 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  68 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  43 ++
 21 files changed, 1294 insertions(+), 108 deletions(-)

-- 
2.43.0

