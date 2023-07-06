Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364BEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 12:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB210E502;
	Thu,  6 Jul 2023 12:03:35 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436FF10E500
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 12:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688645014; x=1720181014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f7IIFsUe/QwfHsUxJ7HJ9DtaiCEhi+RhSEQo0ozz8vQ=;
 b=fPa2r43JA91Ec24yAw2Ectu/NmDKwCmCgYTOusbhsFKQMtxzKeQ6SomM
 z+FI0Nrowmcfe3FRr30AzYrCORUdX+urcziT9kuczZoSh8cQvDRfc1BZj
 Gtu79l07vfLajLwa+zoRj2w3zK7P2f3jwFGdqDMReFXBww6z+eYpQV7km
 2bOJPDTlBVioUWssa8yMCs29ReOF6sQgurG6zn6vJHWmqp2jBLk+qwEwV
 tnYgWKOn4RYGi1AiNsf7x1Pv9qxW9M3VktYTU1eHzYF8SYAFonBGjEUcG
 QU2ph/63doYb165TaaZQPnb51kVRYW6Kn180qGtG1bqpNZ+S560R7j4KK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449942876"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="449942876"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843663397"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="843663397"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:29 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:32:03 +0530
Message-Id: <20230706120208.2828158-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/5] D3Cold Policy
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
v3 -> v4:
- changes has been described in patch 3 and 4 commit log.

Anshuman Gupta (5):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: Toggle d3cold_allowed using vram_usages
  drm/xe/pm: Init pcode and restore vram on power lost

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 23 ++++++-
 drivers/gpu/drm/xe/xe_guc.c          | 17 +++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++-----
 drivers/gpu/drm/xe/xe_pm.c           | 98 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  6 +-
 9 files changed, 275 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

-- 
2.38.0

