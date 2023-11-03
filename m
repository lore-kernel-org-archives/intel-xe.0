Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE2C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ABE10E9F4;
	Fri,  3 Nov 2023 14:35:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132810E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022110; x=1730558110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZXYaTBKQvdnMLQqGYHvAq6au2V/rrCc3Fc6y6VH01fw=;
 b=fhxPUY9EGrax4j/awU0d+VJDVtIDreyodf843zF6zOpFt/MmvOv90nTV
 uwUPj2Ad8VUt28oMDty/IClrSma47FBLkceUzJWhxwR5INSpJVYgoPj9f
 LjK/MUdN0tuwM/1EsnTNzIAKmCgMh9XMdVgxB67bWY0Qd+/f/C46WspAD
 uwRhGPcce0iQoCa7vs2eKJhLDqwPJBjPn4ni4MIR5nDdKVDm1OdB1YtnM
 572pBzO4/OcQQXlYmpgLPADI/SkzjKqXeQ4s7R78KhcjXZvQGnR6xj8qW
 r14CERXOKYljuQ54+3B9hmEf0qFUpRw6i3i2k+kBLoiR4AXY0qOYlPaIg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843314"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843314"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832391"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832391"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:06 +0000
Message-Id: <20231103143456.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/50] uAPI Alignment - take 2
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is the second take of uAPI updates that would lead to
breakage in the compatibility, which it is not acceptable after
we are merged upstream. So, let's break it before it is too late,
and start upstreaming a good, reliable and clean uapi.

v2: Rebase, drop "RFC", more uAPI fixes and cleanup

Aravind Iddamsetty (1):
  drm/xe/pmu: Drop interrupt pmu event

Francois Dugast (20):
  fixup! drm/xe: Correlate engine and cpu timestamps with better
    accuracy
  drm/xe/uapi: Add documentation for query
  drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
  drm/xe: Extend uAPI to query HuC micro-controler firmware version
  drm/xe: Remove useless query config num_params
  drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
  drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
  fixup! drm/xe: Add uAPI to query micro-controler firmware version
  drm/xe/uapi: Make constant comments visible in kernel doc
  drm/xe/uapi: Remove unused inaccessible memory region
  drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
  drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
  drm/xe/uapi: Replace BO with GEM in documentation
  fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
  drm/xe/uapi: Add link to Xe documentation
  drm/xe/uapi: Align on a common way to return arrays (memory regions)
  drm/xe/uapi: Align on a common way to return arrays (gt)
  drm/xe/uapi: Align on a common way to return arrays (engines)
  drm/xe/uapi: Add block diagram of a device
  drm/xe/uapi: Add examples of user space code

José Roberto de Souza (2):
  drm/xe: Add uAPI to query micro-controler firmware version
  drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof

Mauro Carvalho Chehab (1):
  xe/xe_bo: Reject bo creation of unaligned size

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

Rodrigo Vivi (24):
  drm/xe/uapi: Remove GT_TYPE_REMOTE
  drm/xe/uapi: Kill VM_MADVISE IOCTL
  drm/xe/uapi: Separate bo_create placement from flags
  drm/xe/uapi: Rename *_mem_regions masks
  drm/xe/uapi: Rename query's mem_usage to mem_regions
  drm/xe/uapi: Fix indentation issues that sometimes causes build
    warning
  drm/xe/uapi: Order sections
  drm/xe/uapi: More uAPI documentation additions and cosmetic updates
  drm/xe/uapi: Split xe_sync types from flags
  drm/xe/uapi: Standardize the FLAG naming and assignment
  drm/xe/uapi: Differentiate WAIT_OP from WAIT_MASK
  drm/xe/uapi: Move xe_exec after xe_exec_queue
  fixup! drm/xe/uapi: Split xe_sync types from flags
  drm/xe/uapi: Move memory_region masks from GT to engine
  drm/xe/uapi: Document the memory_region bitmask
  drm/xe/uapi: Be more specific about the vm_bind prefetch region
  drm/xe/uapi: Convert tile_mask to a pt_placement_hint
  drm/xe/uapi: Rename couple exec_queue items
  drm/xe/uapi: Refactor engine information
  drm/xe/uapi: Crystal Reference Clock updates
  drm/xe/uapi: Add Tile ID information to the GT info query
  squash! drm/xe/uapi: Rename couple exec_queue items
  fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof
  drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL

Umesh Nerlige Ramappa (1):
  fixup! drm/xe: Correlate engine and cpu timestamps with better
    accuracy

 drivers/gpu/drm/xe/Makefile              |    1 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c    |    8 +-
 drivers/gpu/drm/xe/xe_bo.c               |   51 +-
 drivers/gpu/drm/xe/xe_bo_types.h         |    3 +
 drivers/gpu/drm/xe/xe_devcoredump.c      |    8 +-
 drivers/gpu/drm/xe/xe_device.c           |    8 +-
 drivers/gpu/drm/xe/xe_exec.c             |    4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   86 +-
 drivers/gpu/drm/xe/xe_exec_queue.h       |    4 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |    4 +-
 drivers/gpu/drm/xe/xe_gt.c               |    2 +-
 drivers/gpu/drm/xe/xe_gt_clock.c         |    4 +-
 drivers/gpu/drm/xe/xe_gt_types.h         |    4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       |   32 +-
 drivers/gpu/drm/xe/xe_irq.c              |   18 -
 drivers/gpu/drm/xe/xe_pmu.c              |   25 +-
 drivers/gpu/drm/xe/xe_pmu_types.h        |    8 -
 drivers/gpu/drm/xe/xe_query.c            |  221 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c         |    8 +-
 drivers/gpu/drm/xe/xe_sched_job.c        |   10 +-
 drivers/gpu/drm/xe/xe_sync.c             |   27 +-
 drivers/gpu/drm/xe/xe_sync_types.h       |    1 +
 drivers/gpu/drm/xe/xe_trace.h            |    8 +-
 drivers/gpu/drm/xe/xe_vm.c               |  115 +-
 drivers/gpu/drm/xe/xe_vm_doc.h           |   14 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c       |  299 -----
 drivers/gpu/drm/xe/xe_vm_madvise.h       |   15 -
 drivers/gpu/drm/xe/xe_wait_user_fence.c  |   74 +-
 include/uapi/drm/xe_drm.h                | 1334 ++++++++++++++--------
 29 files changed, 1246 insertions(+), 1150 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

