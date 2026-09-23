Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25FFC98309
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0FD10EFFB;
	Wed, 23 Sep 2026 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITlWeD2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3263410EFE9;
 Wed, 23 Sep 2026 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164823; x=1821700823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wE1Jz67arY6La7Q6RrGVvQVcCmrq/pLz43Y0jeNvl7I=;
 b=ITlWeD2Ic93RnWCSkMEwVPd0Xhwfkp/+df02RobztxV/DUPz44TZr1bX
 t/ywI0EBgJnQW+Su/Cx1VLm1WXX9n827tOkK/iM7pdpsBQdacZKBpu+lb
 xBqL415aJXx9vPSwdCXuhkAYGRzFEPKFM9y6biF9il71Hu1eaRz+oyIZJ
 Zx4qwwkjOY+MxIIgomTz6NSWpYKF/UHC0gI7wHETvCEezYW0uXANEhYAG
 pNgJljAMMusFT1REm6uA9EOmNF3XTEWNK9O0700iLRNa7klh+FUq7iuV4
 xYrBq30mQcnDpjDAgz/2DYDd1DK3s6NihKOZ+SBupRHILkAMJZhEXbJsM w==;
X-CSE-ConnectionGUID: K2zAVzXjSt+we96x9FLasw==
X-CSE-MsgGUID: dWcULi1rS3CCVskZbtyTKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965103"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965103"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:44 -0700
X-CSE-ConnectionGUID: PRAOB9M7Q6a47yh4+RhsaA==
X-CSE-MsgGUID: lbEuoptWTZmXOFcfJG8jHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665821"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:43 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 0/5] drm/i915/psr: Panel Replay and PSR2 with the joiner
Date: Wed, 23 Sep 2026 11:59:36 +0000
Message-ID: <20260923115941.746934-1-mika.kahola@intel.com>
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

PSR has been refused outright with the joiner so far. Each joined pipe
has its own PSR register block, so Panel Replay and PSR2 selective
update do work as long as the joined pipes are A and B. Plain PSR1
doesn't, and stays rejected.

The first three patches fix what the joiner breaks, before anything is
enabled: frontbuffer tracking only looked at the primary pipe, the
selective fetch area was taken from the adjusted mode which spans all
the joined pipes, and PSR2_MAN_TRK_CTL is a transcoder register that
both joined pipes would program. Patch 4 then allows the feature and
patch 5 lets the joiner be forced on eDP, so this is testable without a
panel that asks for it in VBT.

Tested with kms_joiner and kms_psr2_sf on LunarLake, together with the
IGT changes in https://patchwork.freedesktop.org/series/174623/

Mika Kahola (5):
  drm/i915/psr: Track all joined pipes for frontbuffer tracking
  drm/i915/psr: Take the selective fetch area from pipe_src
  drm/i915/psr: Merge the selective fetch area across joined pipes
  drm/i915/psr: Allow Panel Replay and PSR2 with joiner
  drm/i915/display: Allow forcing the joiner on eDP

 .../drm/i915/display/intel_display_debugfs.c  |   5 +-
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  12 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 288 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h     |   2 +-
 6 files changed, 241 insertions(+), 69 deletions(-)

