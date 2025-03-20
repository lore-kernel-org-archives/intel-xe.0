Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B5AC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5010E688;
	Thu, 20 Mar 2025 19:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llu7CzIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBD510E69D
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TJckZlszWVP4ERyfcjpChHHDwbSVSXtuMdKsgKY3xsQ=;
 b=llu7CzIMkiQkDzLevn8Q995W9G2Swj3ZdVP2dYk6QiWr8Ohmht7h5a6S
 hLmcaVpAjkflOKWo3HSXZAbq7VF0XcXzW7QSiokLys2tOOJypoMn1rtaU
 blmYMRpNkwSH+Zxe1Wx3+GhJWgXbEme5yjG47AUy/9nSdLdwinV0Xx4nm
 XE2QvI1D8MiQ/003Gjl4iLCYT2c21ejZPOCm3bALoOYPTDzK2xlDJJhci
 f3pmt7A5UBDZ82ykQJU7FouPxYQ2x4pODQMTH07C04dyjfRL0m2QIhsox
 fCRL/kDOQXu6chiRriuy239CrzG7VZhLBHv9qcgmzmiDYylUTxikTZIol g==;
X-CSE-ConnectionGUID: 3xio4xk7TyGTtTUUw/quRw==
X-CSE-MsgGUID: FZiBYBmwRf+4FuQp3ITPfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678744"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
X-CSE-ConnectionGUID: v0aKeajnTjuMR7ESZ59mjw==
X-CSE-MsgGUID: 1dOw1/HRR7+hFaPB/txJ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156804"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 0/9] Add support for Mesa GPU hang replay tool
Date: Thu, 20 Mar 2025 12:28:22 -0700
Message-Id: <20250320192831.3842138-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the Mesa GPU hang replay tool, which exists in the i915.

The main changes are as follows:

- Update devcoredump to include additional information, allowing the
  Mesa tool to extract everything it needs to replay a GPU hang. These
  updates are designed to remain compatible with the existing Mesa
  devcoredump parser.
- Introduce the DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE extension, which
  enables setting the execution queue state to the hung execution queue
  state.

v2:
- Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
- Fix the page math to avoid a crash
v3:
- Add pat_index and cpu_caching to properties
- A VM.uapi_flags  

The Mesa uAPI tool development is a WIP. The tool is a prerequisite for
merging this change.

Matt

Matthew Brost (9):
  drm/xe: Add properties line to VM snapshot capture
  drm/xe: Add "null_sparse" type to VM snap properties
  drm/xe: Add mem_region to properties line in VM snapshot capture
  drm/xe: Add pat_index to properties line in VM snapshot capture
  drm/xe: Add cpu_caching to properties line in VM snapshot capture
  drm/xe: Add VM.uapi_flags to VM snapshot capture
  drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
  drm/xe: Add replay_offset and replay_length lines to LRC HWCTX
    snapshot
  drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE

 drivers/gpu/drm/xe/xe_exec_queue.c       | 32 +++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 44 +++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |  4 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 55 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h                |  9 +++-
 8 files changed, 137 insertions(+), 15 deletions(-)

-- 
2.34.1

