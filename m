Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E44E810D0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A612910E4DB;
	Wed, 27 Sep 2023 11:40:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9AF10E4DB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814806; x=1727350806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1u0wU1LHc5ox1TA9ttyGwpO8Q+bvSbrLLwrQP80H8mc=;
 b=NY9oH5+d7e7CB6sULvXYpvfTadQgU3kEE/WhkILcOW+qx0NC5soseBMC
 bxUQdmefJ/zuOULjpiwLPFZrrp1BiMcDniw8X+TTgbhAmMvzihw7/wANa
 xFYRkpIY3RNi4XkzdGUizJC3Jba5q7X2JSXJv0mZNN/MT6B6jQ4XWEy9G
 uZVGqXblLYCfRyNFE237SFC9/97sPu3oX87aNBydjpIkWxGa5an7k8YAv
 DHBUnmdg2flZ5uYqfeOSyS8LhNOC7nya/neYB1X3HmHrlKecCQ9LDYLQc
 ZEzOdTj9Kk2xj+WKV2J9jtK17r4UTaEFExhYp0RlcJRz2yphBkj90yJLs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863174"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855427"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855427"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:16 +0530
Message-Id: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/11] Supporting CSC and SOC HARDWARE ERROR
 HANDLING on PVC
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

The patches in this series covers errors from  SOC, GSC/CSC.

Depends-on:https://patchwork.freedesktop.org/series/122257/
The patches of this series are part of this series to ensure CI
validation.

Himal Prasad Ghimiray (11):
  drm/xe: Handle errors from various components.
  drm/xe: Log and count the GT hardware errors.
  drm/xe: Support GT hardware error reporting for PVC.
  drm/xe: Process fatal hardware errors.
  drm/xe: Support GSC hardware error reporting for PVC.
  drm/xe: Notify userspace about GSC HW errors.
  drm/xe: Support SOC FATAL error handling for PVC.
  drm/xe: Support SOC NONFATAL error handling for PVC.
  drm/xe: Handle MDFI error severity.
  drm/xe: Clear SOC CORRECTABLE error registers.
  drm/xe: Clear all SoC errors post warm reset.

 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   |  29 +
 drivers/gpu/drm/xe/regs/xe_regs.h            |   5 +-
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  58 ++
 drivers/gpu/drm/xe/xe_device_types.h         |  15 +
 drivers/gpu/drm/xe/xe_gt_types.h             |   7 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 889 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 223 +++++
 drivers/gpu/drm/xe/xe_irq.c                  |  10 +
 include/uapi/drm/xe_drm.h                    |   9 +
 10 files changed, 1245 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.25.1

