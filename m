Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0DCCFA05
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1BD10E305;
	Fri, 31 Oct 2025 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="av/bQp19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A811C10E2FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935383; x=1793471383;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MkQlWt88hmMm28Vnt+2gtHviDDRzvKdbOOzdu9KFfc0=;
 b=av/bQp19qu13QqgbTyF/YxiAha1eE4gDzXHyZLoGqWwYmiKI0wEbHXej
 f0eZdCv9OGs5yZMp5xGGbptFKnD+XX/JK+csHOhbPOekIAukwLgu66Zlb
 mndtHOTCA48qjPzJ5AJM/m4WwIyEmpgBNc87RS6MUtEsFtaP+QZrTn3Y0
 O4lpTBrQM9VkBF7xgI9e7DKnnc7Q6p/gzzP6mmCLeecj+fenya6QLUJD7
 QGSbXThkKIrXs8HaoQo8qwvhZMXA8eWcfSe7oUHe8kTKI5l8suxD4hWBT
 zHtXE/H/I6gL1IP6+cvYtc6rACB8QGf2r0IKUxE+AicNoOy3GCP8/zWLm g==;
X-CSE-ConnectionGUID: tkj537knQZCMRKDFH7PIfQ==
X-CSE-MsgGUID: L3RjFkyFS+GwZPJsZjD3uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123849"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
X-CSE-ConnectionGUID: vanAK0ZoR5a1oDf29DAL+Q==
X-CSE-MsgGUID: qlatr8VlSJGM6Hr6GHmTeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987627"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/16] drm/xe: Multi Queue feature support
Date: Fri, 31 Oct 2025 11:29:20 -0700
Message-ID: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue.c            | 414 +++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  51 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            | 612 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  32 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |  68 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
 include/uapi/drm/xe_drm.h                     |  40 ++
 21 files changed, 1276 insertions(+), 108 deletions(-)

-- 
2.43.0

