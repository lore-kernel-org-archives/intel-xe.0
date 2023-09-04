Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5979BC83F3F
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 18:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007FF10E3D3;
	Mon,  4 Sep 2023 18:16:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE0110E3D3
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693851365; x=1725387365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e48FJP8tkyFZ7AupeRdl4ciaaJ3876lRnJDs5vGELew=;
 b=Y0vminCB7Ne+RTc3S9SCiJXrYFl2bKtNghTr2yp+mr/vk03/hCRPQEJl
 ZahK1DTaaqccjKbUZEAKxX62NLq5MOCSOxtxOHNRWwkjyyjEA7kX/nJC+
 V/H0fKyvm9AAstXyHLb4/W+LGgtKK7Ch87b/bnF9aX0slYUAHmUtGGZ7a
 UnXUgLeGPPfroJEt7aBtlzM6FegGvf7+fYaF9xkNw8wHVYfAv6AdsOPwn
 vBQAGOSWoII2C2/rhHKzBLgbTxf/rvY5mGEQxvgCY+XRrz96u1v0R7GvT
 Aa0/wSKEvTGyfQZCdRu1qYrG23HiZ0knKqyrJn4G09nt9tbPx8SICpPCr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366867377"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="366867377"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 11:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071692671"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="1071692671"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 11:16:01 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Mon,  4 Sep 2023 23:52:52 +0530
Message-Id: <20230904182258.2291881-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/6] Add HWMON support for DGFX
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
Cc: linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds the hwmon support on xe driver for 
DGFX. This is ported from i915 hwmon. 

v3: Fix review comments (Matt Brost/Andi) 

v4:
  - Squashed "Add HWMON infrastructure" patch to "Expose power attributes"
  - Dropped changes related to disable PL1 to boost firmware loading. 
    Will handle it saperate patch/series.
  - Dropped changes related to gt specific energy attributes. 
    Will handle gt specific energy attributes in saperate patch/series with design
    change suggested by Guenter
  - Fix review comments (Andi/Guenter)

Badal Nilawar (6):
  drm/xe: Add XE_MISSING_CASE macro
  drm/xe/hwmon: Expose power attributes
  drm/xe/hwmon: Expose card reactive critical power
  drm/xe/hwmon: Expose input voltage attribute
  drm/xe/hwmon: Expose hwmon energy attribute
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  72 ++
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  44 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 767 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  20 +
 drivers/gpu/drm/xe/xe_macros.h                |   3 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   1 +
 12 files changed, 936 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

