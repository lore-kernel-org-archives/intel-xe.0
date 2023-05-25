Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E43C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA3710E777;
	Thu, 25 May 2023 21:34:41 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088010E777
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050479; x=1716586479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XLqRiElXxQxa7PLkZd8j78zKIRHedc3AjWHZ1TF5YmM=;
 b=bWjliEZSwysJkQQUEJUui7Fw5BzF6PwrcFZDji3PvJD4JNFx/fw6TU74
 7KBAFvCmWPYgYG2rmWSyjoCUhYa0agRhftIZO2Ud4ncnjTqSATPGgJZmI
 jCRntEo7FdYvquY+3LvLOIucwEEkPaGk++j+xm6FO2SXOR3XJmxlX6Xbr
 LTBL9HMyw3M6IVd8GEFhIzmTpkEEL31VD/QgzZ9GQlL25NgfeTNIXqM88
 nq9zumAfi/KXNo4qMJW//tRcznU+7p+JiNVBRvG2miKQSm+2fa1ggM48y
 T7pT7XCsPBU84wlan6z+fCnUeOAX4Vqnj6GFRbI6bJFJbx2KL2bQmqI01 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377897"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377897"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970720"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970720"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:33:46 -0700
Message-Id: <20230525213407.3907094-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 00/21] Dump + OOB workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

May the fourth be with the workarounds.
Fourth version of the OOB workarounds.

Previous version can be seen here:
https://lore.kernel.org/intel-xe/20230516221950.3512818-1-lucas.demarchi@intel.com/

Changes in v4:

  - All workarounds are now tracked per gt instead of per device. This
    helps supporting new platforms with different types of GTs

  - Split the last commit to be per (group of) workaround. Original
    intention was to just port the workarounds over to the new infra
    using the same conditions as was originally in the code. As
    demonstrated by v3 and the commits here, the conditions currently
    there can't be trusted much.

  - Add commit to fix build with M=drivers/gpu/drm/xe/ since it has a
    side-effect of not including the $(obj) in the include search path.

  - Properly convert Wa_14014475959 using IP versions. This is currently
    working for DG2, but I couldn't really test on MTL. We may want to
    postpone the last 2 commits to when xe is properly loading in MTL.

Using a DG2 platform for test:
	XE_DG2 G12 56b2:0001 dgfx:1 gfx:Xe_HPG (12.55) media:Xe_HPM (12.55) ...
	Stepping = (G:A1, M:A1, D:C0, B:**)

Output:
	# cat gt0/workarounds
	GT Workarounds
		14014830051
		14015795083
		18018781329
		1509235366
		14010648519

	Engine Workarounds
		14010826681, 1606700617, 22010271021, 18019627453
		22013037850
		22014226127
		18017747507
		14015227452
		16015675438
		16011620976, 22015475538
		1509727124
		22012856258
		22010960976, 14013347512
		1608949956, 14010198302

	LRC Workarounds
		16013271637
		14014947963
		18018764978
		15010599737
		18019271663

	OOB Workarounds
		14014475959
		22011391025
		14012197797
		16015675438
		18020744125

Eventually we may want to add a node in debugfs to consolidate the WAs
for all GTs, but that is not currently needed.

Lucas De Marchi (21):
  drm/xe: Fix Wa_22011802037 annotation
  drm/xe/rtp: Split rtp process initialization
  drm/xe/rtp: Replace XE_WARN_ON
  drm/xe/rtp: Add "_sr" to entry/function names
  drm/xe/rtp: Allow to track active workarounds
  drm/xe/wa: Track gt/engine/lrc active workarounds
  drm/xe/debugfs: Dump active workarounds
  drm/xe/rtp: Rename STEP to GRAPHICS_STEP
  drm/xe/rtp: Add check for media stepping
  drm/xe/rtp: Add support for entries with no action
  drm/xe: Include build directory
  drm/xe: Add support for OOB workarounds
  drm/xe/guc: Port Wa_22012773006 to xe_wa
  drm/xe/guc: Port Wa_16011759253 to xe_wa
  drm/xe/guc: Port Wa_14012197797/Wa_22011391025 to xe_wa
  drm/xe/guc: Port Wa_16011777198 to xe_wa
  drm/xe/guc: Port Wa_22012727170/Wa_22012727685 to xe_wa
  drm/xe/guc: Port Wa_16015675438/Wa_18020744125 to xe_wa
  drm/xe/guc: Port Wa_1509372804 to xe_wa
  drm/xe/rtp: Also check gt type
  drm/xe/guc: Port Wa_14014475959 to xe_wa and fix it

 drivers/gpu/drm/xe/Makefile            |  16 +-
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  23 +--
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 164 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c             |   6 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  12 ++
 drivers/gpu/drm/xe/xe_gt_types.h       |  12 ++
 drivers/gpu/drm/xe/xe_guc.c            |  49 ++----
 drivers/gpu/drm/xe/xe_hw_engine.c      |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |   6 +-
 drivers/gpu/drm/xe/xe_rtp.c            | 207 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_rtp.h            |  63 ++++++--
 drivers/gpu/drm/xe/xe_rtp_types.h      |  29 +++-
 drivers/gpu/drm/xe/xe_tuning.c         |  12 +-
 drivers/gpu/drm/xe/xe_wa.c             | 172 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa.h             |  12 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  16 ++
 16 files changed, 662 insertions(+), 147 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
 create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules

-- 
2.40.1

