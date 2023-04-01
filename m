Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D6CC77B6D
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 08:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F8510E0DF;
	Sat,  1 Apr 2023 08:52:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED49510E080
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680339160; x=1711875160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xvAZomDqACo/3nggrsdgZg53812Lypx6lPVMRbgg4x8=;
 b=Gs60ktXEpbJNepPFMMrOQB6/99/IviPaSJMzWk3tSN7oXTB4Ys94+MUz
 /CVAxpSBFN+BS6UBSnZzy/UzF5pne34cJe7pTDISUmTZxzL6Ci94un0yy
 66ZRuTTtj3BFBmBEYT/EWD2nO9zULWTE9mDwf9Xvn2GBGJU/KKl/wYFiv
 H4I83JUpDs2xtRmRnwOeyxpEJvkDsNYn59yZpfD9o38cX5Ev0i/86Gkxm
 O4JKsh0HMu13fmpGl4ZZjS1ksVOUPCYHRK5nIwP3mBY2kQOQI46EFAGLe
 s23z1UQyFOaysQFAgllLsoRbtIBLpk1VIIKTwK3454/5M04N1/Pix9/sI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341651165"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="341651165"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="685369560"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; d="scan'208";a="685369560"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 01:52:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat,  1 Apr 2023 01:51:44 -0700
Message-Id: <20230401085151.1786204-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/7] Unit tests for rtp and GT wa/tuning
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
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal@hardline.pl>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add tests for the RTP infra and for the GT workaround/tuning
programming, while building the unit test infra to be able to test with
fake devices.

Notes:

- I debated a little bit whether we should use "mock" or "fake" to name
  these helpers for running without real hardware.  Here it's using
  "fake" since it's not a proper mock framework, and it seems to be what
  kunit itself uses in the documentation and examples.
- The tests themselves are "unit tests", for the
  software part, testing the implementation for the rtp,
  reg-save-restore and WA infrastructure.
- Last patch is the big improvement functonality-wise, which will help
  us detect wrong updates in the workaround tables, without running in
  real hardware.  That patches should be followed up with similar ones
  for the other WAs: engine and LRC.

v2:
  Besides the changes documented in each patch, move commits around so the
  additional tests are at the end, with the infrastructure as prerequisite patches.
  Also, XE_KUNIT as symbol namespace is no more: there is a macro from
  kunit that can be used for the same purpose.

Lucas De Marchi (7):
  drm/xe: Extract function to initialize xe->info
  drm/xe: Move test infra out of xe_pci.[ch]
  drm/xe: Use symbol namespace for kunit tests
  drm/xe: Generalize fake device creation
  drm/xe/reg_sr: Save errors for kunit integration
  drm/xe: Add basic unit tests for rtp
  drm/xe: Add test for GT workarounds and tunings

 drivers/gpu/drm/xe/Kconfig.debug           |   1 +
 drivers/gpu/drm/xe/tests/Makefile          |   8 +-
 drivers/gpu/drm/xe/tests/xe_bo.c           |   7 +-
 drivers/gpu/drm/xe/tests/xe_bo_test.c      |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      |   4 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c          | 109 +++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h     |  31 ++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c     | 318 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_wa_test.c      | 136 +++++++++
 drivers/gpu/drm/xe/xe_pci.c                | 150 ++++------
 drivers/gpu/drm/xe/xe_pci.h                |   9 -
 drivers/gpu/drm/xe/xe_reg_sr.c             |  10 +
 drivers/gpu/drm/xe/xe_reg_sr_types.h       |   4 +
 drivers/gpu/drm/xe/xe_rtp.c                |   3 +
 drivers/gpu/drm/xe/xe_tuning.c             |   3 +
 drivers/gpu/drm/xe/xe_wa.c                 |   2 +
 19 files changed, 692 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c

-- 
2.39.0

