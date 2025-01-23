Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F0C0218D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F067910E3D3;
	Thu, 23 Jan 2025 01:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+WpK+R7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF51E10E041
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594862; x=1769130862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EcSC3HFzBZZ3wA9MnSMZtkSM+5Tb//30/8yRDIsdy7w=;
 b=j+WpK+R7zthP8EOvSLZTSEru8SqoSUXBsTRuCNmh4dTikJiKLMbbGIYL
 eNTHN0PzwhB4ap5+szfQ2GjD0Vjv82ch6wQS7WmBUyOCuampqTobdp7lX
 MgS6aiKVsbUym6PmG5dJOamsi4dPv6a/7yRwVABrAYfMPvBKQWfAbS3Hl
 /nGE+zBfRcWnZ0qKS1w/ffNNcqJ2Zn+76x0Pp/Q0lq8DqRZzE7AXWXUl8
 ABYL3ixeAlS0tWYWzlDPGacgOdwAvr0uSqjgTmFXrDZzv3YCOdzftjdul
 6325LEGW6BcG2W62Zv2SKEjWJpkn+3pkrkv9kkzGKtk+1UkbyFMPvTUcH A==;
X-CSE-ConnectionGUID: VAyFuhXIQr6XQCV1JACFhA==
X-CSE-MsgGUID: foIYT9aSTMm7J5AosAfzMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967060"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: Gzv64cqARjeO3yLB18VJDw==
X-CSE-MsgGUID: hU5XX7PPTZ2MyFKx4jj4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124105"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 0/6] Add support for Mesa GPU hang replay tool 
Date: Wed, 22 Jan 2025 17:15:07 -0800
Message-Id: <20250123011513.362430-1-matthew.brost@intel.com>
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

This is being sent as an RFC, as the Mesa uAPI tool has yet to be developed. The tool is a prerequisite for merging this change.

Matt

Matthew Brost (6):
  drm/xe: Add properties line to VM snapshot capture
  drm/xe: Add "null_sparse" type to VM snap properties
  drm/xe: Add mem_region to properties line in VM snapshot capture
  drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
  drm/xe: Add replay_offset and replay_length lines to LRC HWCTX
    snapshot
  drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE

 drivers/gpu/drm/xe/xe_exec_queue.c       | 29 +++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 40 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 42 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h                |  9 +++--
 8 files changed, 120 insertions(+), 12 deletions(-)

-- 
2.34.1

