Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46B606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A3csBtYv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFB10E444;
	Thu, 29 Oct 2026 08:28:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83AE10E444
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262483; x=1824798483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yAvQ2WYwpzxGxh1fNBp4pVxNa5+t8Fv9o2Rgy9EAJ74=;
 b=A3csBtYvaKN2R/t4K+HU8ICnR7jaPcoSMnWxc9EnusfgK7m9RpS/AksY
 jmg1JmFjTU7upKNYVuazvxNowwcg8OUb8rM5tPLgeK3M42nxD1LrWt36L
 einWjZOI/AVA5ei+//EV8g0S0Sk0PXG4yCP1UWQLXPODkBgWWQ8PVWOcB
 aWGhi8IgZoQnnAwqTa0jrYfZwyTJ4IDcUQDAV9IQ0XDsx5a3VLCxsJFm8
 WXGtAQad5LOIxtGwWT/Ykr3bUgtusiLzitI61Tx69P1RX1qyhnlEXNm5q
 FEq7f5pDxrPzNV1zIQaC/H3iYZFD2IQzEzMxHVvxBnZT8Gccys9hYqS4J g==;
X-CSE-ConnectionGUID: i0XqwE5bRa2ngVa6NbJj1A==
X-CSE-MsgGUID: JgPC8ttzTaKOmic40buYdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2014666"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2014666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:28:01 -0700
X-CSE-ConnectionGUID: qzb7/AAhT0WzE3hN8Hb8Yg==
X-CSE-MsgGUID: kFCSGHVTTfyL3GlqzaQSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5166301"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:27:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v7 00/10] Add CPER logging support for CRI
Date: Thu, 29 Oct 2026 13:57:53 +0530
Message-ID: <20261029082752.1739281-12-badal.nilawar@intel.com>
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
v7:
  - Rebased
  - Fixed Sashiko comments
  - Added GUID of PCIID 6752

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
 drivers/gpu/drm/xe/xe_cper.c                  | 321 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 110 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 146 ++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
 11 files changed, 692 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.56.0

