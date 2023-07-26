Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08C6C001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 13:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9971510E478;
	Wed, 26 Jul 2023 13:19:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211010E478
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690377548; x=1721913548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HbboIinnxQ7aV0HEQl4KDvt2tqCtV3+dhBX3NF1NY1I=;
 b=hAOhRV1s4fqAQFyRQVSRIRF674IW7P85JskjNf5IGYC/SjSgJtPwOtpa
 ozngKmxdWOthyfaVbMu5LBz5YoEhKtWv4o/BOo/Ej/WztSk4UoWF7AGMa
 mRM3sM14NousONxCRs75TYqy9RgVnb4VqoRB4vURAnAut2ohQd3OW0EJh
 xeZI/gpZmQPWTTiOYB4Pl/ViH7YjxXq4SEVEpSXHZtMm+4sbq9QTqiYSl
 znfz+wiczx1KxazExM1fRnep37MFXyg0gy3imJz9VYtpyy/CAdjFQN127
 UYCqhOhhS3KQXPX8qdolpwP5JQB/taHgLMVbwS7RSuSDWvvcImbxvNZwe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371624317"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371624317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 06:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676695683"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676695683"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 06:19:05 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:55:44 +0530
Message-Id: <20230726132550.846300-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V8 0/6] drm/xe: Add engine scheduler control
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

 drivers/gpu/drm/xe/Kconfig                 |   6 +
 drivers/gpu/drm/xe/Kconfig.profile         |  46 ++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_engine.c             |  46 +-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 640 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  35 ++
 drivers/gpu/drm/xe/xe_gt.c                 |   7 +
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c          |  18 +
 drivers/gpu/drm/xe/xe_hw_engine.h          |  31 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h    |  40 ++
 12 files changed, 866 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h

-- 
2.25.1

