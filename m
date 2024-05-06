Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E0C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107AA10E7C7;
	Mon,  6 May 2024 13:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WJOvK3N5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8277E10E7C7
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002709; x=1746538709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YGFTjkxWCiPqruop5HrEB+DMRurAGXoylLuc8cYnwHQ=;
 b=WJOvK3N55UMLwfwSvqOYopZL6uGjGjh5I4QXtdu+Ysq05DYtn1CP0UD4
 lln9C7To+gVymTSRoi8chagtb2wlH4Hq4G9XwNtovWxOKfQD7n7JR86Lo
 1/5k2jDzouOapaeRDEqKkOAYfPKo8eAMZ1Jd8JKsDOq3M59oU8r5OxJmN
 noNq8SVwb+KWN3nAi9P7wPq+74oCTXsScunuCKXWSJfhUGpL//cUGUYyi
 n/cH/Met1gQTsAEnouVli8r4JTnO2geZS62bMx7BHBwXH2razWsR+cm5+
 Bzqk0/8iNdNeO3QW147shc9wzJEmA1032pB4khzV+arZ1o+cZ3Z454end A==;
X-CSE-ConnectionGUID: VGnhdHOdRZ2FvRO1qpuuAw==
X-CSE-MsgGUID: ulvXvnkaQSqD+MIucaOURw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903415"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903415"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:29 -0700
X-CSE-ConnectionGUID: jASddpbwTcu/onIYUuGnpg==
X-CSE-MsgGUID: 9/1d7/vJTFGgR7GMN7xQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131649"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/8] PF: Support for adverse events notifications
Date: Mon,  6 May 2024 15:38:06 +0200
Message-Id: <20240506133814.2571-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The GuC firmware monitors VF's activity and notifies the PF driver
once any configured threshold related to such activity is exceeded.

To avoid having to rewrite a lot of code for each threshold and to
be prepared for any new GuC threshold additions, where possible,
use macros to generate threshold specific code.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Michal Wajdeczko (8):
  drm/xe/guc: Add more KLV helper macros
  drm/xe/guc: Introduce GuC KLV thresholds set
  drm/xe/guc: Add support for threshold KLVs in to_string() helper
  drm/xe/pf: Introduce functions to configure VF thresholds
  drm/xe/pf: Allow configuration of VF thresholds over debugfs
  drm/xe/guc: Add GUC2PF_ADVERSE_EVENT to ABI
  drm/xe/pf: Track adverse events notifications from GuC
  drm/xe/pf: Expose PF monitor details via debugfs

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  30 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  87 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   6 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  79 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c   | 143 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h   |  27 ++++
 .../gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h |  22 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   9 ++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  15 +-
 .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    |  58 +++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  65 ++++++++
 15 files changed, 554 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h

-- 
2.43.0

