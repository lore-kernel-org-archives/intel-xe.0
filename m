Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58438C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A4D10E385;
	Tue, 16 May 2023 22:20:40 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33BF10E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275626; x=1715811626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0bR58vjCY9EwBcQ8KE2JjakcD4VkRlSqVu2E2L3k3GQ=;
 b=Db02Sqc3xHTck+k94up18Z179d2a4x14oIhzRmcaOseiiUvjCpSKr1w4
 eqmXNGIwfaADK5eiw+qLzOf+nKVgZ33FyaBJQLffqIMaLors3HnRLNgOS
 YFyTptpZgaSM3btDRIk/7pLjG8qoe1Lg9xAG1gRNtuBVU2seVQiGC6tOw
 3RYm1g3iKZQJhaNgZy+HKlVL7XqL/lFU62/G4FWQaxjAvHM2Gl1gL3IH6
 0jEZzGorc9jBkV0ScWoSuvANsXPIYTyJ3yMyAL+GMtDE+K+HCCmxN+V85
 XxPMJwig+4knwBkSYxp1Sk1F4GBrKYFbolastz1BI2xhHP19WQsnvem8i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013377"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013377"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530848"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530848"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:41 -0700
Message-Id: <20230516221950.3512818-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/9] Dump + OOB workarounds
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Third version adding OOB workarounds, third different approach.
Gone is the special ELF section and now it's implemented by
creating a new RTP struct that holds tables containing only rules,
without the actions interacting with reg-save-restore.

Now a common approach between all types of workarounds is used for
marking the "active" workarounds. These are the ones in play for the
running system.  They can be queried over debugfs and for the OOB,
are checked throughout the code. Last patch converts xe_guc.c to the
new infra.

In order to be able to implement the simpler XE_WA() requested in
previous versions, and at the same time avoiding error-prone updates
in different places of the code, a simple program was written to
generate xe_wa_oob.c and xe_wa_oob.h. The syntax is kept very simple
on purpose, with the following goals:

	1) Be similar to the rest of the workarounds. The codegen
	   just paste together the info in the .rules file
	   and updated header/source with the appropriate values
	2) Doesn't increase the build dependencies of the kernel,
	   so it's implemented in C and built as a hostprog.

Tested on a single DG2 system.

Lucas De Marchi

Lucas De Marchi (9):
  drm/xe: Fix Wa_22011802037 annotation
  drm/xe/rtp: Split rtp process initialization
  drm/xe/rtp: Add "_sr" to entry/function names
  drm/xe/rtp: Allow to track active workarounds
  drm/xe/wa: Track gt/engine/lrc active workarounds
  drm/xe/debugfs: Dump active workarounds
  drm/xe/rtp: Add support for entries with no action
  drm/xe: Add support for OOB workarounds
  drm/xe/guc: Port workarounds to OOB infra

 drivers/gpu/drm/xe/Makefile            |  14 ++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  23 ++--
 drivers/gpu/drm/xe/xe_debugfs.c        |  12 ++
 drivers/gpu/drm/xe/xe_device.c         |   7 +
 drivers/gpu/drm/xe/xe_device_types.h   |  12 ++
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     | 165 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.c            |  49 +++----
 drivers/gpu/drm/xe/xe_hw_engine.c      |  10 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |   6 +-
 drivers/gpu/drm/xe/xe_rtp.c            | 180 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_rtp.h            |  31 +++--
 drivers/gpu/drm/xe/xe_rtp_types.h      |  28 +++-
 drivers/gpu/drm/xe/xe_tuning.c         |  12 +-
 drivers/gpu/drm/xe/xe_wa.c             | 106 +++++++++++++--
 drivers/gpu/drm/xe/xe_wa.h             |  13 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  16 +++
 16 files changed, 584 insertions(+), 100 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gen_wa_oob.c
 create mode 100644 drivers/gpu/drm/xe/xe_wa_oob.rules

-- 
2.40.1

