Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372EFC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369C10E540;
	Fri, 19 May 2023 16:28:25 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4478088E26
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684513703; x=1716049703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mE0583HeCrbo5enyG30u+O1J9yPePWhnhOPvWhw8QmM=;
 b=AJ9xi/VZLStrnjbDTelmldTEvXFIsPmVRb23DyIldB0mZ8pjvmiKkGmS
 LCGStARANwGFUb8EO8+u3zWSIVZ2laA9KtpbDduTf+bPODOy272djc2hG
 N154Y/rheRpPXKFilSvlWlGMqZ0uTcp039euVZuK2zKNBez9EV0zZtK//
 656yVvTjP9ovF4x+jATQIisrjBNp75AsWt1rP8gi1EE2SoOA7Xd8LH2Td
 yRr9J8Iihaio6g0OGWebXp/vBmviXx4FL+R+xFXvHbmAOjfMMlZWF/bVD
 bQ/dMkG+CuiMj8NPsFjWRbGQyxVmc+IkeWpzKhkhH33I6H21gpusCAsv9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332022396"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332022396"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032660325"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032660325"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:28:20 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 21:55:51 +0530
Message-Id: <20230519162555.409853-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] D3Cold Policy
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds d3cold policy.

Anshuman Gupta (4):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: manoeuvre d3cold_allowed using vram_usages

 drivers/gpu/drm/xe/xe_device_types.h |  11 +++
 drivers/gpu/drm/xe/xe_pci.c          |  31 +++++++-
 drivers/gpu/drm/xe/xe_pm.c           | 109 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pm.h           |   3 +-
 4 files changed, 151 insertions(+), 3 deletions(-)

-- 
2.38.0

