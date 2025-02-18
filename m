Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A89CC021AD
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862310E752;
	Tue, 18 Feb 2025 19:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9HIlVdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46710E74F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739908458; x=1771444458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eeG20BFy7q2JVDIN7Xopf2PD/LS0U8Fl7p9T265xQyA=;
 b=U9HIlVdxkUNDKKalDrR2Ow1Zq46T+9LW8mnVqMELPNgUA7mvT46gSLQh
 2/77DZE31sslh/XrMa8840mEJlASOdvzSMAA6iqbYauoF7jrOEvj8W0VY
 caEolDbRO4Bx2QUdBhp//CiMui0yufYFFy41MdVvrZ9VAxg0D1BRMRxMa
 fxmCNXvZbvTxFcOGgH7ngUVOlnxW/0WnRKWvYBBW2uIxPm0UK+RoFxYDi
 /o8lHGgXjAI4iNrQMHfHTaj0oRvd3XxLHKqZ9St2esElfCma+CZb++7CE
 rAR8zJ8hPQKtklTrxo30eKN52Q64hJX3RqSGAYWBKmbsFQ2/aWOFe+c1G g==;
X-CSE-ConnectionGUID: rbJYr8rnQxqCYTw1vFK/Bw==
X-CSE-MsgGUID: VnaNKleJQlaPzhbRcIaomQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44382046"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44382046"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:17 -0800
X-CSE-ConnectionGUID: ieNjEbKbQauI5S9RQwlmJg==
X-CSE-MsgGUID: rGSYXPO6T3KdJ3ITP8sTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151706343"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:17 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v10 0/8] Add support for EU stall sampling
Date: Tue, 18 Feb 2025 11:53:50 -0800
Message-ID: <cover.1739906138.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Issues that need investigation:
1. Blocked reads with small user buffers may be blocked even with EU
stall data in the kernel buffer as a previous read has set pollin to
false even when kernel buffer has data that could be read but the user
buffer is too small to read all the data.

Thank You.

v10 a. Fixed error rewinding code
    b. Used cancel_delayed_work_sync() instead of flush_delayed_work()
    c. Replaced per xecore lock with a lock for all the xecore buffers
    d. Remove function description for static functions.
    e. Use extension number while parsing chain of extensions.
    f. Moved code around as per review feedback
v9: a. Split the big patch in v8 into two patches
    b. Moved all drop data handling code into one patch
    c. Several other code improvements as mentioned in the patches
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

Test-with: cover.1739901972.git.harish.chegondi@intel.com

Reviewed-by: Ben Olson <matthew.olson@intel.com>
Acked-by: Felix Degrood <felix.j.degrood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Harish Chegondi (8):
  drm/xe/topology: Add a function to find the index of the last enabled
    DSS in a mask
  drm/xe/uapi: Introduce API for EU stall sampling
  drm/xe/eustall: Add support to init, enable and disable EU stall
    sampling
  drm/xe/eustall: Add support to read() and poll() EU stall data
  drm/xe/eustall: Add support to handle dropped EU stall data
  drm/xe/eustall: Add EU stall sampling support for Xe2
  drm/xe/uapi: Add a device query to get EU stall sampling information
  drm/xe/eustall: Add workaround 22016596838 which applies to PVC.

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |  29 +
 drivers/gpu/drm/xe/xe_eu_stall.c           | 946 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |  20 +
 drivers/gpu/drm/xe/xe_gt.c                 |   6 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |  13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 drivers/gpu/drm/xe/xe_observation.c        |  14 +
 drivers/gpu/drm/xe/xe_query.c              |  38 +
 drivers/gpu/drm/xe/xe_trace.h              |  33 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |   1 +
 include/uapi/drm/xe_drm.h                  |  74 ++
 12 files changed, 1178 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.48.1

