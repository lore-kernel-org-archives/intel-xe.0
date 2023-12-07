Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B46EC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D8810E899;
	Thu,  7 Dec 2023 12:50:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFFA10E899
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953439; x=1733489439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=btDz54/82tEm5Y/kGnJ3noMx/j9xUV1Ugxh135p0sXA=;
 b=VUznpJe1TqWyPOBoXaLCdnCfSG/YXibvTu/zh4izJXDu+qE4tlFfyvYP
 1Sc5findfUAwp3Y/wwwZ2jTzEL4d+F8OWrcuTorS3JSqtGb0JHzNxUD3M
 fQR8vCHRFgC2Jpqfmpf4sUjag0ML/RP3v87tid/Ums7g8iGk+qv91VCvL
 LzQpQqgp8enKIikZ5DEblDaMgOzmToPnSd6NKJMtba5gYh42EpzXW8kPn
 YiXbSgil0Z0t6es1JVpYc5RvJZTm89POAjYlf5oKBK/1BDEVOHKxTKpAz
 9IjNgik1YJIwuX2Wkx/CP5+LqB2TxCC1UslQr+vXP1rxPJMbndNg22X0t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051367"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692649"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/8] Engine Busyness
Date: Thu,  7 Dec 2023 18:27:54 +0530
Message-Id: <20231207125802.3730165-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

GuC also provides a periodically total active ticks that GT has been
active for. This counter is exposed to the user such that busyness can
be calculated as a percentage using

busyness % = (engine active ticks/total active ticks) * 100.

This can be listed as

sudo ./perf list
     xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
     xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]

and can be read as

	sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/,xe_0000_03_00.0/total-active-ticks-gt0/  -I 1000

v2: rebase
    fix review comments

Riana Tauro (8):
  RFC drm/xe: Move user engine class mappings to functions
  RFC drm/xe/guc: Add interface for engine busyness ticks
  RFC drm/xe/guc: Expose engine busyness only for supported GuC version
  RFC drm/xe/guc: Add PMU counter for total active ticks
  RFC drm/xe/uapi: Add configs for Engine busyness
  RFC drm/xe/pmu: Add PMU counters for engine busy ticks
  RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
  RFC drm/xe/guc: Handle runtime suspend issues for engine busyness

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c          |  19 +-
 drivers/gpu/drm/xe/xe_gt.c                  |  26 ++
 drivers/gpu/drm/xe/xe_gt.h                  |   3 +
 drivers/gpu/drm/xe/xe_guc.c                 |   7 +
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 367 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  21 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  15 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  25 ++
 drivers/gpu/drm/xe/xe_hw_engine.c           |  50 +++
 drivers/gpu/drm/xe/xe_hw_engine.h           |   3 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 189 +++++++++-
 drivers/gpu/drm/xe/xe_pmu.h                 |   2 +
 drivers/gpu/drm/xe/xe_query.c               |  23 +-
 include/uapi/drm/xe_drm.h                   |  24 ++
 16 files changed, 726 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_busyness.h

-- 
2.40.0

