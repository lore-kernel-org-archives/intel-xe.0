Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9D1C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7BB10FC3E;
	Thu, 14 Mar 2024 17:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzHEEz7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7200610FC3C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710437521; x=1741973521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q+/Y044wo0HmgfPzrivSAGXEL3xqKeE1Y5usBYV+s2s=;
 b=dzHEEz7Puqwxb6Wp9p15hkDkIjG4u15SeZeeeod2XhNW6a7Tjw4v5JKh
 A+tpPtB2HDEOyZsBGnL+qszMIPmoiwPhIQ5z8ouO5Mdz92S0GsrfkfVWf
 RRWmWzmkiPZBrr4tRUJvyPCCBcy+fGs4ZYuRt2d1M57bZKcq0KeSu8pXU
 WE8NQW97wEItuTE1HX9iCDIba/zlLe5bDPEymUYT1wBz3+XHUIQ8J87Eq
 mgqojd8I6R2W/h612yAsM2Rs27DkzRxaC6A4Yptlh875AI0CZoNzaYdrS
 yDHqdlavoEsVk3k/EUijvPSRim2KJXCat9uAIeH4IC/aqsiw1R/qjsDtG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22791655"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22791655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12388783"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.155.117])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:31:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/6] Update MMIO read/write functions
Date: Thu, 14 Mar 2024 18:31:24 +0100
Message-Id: <20240314173130.1177-1-michal.wajdeczko@intel.com>
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

Prepare MMIO read/write functions for future SR-IOV specific enhancements.

v2: explain when interrupts regs are really VFs accessible (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>

Michal Wajdeczko (6):
  drm/xe: Assert size of the struct xe_reg
  drm/xe: Define XE_REG_OPTION_VF
  drm/xe: Mark VF accessible GuC registers
  drm/xe: Mark VF accessible global registers
  drm/xe: Mark VF accessible interrupt registers
  drm/xe: Make xe_mmio_read|write() functions non-inline

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 40 +++++++------
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +--
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 14 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h     |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c          | 72 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h          | 81 +++------------------------
 6 files changed, 121 insertions(+), 96 deletions(-)

-- 
2.43.0

