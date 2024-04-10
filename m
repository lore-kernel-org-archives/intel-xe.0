Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4758CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B4711341D;
	Wed, 10 Apr 2024 17:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kY4gr+QR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3DA10E7E8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712768641; x=1744304641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X2nEralu350+F3f36h+7TSkZKQ2eZFuPLwwZgowHhRQ=;
 b=kY4gr+QRTAVd9c2RjVHWwSb+iG2hVeoJXvcV4j1I0Dil1sHH8uwwDtA9
 yws9Lt5Jm4xpFLun4Ftw6ecAA/VJZLOrF6UPEObirU7y40hJkNpykAXBP
 olOQbAuhb23X4r+VeHXNTYNHaF2ccVfiu/iwcwlqUDg8DjCgOVLojGffr
 zFry+2z0FpYMhGBpIzzMiiopNGcNo6Bn3h1g49WNt6yrk+zMqSqOCbsRo
 l75FkckMhk7ggFiqdRtAKH6U8wLDHxp1JGwlEGR1JaPAhSJVMe57uypst
 d6SimlkQ8rLrCXYcOeCPWLaVNTdPhytkKJsZOpsoDnwCc8kwvSNR9UZkJ w==;
X-CSE-ConnectionGUID: WR5mksMkQX6qTACa1AOH6g==
X-CSE-MsgGUID: T5N/wFNiS0io0M5ZPg3ONQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18707629"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18707629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:04:01 -0700
X-CSE-ConnectionGUID: lnqGd+iQTBWWzib+jfORsQ==
X-CSE-MsgGUID: cbDxu5SxSbS/dOoEdrcMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25401926"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:03:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/5] PF: Add support to configure GuC SR-IOV policies
Date: Wed, 10 Apr 2024 19:03:33 +0200
Message-Id: <20240410170338.1199-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: kernel-doc fix for PF helper (CI.Hooks)
    typo in GuC ABI doc (Piotr)
    prefer xe_map_memcpy_to (Piotr)
    fix xe_device_mem_access_put (Piotr)

Michal Wajdeczko (5):
  drm/xe/pf: Introduce mutex to protect VFs configurations
  drm/xe/pf: Introduce helper functions for use by PF
  drm/xe/guc: Add PF2GUC_UPDATE_VGT_POLICY to ABI
  drm/xe/guc: Add helpers for GuC KLVs
  drm/xe/pf: Add support to configure GuC SR-IOV policies

 drivers/gpu/drm/xe/Makefile                   |   2 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  47 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h   |  35 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 417 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  25 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  31 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |  21 +
 drivers/gpu/drm/xe/xe_gt_types.h              |   7 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       | 134 ++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  51 +++
 drivers/gpu/drm/xe/xe_sriov.c                 |   7 +
 drivers/gpu/drm/xe/xe_sriov_pf.c              |  15 +
 drivers/gpu/drm/xe/xe_sriov_pf.h              |   6 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h      |  46 ++
 drivers/gpu/drm/xe/xe_sriov_types.h           |   4 +
 15 files changed, 848 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h

-- 
2.43.0

