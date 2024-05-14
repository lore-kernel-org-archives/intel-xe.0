Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FD4C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CECA10E136;
	Tue, 14 May 2024 19:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk1pw170";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF2910E136
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713263; x=1747249263;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p9E5PgDLwjFygxLHz6O/hIUhWKh6nmExkabYd9zglEo=;
 b=kk1pw170yiPq5tDGu+/o1u5LRZ/ezHVm1dmTaofU040G1ruZpGR0x9bF
 Qe7vXxcG6Tnkld2WXKZbTVcE1DK+7fMEcpaxGLFpFvuyPWaqxvVdoATpH
 YBUTncaMn+Ljmn3hAa6LTnEkM0XFYc3OPEpMyLqISBirsdAhTGP7m6tcM
 Jlb+oIMB7Snk5LzrRZuupC4/Vzm/e+d5u/5YNRqCj9IfLT1dJ6SP43IG2
 X9ucpUySSWECQw8Iq8epM5AJF42KRhV0aHIHOZG2Sd66m1uMawI7yTg5l
 bDvt5UWQqHnC0ZW9hcInhl7OP5QSPjUJ/1GTF10VFIuYYYwMAhre1YuI7 A==;
X-CSE-ConnectionGUID: wMiizf2zQjWNi/HJa42ZlA==
X-CSE-MsgGUID: 0P5UrEpjR6+RQ7v9MtznfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523178"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:02 -0700
X-CSE-ConnectionGUID: Mz6nBpuLSQGdjg9K6Y93Ew==
X-CSE-MsgGUID: Vvt1AB0dTYyOnIGWEpco6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565472"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/8] PF: Support for adverse events notifications
Date: Tue, 14 May 2024 21:00:07 +0200
Message-Id: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

The GuC firmware monitors VF's activity and notifies the PF driver
once any configured threshold related to such activity is exceeded.

To avoid having to rewrite a lot of code for each threshold and to
be prepared for any new GuC threshold additions, where possible,
use macros to generate threshold specific code.

v1: https://patchwork.freedesktop.org/series/133236/#rev1
v2: improve readability of macros (Piotr)
    fix kernel-doc (Piotr, CI.hooks)
    add explicit asserts (Piotr)

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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c   | 147 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h   |  27 ++++
 .../gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h |  22 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  12 ++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  15 +-
 .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    |  64 ++++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  68 ++++++++
 15 files changed, 570 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h

-- 
2.43.0

