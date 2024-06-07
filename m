Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A040C27C54
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 00:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437A10E12B;
	Fri,  7 Jun 2024 00:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvtua2dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813F210E12B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 00:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717718853; x=1749254853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NOPQUVQwzoEWpH+6CeyJO2X8YR6b6XKU8Ay3Vr3VJmQ=;
 b=cvtua2dpHbBrBRe6Z+r96cpzdpmdxGBmiuyiPkdH94AR6bbtCwX/EEr5
 3dWD0lGgT9Yxh8o/Vh0f+7QIGe/49+Wtk51Q6yYMNtaZcvqq1ZgrVlLvf
 8+cLNBiOLDUh7zyudrOGrYf6ah115f+Vsm54vBEGkOQ4xxyKqBR4cKy11
 i/2BAM5+o55yNQujn3dVp5MiponSAIAah5xaAInSK8tMNGPt75Nm9ugMJ
 5S8gi1uCRqOPwHHuSjzHNiRIbTkkKfSkNFkYjLG9WiSDvjMbtwIWjJPze
 ZVA6ZlKHuPB0/tCEPjcAlhfjD6EW/xM01hQSvTTBUbwAbxpAFqpxM7Bb1 Q==;
X-CSE-ConnectionGUID: IDeRRhgGTCunKu67WB7QPQ==
X-CSE-MsgGUID: zW19c6mkTYut+RGMiLcbXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39826247"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="39826247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 17:07:32 -0700
X-CSE-ConnectionGUID: wbgDI5OVRVKxiHIiuG5CMA==
X-CSE-MsgGUID: JxaoR+AUQwucy0MV2hV9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="43241361"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 17:07:32 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v9 0/4] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Thu,  6 Jun 2024 17:07:15 -0700
Message-Id: <20240607000719.1012422-1-zhanjun.dong@intel.com>
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

Zhanjun Dong (4):
  drm/xe/guc: Prepare GuC register list and update ADS size for error
    capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Extract GuC capture lists to register snapshot

 drivers/gpu/drm/xe/Makefile               |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |    7 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |    4 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h |    2 +
 drivers/gpu/drm/xe/xe_gt_printk.h         |    3 +
 drivers/gpu/drm/xe/xe_guc.c               |    5 +
 drivers/gpu/drm/xe/xe_guc.h               |   28 +
 drivers/gpu/drm/xe/xe_guc_ads.c           |  213 +++-
 drivers/gpu/drm/xe/xe_guc_ads.h           |    3 +
 drivers/gpu/drm/xe/xe_guc_ads_types.h     |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 1412 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h       |   53 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h  |  198 +++
 drivers/gpu/drm/xe/xe_guc_ct.c            |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h          |   76 ++
 drivers/gpu/drm/xe/xe_guc_log.c           |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h           |   17 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h     |   24 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   63 +-
 drivers/gpu/drm/xe/xe_guc_submit.h        |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         |  218 ++--
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  159 ++-
 drivers/gpu/drm/xe/xe_lrc.h               |    1 +
 25 files changed, 2510 insertions(+), 166 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

