Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8584D43360
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 13:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4610E30B;
	Thu,  7 Nov 2024 13:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKT8X0oV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A5A10E30B
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730987724; x=1762523724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j8slaFaTEGu/xhHXE12T4LXqXQF7F/yzjCDfNWmxfTM=;
 b=CKT8X0oVWrrqNVstrnBWsCm77x7fZaZ5WaErufP0r4akyF1Of5SDYzou
 SxviTDMbv1Nu8jSy9I/pDVVScTRwTiwxUkPjtxsMUE7W8pjkzghm/EePz
 PXQpSSg9sjKrBinuLMb54YmYrevzDAJ83KXuOhGisB/yq01xh2Mn7FeB+
 7OZsulnhjHKXyF8InXlkxZTf5AmOyg0kz8uphMwiUOUEjc48WYnQRcao+
 kDCaWhhM2XOaLm4iP9sAVmmp+c9vjtJvp1IgoRl4rFOgTp8W7B001DU2o
 gAd+675a8wd+vZWRmUElHKi2W8ytOeVyUZm8Oy9x8WFBIOsaDVXZQ7s2k w==;
X-CSE-ConnectionGUID: TMn+nrYtSISJlEAOMFKakg==
X-CSE-MsgGUID: kZaA09dkSZSDKBE59A7JmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48289938"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48289938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:24 -0800
X-CSE-ConnectionGUID: whZXLDeuR/anVjNXBbwJKA==
X-CSE-MsgGUID: QP3lkXGURKugdlQrwd776g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84708035"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 05:55:22 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.winiarski@intel.com, michal.wajdeczko@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 0/4] PF: Add functions to save and restore VF LMEM and CCS
 data
Date: Thu,  7 Nov 2024 14:55:13 +0100
Message-Id: <20241107135517.9516-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

State of VF LMEM and corresponding CCS metadata needs to be saved and
restored during migration of VM with attached dGPU VF. Add helpers that
allow it. We will start using them in upcoming patches. For feature
enabling and testing purposes, allow to save VF LMEM and CCS state and
to replace it using debugfs blob file, but only under strict debug
config.

v3:
 - refactor locking (Matt B)
 - add helper to retrieve VF's LMEM object (Lukasz).

Lukasz Laguna (4):
  drm/xe/migrate: Add function for raw copy of VRAM and CCS
  drm/xe/pf: Add helper to retrieve VF's LMEM object
  drm/xe/pf: Add functions to save and restore VF LMEM and CCS data
  drm/xe/pf: Allow to view and replace VF LMEM and CCS state over
    debugfs

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  22 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 318 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  18 +
 drivers/gpu/drm/xe/xe_migrate.c               | 208 ++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h               |   5 +
 7 files changed, 650 insertions(+)

-- 
2.40.0

