Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED17D5B175
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 14:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0910E4E1;
	Mon, 15 Dec 2025 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKaYoy+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E946010E4F8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809497; x=1797345497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s0y6x/NyuxwhSnGQM0FxBp6BQa7xRsraZtR1XikDY18=;
 b=VKaYoy+NfVMHkTow9hEd/zDe+a117nihIToz/Yjqf+GbBM/upp9kLbzm
 Y279/0k2wDgd5Xd1KoPK/C7Jv9qWMRdKIsJ6f3sGodMcGaDRF5J7sgqtC
 hFg7e3Ld9wYHOyNBpoMTzUnzNMwHAg73aNDt3HPSXHfemGRDzm6mofFM1
 2hXLSLOxk9IODGtHNejfxJ6PXlZqsn/nTL4w9p2T66YeCYljGTg0n4tcP
 t58akyswuTKRzBRIsFgGxkEXHfbqL8MVuFD19W2S4nMdjZOVBAoLFT+4M
 JtlWuzpXIbe9ZfALNiVbe2lu3ENXL5ZQIrGV2Nic3juOPRFcQS1yf1NpP w==;
X-CSE-ConnectionGUID: p6jY8ZcyQIWUxxttnq+d4g==
X-CSE-MsgGUID: 1mnYrJtVT76PjAfr8b8h7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85304126"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85304126"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:11 -0800
X-CSE-ConnectionGUID: OjD6kBe4SSG91Hypab+4XQ==
X-CSE-MsgGUID: YVjyyIIpR9SebdBwyGlN3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="196828289"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:37:57 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 0/4] PF: Add handling for new adverse event thresholds
Date: Mon, 15 Dec 2025 15:37:35 +0100
Message-ID: <20251215143739.196336-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.

Instead of using magic version like 0.0.0 for legacy KLVs, add
utility IF_ARGS macro that can be used in code generators to emit
different code based on the presence of any additional arguments.

This series cherry-picks one patch from the EGS series [1] and
can be merged separately.

v1: https://patchwork.freedesktop.org/series/158874/#rev1
v2: new patch with GUC_FIRMWARE_VER_AT_LEAST macro

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

[1] https://patchwork.freedesktop.org/series/158142/#rev3

Daniele Ceraolo Spurio (1):
  drm/xe/pf: Add handling for MLRC adverse event threshold

Michal Wajdeczko (3):
  drm/xe: Introduce IF_ARGS macro utility
  drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
  drm/xe/pf: Prepare for new threshold KLVs

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
 drivers/gpu/drm/xe/tests/xe_args_test.c       | 53 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h                  | 18 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 +-
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
 9 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.47.1

