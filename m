Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4A6EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300D8910E;
	Thu, 15 Jun 2023 14:13:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63AF10E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686838424; x=1718374424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tC2ZeLlhS8JFrz16fDbFA/PDM//VnJNvgqx1OF6sx0o=;
 b=IWiCqlmoCs2cmgLYEq2yurQMfsItxb4tc+panuXmMwzoxVnL997/Wwe2
 9P/FdgSsVlAhtUDUddDPHjkJYp9vaffsIK3b0mKX9Nu9aBQj1B7w8XlsH
 MR/VLpiUQ2Rcz98yvaDDQBbUXdr2nmMJ/U23spcOexd0qE9yegyYowdT9
 rFiH9ZOPp87WQnCJ+HGUW9OVrsYKmx5Sttj+yd9/DjqZmNGDBZXx8x0d8
 6NKkSBb14ajzo392DrB8rwN6uyjCzfLDBpYysapQymWsejshaqotMdn98
 paZ4+sMFbJ1wf6sAUFkhWwqO2UFrC/uMzB0J5BoCP2m8gLDHj3zG5EGo5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445290496"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="445290496"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 07:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="706683771"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="706683771"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2023 07:13:40 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jun 2023 19:49:27 +0530
Message-Id: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] drm/xe: Add engine scheduler control
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Tejas Upadhyay (6):
  drm/xe: Add sysfs entries for engines under its GT
  drm/xe: Add sysfs for default engine scheduler properties
  drm/xe: Add job timeout engine property to sysfs
  drm/xe: Add timeslice duration engine property to sysfs
  drm/xe: Add sysfs for preempt reset timeout
  drm/xe: Add min/max cap for engine scheduler properties

 drivers/gpu/drm/xe/Kconfig              |   7 +
 drivers/gpu/drm/xe/Kconfig.profile      |  39 ++
 drivers/gpu/drm/xe/xe_engine.c          |  44 +-
 drivers/gpu/drm/xe/xe_gt.c              |   6 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c        | 617 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.h        |   9 +
 drivers/gpu/drm/xe/xe_gt_sysfs_types.h  |  13 +
 drivers/gpu/drm/xe/xe_guc_submit.c      |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  11 +
 drivers/gpu/drm/xe/xe_hw_engine.h       |  31 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  23 +
 11 files changed, 799 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/Kconfig.profile

-- 
2.25.1

