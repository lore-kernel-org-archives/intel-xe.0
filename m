Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D25606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecXhl7GQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1810E833;
	Wed, 25 Nov 2026 05:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E655510E05E;
 Wed, 25 Nov 2026 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583886; x=1827119886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fVdAUaiVHTybWbtqcCrgUFVv9MLzyW2xE1nf3cugLew=;
 b=ecXhl7GQMc1hJgZlg50c4VM91waApdPh4rlScCLvJxCki/L81P6M0nr1
 ZpDc3wCYw4v18RkDr5po5TVxM0CP6fQKD8ZXeSG7sc9V6W1Sz+aoyVdJJ
 yXKtXw4SCCMR+7TophkMVCMDttFBfWcsJ3T+t4YHeZlLTuI6gIlyxlTMx
 cpEakFEmHnYTx8tkiBFKKpf5UdauMv+tk0PBuwJi2/CSYe9Cn7olwuTLf
 TxxHnUza2IHkp0NusSADsfeeIZO3Esof32hKQQgPtqHAjh5yp1AwtQfeB
 6nM9yRaLy2zFmYUxtLPTgcJlPW0PKp0exV1pHHxX1vfwvMclt/1+/8vsH A==;
X-CSE-ConnectionGUID: /VfIhfzGTXCo6teu8phEpw==
X-CSE-MsgGUID: /5pR6RMuQk6ZtBN/bZswVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334158"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:06 -0800
X-CSE-ConnectionGUID: 2U3TZy3nQNGVSjPLdkhLFA==
X-CSE-MsgGUID: eVZ3zpgyR8GSKXfHffvz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12092966"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:04 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/7] drm/i915/dp: Fix FRL/TMDS bandwidth checks for HDMI2.1
 PCON
Date: Wed, 25 Nov 2026 10:32:24 +0530
Message-ID: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the first part of the series at
https://patchwork.freedesktop.org/series/171345/#rev4

The FRL bandwidth check for a DP->HDMI2.1 PCON ignores the max FRL rate
of the HDMI sink, and is only done in mode_valid, not in compute_config.
This series fixes the check, uses it for the bpc selection as well, and
reworks the HDMI DSC helpers so that they can be reused by the
subsequent PCON DSC changes.

These are the patches that are already reviewed, so they are sent
separately for CI and to be merged first. The rest of the series, the PCON
DSC operations, will be sent after this.

Ankit Nautiyal (7):
  drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
  drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
  drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
  drm/i915/dp: Use the common downstream bw check in compute_bpc
  drm/i915/hdmi: Expose DSC min/max bpp helpers
  drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
    limits
  drm/i915/hdmi: Pass pixel clock to DSC slice helper

 drivers/gpu/drm/i915/display/intel_dp.c   |  76 ++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c | 121 +++++++++++++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.h |   5 +
 3 files changed, 145 insertions(+), 57 deletions(-)

-- 
2.50.1

