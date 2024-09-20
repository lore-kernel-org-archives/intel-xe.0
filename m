Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1EC78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9DD10E835;
	Fri, 20 Sep 2024 14:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTXmv/bW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A2C10E835
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726841359; x=1758377359;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jYxIwD7KauZVmbGXyUeGJIqmXreWgRdUL2ZIDE+gQ2s=;
 b=BTXmv/bWRWSLoIRQh+r3vCvJz4w1fl/RjuFBtSHlzrWt9W9vuvTD5YoG
 T3QeGLTlLtC1+MdkUdpHK/XG8KfHgR8m7ns2MO+LUeRNZVnE1yt/vB4m5
 O8DdluhQFCLFIlT5ojAOKY9vKBGgLZvycLlAepp/8xXCQ7hV6rMgc6ro6
 VGza71c+NKnaEbtIjjCSyzi1/Qx3V5b7gKsXDPWgbKcHoZlW0WETUuRhz
 rldlMYZsRY2i5k9bi9RBufVoBd4xMTap0kkLdV++f6V4XDAYX8K7Jrlaj
 WiOKvBoA1CNhLcd+1jA7Hvt5yB9FKdBANb4npqs8YIwsH4sUJPjazdq/o Q==;
X-CSE-ConnectionGUID: tT9JPuc+SyufjRvAeOX1TA==
X-CSE-MsgGUID: spsoibYLRKiGMlSkwRx98g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43368328"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43368328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:18 -0700
X-CSE-ConnectionGUID: oEedwOPfRBqYa6oRkIB8kA==
X-CSE-MsgGUID: PW4I3/aiRoelVDauILI+Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70182541"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:09:17 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [CI 00/12] Debug g2h timeout issue
Date: Fri, 20 Sep 2024 19:59:10 +0530
Message-Id: <20240920142922.618649-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Do not review

John Harrison (10):
  drm/xe/guc: Remove spurious line feed in debug print
  drm/xe/devcoredump: Use drm_puts and already cached local variables
  drm/xe/devcoredump: Improve section headings and add tile info
  drm/xe/devcoredump: Add ASCII85 dump helper function
  drm/xe/guc: Copy GuC log prior to dumping
  drm/xe/guc: Use a two stage dump for GuC logs and add more info
  drm/xe/guc: Dead CT helper
  drm/xe/guc: Dump entire CTB on errors
  drm/xe/guc: Add GuC log to devcoredump captures
  drm/xe/guc: Add a helper function for dumping GuC log to dmesg

Michal Wajdeczko (1):
  drm/print: Introduce drm_line_printer

bnilawar (1):
  [For CI] Debug prints/logs to debug G2H timeout issue

 drivers/gpu/drm/drm_print.c                   |  14 +
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
 drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
 drivers/gpu/drm/xe/xe_device.c                |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                | 416 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
 drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
 drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
 drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
 include/drm/drm_print.h                       |  64 +++
 17 files changed, 804 insertions(+), 144 deletions(-)

-- 
2.34.1

