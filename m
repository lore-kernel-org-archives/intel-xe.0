Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A875C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30710E349;
	Tue,  6 Jun 2023 12:45:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD6310E338
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055548; x=1717591548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ef+G6bqjQKQpDSvfU9LkfRqBsg/mkS6SY9F3wUfX4VE=;
 b=Wy8AWZl95eSlBLoO9KK50l0I4cZuzJoXO5/Nj13L89dHpFXXZ2to+FLg
 feB7slYPhsuTVPMkyy5oIpz31wIDaFlNzWC6yNDT14rSVowhhir7Q6YS/
 EVESFz+rZnbE6LpBFxwo3u5fQZsChCycs4+xXvlX9pAYkE6qoU5FzFdC+
 5bXnu420duZe38YbiIDYFnOM+HrFDG+LuD8W3up8ee2mJEa51S3w6HFXp
 qZoC0ZangrznjhCQpX/ZIOc+8x+B7HzMGEdmqdrr+jy0TxZNRqIJ1g4yn
 uOO41VypYUqV8lIC8CnVFIO20rUrBdGH8FEmXX+Ti1+Rwm7tz4ehN3HpG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297857"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297857"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063410"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063410"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:44 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:51 +0530
Message-Id: <20230606125057.838618-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/6] Add HWMON support for DGFX
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds the hwmon support on xe driver for 
DGFX

Badal Nilawar (6):
  drm/xe/hwmon: Add HWMON infrastructure
  drm/xe/hwmon: Expose power attributes
  drm/xe/hwmon: Expose card reactive critical power
  drm/xe/hwmon: Expose input voltage attribute
  drm/xe/hwmon: Expose hwmon energy attribute
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  77 ++
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  45 +
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 950 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  26 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 10 files changed, 1130 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

