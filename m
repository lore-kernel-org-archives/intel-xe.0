Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7CE606A32E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=awEhKW3i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C758710E010;
	Thu, 26 Nov 2026 13:57:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4445310E010
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795701465; x=1827237465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ep7pGDzHHZ7C5QKmDb2D/0PZDlpfWuF/NYcdjp/wFew=;
 b=awEhKW3iut8QKfw/fJxB/ZQUTEehX8WkAW8HagSAB1Ff7ZvhBkA1B9og
 hrk7F3v9MW6SHVu/IMz2ooZCmdX4zMPaHl+OrFdJBGfnZuY0reNKflgKX
 tfWTFexnhDImjGLr8L7OoALPVptqTyP9C+2EcD+3B4j4ZfBK4QCkxkQPG
 MJIUQ+OtRdxr8BB4ZZRxtgK4t5ejgiMUiLjE65pcx7AUztNX+KAni3Cw/
 VipO0F4ljdj7COlReM+DjRURQ1B4rWUhcxUhFYBIs457ewvuGP35VPIUW
 pYgVogaKltyOWc9Okz/FCA61yJ8wsCGvDdmgSkElMDEz++NNGu/fVxCZv g==;
X-CSE-ConnectionGUID: 6CPheANvTX+l9UDKS0gW4g==
X-CSE-MsgGUID: FMCqXehwTNCoiqnBqLg4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4520584"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4520584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:57:44 -0800
X-CSE-ConnectionGUID: Ol4A+7pOQzazo7sQNWAPjg==
X-CSE-MsgGUID: ZHVqPRdbTQ29aZtaU28Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12684391"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 05:57:41 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v1 0/6] drm/xe: Support xe_log_* helpers in atomic context
Date: Thu, 26 Nov 2026 19:27:32 +0530
Message-ID: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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

xe_log_* currently uses GFP_KERNEL for CPER allocations and cannot be
safely used from atomic context.

Add atomic logging helpers and pass GFP flags through the CPER emission
path so callers can choose the appropriate allocation mode. Convert the
existing atomic-context users to use the new helpers.

The series builds on top of:
https://patchwork.freedesktop.org/series/176576
The dependency is included only so the series compiles.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>

Mallesh Koujalagi (6):
  drm/xe/cper: Software CPER-Do not review
  drm/xe/log: Add xe_log_* logging helpers for atomic context
  drm/xe/cper: Add gfp argument to xe_cper_emit()
  drm/xe/tests: Update log tests for atomic logging support
  drm/xe/pagefault: Use xe_log_err_atomic() for queue full errors
  drm/xe/guc_ct: Use atomic logging under ct->fast_lock

 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 143 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.c            |  84 +++++++++++---
 drivers/gpu/drm/xe/xe_cper.h            |  10 +-
 drivers/gpu/drm/xe/xe_cper_types.h      |  39 ++++++-
 drivers/gpu/drm/xe/xe_device_types.h    |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c          |  24 ++--
 drivers/gpu/drm/xe/xe_log.c             |  30 ++++-
 drivers/gpu/drm/xe/xe_log.h             |  61 ++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c       |   2 +-
 drivers/gpu/drm/xe/xe_pci.c             |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
 drivers/gpu/drm/xe/xe_printk.h          |   3 +
 drivers/gpu/drm/xe/xe_ras.c             |   3 +-
 13 files changed, 369 insertions(+), 35 deletions(-)

-- 
2.48.1

