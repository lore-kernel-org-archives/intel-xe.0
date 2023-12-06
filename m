Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A5C10DC3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 02:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDDE10E07A;
	Wed,  6 Dec 2023 02:50:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3B910E07A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701831007; x=1733367007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zgzwhh6/ckeZfXDjVc3y5EWM22V6cynEEO7e5gp3yQo=;
 b=Bbhioatf0T2i68STGz4kLO0uLmJS9Gwy8Lxx+Iwf1sqURlYeZ+Zj7nHj
 wGsLIFlbbDQ5FNuGGS9WNu0p+G64DqPjyLjNLQRHY00mnVw3ScP3ZURXh
 ZDBZDL/NbH/+RNdUF408EC6PGsobl2Dq5nnS4UGWiGCqbRvHRmjTdacGb
 h4LQtVUgh3p+YnTNMvmNNyc1layqpAgnKdH5BdyYcjNZIz/q0Zw3tu/Gn
 TuHv3fqcCFnBk6iWnreKihmUALMvfOlqsiHlD4HZoM/TtgLeSIWfFVaOq
 5+W5eamxYSdOW36DgxyhZcAkJWVbpxLbygNL/gfqWmPbp0npZ3rbGkMGI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1086753"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1086753"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 18:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771144153"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="771144153"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 18:50:04 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 08:15:21 +0530
Message-Id: <20231206024523.29164-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] RFC: drm/xe/uapi: Return correct error
 code for xe_wait_user_fence_ioctl
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

remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

Currently xe_wait_user_fence_ioctl is not checking exec_queue state
and blocking until timeout, with this patch wakeup the blocking wait
if exec_queue reset happen and returning proper error code

I am able to see exec_queue reset was happened and xe_wait_user_fence_ioctl returned EIO
test output
root@DUT7075PVC:/home/gta# LD_LIBRARY_PATH=/home/gta/ ./xe_waitfence --r invalid-exec_queue-wait
IGT-Version: 1.28-g3c0162fc4 (x86_64) (Linux: 6.6.0-rc3-xe x86_64)
Opened device: /dev/dri/card0
Starting subtest: invalid-exec_queue-wait
Subtest invalid-exec_queue-wait: SUCCESS (0.993s)

test dmesg
[  807.680378] [IGT] xe_waitfence: executing
[  807.699796] [drm:drm_stub_open [drm]]
[  807.704536] xe 0000:51:00.0: [drm:drm_open_helper [drm]] comm="xe_waitfence", pid=2952, minor=0
[  807.715155] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.727328] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.739580] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.751518] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.763550] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.775525] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.787556] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.799494] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.811531] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.823476] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  807.835577] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  807.847921] [IGT] xe_waitfence: starting subtest invalid-exec_queue-wait
[  807.855528] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_VM_CREATE
[  807.891346] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying GT save-restore MMIOs
[  807.901602] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x9424] = 0x7ffffffc
-----------------
-----------------
[  808.560967] xe REG[0x4500-0x45ff]: deny rw access
[  808.566292] xe REG[0x1e3a8-0x1e3af]: allow read access
[  808.572161] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs3 save-restore MMIOs
[  808.582462] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x260c4] = 0x3f7e0104
[  808.592096] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs3 registers
[  808.601962] xe REG[0x4400-0x45ff]: deny rw access
[  808.607281] xe REG[0x4500-0x45ff]: deny rw access
[  808.612608] xe REG[0x263a8-0x263af]: allow read access
[  808.618477] xe 0000:51:00.0: [drm] GT0: resumed
[  808.626283] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC_QUEUE_CREATE
[  808.638765] krishna xe_exec_queue_create_ioctl
[  808.645592] krishna args->exec_queue_id = 1
[  808.650328] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_GEM_CREATE
[  808.662621] xe 0000:51:00.0: [drm:xe_migrate_clear [xe]] Pass 0, size: 262144
[  808.672889] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_GEM_MMAP_OFFSET
[  808.685733] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC
[  808.696900] krishna args->exec_queue_id = 1
[  808.702700] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_WAIT_USER_FENCE
[  808.704620] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]]
                ASID: 1048575
                VFID: 0
                PDATA: 0x00a3
                Faulted Address: 0x00000000001a0000
                FaultType: 0
                AccessType: 0
                FaultLevel: 4
                EngineClass: 3
                EngineInstance: 0
[  808.750685] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
[  808.760519] xe 0000:51:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] Engine memory cat error: guc_id=2
[  808.773237] xe 0000:51:00.0: [drm] exec gueue reset detected
[  808.773965] xe 0000:51:00.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x8
[  808.779632] xe 0000:51:00.0: [drm:xe_wait_user_fence_ioctl [xe]] Ioctl argument check failed at drivers/gpu/drm/xe/xe_wait_user_fence.c:174: err < 0
[  808.789655] xe 0000:51:00.0: [drm] Xe device coredump has been created
[  808.803796] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence", pid=2952, ret=-5
[  808.811133] xe 0000:51:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
[  808.811220] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, XE_EXEC_QUEUE_DESTROY
[  808.823605] xe 0000:51:00.0: [drm] Engine reset: guc_id=2
[  808.829862] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[  808.843312] xe 0000:51:00.0: [drm:guc_exec_queue_timedout_job [xe]] Timedout signaled job: seqno=4294967169, guc_id=2, flags=0x9
[  808.848707] [IGT] xe_waitfence: finished subtest invalid-exec_queue-wait, SUCCESS
[  808.882255] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2952, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  808.894404] xe 0000:51:00.0: [drm:drm_file_free.part.0 [drm]] comm="xe_waitfence", pid=2952, dev=0xe200, open_count=1
[  808.907374] xe 0000:51:00.0: [drm:drm_lastclose [drm]]
[  808.913594] xe 0000:51:00.0: [drm:drm_lastclose [drm]] driver lastclose completed
[  808.922416] [IGT] xe_waitfence: exiting, ret=0


Bommu Krishnaiah (2):
  drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 +++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 81 +++++++-----------------
 include/uapi/drm/xe_drm.h                | 16 +----
 5 files changed, 44 insertions(+), 72 deletions(-)

-- 
2.25.1

