Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F2606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F2lVZwXw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E75810E334;
	Wed, 21 Oct 2026 16:25:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CFC10E334
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599929; x=1824135929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QBcLlHzOjgEV+Hp665Y6MS6+lfcM1/pdPPkqOtLMxFw=;
 b=F2lVZwXwf0Ups6LD8NZOxSSbbtj6A+Eu4lXdikUSwLBOWlJhB8wyl4pO
 SYjkQhDTYlgBub6NvxA9uKrCx6aNaaK5mtGzp6KuFw0ZMvQrCNTb7VHPV
 DWgVpvpVdAnsIggstsYHcKNWDEj3pUgqg8QieZ+g0P/poNkPjzUgD0KTc
 wJUK5vcLNgBkyoE2ehtIBGJ6+vDTfy6QWC49OMmsii5mCEYJRXLSrghDg
 emzvM3wnwKuXL/r7G53rPmj5RBv/F0e3QmKssaCeY0bg2Hf9lBw8ih5vP
 N3K84GufSv4wAkQYV9qf3KBWl0lEtslg78gci6l52+HaZ3vtc/FswZijE Q==;
X-CSE-ConnectionGUID: Z+llj2BVQXq7VXDsLoVnpg==
X-CSE-MsgGUID: 7GLutlT0QUKxDx/aFnBE8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428249"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428249"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:29 -0700
X-CSE-ConnectionGUID: 3y1rGNmMQB2F/ifXME7Abg==
X-CSE-MsgGUID: iYLO75UdTHG8ZnmlMLQtlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468891"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:25 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 0/5] drm/xe/cper: Software (driver-detected) CPER error
 reporting
Date: Wed, 21 Oct 2026 21:55:08 +0530
Message-ID: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series wires up CPER record generation for driver-detected
(software) errors, i.e. the INTEL_SIGID_GPU_XE_SOFTWARE_START..
INTEL_SIGID_BATCH SIGID range, alongside the existing RAS-counter-
sourced (hardware) CPER path.

Patch 1 is a prerequisite carried over from patchwork series 169692
(https://patchwork.freedesktop.org/series/169692/), included here only
so the tree compiles; it is explicitly marked DO NOT REVIEW and is not
part of this submission.

Badal Nilawar (1):
  Add CPER logging support for CRI-Do not review

Mallesh Koujalagi (4):
  drm/xe/cper: Add driver error classification definitions
  drm/xe/cper: Let caller initialize error_class
  drm/xe/cper: Add CPER support for software errors
  drm/xe/log: Add software CPER KUnit test

 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/tests/xe_log_kunit.c       |  94 ++-
 drivers/gpu/drm/xe/xe_cper.c                  | 616 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 226 +++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 249 ++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++
 14 files changed, 1418 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.48.1

