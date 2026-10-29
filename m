Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4067D606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wox9rjJU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022B011221C;
	Thu, 29 Oct 2026 11:37:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7311221C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273822; x=1824809822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OIuL0JQbpvQMUW01VhJIkMCy4WoOua3WZ0hEssJtdwY=;
 b=Wox9rjJUgv50HAY3sd3imx76sifJLDu4V+qBaNKhqtWTH7qOxPQuy4Dn
 Te3W0eXFtALgKRrBkVxWUfiG3unG0qDgCD8y2Bnh6r3BifaQP0og7dj0b
 9EwSMFgSoxgzcd7F1yrh6fk+P0zFGialT4O1ZkZ0ZtI/Wv8baljt9beKW
 DMrG5/xadqy97x7lXLwFGYb/Nk6nKFqrUoZ3v5DC9Ufhmxl2HDCe+Ziom
 tfiZaKSuFwy05z4iJXYlnrBVjQ+2BDQb4NAq0APWbLr4GahMjThmYaAP1
 +cakzBR5XvdiPbLCsfB1B1OqfCLPHReS22ky7xylXaR8rQZbKaOIlJEzO Q==;
X-CSE-ConnectionGUID: 66lMu8FyQOW20gQVqSafXg==
X-CSE-MsgGUID: gAw3YzLYTcCVgJW47hf08Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2026488"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2026488"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:37:02 -0700
X-CSE-ConnectionGUID: V8PVylc9QcmWr9BXTi8BcA==
X-CSE-MsgGUID: DrYeP9zHT/ye+XUolvLQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5659041"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:36:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 00/10] Add CPER logging support for CRI
Date: Thu, 29 Oct 2026 17:06:54 +0530
Message-ID: <20261029113653.1860286-12-badal.nilawar@intel.com>
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
  - Fixed v5 comments
  - Dropped the Info Queue patches; they will be submitted separately
  - Dropped "drm/xe/xe_ras: Report unknown errors using SIGID" as
    SIGID logging is not needed for it (Riana/Raag)
v7:
  - Rebased
  - Fixed Sashiko comments
  - Added GUID of PCIID 6752

v8: 
  - Address v6 review comments missed in v7 (Raag)

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
 drivers/gpu/drm/xe/xe_cper.c                  | 322 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 110 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 148 ++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
 11 files changed, 695 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.56.0

