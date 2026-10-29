Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CF606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KF9v05lC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F175C11229D;
	Thu, 29 Oct 2026 13:26:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AC411229D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280380; x=1824816380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bg67KE3qqObwBkvd4REW9Uw4gXQ3ojncApkreqhY/Jg=;
 b=KF9v05lCa6C0OUdKg8V5rgrjc/FfNjWjf0Sma12kNjgTutifo7KXmIOd
 nGkFJ2Rbe2aM9O+P9qz2lQSb18lRYs5nR6YSYhZ2h8USxDkmuW2pqoW2a
 yV16A9lWtyUBujtUwimbXjWEoYjdoZ8O5DLkQmTBS33ORwc5FO1Dm0PIC
 U+MMz5qXgIAHE84KWADTxGc1fs6ERBtysIdEcoAw/Af5H3r3YwxYIi4KX
 nKF+MKq1R6rp89UT8oiy+tEjMxN76rDZKuOhrHHZVRlVTDSMHE0f6YyyA
 gLuBgVgblS88duoJ7hCTbWHWZEA8jJ9ZgZIQBMDxvr7mh5GTqHoKEmFyO A==;
X-CSE-ConnectionGUID: zIJkgOONQOeJMovjpXLW5g==
X-CSE-MsgGUID: MPGH7G1bRPqv9OjxmPYUdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900312"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:20 -0700
X-CSE-ConnectionGUID: 9tufdIYWTrKaUohVeim6Ug==
X-CSE-MsgGUID: tb8UumPCSIWSVFay0Khx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691661"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 06:26:16 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 0/6] drm/xe/cper: Software (driver-detected) CPER error
 reporting
Date: Thu, 29 Oct 2026 18:56:10 +0530
Message-ID: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
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

This series wires up CPER record generation for driver-detected
(software) errors, i.e. the INTEL_SIGID_GPU_XE_SOFTWARE_START..
INTEL_SIGID_BATCH SIGID range, alongside the existing RAS-counter-
sourced (hardware) CPER path.

Patch 1 is a prerequisite carried over from patchwork series 169692
(https://patchwork.freedesktop.org/series/169692/), included here only
so the tree compiles; it is explicitly marked DO NOT REVIEW and is not
part of this submission.

v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

Badal Nilawar (1):
  Add CPER logging support for CRI-Do not review

Mallesh Koujalagi (5):
  drm/xe/cper: Add software error classification definitions
  drm/xe/cper: Decouple RAS error class initialization
  drm/xe/cper: Support software CPER records
  drm/xe/log: Add software CPER information to KUnit output
  drm/xe/log: Test software CPER emission parameters

 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/tests/xe_log_kunit.c       |  94 ++++-
 drivers/gpu/drm/xe/xe_cper.c                  | 360 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 141 +++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 148 +++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
 12 files changed, 857 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.48.1

