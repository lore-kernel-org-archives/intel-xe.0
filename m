Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433B0CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FBC112057;
	Fri,  9 Oct 2026 10:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJRIZhwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADDC11204D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541751; x=1823077751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4FPZdeceIX6T4qurVQOGFytQrJ2RnEuwVxA5AQEp0eE=;
 b=QJRIZhwx5SBZ5itvhDZTdBEHXuST6yRCRIM3V6emCp678P3mIDGAgcEy
 uwIdQvsGcErNfiqju4+50Myd4IkxytqbGf6dqA63jVMuRc2nFpkPMLL5G
 bcrlu38rt2ABm/0ShrJDHZsb3eAqZFcymataC+xUVDV+DmMMqHm0/j7xx
 NK4anBxSoaAZKug/h5Y9pmPfKHGmIjPTTFEK97imgOJOWlVGyWL35ZvvY
 5Z+Y/rnYn98sEaJDYSTFTzsUbp8cBtQKcby+nVsfg74a6Dgt4U7b0H98d
 dDzIOxk0V8S72YtlqAc51spBSyS/gC02i0OSRei7qQ+VZ0lBZPjUmAylN g==;
X-CSE-ConnectionGUID: 1uDxT80ZRtim8PuIwMnLkQ==
X-CSE-MsgGUID: 2HcyAqb0Q4Sjs+wjt17DhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344056"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344056"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:11 -0700
X-CSE-ConnectionGUID: xyySpupJQmuk5oL9sMM6hQ==
X-CSE-MsgGUID: /HBja5ScQAKm5HCtv9lWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025539"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:07 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 00/12] Add CPER logging support for CRI
Date: Fri,  9 Oct 2026 16:16:03 +0530
Message-ID: <20261009104602.1075405-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

This patch series adds CPER (Common Platform Error Record) logging support
for Correctable errors reported by Intel Xe GPUs. CPER logging is done
through trace event.

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

Badal Nilawar (12):
  drm/xe/cper: Add CPER reporting entry point for xe_log
  drm/xe/cper: Retrieve the error counter record for CPER reporting
  drm/xe/cper: Initialize Intel-specific error section header
  drm/xe/cper: Construct CPER record for hardware errors
  drm/xe/xe_ras: Add support to retrieve info queue data for CRI
  drm/xe/cper: Prepare Intel CPER error info records
  drm/xe/cper: Log CPER records for aggregate counter retrieval
  drm/xe/cper: Emit cper record to trace buf
  drm/xe/xe_ras: Report device memory errors using SIGID
  drm/xe/xe_ras: Report core compute errors using SIGID
  drm/xe/xe_ras: Report soc internal errors using SIGID
  drm/xe/xe_ras: Report correctable errors using SIGID

 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/xe_cper.c                  | 530 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 185 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 254 ++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
 13 files changed, 1202 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

-- 
2.54.0

