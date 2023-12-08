Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6DBC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C9310E9BB;
	Fri,  8 Dec 2023 04:22:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4C10E12E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702009324; x=1733545324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+ODAj8yNasjP5EdeVvQM8pqWt2jGHqSl5i2uzb5i+Jo=;
 b=OFgi8hfaMR/S/6ow2l3RH6VfKgP9OwhNKGf4D+60+1cpe3jr0uDna2qY
 zUzhpArirHr4jCabrw2VqRVeC4iLlWafxIkjWOYB4usATxFbOwlKPW/IX
 9l1cI1lGCFTSlbfNE0aSRspLRjNWbE7qCVR0bFw1uFgwZdZKFDHhfJKml
 2dH2AGWGu7TowC8hbKXzzomdLHBB59qFwXue3QKZ9joeC+d9BNObMHS/9
 vlISxR/WI1PZhhpeW8hFTmqrOYzRNG74ZqixrVa/xs5QlhCwCJqSvElYG
 DyL9cwC7q6GdfqFWRKqmP3BvMzCb26GUy0BNp9eEmVi+HGlTTaJ7Nx9aT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458668128"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="458668128"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="837999896"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="837999896"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2023 20:22:01 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/2] RFC: drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Date: Fri,  8 Dec 2023 09:47:14 +0530
Message-Id: <20231208041716.32369-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

Currently xe_wait_user_fence_ioctl is not checking exec_queue state
and blocking until timeout, with this patch wakeup the blocking wait
if exec_queue reset happen and returning proper error code

v5: addressed previous review comment

NOTE: Corresponding IGT changes is,
IGT patch: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure

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
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 91 +++++++-----------------
 include/uapi/drm/xe_drm.h                | 17 ++---
 5 files changed, 48 insertions(+), 79 deletions(-)

-- 
2.25.1

