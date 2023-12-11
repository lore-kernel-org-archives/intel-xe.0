Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CD1C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 20:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2779E10E4E4;
	Mon, 11 Dec 2023 20:04:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8910E4E4
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702325077; x=1733861077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1SB8g6nCbxHvFvmE56nMAYuSV+yPfOGIMi7kpQlnI68=;
 b=JJwpSeJtwIYIcHzJXdtNE9LxIyjstCygeTbuYkcohtLQB+2ma4yrzDi9
 qppUtjBocK7EgzmNKtNHhda4E1vFLOB6T9wYMca83lUHVlsfAB1dtphA7
 0AYADqP9gDU4F3qkVzp0Q2kipkkDW4sGZZDgwlommPH4ZNnPuSgnprtGN
 8whsExZz6rXkeI4pYJLhSU98TP97AJgoIHuJinWIm/pDktUofkPI5F6lW
 CRtjBnLjKFQaxJzFAEaVgHzh8gHBvXtm6ZvPTsNk+aIDg2vhuP4nGv3S0
 DV0vTB2LhIjN8Ab982ThKYFv7PYDnlfcHB9jp8lJXuENvrF0qNw6kps5o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480900334"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="480900334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807440669"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="807440669"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.141])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 12:04:35 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/9] Introduce GuC Doorbells Manager
Date: Mon, 11 Dec 2023 21:04:15 +0100
Message-Id: <20231211200424.1703-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce simple GuC doorbells ID manager that will be used by the
PF driver for VFs provisioning and can later be used by submission
code once we are ready to switch from H2G based notifications to
doorbells mechanism.

As preparation steps, improve existing logging and kunit code that
is used by the new code.

Michal Wajdeczko (9):
  drm/xe: Add GT oriented drm_printers
  drm/xe: Use GT oriented functions to report TLB timeout
  drm/xe: Introduce GuC Doorbells Manager
  drm/xe/kunit: Set SR-IOV mode of the fake device
  drm/xe/kunit: Define helper functions to allocate mock device
  drm/xe/kunit: Use xe kunit helpers in RTP test
  drm/xe/kunit: Use xe kunit helpers in WA test
  drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
  drm/xe/kunit: Add GuC Doorbells Manager tests

 drivers/gpu/drm/xe/.kunitconfig               |   5 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 199 +++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c   |  85 ++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h   |  19 ++
 drivers/gpu/drm/xe/tests/xe_pci.c             |   3 +
 drivers/gpu/drm/xe/tests/xe_pci_test.h        |   2 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |  36 +--
 drivers/gpu/drm/xe/tests/xe_wa_test.c         |  24 +-
 drivers/gpu/drm/xe/xe_gt_printk.h             |  44 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  13 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 261 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  22 ++
 drivers/gpu/drm/xe/xe_guc_types.h             |  15 +
 drivers/gpu/drm/xe/xe_uc.c                    |   5 +
 15 files changed, 675 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h

-- 
2.25.1

