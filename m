Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA3EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB4D10E31B;
	Tue, 27 Jun 2023 18:25:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBEC10E31B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 18:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687890311; x=1719426311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sjzesD+BZ8dzLPo9Wx3EknOovqIY+u94k3d/HA0D2Uc=;
 b=dQ7eBzVIa2EDfWp0tNzjuUidmQCHLmBedr57MnqMzJXbaxNy5XlTYtL9
 owZ3NTRZJC8qezpG9pdvMe+YVP0Kwxy9EMxjv7qhGBuHUEheCk12PM8A2
 eoGQHSJec+QMLwONmFoDdYOZUEmZSWtUGmAm2SiGrkf+tXBRAprKkE3WM
 A6P72EeNGmHlFj9CnZz8dIhviaWw/x/8MU4IaWix633oiEuNLKJqpq+MZ
 T5U2XvH7L+tBta8jkQ0Q0a2SJabKzVXnrxgjXXHsht/1oYbpvYEWPOebM
 78OFEX9KBR9tFYtgfsf2MzrWUrOkzZRYXf2z5iZhmx2yDIM10GMp7VnVH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359148909"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="359148909"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="829767166"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="829767166"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 11:25:07 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Wed, 28 Jun 2023 00:00:37 +0530
Message-Id: <20230627183043.2024530-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] Add HWMON support for DGFX
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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 989 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  26 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 11 files changed, 1174 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

