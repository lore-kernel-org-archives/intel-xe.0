Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FBBC02185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F331D10E7D8;
	Wed, 15 Jan 2025 20:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd6+nuae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334BC10E0AE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736971342; x=1768507342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XThehnL40SHkxoPGTwdsi4Ty64vx0LNdQbYJ1341aIA=;
 b=Wd6+nuaetNSOiydp/UFgJ9nsrelxT8nlXfFBhhqqH+Ju0yCoYM53WjvR
 6PhHeChvUiBIR3H+xn2f0hOZ4r3L0TeV0dUufgFpQ5dAhMhbydNvKoXAL
 lMJ+NBes0HWUUFYQbx85Kgwuwm0mhNA6FZYy64OqjccQgzgVQzkCdF73A
 FoP2LOmjkD6rqZ/7RYk7s+Iri2r6PVc/wLWyaOl1yMI1SoagO7qm0cKNk
 /qlz+ZIPzuwqOnNxpyTCsWFUNivmfsLbZ/yUawfqikz7fZXJWkm/7DQFt
 A0rgk2ItYRNs4/HY/rQ9G8uo2QZw5M5am09J82wKWuWhpcSHwgEA12Xnt Q==;
X-CSE-ConnectionGUID: 6WCzLaR1Qs6Z140QRh96Jw==
X-CSE-MsgGUID: YaEn8y17TBSA/zS2GAoQww==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37438278"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37438278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:20 -0800
X-CSE-ConnectionGUID: w72H1+lHTuubWK+aIOBhbQ==
X-CSE-MsgGUID: vmJU0k1FTkmV/mjjmWafwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105785796"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:02:19 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v8 0/7] Add support for EU stall sampling
Date: Wed, 15 Jan 2025 12:02:06 -0800
Message-ID: <cover.1736970203.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.1
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

The following patch series add support for EU stall sampling,
a new hardware feature first added in PVC and is being supported
in XE2 and later architecture GPUs. This feature would enable
capturing of EU stall data which include the IP address of the
instruction stalled and various stall reason counts.

Support for this feature is being added into Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

New IGT tests for EU stall sampling are being added:
https://patchwork.freedesktop.org/series/143030/

This patch series has undergone basic testing with the new IGT tests.

Thank You.

v8: a. Used div_u64() instead of / to fix 32-bit build issue.
    b. Changed copyright year in new files to 2025.
    c. Renamed struct drm_xe_eu_stall_data_pvc to struct xe_eu_stall_data_pvc
    d. Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_xe2

v7: a. Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
       to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
       OA. Renamed the corresponding internal variables.
    b. Fixed some commit messages based on review feedback.
    c. Changed sampling_rates from a pointer to flexible array.

v6: a. Changed the uAPI input to accept sampling rate in GPU cycles
       instead of sampling rate multiplier.
    b. Fix buffer wrap around over write bug (Matt Olson).
    c. Include EU stall sampling rates information and per XeCore buffer size in the query information.

v5: Addressed review feedback from v4 including
    a. Removed DRM_XE_EU_STALL_PROP_POLL_PERIOD from the uAPI (Ashutosh)
    b. Separated the patches for Xe_HPC and Xe2 (Matt R)
    c. Moved read() returning -EIO into a separate patch
    d. Removed spinlocks around set_bit() and clear_bit() (Matt R)
    e. Renamed several variables, structures and enums (Ashutosh and
Matt R)
    f. Addressed other review feedback.
v4: Addressed review feedback from v3 including
    a. Split the patch into multiple patches (Matt R)
    b. Added a new device query to get EU stall info (Ashutosh)
    c. Renamed all Dss to xecore (Matt R)
    d. Removed buffer size and disable at open input properties. (Matt R)
    e. Removed the "_SHIFT" macros (Matt R)
    f. Allocate the EU stall buffer only on system memory.
    g. Changed the work arounds to OOB (Matt R)
    h. Other review feedback.
v3: a. Removed data header and changed read() to return -EIO when data is dropped by the HW.
    b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data record info
    c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
       to xe_drm.h. These declarations would help user space to parse the
       EU stall data
    d. Addressed other review comments from v2
v2: Rename xe perf layer as xe observation layer (Ashutosh)

Cc: Felix Degrood <felix.j.degrood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Harish Chegondi (7):
  drm/xe/topology: Add a function to find the index of the last enabled
    DSS in a mask
  drm/xe/uapi: Introduce API for EU stall sampling
  drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
  drm/xe/eustall: Return -EIO error from read() if HW drops data
  drm/xe/eustall: Add EU stall sampling support for Xe2
  drm/xe/uapi: Add a device query to get EU stall sampling information
  drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
 drivers/gpu/drm/xe/xe_eu_stall.c           | 1103 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_query.c              |   38 +
 drivers/gpu/drm/xe/xe_trace.h              |   33 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
 include/uapi/drm/xe_drm.h                  |   74 ++
 12 files changed, 1376 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.47.1

