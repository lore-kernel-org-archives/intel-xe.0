Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064CCC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 11:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8CE10EC69;
	Thu, 16 May 2024 11:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsJNUInm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7F410EC69
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715857562; x=1747393562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XPVwkxxP6xLP6A+NNfVvCwGw/cB2thPVyMBL/ixaaWg=;
 b=SsJNUInmmxOKhduxXDLGrCh0mHGbCkV7KsSl1HRhRQUlif44KPtvdx2+
 zz4W8bohHte0yWLJFknK6C0mgLXvFtnlCDfUWRzgolbF55KiycRPtYPiN
 9tUAE2fpm7nxTLfgGKd9fhcRpcG8WKxtOuhQ11y+R/W+VSMWkuBCweis1
 uSDAaaWkKHL2xyop6Ny8iKdcCyZs1Eglx7hS7Mzz51QIXhZmCq4jTWvzP
 Yy+EGpdMO541vxulaQm1D+4knJuTthCbUDDq7I4/8j/urp0W+W0mz9jQv
 0e8Ic2KeW4Nsr/t557ES5y6+WzrP4P8C4Eetq9GkqFuG72n2pVzIdso/1 Q==;
X-CSE-ConnectionGUID: 3SHmFKGAR5mvzSdYbHZN7Q==
X-CSE-MsgGUID: oQbpL4RIQzKmDuuBONbA6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12082114"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12082114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:01 -0700
X-CSE-ConnectionGUID: CzWHbFn2RxSd/tKeOSso2A==
X-CSE-MsgGUID: paMrtDY3SlOTj7CNPIdzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="62229137"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 04:06:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/6] Add support for VF to query its configuration
Date: Thu, 16 May 2024 13:05:40 +0200
Message-Id: <20240516110546.2216-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/133509/
v2: explicitly refer to MMIO HXG Message (Piotr)
    use proper kernel-doc format (Piotr, CI.hooks)

Michal Wajdeczko (6):
  drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
  drm/xe/guc: Add VF2GUC_VF_RESET to ABI
  drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
  drm/xe/vf: Add support for VF to query its configuration
  drm/xe/vf: Custom hardware config load step if VF
  drm/xe/vf: Expose SR-IOV VF attributes to GT debugfs

 drivers/gpu/drm/xe/Makefile                   |   2 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 160 ++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 747 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  23 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  72 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h   |  14 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  82 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
 drivers/gpu/drm/xe/xe_guc.c                   |  36 +
 10 files changed, 1142 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h

-- 
2.43.0

