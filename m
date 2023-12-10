Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F927C4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AFD10E325;
	Sun, 10 Dec 2023 18:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF5E10E325
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702231659; x=1733767659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5deJMtZVholvByUsCMiESW/vbVCU+j5+/xFirJRZCXg=;
 b=bVqIAeZNBay4Qzfb/2xEysC2Z7lZ9JxSkACJqkoJlWllU6gcEgQj8jo2
 ega+HEWG4ItcdVcrjiHZClsDLI7CXW608u+twsPYpwsv8928tMJfdtsF9
 5/6rgRxdgOJYxW0oymjYfuttEQKJgtb2OzOPZ1oVwDaCms1Mlh7wLcMUi
 xbYt4X6kyeTOufFPM5KOaZHWC3oBw+zH6qjiw4cRxOBpCrN2wyq4Ze4f5
 YOly87BSw+T8+hozQXqKxu++vTGTwpfJld0ES9PQNN0n+7RYIbldBUz8C
 K6wYNwFzneWkIPlK7IkhqhsJoGhRau48gox+X56RxmdpKvY0sqYI5WMoy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1437956"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1437956"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843229472"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; d="scan'208";a="843229472"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/8] Introduce GuC Doorbells Manager
Date: Sun, 10 Dec 2023 19:06:51 +0100
Message-Id: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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

Introduce simple GuC doorbell ID manager that will be used by the
PF driver for VFs provisioning and can later be used by submission
code once we are ready to switch from H2G based notifications to
doorbells mechanism.

As preparation steps, improve existing logging and kunit code that
is used by the new code.

Michal Wajdeczko (8):
  drm/xe: Add GT oriented drm_printers
  drm/xe: Use GT oriented functions to report TLB timeout
  drm/xe: Introduce GuC Doorbells Manager
  drm/xe/kunit: Set SR-IOV mode of the fake device
  drm/xe/kunit: Define helper functions to allocate mock device
  drm/xe/kunit: Use xe kunit helpers in RTP test
  drm/xe/kunit: Use xe kunit helpers in WA test
  drm/xe/kunit: Add GuC Doorbell Manager tests

 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 199 ++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c   |  85 ++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h   |  19 ++
 drivers/gpu/drm/xe/tests/xe_pci.c             |   3 +
 drivers/gpu/drm/xe/tests/xe_pci_test.h        |   2 +
 drivers/gpu/drm/xe/tests/xe_rtp_test.c        |  36 +--
 drivers/gpu/drm/xe/tests/xe_wa_test.c         |  24 +-
 drivers/gpu/drm/xe/xe_gt_printk.h             |  44 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  13 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 259 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |  24 ++
 drivers/gpu/drm/xe/xe_guc_types.h             |  15 +
 drivers/gpu/drm/xe/xe_uc.c                    |   5 +
 14 files changed, 670 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h

-- 
2.25.1

