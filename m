Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F53C41513
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 16:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822210ED5D;
	Fri, 12 Jul 2024 16:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWLYSV6Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D235510ED59
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720802858; x=1752338858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jt3Vhecgspbm6/pS/En5aM8YfP0m2zxecINUX51S1Mc=;
 b=XWLYSV6Q3lD6+vi9XY9y4hEiFD3k7HaXSS+AV1FUIc8y7ikjHUmsNGKu
 DjpMApLBXBmORVx/Km4ii0rU6/D0FZpWecVX/JkMIb7Jw5LxUYJbM38uY
 nBJIHMHDnVq+pQe2rdnt7+ySZctALGuPVfJzccNltGktBrFoD4aONQ0Fb
 pHChIrHt/gNygsxUqiZA3Ix/1ffuzdhw0B6+Lo8t9Hg6y3KcqNrHYwOqO
 B04gaoM7AtQpk3LYg4U0bu41eWkEUvafovXZxNpBF9iG0zfpf7qvfkFz4
 K2MD9lpF4CShultrczsBZbPWaD61eVWY0RfmM1aDRF+JPm6A8ldjVIIyf w==;
X-CSE-ConnectionGUID: b8wZDczPReSseqpP7UwYKQ==
X-CSE-MsgGUID: PzHYevPASPOxJvo9xOI8Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18382500"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18382500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 09:47:27 -0700
X-CSE-ConnectionGUID: CwWHsrN1Q2Gck5KJpkSPFA==
X-CSE-MsgGUID: v53NcQ9pQWG4eNDCmp0F5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="72162009"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2024 09:47:26 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v12 0/5] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Fri, 12 Jul 2024 09:47:19 -0700
Message-Id: <20240712164724.677393-1-zhanjun.dong@intel.com>
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

Port GuC based register capture for error capture from i915 to Xe.

There are 3 parts inside:
. Prepare for capture registers
    There is a bo create at guc ads init time, that is very early
    and engi  ne map is not ready, make it hard to calculate the
    capture buffer size, new function created for worst case size
    caluation. Other than that, this part basically follows the i915
    design.
. Process capture notification message
    Basically follows i915 design
. Sysfs command process.
    Xe switched to devcoredump, adopted command line process with
    captured node list.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Changes from prior revs:
 v12:-  Rewrite guc log size init from runtime to compile time implementation.
        Change log buffer flush to file from structure bitfield to genmask.
        Change the capture log data copy from u32 copy to size copy
        There are 3 types of engine class refrenced in this series, hw engine
        class, GuC class and GuC capture class, update function parameter type
        to enum for easy to read.
        Update macro names to follow GuC interface specification.
 v11:-  Fixed a bug of missing captured check on register snapshot pre-capture
        Fixed kernel-doc warnings
 v10:-  Resync with updated job timed out follow
        Add pre-capture by read from hw engine if GuC capture data is not
        ready, the pre-captured data will be refereshed if GuC capture is
        ready at later time.
        Add xe_guc_capture_is_ready_for to check if GuC capture is ready
        for a job.
        Re-orgnize some header files to xe abi folder
        Reduce some meesage level from warn/info to debug
        Remove duplicated enum of GuC log type.
  v9:-  Merged snapshot register list into capture register lists
        Optimized devcoredump timing to take snapshot after guc reset
        Add global and engine class registers into capture list
        Fixed bug of incorrect matching guc class id with guc capture class id
  v8:-  Reorgnize the order of patches
        Change the capture size check from worst min size to worst size
        Replace the kernel alloc with drm managed alloc
        Replace the memcpy with xe_map_memcpy_from
        Free GuC capture outlist as part of xe_devcoredump_free
  v7:-  Kconfig CONFIG_DRM_XE_CAPTURE_ERROR removed
  v6:-  Change hardcoded register snapshot fill to follow mapping tables
        When capture is empty, take snapshot from engine
  v5:-  Split dss helper code out as an standalone patch
        Remove old platform registers definition.
        Split register map table to 32 and 64bit each
  v4:-  Move register map table to xe_hw_engine.c
  v3:-  Remove condition compilation in code
  v2:-  Split into multiple chunks

Zhanjun Dong (5):
  drm/xe/guc: Prepare GuC register list and update ADS size for error
    capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Makefile                   |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |    8 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h      |  144 ++
 .../drm/xe/abi/guc_communication_mmio_abi.h   |   23 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h          |   54 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c           |   15 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |    2 +
 drivers/gpu/drm/xe/xe_guc.c                   |    5 +
 drivers/gpu/drm/xe/xe_guc.h                   |   29 +
 drivers/gpu/drm/xe/xe_guc_ads.c               |  151 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h         |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c           | 1655 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h           |   43 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h     |   59 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   26 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |  141 +-
 drivers/gpu/drm/xe/xe_guc_log.h               |   12 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h         |   17 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |   86 +-
 drivers/gpu/drm/xe/xe_guc_submit.h            |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h             |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  240 ++-
 drivers/gpu/drm/xe/xe_hw_engine.h             |    2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  176 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |    1 +
 27 files changed, 2697 insertions(+), 203 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

