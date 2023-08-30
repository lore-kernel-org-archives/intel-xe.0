Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B63DC83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 05:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDD10E4B6;
	Wed, 30 Aug 2023 05:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978A910E4B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 05:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693372058; x=1724908058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g1FyPd7RV3HpktKh07XbklPJ9weyY4hDBWFNihPKurk=;
 b=I6odMthOhlh1haEnOlZGHRRHbgmYADVQigCTfgokoi6hFnCTN79Ct+Xy
 lIlfMPceL8clRuVdOs5yGaw1K3y1X9fii7qYiB0wm7fHyMV6hOiDA8iIw
 AsT8gQ9AqnN/Q7fMMVv30JwWXaPXwFxa8LI4zBxPJIdhxaVRBkz372C6c
 JkCyGP+Tj3uPsKqCihEM2z/Rgbz7RryCnLzXcmqW4Rp96AogONfXNnjai
 DJMicDMpeV1yULZe/RLEJkuew4DVioqhRhOKLncCb/+GfOtBtBst0Ei56
 XgLMIHWRpXlCZdLd+/bPFnFDC+EPiKpfMSjkWYMYmzZzMTnwkImH7ede7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441911737"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="441911737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 22:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="738969764"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="738969764"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 22:07:36 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 10:45:41 +0530
Message-Id: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/3] drm/xe/pmu: Enable PMU interface
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

There are a set of engine group busyness counters provided by HW which are
perfect fit to be exposed via PMU perf events.

BSPEC: 46559, 46560, 46722, 46729, 52071, 71028

events can be listed using:
perf list
  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]

and can be read using:

perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
           time             counts unit events
     1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
     9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
    10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
    10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/

The pmu base implementation is taken from i915.

v5:
1. Use spinlock in forcewake instead of mutex
2. take forcewake when accessing the OAG registers

v4: minor nits.

v3:
1. drop init_samples, as storing counters before going to suspend should
be sufficient.
2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
dropped helpers to store and read samples.
3. use xe_device_mem_access_get_if_ongoing to check if device is active
before reading the OA registers.
4. dropped format attr as no longer needed
5. introduce xe_pmu_suspend to call engine_group_busyness_store
6. few other nits.

v2:
Store last known value when device is awake return that while the GT is
suspended and then update the driver copy when read during awake.

Aravind Iddamsetty (3):
  drm/xe: Get GT clock to nanosecs
  drm/xe: Use spinlock in forcewake instead of mutex
  drm/xe/pmu: Enable PMU interface

 drivers/gpu/drm/xe/Makefile              |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   5 +
 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   4 +
 drivers/gpu/drm/xe/xe_force_wake.c       |  14 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h |   2 +-
 drivers/gpu/drm/xe/xe_gt.c               |   2 +
 drivers/gpu/drm/xe/xe_gt_clock.c         |   5 +
 drivers/gpu/drm/xe/xe_gt_clock.h         |   4 +-
 drivers/gpu/drm/xe/xe_irq.c              |  18 +
 drivers/gpu/drm/xe/xe_module.c           |   5 +
 drivers/gpu/drm/xe/xe_pmu.c              | 679 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h              |  25 +
 drivers/gpu/drm/xe/xe_pmu_types.h        |  76 +++
 include/uapi/drm/xe_drm.h                |  16 +
 15 files changed, 850 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.25.1

