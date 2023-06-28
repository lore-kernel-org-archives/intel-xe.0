Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81CAEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7EE10E37A;
	Wed, 28 Jun 2023 11:41:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570D10E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687952486; x=1719488486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kqRAYktRqa4ukx3ug3ijloaGDs29w7ynA6zTOIJLtUg=;
 b=HPhnv/xPayk0//QKnKBbCDh5/CSCQrucYwGdqeXGhAsKv5QlswXoJ1ti
 ZwV8Khb4CtH3I/DnOJKEnnlZvApz5D4UhG0DzrhXzrEZuAfMN+t+EKxS8
 qbMsn94vx6aN64jyHReJDCXXRxW8xynxXxw7FuDQA0owwJ5m7Bgqn+AEN
 cyeBStFMDVEAPO0RBmKaVZIPDVuvk7vhNKBOH9wkUHZkzWY2n7Hei2GIo
 EX4NP0sKDw98bHWIEPPnRRs9wgjxfbBJVcNAtAWjUxlR0h79BMW3SHccX
 gHg0X0GqlqSRIriyUgVuVxx7HZkWT/o2coaM/m5M8jTO9bsivWTzWjlaL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425492880"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="425492880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861507308"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="861507308"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 04:41:23 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 17:17:26 +0530
Message-Id: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 0/6] drm/xe: Add engine scheduler control
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
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  23 +
 11 files changed, 870 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

-- 
2.25.1

