Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AD7606A320
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EfMOg+gX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F85F10E621;
	Wed, 28 Oct 2026 09:57:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF3C10E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793181452; x=1824717452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fd02hL43OE52iYjEDV3OxpYdI7QY/uLdpj/uoRKvB3Y=;
 b=EfMOg+gXu8QM5f5xHFxUNpxsc/bHvBRt7R5ba+0MuNpuFL4XzpIo0vj5
 U8G33XpjxC5eDTHYVKoQKeHSDrAhu/nmmW95IUg/4I6hscvlQNHDxhrIw
 lhI9AGHZljHe5R9lNgj3noa3RA84HKFCTkDtARWH7G/VITSrc9USN1STW
 2w9uSz2Sh/pwgXqiow+2IzIG4kL648Y7YtGX35tAbLarIWfOcS5Su0Zle
 AGKTnC4Gruc7OnJR9lIeieAfiN9cVqP1MhkJYw4uuoe9Slas9ZVnVGHUP
 XUhszTFZjeKIe2kI9eMrNbzcSPfOt8gSCzXl3dqQ1wyQRle7/wHzIqIXR g==;
X-CSE-ConnectionGUID: r+zadIS8R8+rqjfw0yc9pQ==
X-CSE-MsgGUID: NDRpjr6gTUiiUFUnuDlcGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1913933"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1913933"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:31 -0700
X-CSE-ConnectionGUID: 6IKfEN+3R6y1K5yqEjpAAg==
X-CSE-MsgGUID: qrKIK8EER+qewV0f28degQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4782726"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 02:57:28 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v6 00/10] Add CPER logging support for CRI
Date: Wed, 28 Oct 2026 15:27:24 +0530
Message-ID: <20261028095723.734387-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
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

This patch series adds CPER (Common Platform Error Record) logging support
for RAS errors reported by Intel Xe GPUs. CPER records are emitted through
a trace event.

v2:
   - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
     request
   - Log CPER records via xe_log SIGID infra 

v3:
  - Added the patches in incremental order (Raag)
  - Fixed Sashiko warnings which are applicable 

v4:
  - Split the patches further for incremental review (Raag)
  - Refactor info queue handling (Raag)
  - Fix applicable Sashiko warnings

v5:
  - Fixed v4 comments
  - Covered default paths in error handling flow
  - Moved info queue related patches at top
  - Added example logs

v6:
  - Fixed v6 comments
  - Dropped the Info Queue patches; they will be submitted separately
  - Dropped "drm/xe/xe_ras: Report unknown errors using SIGID" as
    SIGID logging is not needed for it (Riana/Raag)

Badal Nilawar (10):
  drm/xe/cper: Add CPER reporting entry point for xe_log
  drm/xe/cper: Retrieve the error counter record for CPER reporting
  drm/xe/cper: Initialize Intel-specific CPER header
  drm/xe/cper: Construct CPER record for hardware errors
  drm/xe/cper: Log CPER records for aggregate counter retrieval
  drm/xe/cper: Emit cper record to trace buf
  drm/xe/xe_ras: Report device memory errors using SIGID
  drm/xe/xe_ras: Report core compute errors using SIGID
  drm/xe/xe_ras: Report soc internal errors using SIGID
  drm/xe/xe_ras: Report correctable errors using SIGID

 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/xe_cper.c                  | 318 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 110 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 142 ++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
 11 files changed, 687 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.56.0

