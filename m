Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD9CC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E7B89CD3;
	Wed,  7 Jun 2023 11:05:35 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A96089DA9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686135933; x=1717671933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mlHWVbUflfnkjuJrHHY5mUwwQEq1OGU5XMCR70WBoTM=;
 b=f+WLKZnxFn61PQpdDd00jWd/tM2BpsXLQSpP7qevD2FLMNmwE4T554wW
 gqh3ngv7ucyjK1LsdYDblk9JyqGYv5l+17ofJBRuo9pz4AOKzDEPHFHJa
 9aKdj/iNnCAc+iQTFvR1VJSvIUrhIroiL1tPVXD8MIkgG2BNhK/oMhcSR
 yTGv4Ct+zhHVUaEKqtPJGIQDJXyM99PEaMz5oMYc40KwpZbLe+Jglb05W
 ZTwZ1x5QLFbqnMJHyY2f2kgu+P4Pp1EpsoyUKKRk4T4WQfQxa0TmH7HrY
 +plrXsizypVe1vo3CEwGfgMSg1COtc2e+B5QdYkXQceH076g/pvEx4nrF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420512473"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="420512473"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703593427"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="703593427"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:30 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 16:33:23 +0530
Message-Id: <20230607110328.3739706-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] D3Cold Policy
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe d3cold policy

Anshuman Gupta (5):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: Toggle d3cold_allowed using vram_usages
  drm/xe/pm: Init pcode and restore vram on power lost

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c |  76 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h |  13 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  23 +++++-
 drivers/gpu/drm/xe/xe_guc.c          |  17 +++++
 drivers/gpu/drm/xe/xe_guc.h          |   1 +
 drivers/gpu/drm/xe/xe_pci.c          |  53 ++++++++++----
 drivers/gpu/drm/xe/xe_pm.c           | 100 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |   6 +-
 9 files changed, 267 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

-- 
2.38.0

