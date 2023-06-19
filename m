Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAB2EB64DB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3010E18F;
	Mon, 19 Jun 2023 04:48:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ABB10E09C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 04:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687150088; x=1718686088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3bC+AjGbk8BcYodofphFtEcDnIt6qqYmmmLfPCTqKz0=;
 b=KSuo2bgZW8iv7QrLP4suFVLLKM1Ig7/eAzLeBBD9U1w+61YNtlpZTcvZ
 HwjtxyeA5gVSAJF4UwF7XNCOIjCoxG5MuovS8sMyt4EpBAAhaIccMLqgy
 Az4PcUCwZtv1iv54Bw6wPHg3cduKHqpXDxNcUc3Aip6DgpMgjDY77yXRA
 zNiS9hXSGmt/4GXrKtvrZUZeMcugk+8/vYTsbIR8jTIk/W4cnT1sFWovj
 KjVg//KzQMlSbshtTAo4WZ/AlOZJhetaSQTAPSBnOzyOhjyxSycI1PPyU
 xE4+M21gD3A0Ee/eTi4Qe5GJ1NElmGvYenKamhPDEcxElkQytny9QUKun Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349260730"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="349260730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713541752"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="713541752"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:05 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 10:21:26 +0530
Message-Id: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe/pmu: Enable PMU interface
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
perf stat -a -e "xe_0000_03_00.0/render-group-busy-gt0/" -I 1000
           time             counts unit events
     1.001343319                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     2.011523336                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     3.014168811                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     4.016671838                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     5.018363448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     6.020125417 18446743376875220992 ns xe_0000_03_00.0/render-group-busy-gt0/
     7.021584533 18446744073708230656 ns xe_0000_03_00.0/render-group-busy-gt0/
     8.029878236       696835650983 ns xe_0000_03_00.0/render-group-busy-gt0/
     9.032367313                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
    10.034799448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/

The pmu base implementation is taken from i915.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

Aravind Iddamsetty (2):
  drm/xe: Get GT clock to nanosecs
  drm/xe/pmu: Enable PMU interface

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt_clock.c     |  10 +
 drivers/gpu/drm/xe/xe_gt_clock.h     |   4 +-
 drivers/gpu/drm/xe/xe_irq.c          |  22 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 634 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  22 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  54 +++
 include/uapi/drm/xe_drm.h            |  16 +
 12 files changed, 778 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.25.1

