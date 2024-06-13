Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD9CC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 09:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282B10E0B4;
	Thu, 13 Jun 2024 09:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIX/L+CB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407210E0B4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718272313; x=1749808313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRxmjufamlatTgfV0uvB+yUbFVcnVwomAMLHCuvufRk=;
 b=kIX/L+CBGadabhKP+aAImuWF/htbqkt9oX4awPLnIzlfnRi5U86WPypJ
 A2wFMdNpUGW6uTkJzZ6VkQ93bsqI0JVEpwCar67+9d6xcm1vfxupRWYNo
 W1i9KpYvWNrusolyMtl0LLkzXmtdWUORqb+r3T90C6pDp3CyCa+A5ezhR
 ff3LJC5NYB2d99AMfnC+vm+gaVwuDVOnJyYOPcqN7Wn2L59ZiuGxN7Mpy
 dkTSsILYyLGhj48L5R4iXWXBdX75Bdfu3kU0ynrFo2/VE6dikpMLBY5P7
 9kWTK/+1X4HJqbpPfCqVxtsly51V8djc8gddZUItIL5fADIebQlEyTWUm A==;
X-CSE-ConnectionGUID: 6qHeaThGS7e58HoKJHucDw==
X-CSE-MsgGUID: n7aaM4ELTh+0k9RKPYCavQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14804657"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14804657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:51:52 -0700
X-CSE-ConnectionGUID: tTAPhd1hRXatbp2gBm/LSg==
X-CSE-MsgGUID: F40boWEOQQuKPzkIKt6yDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40205812"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:51:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 umesh.nerlige.ramappa@intel.com, krishnaiah.bommu@intel.com
Subject: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
Date: Thu, 13 Jun 2024 15:34:09 +0530
Message-Id: <20240613100411.1579218-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

There are a set of engine group busyness counters provided by HW which are
perfect fit to be exposed via PMU perf events.

BSPEC: 46559, 46560, 46722, 46729, 52071, 71028

events can be listed using:
perf list
  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
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

v9:
1. replace drmm_add_action_or_reset with devm
2. add doc to xe_gt_clock_cycles_to_ns
 
v8:
1. rebase
2. drop interrupt pmu event 

v7:
1. update UAPI documentation
2. drop MEDIA_GT specific change for media busyness counter.

v6:
1. drop engine_busyness_sample_type
2. update UAPI documentation

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

Aravind Iddamsetty (2):
  drm/xe: Get GT clock to nanosecs
  drm/xe/pmu: Enable PMU interface

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_gt.c           |   2 +
 drivers/gpu/drm/xe/xe_gt_clock.c     |  13 +
 drivers/gpu/drm/xe/xe_gt_clock.h     |   2 +-
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 631 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  67 +++
 include/uapi/drm/xe_drm.h            |  39 ++
 12 files changed, 797 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.40.0

