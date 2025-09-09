Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE34CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 15:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520610E262;
	Tue,  9 Sep 2025 15:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEbcyNVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02B10E71F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757430302; x=1788966302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lNV48hUVEifIHhhStYzZgNb1WNQlPHF+5ZwyYeoZTbk=;
 b=BEbcyNVHvEk09bvGfVVbZmJ0Rr/HiIUME2SSCwRNlDy9c3g5USu8LJKm
 8sTI/47NfzI3L2BXkz2CECuBoVOnHuEDFWfLIO0zNhAKCQNKOmnILJUlt
 R698ljq79LkC98if5a6q4C8pI7KhxXMIVs/6dsWsoQW33wQzODkJO527h
 bAb0gLvBllfRBwtAJ5I0M/aUdXYg3kiWWBaE7/x3rcTsXN7clRQwOMR8b
 OrxItt82V0MkxmIjvDZt+dzAjpe9VBVLQeWbD7CyOB5XaTMqZ8t2wNpqJ
 lGSwS96qxdzL5XITGbljgBIGdnw+LTD93L21YYiM5DK/+LfumWA3XgHdI g==;
X-CSE-ConnectionGUID: wQDPiQJcRam4C7eQzmeAQg==
X-CSE-MsgGUID: RLhkwdcKQAOMGH3evDriBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63354356"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63354356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:02 -0700
X-CSE-ConnectionGUID: 62/hTxqFSfWVIWQS8YDb0A==
X-CSE-MsgGUID: 5qCzI+5yS5iYDPvbPBko5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203881473"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 08:05:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, michal.mrozek@intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC 0/2] Add tracepoints to profile SVM page faults and migration
Date: Tue,  9 Sep 2025 17:03:35 +0200
Message-ID: <20250909150437.986365-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xe already provides various tracepoints thanks to the infrastructure in
xe_trace. Add a few more new tracepoints specifically to debug and profile
SVM page faults and migration. This can be useful when developing with SVM
in KMD, in UMD, or in applications. Those are standard tracepoints which
can be used with standard usespace tools such as bpftrace:

    $ sudo bpftrace -e 'tracepoint:xe:xe_migrate_vram { printf("Migrating 0x%lx bytes at %llx\n", args->len, args->vram_addr); }'
    Attaching 1 probe...
    Migrating 0x200000 bytes at 2fae00000
    Migrating 0x200000 bytes at 2fae00000
    Migrating 0x200000 bytes at 2fac00000

Another way without bpftrace is to enable them manually:

    $ echo 1 | sudo tee /sys/kernel/tracing/events/xe/xe_handle_svm_pagefault/enable
    $ echo 1 | sudo tee /sys/kernel/tracing/events/xe/xe_handle_vma_pagefault/enable
    $ echo 1 | sudo tee /sys/kernel/tracing/events/xe/xe_migrate_vram/enable
    $ echo 1 | sudo tee /sys/kernel/tracing/tracing_on

After this, run the workload, then the trace is visible in
/sys/kernel/tracing/trace:

# tracer: nop
#
# entries-in-buffer/entries-written: 202/202   #P:16
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
 xe_exec_system_-1375    [002] .....   120.736639: tracing_mark_write: xe_exec_system_allocator: executing
 xe_exec_system_-1375    [003] .....   122.588912: tracing_mark_write: xe_exec_system_allocator: starting subtest compute-basic
   kworker/u65:0-674     [012] .....   122.632024: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=100000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.633158: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=83e0000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.633956: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=83e0000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.633982: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=83e0000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   ...
   kworker/u65:0-674     [012] .....   122.636255: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=63d0000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.636263: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f0611000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.638854: xe_migrate_vram: dev=0000:00:08.0 len=200000 vram_addr=2fae00000 dir=TO_VRAM
   kworker/u65:0-674     [012] .....   122.641581: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f0611000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.641593: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f0612000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.641600: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f0612000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   ...
   kworker/u65:0-674     [012] .....   122.645512: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f020f000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.645520: xe_handle_svm_pagefault: dev=0000:00:08.0 addr=7f03f0245000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
   kworker/u65:0-674     [012] .....   122.645648: xe_handle_vma_pagefault: dev=0000:00:08.0 addr=10000 fault_type=0 access_type=0 fault_level=0 engine_class=0 rcs engine_instance=0
 xe_exec_system_-1375    [003] .....   122.646985: xe_migrate_vram: dev=0000:00:08.0 len=200000 vram_addr=2fae00000 dir=TO_SRAM
 xe_exec_system_-1375    [003] .....   122.649282: xe_migrate_vram: dev=0000:00:08.0 len=200000 vram_addr=2fac00000 dir=TO_SRAM
 xe_exec_system_-1375    [003] .....   122.667223: tracing_mark_write: xe_exec_system_allocator: finished subtest compute-basic, SUCCESS


Francois Dugast (2):
  drm/xe/migrate: Add tracepoint during VRAM copy
  drm/xe/gt_pagefault: Add tracepoints when handing page faults

 drivers/gpu/drm/xe/xe_gt_pagefault.c       | 22 ++-----
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h | 25 ++++++++
 drivers/gpu/drm/xe/xe_migrate.c            |  9 ++-
 drivers/gpu/drm/xe/xe_migrate_types.h      | 14 +++++
 drivers/gpu/drm/xe/xe_trace.h              | 72 ++++++++++++++++++++++
 5 files changed, 121 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_migrate_types.h

-- 
2.43.0

