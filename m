Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77BEEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 14:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A251C10E03A;
	Thu, 20 Jul 2023 14:18:37 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562910E03A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689862715; x=1721398715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gERPgqDtxPBHoECetkf9Cth9pIsqkEuUAuc67X5cPrM=;
 b=mvF7nQM9NO5EXdxyXGrYfDtFTuBjUfwWq+QaJJASx9eaARF3tMfb9GJ8
 YmevguKraGBSBIw1dpiuk5hqupY37m5N5aoQe/hAs/xmX4zQqJSp7rwD/
 BzM9quU96ZsldHKCjs/l9MM4+CJSZ9X57PcKxCVobNpjq8b9Reo/DWuqW
 oz+hhhr0ci5yfeEx56NLC2sH7vIH/xfQF+V2b5uoFfqibBFJkPKi9uAjA
 GFosHKbat/0+ZVG623NPp0IauWfJKuVrGAGjK/eMhk7lWF2M5/OIi4NRN
 n/bZKoXr2HKLogAH6HpTPf3HbMiL35i3jlAspRJMP1+VCYdTBINQDjVjg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397628707"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="397628707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 07:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898295221"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="898295221"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 07:18:33 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jul 2023 19:55:04 +0530
Message-Id: <20230720142510.534057-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 0/6] drm/xe: Add engine scheduler control
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

 drivers/gpu/drm/xe/Kconfig                 |   7 +
 drivers/gpu/drm/xe/Kconfig.profile         |  45 ++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_engine.c             |  47 +-
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 684 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  34 +
 drivers/gpu/drm/xe/xe_gt.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c         |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c          |  11 +
 drivers/gpu/drm/xe/xe_hw_engine.h          |  31 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h    |  24 +
 11 files changed, 890 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h

-- 
2.25.1

