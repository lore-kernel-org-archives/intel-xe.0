Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995D9E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEB910E8C9;
	Tue, 17 Dec 2024 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3+31MaG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440610E8C9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428832; x=1765964832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yjmGAGIHPeo1XKwM23H0OyNErnWm4eWoE8Tt+6OovPE=;
 b=M3+31MaGUEHHO+ZsOfVYlNutmSa2EAkvN7b+IVbi+vbQPgdJyCbEGwrw
 HH6Ie6QZtyovVVbNuktgMAT0N5xT+Da/mVwu+FqxWe/HoVBTk7F9ywhts
 ytyZMJKR8eQaEGwLjWwnVjr/1QHtI7lu4ImpRGqd5FEL0OkQFh6URtZhM
 wo/rq7gkzw6TWid4VRfTFPfGECT+784gZP0GxHGcCaIfhyfejrzNUexj3
 HKe2gmW97KsvVb2gL7B6oTYpbDZgR8z18ntUb6u21+xZCk0s6LzkHYZ1o
 2baE45a1LOOgrpuKaZrRAIlT1npOvzwK5fN1yFCG234nw919N77wkg8HX Q==;
X-CSE-ConnectionGUID: EZqojzVrS2WJjqBaq5HDvQ==
X-CSE-MsgGUID: IT44wO4xQZucGpBGtr7fHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46238177"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46238177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:11 -0800
X-CSE-ConnectionGUID: eCqyyGZkQ42hen3nUhhvrg==
X-CSE-MsgGUID: ehDt9h1qSlG9bLu6j5/wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97364644"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:11 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v6 0/7] Add support for EU stall sampling
Date: Tue, 17 Dec 2024 01:46:50 -0800
Message-ID: <cover.1734427624.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Support for this feature is being added into Mesa.
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

This patch series version v6 has new uAPI changes which need to be
incorporated into the above Mesa PR.

A new test in the IGT repo:
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This
patch has undergone basic testing with the new IGT test that is under
development.

Thank You.

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
 drivers/gpu/drm/xe/xe_eu_stall.c           | 1101 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_query.c              |   43 +
 drivers/gpu/drm/xe/xe_trace.h              |   33 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
 include/uapi/drm/xe_drm.h                  |   76 ++
 12 files changed, 1381 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.47.0

