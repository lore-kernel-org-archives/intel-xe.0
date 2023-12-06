Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD93C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 03:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620010E076;
	Wed,  6 Dec 2023 03:46:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2510E076
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 03:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701834373; x=1733370373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NYsOz2ltWEBd3GhizTOOvFHJy40xs1VlMgyuYW4u7Ug=;
 b=EfbjgChYIsivY9XKU/JseECaIJFmX46TwsaZYVMLKqruVgeUh5PxrqhV
 gVSj0zwf63J9vdiS1A33u7xU9eAaM9RNf4XTp7ZZNwsCPXJfvwk3ByaDU
 9r/R5NwU8aHKByC1ZrfHONaEEypVdR73qwIK4PBv/wo8YAtmciNzbkroa
 mctoMMAy2CQRP3xUSEeuFXlYdzVCn41CpKjprqcVvzB7EPHQntNocWnt5
 c2aCvQp7DZalzxa0dt8KN+C97vxlvrPWoVRYbPtnXJv4jaZEbsL4Ksuas
 6+ZAY2TFi76/Zgm6tzPPp1JjZWXxLC4u3wXKm7sk2gmGX9DbmmxJSXxrv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480197286"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="480197286"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 19:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774854126"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="774854126"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 19:46:11 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 09:11:28 +0530
Message-Id: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] RFC: drm/xe/uapi: Return correct error
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

v2: Addressed the review comments

I am able to see exec_queue reset was happened and xe_wait_user_fence_ioctl returned EIO
test output
root@DUT7075PVC:/home/gta# LD_LIBRARY_PATH=/home/gta/ ./xe_waitfence --r invalid-exec_queue-wait
IGT-Version: 1.28-g3c0162fc4 (x86_64) (Linux: 6.6.0-rc3-xe x86_64)
Opened device: /dev/dri/card0
Starting subtest: invalid-exec_queue-wait
Subtest invalid-exec_queue-wait: SUCCESS (0.964s)
root@DUT7075PVC:/home/gta#

test dmesg
[  602.739260] [drm:drm_stub_open [drm]]
[  602.743670] xe 0000:51:00.0: [drm:drm_open_helper [drm]] comm="xe_waitfence", pid=2782, minor=0
[  602.755240] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  602.768439] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  602.786216] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.798395] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.810375] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.822345] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.834970] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.846984] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.859022] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.871020] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_DEVICE_QUERY
[  602.883066] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  602.895474] [IGT] xe_waitfence: starting subtest invalid-exec_queue-wait
[  602.903088] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_VM_CREATE
[  602.939310] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying GT save-restore MMIOs
[  602.949548] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x9424] = 0x7ffffffc
[  602.959073] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xb01c] = 0x00010001
[  602.968602] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xcf2c] = 0x00010008
[  602.978193] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xcf30] = 0x00010008
[  602.987726] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xcf34] = 0x00010008
[  602.997285] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xcf38] = 0x00010008
[  603.006876] xe 0000:51:00.0: [drm:xe_wopcm_init [xe]] WOPCM: 4096K
[  603.014061] xe 0000:51:00.0: [drm:xe_wopcm_init [xe]] GuC WOPCM is already locked [1440K, 1024K)
[  603.034935] xe 0000:51:00.0: [drm:__xe_guc_upload [xe]] GuC successfully loaded
[  603.043633] xe 0000:51:00.0: [drm:xe_guc_ct_enable [xe]] GuC CT communication channel enabled
[  603.054277] xe 0000:51:00.0: [drm:xe_mocs_init [xe]] flag:0x2
[  603.061026] xe 0000:51:00.0: [drm:xe_mocs_init [xe]] entries:3
[  603.067808] xe 0000:51:00.0: [drm:xe_mocs_init [xe]] LNCFCMOCS[0] 0xb020 0x100030
[  603.076498] xe 0000:51:00.0: [drm:xe_mocs_init [xe]] LNCFCMOCS[1] 0xb024 0x300030
[  603.086071] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs0 save-restore MMIOs
[  603.096369] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x220c4] = 0x3f7e0102
[  603.105999] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
[  603.114341] xe 0000:d0:00.0: [drm] GT0: suspended
[  603.115802] xe REG[0x4400-0x45ff]: deny rw access
[  603.126497] xe REG[0x4500-0x45ff]: deny rw access
[  603.131819] xe REG[0x22200-0x22207]: deny rw access
[  603.137336] xe REG[0x223a8-0x223af]: allow read access
[  603.143200] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs1 save-restore MMIOs
[  603.153492] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3e00c4] = 0x3f7e0102
[  603.163276] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
[  603.173085] xe REG[0x4400-0x45ff]: deny rw access
[  603.178458] xe REG[0x4500-0x45ff]: deny rw access
[  603.183781] xe REG[0x3e0200-0x3e0207]: deny rw access
[  603.189488] xe REG[0x3e03a8-0x3e03af]: allow read access
[  603.195553] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs2 save-restore MMIOs
[  603.205922] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3e20c4] = 0x3f7e0102
[  603.215644] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
[  603.225524] xe REG[0x4400-0x45ff]: deny rw access
[  603.230851] xe REG[0x4500-0x45ff]: deny rw access
[  603.236175] xe REG[0x3e2200-0x3e2207]: deny rw access
[  603.241939] xe REG[0x3e23a8-0x3e23af]: allow read access
[  603.247947] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs5 save-restore MMIOs
[  603.258304] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3e80c4] = 0x3f7e0102
[  603.268020] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
[  603.277893] xe REG[0x4400-0x45ff]: deny rw access
[  603.283208] xe REG[0x4500-0x45ff]: deny rw access
[  603.288533] xe REG[0x3e8200-0x3e8207]: deny rw access
[  603.294298] xe REG[0x3e83a8-0x3e83af]: allow read access
[  603.300304] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs6 save-restore MMIOs
[  603.310660] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ea0c4] = 0x3f7e0102
[  603.320400] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
[  603.330270] xe REG[0x4400-0x45ff]: deny rw access
[  603.335579] xe REG[0x4500-0x45ff]: deny rw access
[  603.340963] xe REG[0x3ea200-0x3ea207]: deny rw access
[  603.346670] xe REG[0x3ea3a8-0x3ea3af]: allow read access
[  603.352675] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs7 save-restore MMIOs
[  603.363048] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ec0c4] = 0x3f7e0102
[  603.372775] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
[  603.382628] xe REG[0x4400-0x45ff]: deny rw access
[  603.388000] xe REG[0x4500-0x45ff]: deny rw access
[  603.393325] xe REG[0x3ec200-0x3ec207]: deny rw access
[  603.399090] xe REG[0x3ec3a8-0x3ec3af]: allow read access
[  603.405096] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs8 save-restore MMIOs
[  603.415399] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ee0c4] = 0x3f7e0102
[  603.425177] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
[  603.434977] xe REG[0x4400-0x45ff]: deny rw access
[  603.440351] xe REG[0x4500-0x45ff]: deny rw access
[  603.445676] xe REG[0x3ee200-0x3ee207]: deny rw access
[  603.451384] xe REG[0x3ee3a8-0x3ee3af]: allow read access
[  603.457446] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs0 save-restore MMIOs
[  603.467746] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20e4] = 0x80008000
[  603.477352] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe48c] = 0x08000800
[  603.486935] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe7c8] = 0x40000000
[  603.496487] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x1a0c4] = 0x3f7e0104
[  603.506181] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs0 registers
[  603.515988] xe REG[0x4400-0x45ff]: deny rw access
[  603.521363] xe REG[0x4500-0x45ff]: deny rw access
[  603.526687] xe REG[0x1a3a8-0x1a3af]: allow read access
[  603.532495] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs1 save-restore MMIOs
[  603.542853] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x1c0c4] = 0x3f7e0104
[  603.552475] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs1 registers
[  603.562342] xe REG[0x4400-0x45ff]: deny rw access
[  603.567657] xe REG[0x4500-0x45ff]: deny rw access
[  603.573102] xe REG[0x1c3a8-0x1c3af]: allow read access
[  603.578911] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs2 save-restore MMIOs
[  603.589212] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x1e0c4] = 0x3f7e0104
[  603.598902] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs2 registers
[  603.608708] xe REG[0x4400-0x45ff]: deny rw access
[  603.614085] xe REG[0x4500-0x45ff]: deny rw access
[  603.619415] xe REG[0x1e3a8-0x1e3af]: allow read access
[  603.625226] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs3 save-restore MMIOs
[  603.635574] xe 0000:51:00.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x260c4] = 0x3f7e0104
[  603.645205] xe 0000:51:00.0: [drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting ccs3 registers
[  603.655069] xe REG[0x4400-0x45ff]: deny rw access
[  603.660375] xe REG[0x4500-0x45ff]: deny rw access
[  603.665698] xe REG[0x263a8-0x263af]: allow read access
[  603.671572] xe 0000:51:00.0: [drm] GT0: resumed
[  603.680876] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_EXEC_QUEUE_CREATE
[  603.695310] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_GEM_CREATE
[  603.707535] xe 0000:51:00.0: [drm:xe_migrate_clear [xe]] Pass 0, size: 262144
[  603.717871] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_GEM_MMAP_OFFSET
[  603.730487] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_EXEC
[  603.742802] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_WAIT_USER_FENCE
[  603.744908] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]]
                ASID: 1048575
                VFID: 0
                PDATA: 0x00a3
                Faulted Address: 0x00000000001a0000
                FaultType: 0
                AccessType: 0
                FaultLevel: 4
                EngineClass: 3
                EngineInstance: 0
[  603.790711] xe 0000:51:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
[  603.800600] xe 0000:51:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] Engine memory cat error: guc_id=2
[  603.813364] xe 0000:51:00.0: [drm] exec gueue reset detected
[  603.814144] xe 0000:51:00.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x8
[  603.819761] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence", pid=2782, ret=-5
[  603.820914] xe 0000:51:00.0: [drm] Xe device coredump has been created
[  603.828946] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, XE_EXEC_QUEUE_DESTROY
[  603.838061] xe 0000:51:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
[  603.841738] xe 0000:51:00.0: [drm] Engine reset: guc_id=2
[  603.845581] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, DRM_IOCTL_GEM_CLOSE
[  603.859013] xe 0000:51:00.0: [drm:guc_exec_queue_timedout_job [xe]] Timedout signaled job: seqno=4294967169, guc_id=2, flags=0x9
[  603.867724] [IGT] xe_waitfence: finished subtest invalid-exec_queue-wait, SUCCESS
[  603.907471] xe 0000:51:00.0: [drm:drm_ioctl [drm]] comm="xe_waitfence" pid=2782, dev=0xe200, auth=1, DRM_IOCTL_VERSION
[  603.919621] xe 0000:51:00.0: [drm:drm_file_free.part.0 [drm]] comm="xe_waitfence", pid=2782, dev=0xe200, open_count=1
[  603.932366] xe 0000:51:00.0: [drm:drm_lastclose [drm]]
[  603.938362] xe 0000:51:00.0: [drm:drm_lastclose [drm]] driver lastclose completed
[  603.947176] [IGT] xe_waitfence: exiting, ret=0
[  603.975414] xe 0000:d7:00.0: [drm] GT0: suspended


Bommu Krishnaiah (2):
  drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl

 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 +++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 86 +++++-------------------
 include/uapi/drm/xe_drm.h                | 16 +----
 5 files changed, 40 insertions(+), 81 deletions(-)

-- 
2.25.1

