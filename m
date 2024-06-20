Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51524C2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 16:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0593F10EACB;
	Thu, 20 Jun 2024 16:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpmDD5Hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23F810EAC9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718899695; x=1750435695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Es/jPDWjUdhnIM7gVkncF842+nNOz6jCdLxyraEs9LY=;
 b=lpmDD5Hf8DhlgiLWFThjsPzdBWOWk7+cq4qopCKdk52gYnor12vb9V5J
 K1ar1LshwWaC99DOlXvweiG0tYxZuXl4TfCTJq5ibyo414rlB9QbGmYvR
 s2QAer2y+6LytpwPmWjLM/HC59qsxzRewWOgfljiSYdSFqhhR0c2A910x
 Z9gpWUPYvfDoBZf6x3RpHYbBn+dArLjQ/+aI4acFqfWoJ9OFoEv80IdGH
 kXj0GNuMTx0jLktna39MEyu1BfjboO7T9wx5Wpl0pC74PiaOpvaRaqWLo
 yqVSZmnw7FmPJIiyA2LJMwJx9QL1FTiPcDvix13k0nm8/uWKd8KHJjkix A==;
X-CSE-ConnectionGUID: fDfflzhMQ/qep0pOPFj3QA==
X-CSE-MsgGUID: nF9xI3DER6+04Ipyj6gGxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15867176"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15867176"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:08:14 -0700
X-CSE-ConnectionGUID: Xgo4oCtcQjy89n10+yLWKw==
X-CSE-MsgGUID: 3o8KaVSYS4G9neNtn3SbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42098413"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa006.fm.intel.com with ESMTP; 20 Jun 2024 09:08:14 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v10 0/5] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Thu, 20 Jun 2024 09:08:06 -0700
Message-Id: <20240620160811.2774704-1-zhanjun.dong@intel.com>
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

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |    8 +
 drivers/gpu/drm/xe/abi/guc_capture_abi.h  |   78 +
 drivers/gpu/drm/xe/abi/guc_log_abi.h      |   59 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |   15 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |    2 +
 drivers/gpu/drm/xe/xe_guc.c               |    5 +
 drivers/gpu/drm/xe/xe_guc.h               |   28 +
 drivers/gpu/drm/xe/xe_guc_ads.c           |  157 ++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h     |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 1564 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h       |   56 +
 drivers/gpu/drm/xe/xe_guc_capture_types.h |  133 ++
 drivers/gpu/drm/xe/xe_guc_ct.c            |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h          |   32 +
 drivers/gpu/drm/xe/xe_guc_log.c           |  205 +++
 drivers/gpu/drm/xe/xe_guc_log.h           |   17 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h     |   18 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   82 +-
 drivers/gpu/drm/xe/xe_guc_submit.h        |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         |  242 +++-
 drivers/gpu/drm/xe/xe_hw_engine.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  173 ++-
 drivers/gpu/drm/xe/xe_lrc.h               |    1 +
 26 files changed, 2711 insertions(+), 177 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

