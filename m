Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFDC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BDC10E6EB;
	Thu, 13 Jul 2023 14:32:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DF310E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689258762; x=1720794762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=erLmRz4JGkRjXeNZ7kPjS6+yQ7BIaIpfpF2mXDre27A=;
 b=apc8DAddyE79sbs/N9Uhf6QpiudohsDBC7yvR+nDkx8WzgFcB2DAls6O
 Ojy/NYqZHdFYmdbESrgpu8DIKY/c484GCQ9PQOK8LVlY98f5OIlOs07xQ
 zHwPJ7vShXRsjnGzJ7X8QWX2FxO8fUdf79WDhRor0g1DkuUAFNSYFBwHL
 MZlU0ZAN0uLuUzp9osAqLnTfuoOKtTzrhhU84t0def3NMJjVDHKJTOt2x
 +mB7DwVI6hSOtvxZrvS+1FvTRptipsnw2dKTDlFHSQC4kRstD5ee1f7Qu
 8a95CdElnHbIKA/sxKfZBEEDrJZRHXf3tzL3P8Bj6RRQRG7z2XzwREIZb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362668520"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="362668520"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812016290"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="812016290"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:34 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 20:01:16 +0530
Message-Id: <20230713143121.3901357-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/5] D3Cold Policy
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding Xe d3cold policy support.
v4 -> v5:
- Fixed kernel-doc warnings to make CI happy.
- Fixed some cosmetics review comment.
  changes has been described in patch 3,4 and 5 commit log.

Anshuman Gupta (5):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: Toggle d3cold_allowed using vram_usages
  drm/xe/pm: Init pcode and restore vram on power lost

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 86 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 26 +++++++-
 drivers/gpu/drm/xe/xe_guc.c          | 27 ++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 62 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pm.c           | 95 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  6 +-
 9 files changed, 295 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

-- 
2.38.0

