Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459C5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TKY4dlmr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1490E10E528;
	Fri, 23 Oct 2026 04:17:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E6B10E528
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729041; x=1824265041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Yw600GCZlHwQcv+DhIxAl0SJ1RE3/4T/XgP2hs9PIo=;
 b=TKY4dlmr0ERZSvSv7NKF8ON8XyKLYZeme7G7yP9GtUPE4tbkkxgQAEF6
 efmLGQy+gJvVk5tEk+R03xNm1QwH67wJEjEaRSfW2rRfRRGzuW+d0DFgJ
 x/3hOJ68vOP2UsPm1+cl7DXG5DMs1eJ+cUST+WfPe9PBGmLrZzJ/xO0eD
 gNJKvuVVVuvgnI9Oq492u3UWtSH668S1T00dklJCUN0/EwlOfdGi4/3xR
 mGWRjDKdsqtwl/W5X+8nsTjmUYFhVzDykFlsPJ2hlQraHCU6Aox4G971t
 WAT9kDsXL7tvtjjJ5gIRcUuRMEBnEHRsl53QJweNqIT7AbnEvsk98hu5t A==;
X-CSE-ConnectionGUID: Dg2w+ny/T6qVI3r0w9yi/Q==
X-CSE-MsgGUID: vc3UAXjHSw6SxZxtFxkP1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383444"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:21 -0700
X-CSE-ConnectionGUID: Z+sIEE/wRrG96QWk5NUf0g==
X-CSE-MsgGUID: D7+EEAR8RpqvOZ58Hz74pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658221"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 00/13] Add CPER logging support for CRI
Date: Fri, 23 Oct 2026 10:04:22 +0530
Message-ID: <20261023043422.681260-15-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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
 
Badal Nilawar (13):
  drm/xe/cper: Add CPER reporting entry point for xe_log
  drm/xe/cper: Retrieve the error counter record for CPER reporting
  drm/xe/cper: Initialize Intel-specific section header
  drm/xe/cper: Construct CPER record for hardware errors
  drm/xe/cper: Log CPER records for aggregate counter retrieval
  drm/xe/cper: Emit cper record to trace buf
  drm/xe/xe_ras: Report device memory errors using SIGID
  drm/xe/xe_ras: Report core compute errors using SIGID
  drm/xe/xe_ras: Report soc internal errors using SIGID
  drm/xe/xe_ras: Report correctable errors using SIGID
  drm/xe/xe_ras: Report unknown errors using SIGID
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/xe_cper.c                  | 558 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 162 +++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 288 ++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 116 +++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++
 13 files changed, 1241 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.54.0

