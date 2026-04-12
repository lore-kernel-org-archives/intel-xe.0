Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE10E937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E7210E29E;
	Sun, 12 Apr 2026 11:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xuc82rdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C146910E0B5;
 Sun, 12 Apr 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992063; x=1807528063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wVYKkiAnAEcK6wZhwEH17v1B3JRTU0s4u3ufGI/GuS8=;
 b=Xuc82rdFXFLEGkFuthjxrMI1Udv3xDA23kaRtlWFSq5Axg+wzcLsYLJV
 Evu7vZwR6Tj9p8mgBGc6dmcnobM1Ad9d4XQLJRgyubVGB8xdGzHOV3nr0
 x/bC9YgS6Llx/fkgolq4dJaQX9liTXrYCgjAEQHB/CVWWkgAQtU5kwxji
 SeHhYVCWpXxa1Y+TuFMwnc+flM5S3Ukwo/rWo36m9Q/csQ4vs1PyU8fn7
 AsvnBSA04aXcYKKMM5wOpY5t9LLWT5n12cm9Qqv1nH8VbQCa7JdLvfJLX
 O1V2H0cnwsv7Y1Fx2hf0LSV8s8LwsDpg2eoRJLNZAHVjSyPgRtrpFoXCo w==;
X-CSE-ConnectionGUID: lhfCqKVqQcu0mwvA2fPpYA==
X-CSE-MsgGUID: E/MYHCFzQkOsXQFcQbmRGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115111"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:07:42 -0700
X-CSE-ConnectionGUID: lX0oV+b0RWmsKG3cN56tjA==
X-CSE-MsgGUID: 6sa2VJFBQreZPFpp4kQu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507707"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:07:40 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 00/13] CMTG enablement
Date: Sun, 12 Apr 2026 16:06:59 +0530
Message-Id: <20260412103712.4021213-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Common mode timing generator (CMTG) support is added NVL onwards.
Enable CMTG which will be needed by other fearure like dynamic dc
state enablement later.

Testing ongoing, currently counters are incrementing as expected.

Animesh Manna (12):
  drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
  drm/i915/cmtg: Set CMTG clock select
  drm/i915/cmtg: Set timings for CMTG
  drm/i915/cmtg: Program VRR registers of CMTG
  drm/i915/cmtg: Set transcoder mn for CMTG
  drm/i915/cmtg: Add hook to enable CMTG with sync to port
  drm/i915/cmtg: Add a hook to make eDP transcoder secondary
  drm/i915/cmtg: Split CMTG support check from intel_cmtg_is_allowed()
  drm/i915/cmtg: Add trigger to enable/disable cmtg
  drm/i915/cmtg: Add CMTG interrupt handling
  drm/i915/cmtg: Disable CMTG if dc3co is not allowed
  drm/i915/cmtg: Set target_dc_state flag for lobf/psr2/pr-alpm

Dibin Moolakadan Subrahmanian (1):
  drm/i915/cmtg: Modify existing hook to disable CMTG

 drivers/gpu/drm/i915/display/intel_cmtg.c     | 260 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  14 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  70 ++++-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  19 ++
 .../gpu/drm/i915/display/intel_display_irq.c  |  12 +
 .../gpu/drm/i915/display/intel_display_regs.h |   6 +
 .../drm/i915/display/intel_display_types.h    |   4 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   8 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |   5 +
 10 files changed, 393 insertions(+), 10 deletions(-)

-- 
2.29.0

