Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEA0C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA5D10E5DE;
	Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZdIrmki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F52510E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475232; x=1772011232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DlplR5hkAgskgfb69QK1xA3d3gAobUo9XD/1H5KjR2k=;
 b=YZdIrmkiLgxJK9rEUjc9kKGUAS7DszDBidrfOB2Gu5Faka2BE+k8972u
 h4J1CK9IwjjxjvKwsmttvyQSxdMUeglmt5BdqaiHUJwrpj/+sstwz8krc
 LQvIbvYrlbDjx7hu/SBxz+MuOGjPlavLfBUDT+SWNTG/T00gNirHSW8kk
 0ppch6b1cZ9TPH7eCPmjdKuRbcKscezIIIOAXYDBih1JOPB6XIzFQAGY7
 wx6mqGCpArUIYDbBw3m0mnjL7Q0Fk8U5uwVt1aik6LMzIlee9QXHAt860
 sW5z9Feh3rOyDjzyV6hN676OKIRByv6YsJ+kkhbUD3QxR3zGWZbI/SqdA g==;
X-CSE-ConnectionGUID: wVKYM3qVRCW6qWnQrevE3g==
X-CSE-MsgGUID: Q+iv6kndQcWGrHVoB+cbWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40507669"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40507669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
X-CSE-ConnectionGUID: OQJOm7ylTESBhJwxSzNKdw==
X-CSE-MsgGUID: t0fuUg7ERP6HAuJPyP9YMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117261766"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v11 0/8] Add support for EU stall sampling
Date: Tue, 25 Feb 2025 01:20:17 -0800
Message-ID: <cover.1740474556.git.harish.chegondi@intel.com>
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

v11 a. Lock optimization
    b. Moved around code as per review feedback
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
 drivers/gpu/drm/xe/xe_eu_stall.c           | 968 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h           |  19 +
 drivers/gpu/drm/xe/xe_gt.c                 |   5 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |  13 +
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 drivers/gpu/drm/xe/xe_observation.c        |  14 +
 drivers/gpu/drm/xe/xe_query.c              |  43 +
 drivers/gpu/drm/xe/xe_trace.h              |  30 +
 drivers/gpu/drm/xe/xe_wa_oob.rules         |   1 +
 include/uapi/drm/xe_drm.h                  |  74 ++
 12 files changed, 1200 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

-- 
2.48.1

