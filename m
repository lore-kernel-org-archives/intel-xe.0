Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A887AEE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 04:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B0A10E00C;
	Tue, 22 Aug 2023 04:48:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7099010E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 04:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692679703; x=1724215703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GtG5bArTXKKB1w70AiBTuXdNCpKFkriZtYupaGqsY14=;
 b=DtU+jiOREwICBTAiSMYtf0o0zg2q1fXoXQD8sA04OnND3EKHljaCJTBl
 3PHXyy1SCWDURlGh1qE85DRoAgRtkqtWujsPMLsH0EZzZf7vqXBPwauDl
 E70sFmRgD68wjmOJwBtWK1tFyYmrQmIkyXQ3fPmvb0QX5XcZ4S/BPd25V
 kocilEE2bZKPZjj8WcR22RwZpfNmjOWrfN6kMllz4kXOBO0rtibLgmkKp
 h265X7bsRCTC67lpMdzIm8hjb9RW7qMVvK3u5mStwwgpzAhgqXkyByhhP
 JJLNjPq5fwz9nxeRq1T/XeY3qKtiLRypE95Of8X46ECZN7PPNfgQ1cG8Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440144557"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="440144557"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 21:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850454378"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="850454378"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 21:48:20 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 10:28:24 +0530
Message-Id: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Add throttle reasons sysfs
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

Add throttle reasons sysfs under a separate throttle
folder under <dev>/gtN

Sujaritha Sundaresan (1):
  drm/xe: Add throttle reason sysfs attributes

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
 .../drm/xe/regs/xe_gt_throttle_sysfs_types.h  |  36 +++
 drivers/gpu/drm/xe/xe_gt.c                    |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 282 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
 .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  35 +++
 drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
 8 files changed, 391 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h

-- 
2.25.1

