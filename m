Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72133C76195
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C9510E245;
	Tue, 21 Mar 2023 22:06:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9519010E090
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436379; x=1710972379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ur5XnyxoUPVo/qqmcAkUikM7PZF22p8xhjJj8fCpmi8=;
 b=f+g59pY3Ts+1vPugq3ET/4fTLI6JgHMkozcFUonl1FRH9q0MGcbY+rwY
 M8Nf+UqCxSjkrpEPbKHNbLtklKew+KyHa8cna+uC/QTiIGBqpUyPojtIN
 qnuGkoUp/LKN/svdEYvsXDynju9Kdf6BlpWqThvHGBzybdWkfVwcyw+Vs
 yovN+bcLygQ6aYlFHuAZvUl7ZIK8cyhP3gPROx/RTuV0Neq+g2SYWeIwI
 aPU0oYLANHp5fXGUcmeJ3wDtZKC/ZKDVWFrBkwG27sK/gfaY4Xf0Pe1X4
 a51CgSBJoaPvQOSEY16MTJZR1VdNtv9CgUk1BZQhS3+H8ZImp9dobH8IT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109495"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065691"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065691"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:20 -0700
Message-Id: <20230321220527.595462-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] Unit tests for rtp and GT wa/tuning
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add tests for the RTP infra and for the GT workaround/tuning
programming, while building the unit test infra to be able to test with
fake devices. This supersedes previous patch with only the rtp
tests (https://lore.kernel.org/intel-xe/20230316210341.3547058-1-lucas.demarchi@intel.com/T/#m1fd17b976409805f74aaeb565a441d7d63e0553d)

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

Lucas De Marchi (7):
  drm/xe: Add basic unit tests for rtp
  drm/xe: Extract function to initialize xe->info
  drm/xe: Move test infra out of xe_pci.[ch]
  drm/xe: Use XE_KUNIT for symbol namespace
  drm/xe: Generalize fake device creation
  drm/xe/reg_sr: Save errors for kunit integration
  drm/xe: Add test for GT workarounds and tunings

 drivers/gpu/drm/xe/Kconfig.debug           |   1 +
 drivers/gpu/drm/xe/tests/Makefile          |   8 +-
 drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +-
 drivers/gpu/drm/xe/tests/xe_bo_test.c      |   1 +
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      |   3 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c      |   3 +-
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_pci.c          | 108 +++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h     |  31 ++++
 drivers/gpu/drm/xe/tests/xe_rtp.c          | 201 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c     |  64 +++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.h     |  15 ++
 drivers/gpu/drm/xe/tests/xe_wa_test.c      | 136 ++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c                | 150 ++++++---------
 drivers/gpu/drm/xe/xe_pci.h                |   9 -
 drivers/gpu/drm/xe/xe_reg_sr.c             |   9 +
 drivers/gpu/drm/xe/xe_reg_sr_types.h       |   4 +
 drivers/gpu/drm/xe/xe_rtp.c                |   4 +
 drivers/gpu/drm/xe/xe_tuning.c             |   1 +
 drivers/gpu/drm/xe/xe_wa.c                 |   1 +
 21 files changed, 647 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_pci_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_test.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_wa_test.c

-- 
2.39.0

