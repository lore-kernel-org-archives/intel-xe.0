Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61EF30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82C310EB21;
	Thu,  5 Mar 2026 12:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afjDSUia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302D10EB21;
 Thu,  5 Mar 2026 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772715001; x=1804251001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WMCBu7nETDMMeLdTIUM3q3fbFVMGLADq4lYO1V4zoj0=;
 b=afjDSUia6vMS2P2hRhSHOfUGF7Ihx/yyD5ywnSNxTOxGK9gsQP+sXNpp
 +Ri1WrCHwRVNy6xG8S1dWOPKh28gdR3mCFBo2N9mRIs4bNPAvk6TSRDyE
 4lBAWtGOEf4oe6qnMcs41Mwyf8nTE7YhGEwnyzvzRzd/3/36dK9g9yAPF
 i9yt26kgsFAPimJp8pGlShj+lj8O4wpHcOhBzEUDUup/zH0IMJ9xw63mt
 7EuL5KNYUY2oWD6rY3Kfm+KmlfW33FWKrrDUVK8+J6pM2Nr8jzexPzbc1
 +AEn3UclxUaRMOPwGsZockVo1VPrSaXZKwh1efZignzSSH0B8AHtWA5S9 g==;
X-CSE-ConnectionGUID: Yqe2JajZQEiwG7NkB7GnMg==
X-CSE-MsgGUID: UN0lOkSOSB+IrRCDjq2PQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73706858"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73706858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:50:01 -0800
X-CSE-ConnectionGUID: MEV6fzwyReiUEy6fGBZhbw==
X-CSE-MsgGUID: Olp1u3p3QeiqWo1L0/4d3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215483405"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 04:49:59 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 0/2] Panel Replay BW optimization.
Date: Thu,  5 Mar 2026 17:50:09 +0530
Message-Id: <20260305122011.3297262-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Unused bandwidth can be used by external display agents for Panel Replay
enabled DP panel during idleness with link on. This patch series
enabling the same.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (2):
  drm/i915/display: Panel Replay BW optimization for DP2.0 tunneling
  drm/i915/display: Disable Panel Replay for DP-tunneling without
    optimization

 .../gpu/drm/i915/display/intel_display_regs.h |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 42 ++++++++++++++++++-
 4 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.29.0

