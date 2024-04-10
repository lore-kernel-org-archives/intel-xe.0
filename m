Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3BBCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584C10E704;
	Wed, 10 Apr 2024 12:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu/Qz8J3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72A910E704
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752297; x=1744288297;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jScoQ52b05F37UEpenc2MvyJiDOTBisbogIcbY+Tt8Y=;
 b=iu/Qz8J3EbE7DC3iUPGZ1ahSTufLnRh9+zD3lAOMsVQDj3Cz0xlFj1j4
 Uds8WltEP9j05O7S3BjhwAZKA9QUMuIsnU8oc7sY9JTG000KWbnRCSJCN
 jmGFKzHdhVSdpvDyVcUQMh5diW/h8H+8PzNAIAzKah2x7ZI4W+HSEhRYJ
 EqoT3axgNQfj0s51ktmpn/CNVblnOIJF/ok3pLKkNcIP+E5hz2xdPdut/
 JSz3qx/F6fxSz5q3cDANEvEGqearRrPr0prFyBhCa/k/6eJyeBWWA8UTf
 p03cEbWHCjUqkWNWY9bc31dhNp8GzjhOGluZY1Ool1iloOFFLt0/+ZZOb g==;
X-CSE-ConnectionGUID: R8130DsySwujUTdmGo9z2A==
X-CSE-MsgGUID: VfWuERQiQZmL7EfV/Hvu+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8212407"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8212407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:36 -0700
X-CSE-ConnectionGUID: 9XfLFQJ0RNSfb7S+wLNA/g==
X-CSE-MsgGUID: zASHWsEHTAaCA6JOCPp8KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57986278"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] PF: Add support to configure GuC SR-IOV policies
Date: Wed, 10 Apr 2024 14:31:20 +0200
Message-Id: <20240410123125.1155-1-michal.wajdeczko@intel.com>
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

