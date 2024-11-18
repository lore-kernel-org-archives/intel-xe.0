Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC01D43FF6
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97B10E0A0;
	Mon, 18 Nov 2024 09:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWF84zCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B167C10E0A0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920846; x=1763456846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bc6eAHUvyLlihCgz3YzY3mPY+tURhQVsCvhc/3ohhyw=;
 b=QWF84zCFk7MXXO9s45SIQ6VM0U8o/Iy+MY9VXpA4ghF1sF5TV/VHgfrj
 40sqtpePACc1LWYlgjCHBiA3bg1CGW4TCrm5pcMUHvY2sQp9SttgwRfp0
 0rJ6blHju9zVD4q5WQPlq53blnw0PhmMKdNponkja1SMNx7Ijr+bbLV3R
 4j52Rlrnj8Vf9u61RjaZ1+vulomh6BZv5bGLBIC4pRQ0rLvmkV32AB/tW
 SWRnwhoqsKuC+Y2YEXA1BGbtZzi8Q+ol+8GTUPSwaad5fbCJs268OiOv6
 TbBlfWmmzPdMSWwpnXzIy2FWe+6Br1/dCbKDZlhHUJns79Lj40H6KSOk2 w==;
X-CSE-ConnectionGUID: H4MMtsuOQZ6uOA9hoLDEMg==
X-CSE-MsgGUID: 1ySVTDiARNuQhJj1ylXNwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242923"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242923"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: 8H+ej6nUSxG8bdcOdaczJg==
X-CSE-MsgGUID: fC7HJAKWT2qjfXgZkc+v2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705142"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 0/7] Add support for EU stall sampling
Date: Mon, 18 Nov 2024 01:07:12 -0800
Message-ID: <cover.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
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

A new test in the IGT repo:
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
is also under development to test this feature in the driver. This
patch has undergone basic testing with the new IGT test that is under
development.

Thank You.

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
  drm/xe/eustall: Introduce API for EU stall sampling
  drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
  drm/xe/eustall: Return -EIO error from read() if HW drops data
  drm/xe/eustall: Add EU stall sampling support for Xe2
  drm/xe/query: Add a device query to get EU stall data information
  drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
 drivers/gpu/drm/xe/xe_eu_stall.c           | 1054 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |   58 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_query.c              |   30 +
 drivers/gpu/drm/xe/xe_trace.h              |   33 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
 include/uapi/drm/xe_drm.h                  |   62 ++
 12 files changed, 1304 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.45.1

