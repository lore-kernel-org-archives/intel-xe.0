Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26917D1A43A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DD210E273;
	Mon, 14 Oct 2024 06:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzMp2cDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6F10E26F
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728885643; x=1760421643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiZ5O/FDGSEm6k+yOwkcWi5cpdoICu7ABSYCrGEtiHQ=;
 b=mzMp2cDDB9mQ78fwFxgM837OtL93/IKhvZCvPU5U8P4cmq3BAK6yGu2+
 cnll9CBbFb/26AP+WhyzBJlQcHT3BMIiO999OCjHXq3LMASlTcPvw98XP
 yDVIBNpYGqeTNP34qpejC9O5cvWwJQU+GdCtCjHwyqas7jlsd3aWYLFFq
 06N6tWxwtYvhapyynhxYuSlMNkTlOBSaKZ8J2BIfgYs8g3zcrv/S//Wax
 CiAAlNP0FcRcefYI8CWcNsXTPFsqqDRjUIsJH6v3KU0Inn9u6pPyiwZ7p
 OJmRb3lMtR4NYFA0lXAatgdBqvv7Y9sEGK/ObuVPllsQXXdFE4izlQpLu Q==;
X-CSE-ConnectionGUID: RN7OlDwCTFK2Tm/o9/Y5kQ==
X-CSE-MsgGUID: SkhxBpbKRmOgEhbLsYOJkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599325"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39599325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:42 -0700
X-CSE-ConnectionGUID: 0awM8RWCSGG+scX2jlgqCA==
X-CSE-MsgGUID: JDSqpXDuTd6/1OcbaDp0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77575027"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:42 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 0/5] Add support for EU stall sampling
Date: Sun, 13 Oct 2024 23:00:31 -0700
Message-ID: <cover.1728884074.git.harish.chegondi@intel.com>
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

Harish Chegondi (5):
  drm/xe/topology: Add a function to find the index of the last DSS in a
    mask
  drm/xe/eustall: Introduce API for EU stall sampling
  drm/xe/eustall: Implement EU stall sampling APIs
  drm/xe/query: Add a device query to get EU stall data information
  drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
 drivers/gpu/drm/xe/xe_eu_stall.c           | 1031 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |   60 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    6 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_query.c              |   30 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
 include/uapi/drm/xe_drm.h                  |   62 ++
 13 files changed, 1284 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.45.1

