Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD84FC2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1002E10E73C;
	Tue, 18 Jun 2024 17:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUPg7vqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFADA10E744
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718730876; x=1750266876;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PR7CVGXvEWinpMbVXrb5l7Cqsfpol6Gf1ip1TkBC9CI=;
 b=CUPg7vqP3vJB7qb3QUJ3v+/nrEJAWxisNTy9pvV1/O1mR7EwvgO8jFoa
 cHjbM+eHk/7A13FWVlAXsNTD0Xm5Is8MNKxHdO4m9NdcOzFnk6G7E1vj+
 bfum1JDglSSlefQhxThbB7NtYYNhOsyvO/Ts7QAvrCyviRiieYYL7B9xO
 pe1CMkWPe5cW2IO8Pc5I3+R3+yioLeaOpD7rcws6txOa/rC0zR+s2oB5Z
 kHK++MqvCnfhNvD10c0RyGQaf2UNwv+tkYMGRlocOog3GA5MbEVz/9qaV
 IX3jWqg4UYZ4/+pTyGcJUkZE/tKmLfYeGG9/KRzMnvotlymcMKQ/mVilv g==;
X-CSE-ConnectionGUID: efIZYY8DSPGu8aqfhV8Ppw==
X-CSE-MsgGUID: LRezg7TsTaiEV5AF0NXBPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26754429"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26754429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
X-CSE-ConnectionGUID: wPc3r0yqQO6WhVt2LDVAtA==
X-CSE-MsgGUID: kYz4/f92SZitEVnbRCctKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46583651"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/7] Convert multiple bind ops to 1 job
Date: Tue, 18 Jun 2024 10:15:02 -0700
Message-Id: <20240618171509.3336601-1-matthew.brost@intel.com>
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

Continuation of merging parts of [1]. Patch #2 in this series is quite
large but unsure how to split the patch without breaking functionality.

Tested with [2].

v2:
 - Rebase
 - Add error injection patch
 - Fix dma-fence reservation for binds
v3:
 - Rebase
 - Error injection patch omitted in this rev
v4:
 - Rebase
 - Fix tlb invalidation (Paulo)
 - Add missing last fence dep / test to inspection (Inspection)
 - Add error injection patch back in 

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/129606/

Matthew Brost (7):
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Add xe_exec_queue_last_fence_test_dep
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update VM trace events
  drm/xe: Update PT layer with better error handling
  drm/xe: Add VM bind IOCTL error injection

 drivers/gpu/drm/xe/xe_bo_types.h     |    2 +
 drivers/gpu/drm/xe/xe_device_types.h |   12 +
 drivers/gpu/drm/xe/xe_exec_queue.c   |   23 +
 drivers/gpu/drm/xe/xe_exec_queue.h   |    2 +
 drivers/gpu/drm/xe/xe_migrate.c      |  305 +++---
 drivers/gpu/drm/xe/xe_migrate.h      |   34 +-
 drivers/gpu/drm/xe/xe_pt.c           | 1290 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pt.h           |   14 +-
 drivers/gpu/drm/xe/xe_pt_types.h     |   48 +
 drivers/gpu/drm/xe/xe_trace_bo.h     |   10 +-
 drivers/gpu/drm/xe/xe_vm.c           |  647 +++++--------
 drivers/gpu/drm/xe/xe_vm.h           |    2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |   55 +-
 13 files changed, 1386 insertions(+), 1058 deletions(-)

-- 
2.34.1

