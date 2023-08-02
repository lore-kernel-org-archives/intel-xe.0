Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2106C04E69
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B326010E191;
	Wed,  2 Aug 2023 13:46:28 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879D010E191
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690983986; x=1722519986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4z7IEN1wyekBEs6NoGp9FZVqurA3jlN4d48vtWHIO70=;
 b=DNY+Z+XqJKYttKfLGAyi1XR5kXeFn5Ho8YK2+hN5tEa7DYY7iczjmlBw
 A6MEQmmSyOSOoAbq45Zd4c88Ae33tACquPn4S9MTVKrSg9GpMJYN/53jX
 1yc4E0yEYZFkjwkn7HU9AzkXKdydlXysA61Wr7ZlHXTf2sli4JL1XWwGL
 5cO7dXDij5rjvQhBxnB3UfAOlZE/GxyeODMI8+UYudnBUQy76VojPlI7D
 dZJKkIX0rzUWVKj51sXkdrrd6V9Cdr8TIkYcL6pZaWTBDD7/Ob8x7+TDh
 DIBfpKxPqZ30WAsZrv8TCl/GdKPBLD9xlQAypWu6mlvkvgatgwPMylQF8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534914"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="400534914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873890"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="852873890"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:22 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Wed,  2 Aug 2023 19:22:35 +0530
Message-Id: <20230802135241.458855-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/6] Add HWMON support for DGFX
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
 drivers/gpu/drm/xe/xe_hwmon.c                 | 958 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h                 |  26 +
 drivers/gpu/drm/xe/xe_macros.h                |   3 +
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 drivers/gpu/drm/xe/xe_uc.c                    |   6 +
 12 files changed, 1146 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

-- 
2.25.1

