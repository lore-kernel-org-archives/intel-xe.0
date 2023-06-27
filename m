Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1CBEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 12:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E510E175;
	Tue, 27 Jun 2023 12:17:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2DA10E175
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687868254; x=1719404254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l5Yk5Rn7Zb7YdZcXB0BDLNgY7c9l4y9kMIFXe8gJyYY=;
 b=BHmuyasYSenafleb27pBH/QnqXwzNBu8d0GXzSoQK8d761oHV8GDp+lT
 qnMY/ay6MAAE4Z+YqvwbMRVn0ex1pkHdcULQAG1w/ZHJ0x+UK/IegqieA
 2qiw3udoKZ5FQXNyc++G2xFR5eKubyJ2iioTtPimIa5DK+QlhRG8ugF7M
 z/kFnCfZN16hv4wR2HiVgpWh2ENDgjIaztcGzJ3xzUEDFtRKt2bEk7LMN
 /t6p9FEQFeiKgObyMSR6z5cZGWQYG+sqHaMzoTGfF67yj/oVkO4e3O4cA
 OBDR99T4ZZx014wGOCvhGIpyOdBjaxMFr/+y50VSLllLsQRdx/Lv1jpfr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341144793"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="341144793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 05:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746179414"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746179414"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 05:17:31 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:51:11 +0530
Message-Id: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are a set of engine group busyness counters provided by HW which are
perfect fit to be exposed via PMU perf events.

BSPEC: 46559, 46560, 46722, 46729

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

v2:
Store last known value when device is awake return that while the GT is
suspended and then update the driver copy when read during awake.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

Aravind Iddamsetty (2):
  drm/xe: Get GT clock to nanosecs
  drm/xe/pmu: Enable PMU interface

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   2 +
 drivers/gpu/drm/xe/xe_gt_clock.c     |  10 +
 drivers/gpu/drm/xe/xe_gt_clock.h     |   4 +-
 drivers/gpu/drm/xe/xe_irq.c          |  22 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  25 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
 include/uapi/drm/xe_drm.h            |  16 +
 13 files changed, 915 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.25.1

