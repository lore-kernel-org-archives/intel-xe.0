Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD2BCD54B2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911F810E390;
	Tue, 19 Sep 2023 10:55:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDF910E38D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695120909; x=1726656909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8kLYFFFnvspnA8JbICgFfBa/rBX3eY1DLOkxLAGCyQw=;
 b=UwNzsCAaR2my+bhbw/UuONCKgR+eY92ZCEQdQLNXgCDAPMFlE0ZzQ5IJ
 Ubx2kJEarXahrxxP6A2y2kRVck/1s9GcyjwAxuT4QeMX85WjQglILHa4t
 grnt+QSs8ISMww3QueVU1Ak9fUC/rbqxbgQiSuhRQc6zUwp3Xm0O1bAkk
 bAtvHaKX3dhbIH1TYjTfrWnTRzNg25gfGSR+u9f9DXStMunuokn0YCy+R
 Ar9MQol35TnkFkN6tpggeKnTVilSuvlaBURRBYAJtqXIEY5wWFYBGrLo9
 j3MH9TWh6JK5B4QCf9yjv9Wdf92OUBq6AzcUR89kCISoIG+cDXjKZOjTR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379813348"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379813348"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="993124325"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="993124325"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2023 03:55:02 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 16:35:40 +0530
Message-Id: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Add throttle reasons sysfs
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add throttle reasons sysfs under device/tile<n>/gt<n>

Sujaritha Sundaresan (1):
  drm/xe: Add throttle reason sysfs attributes

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
 .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
 drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
 7 files changed, 334 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h

-- 
2.25.1

