Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25EAC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 08:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996AE10E545;
	Thu, 27 Jul 2023 08:15:55 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206310E543
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690445753; x=1721981753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mns05LBDlPLbRN3uFRUJKc1sz9ZQ8nYMzbutLVMhsZc=;
 b=RoY6B0y/+kYfmwZM8sGfPbCgPA/0nstd7OTosLhKPno60MNmPSBxieiW
 AEslyFBm2MB0hpu7iNWqus+O10r7aR9ssYGM4P7g+KtWjzIHo37ijtY9m
 GyVmPaNzkdTyL1FuFAoicBlstTbMmLPyNIKhxWBhy1Wq38XmTpnyLSAtD
 EKpGlCuIPAN8uYyTr8843wD495aM7WhA+Vxd0tgRnt6cR1gCpV3bmp4V5
 5i7do8OlkGnoaXYBYdQnLr6Eo6Ox7Y5pgAtOakaJbKsq9i4N/lQ7E6a02
 BUPHrcOceOQlnfyCFrCK2i5aPrzdcNBOUEiV9xOmDVI3G7FNPq2I9A7XO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353144388"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="353144388"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 01:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057600798"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="1057600798"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 01:15:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 13:52:29 +0530
Message-Id: <20230727082235.905240-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V9 0/6] drm/xe: Add engine scheduler control
 interface
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

Patch series introduces this in several patches,
1. Add basic directory engine class under its GT, as below
   DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
   ccs/ bcs/
2. Add default entries with its value for user to go back
   to default
3,4,5 : Add individual engine properties sysfs entry
6: Introduce min/max to control in what range these properties
   can be set for elevated and non-elevated users.

VLK-46764, VLK-46767

V9 :
   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
   - Remove init_done from class_intf instead check member 
     is initialized - Matt
V8 :
   - Modify enforce_sched_limit logic - Niranjana
   - make sure min < max - Niranjana
   - Push all errors to common err path - Niranjana
V7 :
   - access engine class interface inplace of hw engine - Niranjana
   - Use some API to lower down duplication of code
   - Return EINVAL in place of EPERM
V6 :
   - Scheduling props should apply per class engine not per hardware engine - Matt
   - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
   - Removed timeout validation check as range validation covers it
   - Rebase all the patches based on above changes
V5 :
   - Rebase to resolve conflicts - CI
V4 :
    - Rebase the series
    - Add CONFIG option to enable/disable min/max limitation on
      elevated user - Matt/Joonas
    - Movement of engine related code to its own file
V3 :
    - Improve class_mask logic
V2 :
    - Rebase to solve conflicts
    - Use sysfs_create_files in this patch - Niranjana
    - Handle prototype error for xe_add_engine_defaults - CI hooks
    - Remove unused member sysfs_hwe - Niranjana
    - Restric min/max setting to #define default min/max for
         elevated user - Himal
    - Remove some unrelated changes from patch - Niranjana

Testcase: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/94ccbe7cdf8651d5b76588102eca545cb74caad8
Testcase: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/0753ddf646df691cd1d2219192ce3a629f3e7e3f
Updated Testcase: https://patchwork.freedesktop.org/series/121046/
Tested-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (6):
  drm/xe: Add sysfs entries for engines under its GT
  drm/xe: Add sysfs for default engine scheduler properties
  drm/xe: Add job timeout engine property to sysfs
  drm/xe: Add timeslice duration engine property to sysfs
  drm/xe: Add sysfs for preempt reset timeout
  drm/xe: Add min/max cap for engine scheduler properties

 drivers/gpu/drm/xe/Kconfig                    |   6 +
 drivers/gpu/drm/xe/Kconfig.profile            |  46 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_engine.c                |  31 +-
 drivers/gpu/drm/xe/xe_gt.c                    |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  17 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |  31 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 640 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  35 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  37 +
 12 files changed, 847 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h

-- 
2.25.1

