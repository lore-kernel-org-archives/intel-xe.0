Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE6C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CF110E54F;
	Tue,  5 Dec 2023 14:42:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277EA10E321
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701787357; x=1733323357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QBkvvl6oIzvf4VvfaTWGIajb57+s4E5bG/FlMI6JkEk=;
 b=PFnvI4FbUh8eCLaiUNDUrdA0vCJmSvr1SbGT/f3sL2VlP/aIcKMpembh
 CIKixwxinPiW9EbcCk43Y1Bm4qUtdJS4XMEoyOU/lcx+5Dv8x3SWEeNIZ
 cXijQgZWPWNcTzX2Az9v8Hg6HMsoQnt85WlIsIRZ45DPuD9rZqidjsbk1
 726QfNQaa0/e5LQcbt2TqG1Gpy9TQUFovXeoAGPWvf3hX11Vk+cub/0Ur
 /K80e+Dv1taBFaOszoUGP7s94PoghU3VGzznw6TWLP3M0gcUz0MMiTbNn
 j9Xci0x932z4BBbonjnIMSXYN8h7z28ZG3SuQ7dxv3E9BNHABVCH48SJ1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="988106"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="988106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="18982857"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 06:42:35 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 20:07:53 +0530
Message-Id: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] RFC: drm/xe/uapi: Return correct error code
 for xe_wait_user_fence_ioctl
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

return correct error code if exec_queue is reset/engine is hung
remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

I am able to see exec_queue reset was happened and xe_wait_user_fence_ioctl   returned EIO
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
  drm/xe: Return correct error code for xe_wait_user_fence_ioctl

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 67 +++++-------------------
 include/uapi/drm/xe_drm.h                | 16 ++----
 5 files changed, 35 insertions(+), 67 deletions(-)

-- 
2.25.1

