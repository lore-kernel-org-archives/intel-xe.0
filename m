Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5ECEB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB16810E09A;
	Mon, 26 Jun 2023 10:10:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CD110E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687774244; x=1719310244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UKKM9BlhTuHHTaouxbAIW3nSqmdksn+xuTnzVVzPQ18=;
 b=bnAuNjURoT4RS+Iq/YjCu4Lq9+NbonZN1RNlIILUOe6Q+Bzjnups7jdD
 rUX7KBS6RX6RhZcfu8QLZqcB4Cmqiljs+YmbTy7nSXnxiIimQFGn7xbQR
 rEMOn76Lku/ArbB/g2b053qu1aF3mxQ8sdzfgj18c9PzaLqdd6qjLZ/mP
 yGAEgR2NgSdyHD6mIxCRyS7vsbGS3yKDk0YrGhSPo+fsXdrA/AGtaJli7
 QQ1s5+TYfwickwbHGfXOuddVScigpmQVWxhd8asZSZPxh3EXyJrtHC0Ba
 nVXD12rTtI39EB9nN+4pyQuSv0XiJ+3eU6AggvGxMT5ATYuz4eZ78oUKl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447614531"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="447614531"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693434353"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693434353"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 03:10:41 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:46:42 +0530
Message-Id: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 0/6] drm/xe: Add engine scheduler control
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
1. Add basic directory structure under its GT, as below
   DUT# cat /sys/class/drm/cardX/device/gtN/engines/
   ccs/ bcs/
2. Add default entries with its value for user to go back
   to default
3,4,5 : Add individual engine properties sysfs entry
6: Introduce min/max to control in what range these properties
   can be set for elevated and non-elevated users.

VLK-46764, VLK-46767

V2 :
    - Rebase to solve conflicts
    - Use sysfs_create_files in this patch - Niranjana
    - Handle prototype error for xe_add_engine_defaults - CI hooks
    - Remove unused member sysfs_hwe - Niranjana
    - Restric min/max setting to #define default min/max for
         elevated user - Himal
    - Remove some unrelated changes from patch - Niranjana

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas Upadhyay (6):
  drm/xe: Add sysfs entries for engines under its GT
  drm/xe: Add sysfs for default engine scheduler properties
  drm/xe: Add job timeout engine property to sysfs
  drm/xe: Add timeslice duration engine property to sysfs
  drm/xe: Add sysfs for preempt reset timeout
  drm/xe: Add min/max cap for engine scheduler properties

 drivers/gpu/drm/xe/Kconfig              |   7 +
 drivers/gpu/drm/xe/Kconfig.profile      |  38 ++
 drivers/gpu/drm/xe/xe_engine.c          |  62 ++-
 drivers/gpu/drm/xe/xe_gt.c              |   6 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c        | 671 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.h        |   9 +
 drivers/gpu/drm/xe/xe_gt_sysfs_types.h  |  13 +
 drivers/gpu/drm/xe/xe_guc_submit.c      |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  11 +
 drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  21 +
 11 files changed, 868 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

-- 
2.25.1

