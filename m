Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5815E9A049
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FE710E0AC;
	Thu, 19 Feb 2026 13:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIlTHx6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE410E0AC;
 Thu, 19 Feb 2026 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771506482; x=1803042482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+eVMGNNPTLzhTvbxIxMiZhF1cpStIJJpZlWHyWHEkA=;
 b=hIlTHx6NIgmCqjvffI6l1GLx5FXZsWP7ivUPaWkubcgJ/zSQ7a99FlMH
 LiMdgn/pqb1BIwIDbVyhEFboBjyV9Yew5iW2EH9108hR4mGWyTIXoqGDc
 XWd4nlN4vSnMfvp8CeC+4Al2BOwBRiAHUwu+OQ6X6eTCGpl2lnilqLH3S
 Gl3+JAVahpxpwwpC/pylKlNjj00Gw5v08bs8VdXoK4ev4wzNV6mYfZyrI
 VszyfPtpyDw3xFN/w+6yRYl1XS7pIe2LqvJWTEMugNjjniW90Y+6i5ev8
 b4RDFEyWnLBPnFfGwl4lXrG38fiLXTbjU+4Lsx00v6fNzgN93Ws/Bu3ft g==;
X-CSE-ConnectionGUID: OGPe2wjtR/a0UjVURAUqyQ==
X-CSE-MsgGUID: vdx167O7TQyMe6W+5S34Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72475494"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72475494"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:02 -0800
X-CSE-ConnectionGUID: 3OQrLbkUSWKOuzQOJHnk6g==
X-CSE-MsgGUID: dvJrGF4uR1WfNjoB+ILvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212458560"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:00 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/5] PSR/PR Selective Fetch Early Transport fixes
Date: Thu, 19 Feb 2026 15:07:38 +0200
Message-ID: <20260219130743.1232188-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set contains fixes for Selective Fetch Early Transport configuration:

  - add necessary DSC Early Transport configuration
  - corner case fix for Selective Update area when Early Transport is
    in use and cursor plane is included into SU are due to alignment.
  - remove useless parameter from intel_psr2_sel_fetch_et_alignment

Jouni Högander (5):
  drm/i915/psr: Repeat Selective Update area alignment
  drm/i915/psr: Add DSC_SU_PARAMETER_SET_0 registers for PSR
    configuration
  drm/i915/dsc: Convert intel_dsc_get_vdsc_per_pipe as non-static
  drm/i915/psr: DSC configuration for Early Transport
  drm/i915/psr: Drop cursor_in_su_area from
    intel_psr2_sel_fetch_et_alignment

 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 63 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 12 ++++
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h     |  1 +
 5 files changed, 62 insertions(+), 17 deletions(-)

-- 
2.43.0

