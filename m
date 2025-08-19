Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F6CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9710E125;
	Tue, 19 Aug 2025 06:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibZ/+MSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61AA10E125
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585541; x=1787121541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yaWnEOBo3m8jXxIYbP/E8iE9PhHrRlkTa10T1CKzZHI=;
 b=ibZ/+MSmNgc9H2wVyhT9IOx+yybgX17Hro5AvBIcROET4l9vNFJ7o7M8
 2FI4AH18cCPCnFiRqJr5YtDs+4pv85OPFZRn3uQiCyj0cUjwNEG2OUZV3
 SZWEf71zjSS5iEDk+Wc603ha7JByi2JpTgGpia1nyjDQSaS3txrphmyKg
 fU4ODOLvgpEg++bTnTVjoMsSzKg6c9ZYkUA2JuxtMRNiktxnpOLjqgvPk
 47i12504vIZkRoYUbS8vGLIy4P80cxI5QwqNT2vEhatZX/0JapWJpTvsD
 Pxq9We3xCOhJW+1+UYswKtLz7bFm0ykUTE1VvLkfP+FP0WNFfG8kKoJLQ A==;
X-CSE-ConnectionGUID: Xl4Je+6pT6WEVX4kKI5MgA==
X-CSE-MsgGUID: jTtev5mrQyul6wXHVA2DSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966954"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966954"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:01 -0700
X-CSE-ConnectionGUID: SNCRmojJTZqW7dsuw41OBQ==
X-CSE-MsgGUID: OzBsW/tZR7+LPq/nq9IFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009357"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:01 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 0/8] drm/xe: GPU frequency tracing support
Date: Tue, 19 Aug 2025 12:04:09 +0530
Message-Id: <20250819063417.918666-1-s.sebinraj@intel.com>
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

A periodic GPU frequency monitoring and tracing program for the
Xe driver. The implementation provides periodic sampling of
GPU frequency through the Linux ftrace infrastructure.

Key features:
- Periodic GPU frequency sampling with configurable intervals
- Immediate frequency change reporting via tracepoints
- Integration with Linux ftrace subsystem under 'power' events
- Per-GT (Graphics Technology) monitoring support
- Dedicated workqueue for non-blocking frequency sampling
- Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
- The monitoring interval can be configured at runtime via the sysfs
  (default 5sec).

The module parameter is:
/sys/module/xe/parameters/gpufreq_monitoring_interval_ms

The tracepoint is exposed at:
/sys/kernel/debug/tracing/events/power/gpu_frequency

Format: {unsigned int state, unsigned int gpu_id}
- state: GPU frequency in KHz
- gpu_id: GPU clock domain identifier

This enables userspace tools and system monitoring applications to track
GPU frequency changes for power management analysis, performance tuning,
and debugging purposes.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

S Sebinraj (8):
  drm/xe: Add Kconfig option for GPU frequency tracing
  drm/xe: Add module parameter for GPU frequency monitoring
  drm/xe: Add GPU frequency tracing tracepoint definition
  drm/xe: Add GPU frequency tracer interface
  drm/xe: Add basic GPU frequency tracer implementation
  drm/xe: Add GPU frequency tracer to build system
  drm/xe: Integrate GPU frequency tracer into device initialization
  drm/xe: Add core GPU frequency monitoring functionality

 drivers/gpu/drm/xe/Kconfig                  |  22 ++
 drivers/gpu/drm/xe/Makefile                 |   3 +
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   4 +
 drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 336 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 +++
 drivers/gpu/drm/xe/xe_module.c              |  12 +
 drivers/gpu/drm/xe/xe_module.h              |   3 +
 9 files changed, 463 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h

-- 
2.34.1

