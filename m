Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BA7C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241C10E39A;
	Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B735810E392
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WGWrHI7scor9eHMXv36ZXpEIY872LiTO4kcZ9OqbzDY=;
 b=l/HTAu/jyHWyt9rMkvWAy4ssa20pEhbFia3+5FsODqd7MLrM9iktrma3
 gkTY9ZeyTL5lAReKTjaY1hsxxsMR9Iat0XkMbg3XR4pmZlt2P4cIpZSpK
 F3Njsno8hYazh6vOhdfpIHfrqmn2Q2WDd5rc6stmkuyUs68r2v884gQEv
 T2hDSPWVbN4n8bM9pPSr1e/6zz6H+1vNC+Pf4IleI1vA0FG36dVDvogZZ
 inKLx8UqpmpaUo7ZES1v9dbm1ooSm5gJF9cRLF+VoldkjtGwP966CuoJV
 JK87UkZxGclCSLFQdsMmhMivqlGOUgL1VppZjYDlA1z2rImjQP1xbGA9y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984323"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984323"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157425"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157425"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:50 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI RESEND v2 00/10] Introduce VF specific interrupts handler
Date: Mon, 18 Dec 2023 17:53:34 +0100
Message-Id: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

This is v2 after rebase/conflict resolution.

Michal Wajdeczko (10):
  drm/xe: Add command MI_LOAD_REGISTER_MEM
  drm/xe: Define registers used by memory based irq processing
  drm/xe: Update LRC context layout definitions
  drm/xe: Update definition of GT_INTR_DW
  drm/xe: Define IRQ offsets used by HW engines
  drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode instead WB
  drm/xe/vf: Introduce Memory Based Interrupts Handler
  drm/xe/vf: Update LRC with memory based interrupts data
  drm/xe/vf: Setup memory based interrupts in GuC
  drm/xe/vf: Add VF specific interrupt handler

 drivers/gpu/drm/xe/Makefile                   |   4 +-
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   9 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   9 +
 drivers/gpu/drm/xe/xe_bo.h                    |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device.h                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   3 +-
 drivers/gpu/drm/xe/xe_guc.c                   |  12 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |  28 ++
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
 drivers/gpu/drm/xe/xe_irq.c                   |  71 +++
 drivers/gpu/drm/xe/xe_lrc.c                   |  38 ++
 drivers/gpu/drm/xe/xe_memirq.c                | 430 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.h                |  26 ++
 drivers/gpu/drm/xe/xe_memirq_types.h          |  37 ++
 18 files changed, 690 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
 create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h

-- 
2.25.1

