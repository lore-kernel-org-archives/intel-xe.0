Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6CEC25B5C
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 01:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7748010FCA9;
	Tue,  7 May 2024 01:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaM7qzgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6991610EDBB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 01:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715046476; x=1746582476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PpV9yY0USUZRd7CPXvnV9rwjKooxzHwIil4jwMQKViw=;
 b=EaM7qzgo5tPaLq2pdtMXWlMM5E1StZQb8VpSaxNL1u6hU8MNocvN7+oA
 CfKuFPoQryZI+XATfI/iTjbGsclCMXRkTYYfu6HoqkK4kp9edFccBsvh+
 HwNopULczujxGu1nBFoLUdwLeJq3Yyf+cKsX5e99zJv2umrBFJaEEueWq
 K7uzn7LZ79ujRGb7inzv9YnI8dD9sk0lr+ndqw+HpQ81mjomNC7ZXic/m
 Kn1R9YduxRrsJU0ibgcF3qp8HTqFde5bApJ2d0VkUsu1lElMG3x+kwfhO
 lk7/C+5RDt6QL90iP+xA6uk3p9GMkl16JlMZmTRXKE2bng4WvB46qMvLu Q==;
X-CSE-ConnectionGUID: 4xZsnPKPR8ayl20aXjOJ4Q==
X-CSE-MsgGUID: +5i7mg44TTSsbbEdxwUcjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22230828"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22230828"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:47:39 -0700
X-CSE-ConnectionGUID: Sc/cs1jmQ1yAfYMfasl9vQ==
X-CSE-MsgGUID: ekyjQUC4R1+mjHlwGxBVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28441649"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 06 May 2024 18:47:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v8 0/6] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Mon,  6 May 2024 18:47:30 -0700
Message-Id: <20240507014736.1057093-1-zhanjun.dong@intel.com>
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

Zhanjun Dong (6):
  drm/xe/guc: Prepare GuC register list and update ADS size for error
    capture
  drm/xe/guc: Add XE_LP steered register lists
  drm/xe/guc: Add capture size check in GuC log buffer
  drm/xe/guc: Extract GuC error capture lists
  drm/xe/guc: Pre-allocate output nodes for extraction
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
 drivers/gpu/drm/xe/xe_hw_engine.c        |  251 +++--
 drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  150 ++-
 drivers/gpu/drm/xe/xe_sched_job.c        |    7 +-
 24 files changed, 2309 insertions(+), 151 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

-- 
2.34.1

