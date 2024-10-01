Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A687CEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC70910E2C0;
	Tue,  1 Oct 2024 14:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMi692Kk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F28410E2C0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794408; x=1759330408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RnHm9tuF+4+bNBxSGMhG5gTN2DT37H0BQA//kuEkepE=;
 b=iMi692Kkg8DGoHIKOmsqmA/KlJJvve2X8O9yv7LEQwReR4VqKvLcbLiX
 Md/LO2MzU3DexHSrAQHttKlj281eiyz1Hje4yL4ot2dkrupHF9YtzO3Ye
 fQU1Gi9AB9p+buqxfAlPK9s3TEAC2aaa/WfTap7Dm4gTGzX4kVRxsAu1U
 IelcQaccliqIYvZOwb1hiLWE+duu1XxUiqi72mSr/e0s5HaVdvStQKBCc
 94Ql3TZ7afJnPYnVi/dNXdOijwIpEy4+EzJ+qU7LskvyJdykb9+ZklU8H
 2EBm5bSbO3XomfgxG1HRx0zcpqQrUb5zCG+zaVD0bmkS1BCfDWDYlzldH A==;
X-CSE-ConnectionGUID: W1WGyPOsRZuJIKvOI43jag==
X-CSE-MsgGUID: DfgnsIuLSOCcVWvhg7Waig==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091368"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:27 -0700
X-CSE-ConnectionGUID: 7K/zGJ1zQ06xO3mwtW6fdQ==
X-CSE-MsgGUID: O7w8SkHLSxOEkhzHIH702A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048602"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:26 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 00/18] GPU debug support (eudebug) v2
Date: Tue,  1 Oct 2024 17:42:48 +0300
Message-Id: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

Hi,

This is a continuation of the first submission for GPU debug support:

https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html

The most significant changes are:
  1. Placing the code behind Kconfig switch

  2. Using rw_semaphore to allow resource discovery to run without
     individual resource locks.

The page fault handling RFC will be based on this series but will be
posted separately.

Thanks to all contributors for their feedback on v1 and to patch
authors for their fixes. I hope I haven't missed anything.

Mika

Andrzej Hajda (1):
  drm/xe/eudebug: implement userptr_vma access

Christoph Manszewski (3):
  drm/xe/eudebug: Add vm bind and vm bind ops
  drm/xe/eudebug: Dynamically toggle debugger functionality
  drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test

Dominik Grzegorzek (8):
  drm/xe/eudebug: Introduce exec_queue events
  drm/xe/eudebug: hw enablement for eudebug
  drm/xe: Add EUDEBUG_ENABLE exec queue property
  drm/xe/eudebug: Introduce per device attention scan worker
  drm/xe/eudebug: Introduce EU control interface
  drm/xe: Debug metadata create/destroy ioctls
  drm/xe: Attach debug metadata to vma
  drm/xe/eudebug: Add debug metadata support for xe_eudebug

Mika Kuoppala (6):
  ptrace: export ptrace_may_access
  drm/xe/eudebug: Introduce eudebug support
  drm/xe/eudebug: Introduce discovery for resources
  drm/xe/eudebug: Add UFENCE events with acks
  drm/xe/eudebug: vm open/pread/pwrite
  drm/xe/eudebug: Implement vm_bind_op discovery

 drivers/gpu/drm/xe/Kconfig                   |   10 +
 drivers/gpu/drm/xe/Makefile                  |    4 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h     |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h         |   43 +
 drivers/gpu/drm/xe/tests/xe_eudebug.c        |  175 +
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c  |    5 +
 drivers/gpu/drm/xe/xe_debug_metadata.c       |  233 ++
 drivers/gpu/drm/xe/xe_debug_metadata.h       |   98 +
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
 drivers/gpu/drm/xe/xe_device.c               |   26 +-
 drivers/gpu/drm/xe/xe_device.h               |   36 +
 drivers/gpu/drm/xe/xe_device_types.h         |   47 +
 drivers/gpu/drm/xe/xe_eudebug.c              | 3891 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h              |   93 +
 drivers/gpu/drm/xe/xe_eudebug_types.h        |  328 ++
 drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
 drivers/gpu/drm/xe/xe_execlist.c             |    2 +-
 drivers/gpu/drm/xe/xe_gt_debug.c             |  148 +
 drivers/gpu/drm/xe/xe_gt_debug.h             |   27 +
 drivers/gpu/drm/xe/xe_hw_engine.c            |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
 drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |   45 +-
 drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h           |   28 +-
 drivers/gpu/drm/xe/xe_vm.c                   |  173 +-
 drivers/gpu/drm/xe/xe_vm.h                   |    3 +
 drivers/gpu/drm/xe/xe_vm_types.h             |   40 +
 drivers/gpu/drm/xe/xe_wa_oob.rules           |    2 +
 include/uapi/drm/xe_drm.h                    |   96 +-
 include/uapi/drm/xe_drm_eudebug.h            |  225 +
 kernel/ptrace.c                              |    1 +
 38 files changed, 5887 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.c
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata.h
 create mode 100644 drivers/gpu/drm/xe/xe_debug_metadata_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

-- 
2.34.1

