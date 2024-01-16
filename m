Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64502C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485A10E552;
	Tue, 16 Jan 2024 14:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0057B10E5C7
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416988; x=1736952988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mb4dY6mGlnLBhOFzewxB9dKKqhX08vLXE4kHAU/WCgg=;
 b=ACdTsYY7thEGqbCwUHzMvXRZgOFDvxtGaDyrDP2VKUzMqqG8Jgv22qzp
 yFAmZkGkjSEBhkQPpDBzKQIW5yKdN97umlD8mQcDaW9VHNHdBV0lndMtf
 5xqb8xTtHw4fLdQsMa0osLUaGpnmdkqRR0wCFqjVxFz9/GRRqkbsZY4zR
 EtWebanzO6vxSQgDRRJlTWxenZEulubpShsRGJs6IqACHN3if71c+G5R8
 BLtKDt7eW70ckGWCSHXJDXjntybzYQvbesf5N1HZaxAnTA1lAjda0Jt8C
 t5rsKQiIBaPR08ZlN8+VaRj242PBQSJ0DNA2FDO8ycxdoPDrrcB8yyP5H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262426"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262426"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374869"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374869"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] Update MMIO read/write functions
Date: Tue, 16 Jan 2024 15:56:11 +0100
Message-Id: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Prepare MMIO read/write functions for future SR-IOV specific enhancements.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Michal Wajdeczko (6):
  drm/xe: Assert size of the struct xe_reg
  drm/xe: Define XE_REG_OPTION_VF
  drm/xe: Mark VF accessible GuC registers
  drm/xe: Mark VF accessible global registers
  drm/xe: Mark VF accessible GT registers
  drm/xe: Make xe_mmio_read|write() functions non-inline

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 46 +++++++--------
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +--
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 14 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h     |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c          | 72 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h          | 81 +++------------------------
 6 files changed, 121 insertions(+), 102 deletions(-)

-- 
2.25.1

