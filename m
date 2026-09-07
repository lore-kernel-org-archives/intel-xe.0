Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAECC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BBD10E45C;
	Mon,  7 Sep 2026 06:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiVoZRiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919610E45C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788763634; x=1820299634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HBFwrx3pIpb4BGGtsv31ONfhl/xhtGGm9aDjAwpRVK0=;
 b=EiVoZRiQEoA+XTwKYeUOrtCKqdi5MC1aHiwOWozkGkv6cdNq22XkPBDK
 awf9OyH7PdJOTBfwP4RFlO4H6WMiKyouwEiO3LE86L7AJejYLDmI0pLhg
 KlBM2E2DXvialVJVwWhGltIXysFbujc9tVmI6i0TIFBdk/Kz8Kw/QJ4yn
 tzjjfPGYehWwoYWgaCzo5+c4kCYrKLMNr694cIXUZYZaApbt1Yz8G/h2Q
 EDy2FhuqE1gveF6/+xaKakdHwIGebExN/o1p0pfB9bu7c6k/giyv6hAYR
 2aOSAQr9gG+fibeWL08iUi57McrFYpEA+fCiuxiTDNi21wYI5EP3J5rM1 A==;
X-CSE-ConnectionGUID: bk8CUq5FTBSLzLl9olm6UA==
X-CSE-MsgGUID: f671s3CKRLiWEkQrQnI5FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76717856"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="76717856"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:47:13 -0700
X-CSE-ConnectionGUID: 0redEG7JSxSo/gtHbe2kuw==
X-CSE-MsgGUID: sDl9ho8HS4Se3Sfnzh20EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264434131"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 23:47:12 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 0/4] RFC: drm/xe: Dynamic Xe Memory Monitor
Date: Mon,  7 Sep 2026 11:37:33 +0530
Message-Id: <20260907060737.3636824-1-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introduce xe_mem_monitor, a periodic worker that samples
xe->global_total_pages (the same counter that feeds the
gpu_mem/gpu_mem_total tracepoint) and tracks GPU memory growth using an
exponential moving average (EMA) over per-interval deltas:

    delta(t) = max(0, mem(t) - mem(t-1))
    EMA(t)   = alpha * delta(t) + (1 - alpha) * EMA(t-1)

    where alpha = 0.8, applied to every real sample
    regardless of mode.

A single alpha and a single polling cadence (mem_monitor_poll_ms)
are used in both LATENCY and HIGH_THROUGHPUT mode, once
HIGH_THROUGHPUT mode is entered there is little benefit to re-checking
any faster, since mem_monitor_debounce_count consecutive
below-threshold samples are already required before switching back,
which itself provides the desired minimum dwell time
(debounce_count * poll_ms) at this single cadence.

When the EMA of growth exceeds a threshold, xe->gpu_mem_mode is switched
from XE_GPU_MEM_MODE_LATENCY to XE_GPU_MEM_MODE_HIGH_THROUGHPUT, and
back once mem_monitor_debounce_count consecutive below-threshold
samples are seen.

xe->gpu_mem_mode is intended to be read by the TTM page allocation path
to trade allocation latency for throughput during GPU memory growth
bursts; the GFP flag adjustment itself is added in a follow-up change.

For power, the worker sleeps after mem_monitor_idle_timeout_ms of no
significant activity in LATENCY mode. The worker is re-armed on
activity.

The worker is suspended/resumed across system and runtime PM
transitions with notify_activity() also disabled while suspended.

All tuning is exposed as module parameters (mem_monitor_*) under
/sys/module/xe/parameters/. Defaults:

    mem_monitor_enabled                    false
    mem_monitor_growth_threshold_mb          250
    mem_monitor_poll_ms                     2000
    mem_monitor_debounce_count                 5
    mem_monitor_idle_timeout_ms            10000

S Sebinraj (3):
  RFC: ANDROID: drm/xe: add adaptive GPU memory growth monitor
    xe_mem_monitor
  RFC: ANDROID: drm/xe: register ttm page alloc vendor hooks internally
  RFC: ANDROID: drm/xe: Gate mem_monitor wake ups on order 9 external
    fragmentation

Ryan Neph (1):
  RFC: ANDROID: drm/xe: provide safe mem_monitor enable toggle via
    debugfs

 drivers/gpu/drm/BUILD.bazel              |   4 +
 drivers/gpu/drm/defconfig_xe             |   1 +
 drivers/gpu/drm/xe/Kconfig               |  14 +
 drivers/gpu/drm/xe/xe_bo.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c           |  12 +
 drivers/gpu/drm/xe/xe_device_types.h     |  13 +
 drivers/gpu/drm/xe/xe_mem_monitor.c      | 727 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mem_monitor.h      |  95 +++
 drivers/gpu/drm/xe/xe_module.c           |  78 +++
 drivers/gpu/drm/xe/xe_module.h           |  15 +
 drivers/gpu/drm/xe/xe_pm.c               |   5 +
 drivers/gpu/drm/xe/xe_trace.h            |  16 +
 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c | 135 +++++
 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h |   9 +
 14 files changed, 1127 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_mem_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_mem_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_vendor_hooks.h

-- 
2.34.1

