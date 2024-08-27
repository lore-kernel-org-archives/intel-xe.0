Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747AC54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 21:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CCF10E064;
	Tue, 27 Aug 2024 21:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsCv2tEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748B10E064
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724795249; x=1756331249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wQ0jmxejgPRjelSp5KLfVdSjnAPAG5Q4XIs9L87d3do=;
 b=dsCv2tEaX7TcK0pimlbcvxFd9HVJUoZuTgKVov3gSpjVBN2cAXbkMHPJ
 u1JPbqHvxSTwan4IwneOP/RIVh/ilUwAaNpvKku+trEAxQ4CdiNlNphr7
 oStBpYTN1Iif7OH0l4/i55mYj+Dosnllhixaa5JsWMW8iU/aMLR1XqAHa
 kzc+/nA/nTCIof1G66LD6b/pD9m+q8v9Ij/qwewRP8qoQ06NP57V91lha
 XR47ZnZuTP6n1ffmd7fDL7CyOs72xgygf6BPiSB/Jpg+xREzJKpcjFBpM
 ygSNzCAC4Wve7YlT8DQ+b5yktsBB1y/nAvjvmiolZbXcczrZ53BeznubL g==;
X-CSE-ConnectionGUID: 5Q5xeZFDR+6a4/7/+zj1wg==
X-CSE-MsgGUID: 83oRYv3bTiCD4TB0qvwLRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48683907"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="48683907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 14:47:28 -0700
X-CSE-ConnectionGUID: D1k+bPJGQ5G99pwkAPdTnw==
X-CSE-MsgGUID: sFfon7M1Rvaj5lQqZ1hv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62733173"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 14:47:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v17 0/7] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Tue, 27 Aug 2024 14:47:19 -0700
Message-Id: <20240827214726.1183935-1-zhanjun.dong@intel.com>
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

Changes from prior revs:
 v17:-  Update steering register condition check to check if current gt has
        rcs/ccs engine.
        Add additional null check
        Rollback patch #3, take back RB
 v16:-  Switch to single list of capture register define, remove MMIO registers
        from snapshot structure.
        Seperate register capture list for legacy GPUs
        Rewrite 64bit register support method, add field to indicate hi/low
        dword of 64 bit or a single 32 bit register
        Update the wrost size calculation method
 v15:-  Optimized guc log size code, remove the unnecessary init structure.
        Fix a rebase line number alignment error
 v14:-  Fixed ring buffer wrap around offset issue
 v13:-  Move guc_mmio_reg structure define to guc_capture_abi.h
        Remove duplicated crash/debug/capture unit check
        Remove unnecessary guc_capture_data_extracted
        Update u32 align check in guc_capture_log_remove_bytes
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

Zhanjun Dong (7):
  drm/xe/guc: Prepare GuC register list and update ADS size for error
    capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Move xe_lrc_snapshot to header file
  drm/xe/guc: Add dss conversion from group/instance ID
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |    8 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h  |  186 +++
 drivers/gpu/drm/xe/abi/guc_log_abi.h      |   75 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |   16 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |    2 +
 drivers/gpu/drm/xe/xe_gt_mcr.c            |   13 +
 drivers/gpu/drm/xe/xe_gt_mcr.h            |    1 +
 drivers/gpu/drm/xe/xe_guc.c               |    5 +
 drivers/gpu/drm/xe/xe_guc.h               |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c           |  153 +-
 drivers/gpu/drm/xe/xe_guc_ads_types.h     |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 1846 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h       |   76 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   70 +
 drivers/gpu/drm/xe/xe_guc_ct.c            |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h          |   26 +-
 drivers/gpu/drm/xe/xe_guc_log.c           |  101 ++
 drivers/gpu/drm/xe/xe_guc_log.h           |   10 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h     |    7 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   82 +-
 drivers/gpu/drm/xe/xe_guc_submit.h        |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         |  273 +--
 drivers/gpu/drm/xe/xe_hw_engine.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |   66 +-
 drivers/gpu/drm/xe/xe_lrc.c               |   18 -
 drivers/gpu/drm/xe/xe_lrc.h               |    1 +
 drivers/gpu/drm/xe/xe_lrc_types.h         |   18 +-
 30 files changed, 2719 insertions(+), 352 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

