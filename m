Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E96C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3207110E1DA;
	Thu, 14 Dec 2023 18:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B635810E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579647; x=1734115647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7kC3+5dAXTOVSkacDMXwMF0Y/V5qKO34qDe1yMGQKM0=;
 b=UJ2S4poNXtF2KIRZxpqj6Qj1CdzbDavCIKFZk29rE2iPckrtinznPCxb
 eAGQxgBMvTB5dRWT+6RJDugAcUGX7l+qAUYhrTLsmm4bgR6tG2hAM9e5W
 MMYAeixyVam21ENMpIT6z0ICGbCfHSzPyZtngHPTkHPKQko1sEUoY6ju8
 299lNHlsaEeMhpdQtVpmSoTDkpHLkqUKeEx4PLv+MQqHqSborzk09KRFJ
 vWAtuf03yhB7rQggHeW6iJCIXOWxSf/DVMWsRFTMbI0dJpy5f20ce40o9
 eiEJj3w6lqgwySVPz0GqUzhb51WVF+7iaqqUTELKW3LMd7c5uvC0/byZd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953926"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953926"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581807"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581807"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/8] Trivial register cleanups
Date: Thu, 14 Dec 2023 10:47:00 -0800
Message-ID: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Assorted cleanup of our register headers to keep the code clean and
easier to work with.  None of these patches should have any functional
impact.

Matt Roper (8):
  drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
  drm/xe: Move some per-engine register definitions to the engine header
  drm/xe: Fix whitespace in register definitions
  drm/xe: Move engine base offsets to engine register header
  drm/xe: Move GSC HECI base offsets out of register header
  drm/xe: Define interrupt vector bits with the interrupt registers
  drm/xe: Re-sort GT register header
  drm/xe: Drop some unnecessary header includes

 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 67 ++++++++++++++++++--
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 81 ++++++++++--------------
 drivers/gpu/drm/xe/regs/xe_regs.h        | 41 ------------
 drivers/gpu/drm/xe/xe_execlist.c         |  1 -
 drivers/gpu/drm/xe/xe_ggtt.c             |  1 -
 drivers/gpu/drm/xe/xe_heci_gsc.c         |  5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |  1 -
 drivers/gpu/drm/xe/xe_lrc.c              |  2 -
 drivers/gpu/drm/xe/xe_pci.c              |  1 -
 drivers/gpu/drm/xe/xe_ring_ops.c         |  1 -
 drivers/gpu/drm/xe/xe_wa.c               | 18 +++---
 11 files changed, 108 insertions(+), 111 deletions(-)

-- 
2.43.0

