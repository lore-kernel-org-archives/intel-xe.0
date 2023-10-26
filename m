Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BA3C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367010E74C;
	Thu, 26 Oct 2023 04:01:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F9C10E74C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292908; x=1729828908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cCH0ai3cVFj8Fk5PLoyDtOwvZJN8eXRq59Thif6I5Zc=;
 b=JdG4a7Sb2kPNCvg+hQgtIKIKGq9lChSdrUoUjxq9X9+FXhSmUTYXsRXf
 le80y7XIN3p70Zkxb8rZna6XsVCOXyAb+OoygZcM74ZHmVMb/5K60untc
 8dC13omlQum+tWLjfyBGzpsynp22PAzR0j3YNFxW4rgQTZfOjdcfJq6a8
 oElPUicIK3cLOHeANlI2u71vQaKZDU11l8guyXECS+AbU9Hyoi2vIZUZ/
 VGTNtmEvojCc8ni2anZkYIevKOKhD/FnjQkTViM+BsfpeJNkYZoV8s+gn
 16NE4a7zvy5amgi5fIZDEx+HZhAgKHbVWdDsZughPyMLUN7zOKzYGq0W3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377821979"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377821979"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682312"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682312"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:47 -0700
Message-Id: <20231026040213.1272993-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/26] Refactor VM bind code
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

WIP on refactoring VM bind to final error handling solution.

Major changes are:
1. Allow bind / exec IOCTLs with zero binds / batches
2. Convert multiple binds from IOCTL into single job
3. CPU binds in jobs
4. Sync vs async bind per IOCTL rather than per queue

Error handling still not 100% correct but this this series structures
the code to make it possible.

This series shouldn't break any uAPI compatibility until the last patch
in the series.

Matt  

Matthew Brost (26):
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe: Lock all gpuva ops during VM bind IOCTL
  drm/xe: Add ops_execute function which returns a fence
  drm/xe: Move migrate to prefetch to op_lock funtion
  drm/xe: Add struct xe_vma_ops abstraction
  drm/xe: Update xe_vm_rebind to use dummy VMA operations
  drm/xe: Move drm exec loop to vm_bind_ioctl_ops_execute
  drm/xe: Fixup error handling / ref counting in VM bind IOCTL
  drm/xe: Convert pagefault rebind to use ops interface
  drm/xe: Add some members to xe_vma_ops
  drm/xe: Add vm_bind_ioctl_ops_install_fences helper
  drm/xe: Drop rebind argument from xe_pt_prepare_bind
  drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
  drm/xe: Move setting last fence and sync wait to
    vm_bind_ioctl_ops_install_fences
  drm/xe: Fix vma_is_valid to use tile argument
  drm/xe: Adjust tile mask in operations create
  drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use
    this
  drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
  drm/xe: Convert multiple bind ops into single job
  drm/xe: Update clear / populate arguments
  drm/xe: Add __xe_migrate_update_pgtables_cpu helper
  drm/xe: Add xe_hw_fence_signal helper
  drm/xe: CPU binds for jobs
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe/uapi: Make sync vs async VM bind operations per IOCTL rather
    than queue

 drivers/gpu/drm/xe/xe_bo.c                  |   7 +-
 drivers/gpu/drm/xe/xe_bo.h                  |   6 +-
 drivers/gpu/drm/xe/xe_bo_types.h            |   2 +
 drivers/gpu/drm/xe/xe_device.c              |  23 +
 drivers/gpu/drm/xe/xe_device.h              |   7 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_exec.c                |  48 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  20 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   7 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  18 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  60 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |  43 +-
 drivers/gpu/drm/xe/xe_hw_fence.c            |   8 +
 drivers/gpu/drm/xe/xe_hw_fence.h            |   1 +
 drivers/gpu/drm/xe/xe_migrate.c             | 382 +++-----
 drivers/gpu/drm/xe/xe_migrate.h             |  46 +-
 drivers/gpu/drm/xe/xe_pt.c                  | 992 ++++++++++++--------
 drivers/gpu/drm/xe/xe_pt.h                  |   8 +
 drivers/gpu/drm/xe/xe_pt_types.h            |  51 +
 drivers/gpu/drm/xe/xe_sched_job.c           |   4 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |  31 +-
 drivers/gpu/drm/xe/xe_sync.c                |   5 +-
 drivers/gpu/drm/xe/xe_sync.h                |   2 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 981 ++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h                  |   7 +
 drivers/gpu/drm/xe/xe_vm_types.h            | 208 ++--
 include/uapi/drm/xe_drm.h                   |   6 +-
 28 files changed, 1536 insertions(+), 1444 deletions(-)

-- 
2.34.1

