Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A66C30658
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 21:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F6E10E22B;
	Mon, 24 Jun 2024 21:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idLN0ySH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3346510E155
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719266050; x=1750802050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQLvlw66tpMrAqh7rtHMrWy6nTMW24ob/Zt11LQXh4g=;
 b=idLN0ySHXvf79HmBfg7cx8Z5vLI4sTCXGZ5moHQpy9G81xrU27yyFtkM
 4Mzb87s74EH2bzBtkQvO01PDqbHODeCODr24kI4RkUWEMbCjc928JWrx+
 EDcDWaBNwBxKl8beqIxDiJdxGjsWQGUOwfa1zELN9wXmsY3R4UftPvv+4
 yL3jUTJYVG5tZyooLRujS3+fszhsTJHQRQaTnF7lAZz/ljMzt9eaJvVTy
 m/KPf1ku3frArMYoEaDvsfwwKLqLtMRmQOQnhEBPX5kBJViV4gs84YrcO
 S3qVhU4EgYDOhJv+eMpTYscg20xL8AjvQizbU1QEkicwtjdstJL+PTsvK w==;
X-CSE-ConnectionGUID: KoJxCPgdTmm7c5jpInqPMg==
X-CSE-MsgGUID: EKuj5Q3RTWeuT/TNn4NjdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20073723"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="20073723"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 14:54:09 -0700
X-CSE-ConnectionGUID: /85ameSiRmqVWoqtZbN/Yg==
X-CSE-MsgGUID: +hGVJAa7TaG6Ox4XqE/3ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43532239"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 14:54:07 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v11 0/5] drm/xe/guc: Add GuC based register capture for error
 capture
Date: Mon, 24 Jun 2024 14:53:59 -0700
Message-Id: <20240624215404.3213075-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c        |   83 +-
 drivers/gpu/drm/xe/xe_guc_submit.h        |    2 +
 drivers/gpu/drm/xe/xe_guc_types.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c         |  242 +++-
 drivers/gpu/drm/xe/xe_hw_engine.h         |    2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  176 ++-
 drivers/gpu/drm/xe/xe_lrc.h               |    1 +
 26 files changed, 2715 insertions(+), 177 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_capture_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_types.h

-- 
2.34.1

