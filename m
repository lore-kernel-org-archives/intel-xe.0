Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59A606A329
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AgoaBLFM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D433F10E224;
	Sat, 14 Nov 2026 08:39:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2158010E224
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794645553; x=1826181553;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cyDTriHxGUOl9oxZyn533B/2vhGRtk+YVvygcqI0AAI=;
 b=AgoaBLFM3sLziq8w6O6NPWzBCDdk178qF+g5IbUBTWktvVOjF0YlhR/1
 nbhK5cqepa7qVMMzat0IeXI+5NwrYh3W3sMBGf/I+I/KOmsjHlRkfzrUK
 Q/ZhlhV6CQJQ0p34mAFqw1ZmxaLsSFFZc3fTxzyuTY05htI1Q7r7Jbdj3
 E+XiVNBKGvDNX19D47ngxoa/4Lfx6feHhyoHBbeJD6KwV7t0wroiM+kaq
 eiIMxlkQX/3ZX3c7cx2NN6ahBQmD0CxBk/FW0BrTu17mcTsRTB6z59OTJ
 OlxfjmQmaP64XvZE64ZJUFIrugB9qy8vApnNBFcZg1yxQWtZtcmDJSdkU w==;
X-CSE-ConnectionGUID: HgMtc9vRSd+5ZNZydR+ixg==
X-CSE-MsgGUID: yZzS8yyvQjinkxRofxG7Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3527290"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3527290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2026 00:39:13 -0800
X-CSE-ConnectionGUID: oImFjIlfTCWWhweHgyr+UQ==
X-CSE-MsgGUID: AsvKQ0dpTj2iBj4IKhrv4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9291395"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2026 00:39:12 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] CI-ONLY Fix VM teardown and migration queue recovery
Date: Sat, 14 Nov 2026 14:08:55 +0530
Message-ID: <20261114083859.1007095-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Arvind Yadav (3):
  drm/xe: Hold a device reference across deferred VM destruction
  drm/xe: Mark VMs as closing before queue cleanup
  CI-ONLY:Defer VM teardown until exec queue cleanup

 drivers/gpu/drm/xe/xe_device.c     |  24 +++-
 drivers/gpu/drm/xe/xe_exec.c       |   9 ++
 drivers/gpu/drm/xe/xe_exec_queue.c |  27 +++-
 drivers/gpu/drm/xe/xe_pagefault.c  |  87 ++++++++++---
 drivers/gpu/drm/xe/xe_svm.c        |   3 +-
 drivers/gpu/drm/xe/xe_vm.c         | 191 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h         |  14 ++-
 drivers/gpu/drm/xe/xe_vm_types.h   |  14 +++
 8 files changed, 326 insertions(+), 43 deletions(-)

-- 
2.43.0

