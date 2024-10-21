Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6391AD0E6D8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 09:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A8910E471;
	Mon, 21 Oct 2024 09:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khwSmaiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14A010E471
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729504747; x=1761040747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oVYGg0QnwQwzHQ0ZTeNBW9xVmKBIpPrW3R7Q6zm2Jrw=;
 b=khwSmaiq7W0j9E39/0YEiHM7U3xVIyiP5UEAQSh8Z5Ue6cn4WHT8DlcE
 LUldqVsxUqWT1UYJfw5QIX8VRT8g2dBUou/F4lPdrXwqv6rUEQ0eC0jcg
 Qf7Op0gJZLugI8+CT4AKPYy8AekLLstCD3LftudJbE9k8PlmoAvXjGj5w
 g71sXVHobLT972P7S6CXGervcrPucofe8RpOq/hEann7TWVXQwFr0GqwR
 esCOD0TtEZTIrENkmX9FTarGF54Hk67Tz+HgCyUgAawJV4Beug39cD23P
 rQj/o+FMh6ri01U3nfZCU57qeU/6FtRg3fNUns2axFPCB9+2P5XtHl7sS w==;
X-CSE-ConnectionGUID: nK+WbtR5TCenoLvdnE/tCw==
X-CSE-MsgGUID: bViCfGMbQcG1MeSl+dt1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40350724"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40350724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:07 -0700
X-CSE-ConnectionGUID: c43Fu3dcSWK425IVBuCZDQ==
X-CSE-MsgGUID: zMOHoozOS52enNkARqgl7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84545977"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.221])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:59:03 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
Subject: [RFC 00/19] Support EU online debug on pagefault
Date: Mon, 21 Oct 2024 12:58:39 +0300
Message-ID: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
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

This RFC patch adds a KMD implementation to debug scenarios where
an EU thread causes a pagefault based on GPU Debug support [1].

Fixes code that uses force_wake_[get/put] to work on the latest xe-next,
as the previous version patch[1] does not use
"Fix xe_force_wake_get() failure handling" [2].

[1] https://patchwork.freedesktop.org/series/136572/#rev2
[2] https://patchwork.freedesktop.org/series/137982/

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

Gwan-gyeong Mun (1):
  drm/xe/eudebug: Support EU online debug on pagefault

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
 drivers/gpu/drm/xe/xe_debug_metadata.c       |  233 +
 drivers/gpu/drm/xe/xe_debug_metadata.h       |   98 +
 drivers/gpu/drm/xe/xe_debug_metadata_types.h |   28 +
 drivers/gpu/drm/xe/xe_device.c               |   26 +-
 drivers/gpu/drm/xe/xe_device.h               |   36 +
 drivers/gpu/drm/xe/xe_device_types.h         |   47 +
 drivers/gpu/drm/xe/xe_eudebug.c              | 4147 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h              |  110 +
 drivers/gpu/drm/xe/xe_eudebug_types.h        |  394 ++
 drivers/gpu/drm/xe/xe_exec.c                 |    2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |   56 +-
 drivers/gpu/drm/xe/xe_exec_queue.h           |    2 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |    7 +
 drivers/gpu/drm/xe/xe_execlist.c             |    2 +-
 drivers/gpu/drm/xe/xe_force_wake.c           |    1 -
 drivers/gpu/drm/xe/xe_gt_debug.c             |  199 +
 drivers/gpu/drm/xe/xe_gt_debug.h             |   40 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  281 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            |    1 +
 drivers/gpu/drm/xe/xe_lrc.c                  |   16 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |    4 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |   21 +-
 drivers/gpu/drm/xe/xe_reg_sr.h               |    4 +-
 drivers/gpu/drm/xe/xe_rtp.c                  |    2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |   43 +-
 drivers/gpu/drm/xe/xe_sync.h                 |    8 +-
 drivers/gpu/drm/xe/xe_sync_types.h           |   28 +-
 drivers/gpu/drm/xe/xe_vm.c                   |  194 +-
 drivers/gpu/drm/xe/xe_vm.h                   |    5 +
 drivers/gpu/drm/xe/xe_vm_types.h             |   40 +
 drivers/gpu/drm/xe/xe_wa_oob.rules           |    2 +
 include/uapi/drm/xe_drm.h                    |   96 +-
 include/uapi/drm/xe_drm_eudebug.h            |  237 +
 kernel/ptrace.c                              |    1 +
 40 files changed, 6597 insertions(+), 58 deletions(-)
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
2.46.1

