Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E1FC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 20:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD4810F7D0;
	Thu,  2 May 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ec/PPHT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A481710F7D0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714683461; x=1746219461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OB2ivZudTF2ol28p5ZybMoAOHR/cbDfRjKogQJsyNLs=;
 b=ec/PPHT+gkkfkNDawTHNr8Q3eBL+LiKtnYgp6k2LJgpBccwL7A12GAqj
 XivHdFvDItRT6sK5pvZK6by8bbflswq7QZZg4X2ftClXMx+DiSo0uyl7K
 lY6GM4YKAP1vKyBaicD8QXmalE2ZH+jS237ylkW/r3qcH6xQqQq8gN2jH
 vhuDywU1bXtF354fyt/sCZDdFH/rv0so9+mBx1YE+GHaFfrbbTefkxH5J
 psohpBWUuiAN9CDw50JRM/2HxrGLYtW9vKJXUH4flWixsOYlI4G/w9K/Z
 8Cf7EOxpaAgCT7H9qV+KF0gd177a/z1b+2t6vleZ2mn78BttXAxEImdU8 g==;
X-CSE-ConnectionGUID: 93aEGpA2Q5+xZKuR+MhYdg==
X-CSE-MsgGUID: DS54BUdlRii1WIN0uldbgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10696525"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10696525"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 13:57:41 -0700
X-CSE-ConnectionGUID: xRevdaHgSJKulMQrH1oCjg==
X-CSE-MsgGUID: 1uhhmZQKSSG3QAfMt4Q6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27218890"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 02 May 2024 13:57:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v8 0/5] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Thu,  2 May 2024 13:57:33 -0700
Message-Id: <20240502205738.863369-1-zhanjun.dong@intel.com>
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
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Pre-allocate output nodes for extraction
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Plumb GuC-capture into dev coredump

 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
 drivers/gpu/drm/xe/xe_devcoredump.c      |    2 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_guc.c              |    5 +
 drivers/gpu/drm/xe/xe_guc.h              |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  208 +++-
 drivers/gpu/drm/xe/xe_guc_ads.h          |    3 +
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1223 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   20 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   70 ++
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 ++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   24 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   54 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  249 +++--
 drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  150 ++-
 drivers/gpu/drm/xe/xe_sched_job.c        |    7 +-
 24 files changed, 2308 insertions(+), 150 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

