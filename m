Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D08C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B810EA4C;
	Fri, 15 Dec 2023 16:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809C310EA4C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657514; x=1734193514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qym/ilMF2Y+QeSwuf/gIs0yL6takzSC3e4m4gM2BrQo=;
 b=PVhUizNeI//O5kM/mfeYtT03Wow6UA1Qmrga/nMtiM0+Jg4QQK3KIh0U
 ZXG6zN5F/VC43zBtHwMQ7gqEmDCGtHOD8LbByZKLMriEJxP+P1sTOGpde
 dpWAXe/dNNIC/B+phcIQhS02z39nLl7dYoukyvGrQSFO7pzIBYczLrLBE
 T7I75FUwP4SLZO20jGFLbEyZ2bQ1lfcutzXpUmVa0gJQiQ1wO8VMsOBbU
 eZ++BEsbcfC0Q3fUK+NBbzkRtCisr5EIpmT6HFRR/zMOkfrjlSIgT9JH7
 2BMZdQngBzUxbAs8y8YKRA1WImsmyBKXfjvcOu/bbZmLZ2YbyybwY4Pb9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617408"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617408"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984068"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984068"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 00/10] Introduce GuC Doorbells Manager
Date: Fri, 15 Dec 2023 17:24:52 +0100
Message-Id: <20231215162502.1879-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce simple GuC doorbells ID manager that will be used by the
PF driver for VFs provisioning and can later be used by submission
code once we are ready to switch from H2G based notifications to
doorbells mechanism.

As preparation steps, improve existing logging and kunit code that
is used by the new code.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (10):
  drm/xe: Add GT oriented drm_printers
  drm/xe: Report TLB timeout using GT oriented functions
  drm/xe: Introduce GuC Doorbells Manager
  drm/xe/kunit: Set SR-IOV mode of the fake device
  drm/xe/kunit: Define helper functions to allocate fake xe device
  drm/xe/kunit: Restore test->priv when done with fake xe device
  drm/xe/kunit: Use xe kunit helper in RTP test
  drm/xe/kunit: Use xe kunit helper in WA test
  drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
  drm/xe/kunit: Add GuC Doorbells Manager tests

 drivers/gpu/drm/xe/.kunitconfig               |   5 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 201 ++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c   |  90 ++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h   |  17 ++
 drivers/gpu/drm/xe/tests/xe_pci.c             |   3 +
 drivers/gpu/drm/xe/tests/xe_pci_test.h        |   2 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |   5 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c         |   5 +-
 drivers/gpu/drm/xe/xe_gt_printk.h             |  44 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  13 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 261 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  22 ++
 drivers/gpu/drm/xe/xe_guc_types.h             |  15 +
 drivers/gpu/drm/xe/xe_uc.c                    |   5 +
 15 files changed, 680 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h

-- 
2.25.1

